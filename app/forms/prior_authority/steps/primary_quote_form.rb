module PriorAuthority
  module Steps
    class PrimaryQuoteForm < ::Steps::BaseFormObject
      attribute :service_type, :value_object, source: QuoteServices
      attribute :custom_service_name, :string
      attribute :contact_full_name, :string
      attribute :organisation, :string
      attribute :postcode, :string
      attribute :document, :string

      validates :service_type, presence: true
      validates :contact_full_name, presence: true, format: { with: /\A[a-z,.'\-]+( +[a-z,.'\-]+)+\z/i }
      validates :organisation, presence: true
      validates :postcode, presence: true, uk_postcode: true
      validates :document, presence: true

      def service_type_suggestion=(value)
        # The value of service_type_suggestion is the contents of the visible text field, which is the translated value.
        # This is separate from the value of service_type which is the untranslated value, stored in a hidden dropdown.
        # The complication is that if a user types in a value to the text field but doesn't click the autocomplete,
        # service_type_suggestion will contain an accurate translated value, but service_type dropdown contains
        # a false untranslated value.
        # So to avoid being caught out, the translated value needs to take precedence, and we need to infer the
        # untranslated value from that.
        if value.in?(translations.keys)
          self.service_type = translations[value]
          self.custom_service_name = nil
        else
          self.service_type = 'custom' if value.present?
          self.custom_service_name = value
        end
      end

      private

      def persist!
        Rails.logger.debug document
        record.update!(attributes.merge(default_attributes))
      end

      def default_attributes
        {
          'primary' => true
        }
      end

      def translations
        QuoteServices.values.to_h { [_1.translated, _1.value] }
      end
    end
  end
end
