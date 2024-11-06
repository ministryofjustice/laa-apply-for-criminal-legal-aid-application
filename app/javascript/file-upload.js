import MOJFrontend from '@ministryofjustice/frontend'
import $ from 'jquery'

window.$ = $

MOJFrontend.MultiFileUpload.prototype.uploadFiles = async function(files) {
  let saveButtons = $('button[type="submit"]')

  saveButtons.prop('disabled', true)
  saveButtons.prop('aria-disabled', true)

  const uploads = []

  for(var i = 0; i < files.length; i++) {
    uploads.push(
      this.uploadFile(files[i]).then(
        function(response) { console.log(response); }
      ).catch(
        function(error) { console.log(error);  }
      )
    );
  }

  await Promise.all(uploads)

  saveButtons.prop("disabled", false)
  saveButtons.prop("aria-disabled", false);

};

MOJFrontend.MultiFileUpload.prototype.uploadFile = function (file) {
    const maxFileSize = document.querySelector('.moj-multi-file-upload').dataset.maxSize;
    const singleFile = document.querySelector('.moj-multi-file-upload').dataset.singleFile;

    this.params.uploadFileEntryHook(this, file);
    let formData = new FormData();
    let uploadList = this.feedbackContainer.find('.moj-multi-file-upload__list');

    if(singleFile == "true"){
      console.log("single file");
      formData.set('file_upload', file);
      while(this.feedbackContainer.find('.moj-multi-file-upload__list').firstChild){
        this.feedbackContainer.find('.moj-multi-file-upload__list').removeChild(uploadList.firstChild);
      }
    }
    else{
      console.log("multi file");
      formData.append('documents', file);
    }
    let fileListLength = this.feedbackContainer.find('.govuk-table__row.moj-multi-file-upload__row').length
    let fileRow = $(this.getFileRowHtml(file, fileListLength));
    let feedback = $(".moj-multi-file-upload__message");
    this.feedbackContainer.find('.moj-multi-file-upload__list').append(fileRow);

    let checkSvg =
      `<svg class="moj-banner__icon" fill="currentColor" role="presentation" focusable="false" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 25 25" height="25" width="25">
          <path d="M25,6.2L8.7,23.2L0,14.1l4-4.2l4.7,4.9L21,2L25,6.2z"></path>
      </svg>`

    let failSvg =
      `<svg class="moj-banner__icon" fill="currentColor" role="presentation" focusable="false" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 25 25" height="25" width="25">
        <path d="M13.6,15.4h-2.3v-4.5h2.3V15.4z M13.6,19.8h-2.3v-2.2h2.3V19.8z M0,23.2h25L12.5,2L0,23.2z"/>
      </svg>`

    if (file.size > maxFileSize) {
        feedback.html(this.getErrorHtml('File size is too big. Unable to upload.'));
        fileRow.find('progress').replaceWith(failSvg);
        return Promise.reject(new Error('file, ' + file.name + ', size too big: ' + file.size + ' > ' + maxFileSize));
    }

    return $.ajax({
        url: this.params.uploadUrl,
        type: 'post',
        data: formData,
        processData: false,
        contentType: false,

        success: function (response) {
            feedback.html(this.getSuccessHtml(`${response.success.file_name} has been uploaded`));
            this.status.html(`${response.success.file_name} has been uploaded`);
            fileRow.find(`a.remove-link.moj-multi-file-upload__delete`).attr("value", response.success.evidence_id ?? file.name)
            fileRow.find(`a.remove-link.moj-multi-file-upload__delete`).removeClass('govuk-!-display-none')
            fileRow.find('progress').replaceWith(checkSvg)
            this.params.uploadFileExitHook(this, file, response);
        }.bind(this),

        error: function (jqXHR, textStatus, errorThrown) {
            feedback.html(this.getErrorHtml(jqXHR.responseJSON.error.message));
            this.status.html(jqXHR.responseJSON.error.message);
            fileRow.find('progress').replaceWith(failSvg);
            this.params.uploadFileErrorHook(this, file, jqXHR, textStatus, errorThrown);
        }.bind(this),
    });
};

