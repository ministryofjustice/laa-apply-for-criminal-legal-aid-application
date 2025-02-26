require 'rails_helper'

RSpec.describe Nsm::Steps::SupportingEvidenceController, type: :controller do
  before do
    allow(controller).to receive(:current_application).and_return(current_application)
  end

  describe '#edit' do
    context 'when application is not found' do
      let(:current_application) { nil }

      it 'redirects to the application not found error page' do
        get :edit, params: { id: '12345' }
        expect(response).to redirect_to(application_not_found_errors_path)
      end
    end

    context 'when application is found' do
      let(:current_application) { create(:claim, id: SecureRandom.uuid) }
      let(:form) { instance_double(Nsm::Steps::SupportingEvidenceForm) }

      before do
        allow(Nsm::Steps::SupportingEvidenceForm).to receive(:build).and_return(form)
      end

      context 'when we navigate to the controller' do
        context 'and no files exist' do
          before do
            get :edit, params: { id: current_application }
          end

          it 'responds with HTTP Success' do
            expect(response).to be_successful
          end
        end

        context 'and files exist' do
          before { create(:supporting_evidence, documentable_id: current_application.id) }

          it 'responds with HTTP Success' do
            get :edit, params: { id: current_application }

            expect(response).to be_successful
          end
        end
      end
    end
  end

  describe '#create' do
    context 'when a file is uploaded' do
      let(:current_application) { create(:claim) }

      before do
        request.env['CONTENT_TYPE'] = 'image/png'
        expect(Clamby).to receive(:safe?).and_return(true)
        post :create, params: { id: current_application.id, documents: fixture_file_upload('test.png', 'image/png') }
      end

      after do
        FileUtils.rm SupportingDocument.find(response.parsed_body['success']['evidence_id']).file_path
      end

      it 'uploads and returns a success' do
        expect(response).to be_successful
      end

      it 'returns the evidence_id' do
        expect(response.parsed_body['success']['evidence_id']).not_to be_empty
      end
    end

    context 'when a file fails to upload' do
      let(:current_application) { build(:claim, id: SecureRandom.uuid) }

      before do
        request.env['CONTENT_TYPE'] = 'image/png'
        post :create, params: { id: current_application.id, documents: nil }
      end

      it 'returns a bad request' do
        expect(response).to be_bad_request
      end

      it 'returns an error message' do
        expect(response.parsed_body['error']['message']).to eq 'Unable to upload file at this time'
      end
    end

    context 'when an incorrect file is uploaded' do
      let(:current_application) { build(:claim, id: SecureRandom.uuid) }

      before do
        post :create, params: { id: current_application.id, documents: fixture_file_upload('test.json', 'application/json') }
      end

      it 'returns a bad request' do
        expect(response).to be_bad_request
      end

      it 'returns an error message' do
        expect(response.parsed_body['error']['message'])
          .to eq 'The selected file must be a DOC, DOCX, XLSX, XLS, RTF, ODT, JPG, BMP, PNG, TIF or PDF'
      end
    end

    context 'when an vulnerable file is uploaded' do
      let(:current_application) { build(:claim, id: SecureRandom.uuid) }

      before do
        request.env['CONTENT_TYPE'] = 'image/png'
        allow(controller).to receive(:upload_file).and_raise(FileUpload::FileUploader::PotentialMalwareError)
        post :create, params: { id: current_application.id, documents: fixture_file_upload('test.png', 'image/png') }
      end

      it 'returns a bad request' do
        expect(response).to be_bad_request
      end

      it 'returns an error message' do
        expect(response.parsed_body['error']['message']).to eq('File potentially contains malware so cannot be ' \
                                                               'uploaded. Please contact your administrator')
      end
    end
  end

  describe '#destroy' do
    let(:current_application) { create(:claim, id: SecureRandom.uuid) }
    let(:evidence) do
      create(:supporting_evidence,
             file_size: '2857',
             documentable_id: current_application.id,
             file_path: Rails.root.join('spec/fixtures/files/12345').to_s)
    end

    context 'when there are files present' do
      before do
        FileUtils.cp Rails.root.join('spec/fixtures/files/test.png'), Rails.root.join('spec/fixtures/files/12345')
      end

      it 'deletes the file' do
        delete :destroy, params: { id: current_application.id, evidence_id: evidence.id }

        expect(response).to be_successful
      end
    end

    context 'when there are no files present' do
      it 'returns a 400' do
        delete :destroy, params: { id: current_application.id, evidence_id: SecureRandom.uuid }

        expect(response).to be_bad_request
      end
    end
  end

  describe '#downlaod' do
    let(:current_application) { create(:claim) }

    it 'renders with success' do
      get :download, params: { id: current_application }

      expect(response).to be_successful
    end
  end
end
