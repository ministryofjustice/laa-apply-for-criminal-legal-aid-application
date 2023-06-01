module Tasks
  class CaseDetails < Generic
    PREVIOUS_TASK = FirmDetails
    FORM = Steps::CaseDetailsForm

    def path
      edit_steps_case_details_path(application)
    end
  end
end
