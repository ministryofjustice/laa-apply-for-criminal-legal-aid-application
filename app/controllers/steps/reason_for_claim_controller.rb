module Steps
  class ReasonForClaimController < Steps::BaseStepController
    def edit
      @form_object = ReasonForClaimForm.build(
        current_application
      )
    end

    def update
      update_and_advance(ReasonForClaimForm, as: :reason_for_claim)
    end

    private

    def decision_tree_class
      Decisions::DecisionTree
    end

    def additional_permitted_params
      [reasons_for_claim: []]
    end
  end
end
