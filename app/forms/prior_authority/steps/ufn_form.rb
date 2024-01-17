module PriorAuthority
  module Steps
    class UfnForm < ::Steps::BaseFormObject
      attribute :ufn, :string
      validates :ufn, presence: true

      private

      def persist!
        # return unless valid?

        # return false unless application.update!(attributes)
        # return true unless pre_draft?
        application.update!(extended_attributes)
      end

      def extended_attributes
        attributes.merge(status: PriorAuthorityApplication.statuses[:draft],
                         ufn_form_status: :complete,
                         laa_reference: generate_laa_reference)
      end

      def generate_laa_reference
        loop do
          proposed_reference = "LAA-#{SecureRandom.base58(6)}"
          break proposed_reference unless PriorAuthorityApplication.exists?(laa_reference: proposed_reference)
        end
      end
    end
  end
end