MOJFrontend.MultiFileUpload.prototype.getFileRowHtml = function (file, fileListLength) {
    return `<tr class="govuk-table__row moj-multi-file-upload__row" id="${fileListLength}">
            <td class="govuk-table__cell moj-multi-file-upload__filename" data-label="File name">
              <span class="file-name">${file.name}</span>
            </td>
            <td class="govuk-table__cell moj-multi-file-upload__progress" data-label="Upload Progress">
              <progress>working</progress>
            </td>
            <td class="govuk-table__cell moj-multi-file-upload__actions">
              <a class="remove-link moj-multi-file-upload__delete govuk-!-display-none" href="#0" value="${file.name}">Delete
                <span class="govuk-visually-hidden">${file.name}</span>
              </a>
            </td>
        </tr>`;
};
MOJFrontend.MultiFileUpload.prototype.onFileDeleteClick = function (e) {
    e.preventDefault(); // if user refreshes page and then deletes
    let button = $(e.currentTarget);
    let feedback = $(".moj-multi-file-upload__message");

    let fileName = button
                    .parents('.govuk-table__row.moj-multi-file-upload__row')
                    .find('.moj-multi-file-upload__filename')
                    .text()

    $.ajax({
        url: this.params.deleteUrl,
        type: 'delete',
        data: { evidence_id: button.attr('value') },
        success: function (response) {
            feedback.html(this.getSuccessHtml(`${fileName} has been deleted`));
            button.parents('.moj-multi-file-upload__row').remove();
            if (this.feedbackContainer.find('.moj-multi-file-upload__row').length === 0) {
                this.feedbackContainer.addClass('moj-hidden');
            }
            this.params.fileDeleteHook(this, response);
        }.bind(this),

        error: function (jqXHR, textStatus, errorThrown) {
            feedback.html(this.getErrorHtml(jqXHR.responseJSON.error.message));
            this.status.html(jqXHR.responseJSON.error.message);
            this.params.fileDeleteHook(this, jqXHR, textStatus, errorThrown);
        }.bind(this),
    });
};
MOJFrontend.MultiFileUpload.prototype.onDrop = function (e) {
    e.preventDefault();

    this.dropzone.removeClass('moj-multi-file-upload--dragover');
    this.feedbackContainer.removeClass('moj-hidden');
    this.status.html(this.params.uploadStatusText);
    this.uploadFiles(e.originalEvent.dataTransfer.files);
};
MOJFrontend.MultiFileUpload.prototype.onFileChange = function (e) {
    this.feedbackContainer.removeClass('moj-hidden');
    this.status.html(this.params.uploadStatusText);
    this.uploadFiles(e.currentTarget.files);
    this.fileInput.replaceWith($(e.currentTarget).val('').clone(true));
    this.setupFileInput();
    this.fileInput.focus();
};
MOJFrontend.MultiFileUpload.prototype.getSuccessHtml = function(message) {
    return `<div class="moj-banner moj-banner--success" role="region" aria-label="Success">
              <svg class="moj-banner__icon" fill="currentColor" role="presentation" focusable="false" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 25 25" height="25" width="25">
                <path d="M25,6.2L8.7,23.2L0,14.1l4-4.2l4.7,4.9L21,2L25,6.2z" />
              </svg>
              <div class="moj-banner__message">${message}</div>
              </div>`;
};
MOJFrontend.MultiFileUpload.prototype.getErrorHtml = function(message) {
    return `<div class="moj-banner moj-banner--warning" role="region" aria-label="Warning">
              <svg class="moj-banner__icon" fill="currentColor" role="presentation" focusable="false" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 25 25" height="25" width="25">
                <path d="M13.6,15.4h-2.3v-4.5h2.3V15.4z M13.6,19.8h-2.3v-2.2h2.3V19.8z M0,23.2h25L12.5,2L0,23.2z" />
              </svg>
            <div class="moj-banner__message">${message}</div>
            </div>`;

};

$(function() {
    if (typeof MOJFrontend.MultiFileUpload !== "undefined") {
        new MOJFrontend.MultiFileUpload({
            container: $(".moj-multi-file-upload"),
            uploadUrl: window.location.href,
            deleteUrl: window.location.href
        })
    }
})

$(function(){
  // always pass csrf tokens on ajax calls
  $.ajaxSetup({
    headers: { 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content') }
  });
});
