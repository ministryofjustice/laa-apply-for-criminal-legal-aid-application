require 'rails_helper'

RSpec.describe PriorAuthorityApplication do
  subject(:prior_authority_application) { create(:prior_authority_application, :with_firm_and_solicitor) }

  describe '#provider' do
    it 'belongs to a provider' do
      expect(prior_authority_application.provider).to be_a(Provider)
    end
  end

  describe '#solicitor' do
    it 'belongs to a solcitor' do
      expect(prior_authority_application.solicitor).to be_a(Solicitor)
    end
  end

  describe '#firm_office' do
    it 'belongs to a firm_office' do
      expect(prior_authority_application.firm_office).to be_a(FirmOffice)
    end
  end
end
