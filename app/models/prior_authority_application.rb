class PriorAuthorityApplication < ApplicationRecord
  belongs_to :provider
  has_many :defendants, dependent: :destroy, as: :defendants_included, inverse_of: :prior_authority_application

  attribute :prison_law, :boolean
  attribute :ufn, :string
  attribute :office_code, :string
  attribute :contact_name, :string
  attribute :contact_email, :string
  attribute :firm_name, :string
  attribute :firm_account_number, :string
  attribute :ufn_form_status, :string
  attribute :case_contact_form_status, :string
  attribute :client_detail_contact_form_status, :string
  enum :status, { pre_draft: 'pre_draft', draft: 'draft', submitted: 'submitted' }
  attribute :created_at, :datetime
  attribute :updated_at, :datetime

  scope :for, ->(provider) { where(office_code: provider.selected_office_code) }
end
