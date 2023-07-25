module Steps
  class DisbursementAddController < Steps::BaseStepController
    def edit
      @form_object = AddAnotherForm.build(
        current_application
      )
    end

    def update
      update_and_advance(AddAnotherForm, as: :disbursement_add)
    end

    private

    def decision_tree_class
      Decisions::DecisionTree
    end

    def additional_permitted_params
      [:add_another]
    end
  end
end
