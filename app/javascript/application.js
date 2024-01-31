// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

// https://frontend.design-system.service.gov.uk/importing-css-assets-and-javascript/#javascript
import { initAll } from 'govuk-frontend'
import accessibleAutocomplete from 'accessible-autocomplete'
import '@hotwired/turbo-rails'
import $ from 'jquery'

initAll()

Turbo.setFormMode('optin')

const $inputs = document.querySelectorAll('[data-module="govuk-input"]')
if ($inputs) {
  for (let i = 0; i < $inputs.length; i++) {
    new Input($inputs[i]).init()
  }
}

// Avoid flickering header menu on small screens
// Refer to `stylesheets/local/custom.scss`
const $headerNavigation = document.querySelector('ul.app-header-menu-hidden-on-load')
if ($headerNavigation) {
  $headerNavigation.classList.remove("app-header-menu-hidden-on-load")
}

convertSelectToAutocomplete()

$(document).on('turbo:render', function () {
  initAll()
  convertSelectToAutocomplete()
})

function convertSelectToAutocomplete(){
  //enhance all tagged select elements to be accessible-autocomplete elements
  const $acElements = document.querySelectorAll('[data-module="accessible-autocomplete"]')
  if ($acElements) {
    for (let i = 0; i < $acElements.length; i++) {
      var convertedToAutocomplete = $acElements[i].getAttribute('data-converted')
      if(!convertedToAutocomplete){
        const name = $acElements[i].getAttribute('data-name')
        const autoselect = $acElements[i].getAttribute('data-autoselect') === "true"
        accessibleAutocomplete.enhanceSelectElement({
          selectElement: $acElements[i],
          defaultValue: '',
          showNoOptionsFound: name === null,
          name: name,
          autoselect: autoselect
        })
        $acElements[i].setAttribute('data-converted', true)
      }
    }
  }
}
