module Nsm
  module Steps
    class CaseDetailsController < Nsm::Steps::BaseController
      def edit
        @form_object = CaseDetailsForm.build(
          current_application
        )
      end

      def update
        update_and_advance(CaseDetailsForm, as: :case_details)
      end

      private

      def additional_permitted_params
        [:main_offence_suggestion]
      end
    end
  end
end
