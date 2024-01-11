module PriorAuthority
  module Steps
    class ClientDetailForm < ::Steps::BaseFormObject
      attribute :client_first_name, :string
      attribute :client_last_name, :string
      attribute :client_date_of_birth, :multiparam_date

      validates :client_first_name, presence: true
      validates :client_last_name, presence: true
      validates :client_date_of_birth, presence: true, multiparam_date: { allow_past: true, allow_future: false }

      private

      def persist!
        application.update!(attributes)
      end
    end
  end
end
