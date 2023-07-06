require 'rails_helper'

RSpec.describe 'User can fill in claim details', type: :system do
  let(:claim) { Claim.create(office_code: 'AAAA') }

  before do
    visit provider_saml_omniauth_callback_path
  end

  it 'can do green path' do
    visit edit_steps_claim_details_path(claim.id)

    fill_in 'Number of pages of prosecution evidence', with: '1'
    fill_in 'Number of pages of defence statements', with: '2'
    fill_in 'Number of witnesses', with: '3'

    find('.govuk-form-group', text: 'Does this bill represent supplemental claim ?').choose 'Yes'
    find('.govuk-form-group',
         text: 'Did you spend time watching or listening to recorded evidence?').choose 'Yes'

    fill_in 'Hours', with: 10
    fill_in 'Minutes', with: 30

    click_on 'Save and continue'

    expect(claim.reload).to have_attributes(
      prosecution_evidence: 1,
      defence_statement: 2,
      number_of_witnesses: 3,
      time_spent: (10 * 60) + 30,
    )
  end
end
