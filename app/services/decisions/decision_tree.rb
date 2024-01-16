module Decisions
  class DecisionTree < DslDecisionTree
    # used to add custom methods to filter/query the data
    WRAPPER_CLASS = CustomWrapper

    from(:claim_type).goto(show: 'steps/start_page')
    # start_page to firm_details is a hard coded link as show page
    from(:firm_details)
      .when(-> { application.defendants.none? })
      .goto(edit: 'steps/defendant_details', defendant_id: StartPage::NEW_RECORD)
      .goto(edit: 'steps/defendant_summary')
    from(:defendant_details).goto(edit: 'steps/defendant_summary')
    from(:defendant_delete).goto(edit: 'steps/defendant_summary')
    from(:defendant_summary)
      .when(-> { add_another.yes? })
      .goto(edit: 'steps/defendant_details', defendant_id: StartPage::NEW_RECORD)
      .when(-> { any_invalid?(application.defendants, Steps::DefendantDetailsForm) })
      .goto(edit: 'steps/defendant_summary')
      .goto(edit: 'steps/case_details')
    from(:case_details).goto(edit: 'steps/hearing_details')
    from(:hearing_details).goto(edit: 'steps/case_disposal')
    from(:case_disposal).goto(edit: 'steps/reason_for_claim')
    from(:reason_for_claim).goto(edit: 'steps/claim_details')
    from(:claim_details)
      .when(-> { application.work_items.none? })
      .goto(edit: 'steps/work_item', work_item_id: StartPage::NEW_RECORD)
      .goto(edit: 'steps/work_items')
    from(:work_item).goto(edit: 'steps/work_items')
    from(:work_item_delete)
      .when(-> { application.work_items.none? })
      .goto(edit: 'steps/work_item', work_item_id: StartPage::NEW_RECORD)
      .goto(edit: 'steps/work_items')
    from(:work_items)
      .when(-> { add_another.yes? })
      .goto(edit: 'steps/work_item', work_item_id: StartPage::NEW_RECORD)
      .when(-> { any_invalid?(application.work_items, Steps::WorkItemForm) })
      .goto(edit: 'steps/work_items')
      .goto(edit: 'steps/letters_calls')
    from(:letters_calls)
      .when(-> { application.disbursements.none? })
      .goto(edit: 'steps/disbursement_add')
      .goto(edit: 'steps/disbursements')
    from(:disbursement_add)
      .when(-> { has_disbursements.yes? })
      .goto(edit: 'steps/disbursement_type', disbursement_id: StartPage::NEW_RECORD)
      .goto(show: 'steps/cost_summary')
    from(:disbursement_type)
      .goto(edit: 'steps/disbursement_cost', disbursement_id: -> { record.id })
    from(:disbursement_cost).goto(edit: 'steps/disbursements')
    from(:disbursement_delete)
      .when(-> { application.disbursements.none? })
      .goto(edit: 'steps/disbursement_type', disbursement_id: StartPage::NEW_RECORD)
      .goto(edit: 'steps/disbursements')
    from(:disbursements)
      .when(-> { add_another.yes? })
      .goto(edit: 'steps/disbursement_type', disbursement_id: StartPage::NEW_RECORD)
      .when(-> { any_invalid?(application.disbursements, Steps::DisbursementTypeForm, Steps::DisbursementCostForm) })
      .goto(edit: 'steps/disbursements')
      .goto(show: 'steps/cost_summary')
    # cost_summary to other_info is a hard coded link as show page
    from(:other_info).goto(edit: 'steps/supporting_evidence')
    from(:supporting_evidence).goto(show: 'steps/check_answers')
    # check_answers to equality is a hard coded link as show page
    from(:equality)
      .when(-> { answer_equality.yes? }).goto(edit: 'steps/equality_questions')
      .goto(edit: 'steps/solicitor_declaration')
    from(:equality_questions).goto(edit: 'steps/solicitor_declaration')
    from(:solicitor_declaration).goto(show: 'steps/claim_confirmation')

    # prior authority steps
    from(:prison_law).goto(edit: 'prior_authority/steps/authority_value')
    from(:authority_value).goto(edit: 'prior_authority/steps/ufn')
    from(:ufn).goto(edit: 'prior_authority/steps/case_contact')
    from(:case_contact).goto(edit: 'prior_authority/steps/client_detail')
    from(:client_detail).goto(edit: 'prior_authority/steps/case_and_hearing_detail')
  end
end
