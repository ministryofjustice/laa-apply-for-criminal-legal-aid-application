module Nsm
  module Steps
    class WorkItemsForm < ::Steps::AddAnotherForm
      def save
        unless all_work_items_valid?
          errors.add(:add_another, :invalid_item)
          return false
        end

        super
      end

      def all_work_items_valid?
        application.work_items.all?(&:complete?)
      end
    end
  end
end
