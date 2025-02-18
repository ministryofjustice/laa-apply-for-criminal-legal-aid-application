module Nsm
  class IncompleteItems
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::TranslationHelper

    # govuk_link_to required modules
    include GovukLinkHelper
    include GovukVisuallyHiddenHelper
    include ActionView::Helpers::UrlHelper
    # for path methods
    include Routing

    attr_reader :controller

    EXPECTED_ITEM_TYPES = [:work_items, :disbursements].freeze

    def initialize(claim, type, controller)
      raise "Invalid item type: #{type}" unless type.in?(EXPECTED_ITEM_TYPES)

      @claim = claim
      @type = type
      @controller = controller
      @items ||= case @type
                 when :work_items then @claim.work_items
                 when :disbursements then @claim.disbursements
                 else
                   raise 'Cannot create items from this type'
                 end
    end

    def incomplete_items
      @items.reject(&:complete?).sort_by(&:position)
    end

    def summary
      "#{t("#{path_key}.incomplete_summary", count: incomplete_items.count)}: #{links}"
    end

    def links
      incomplete_items.map do |item|
        govuk_link_to(
          path_title(item),
          path_url(item)
        )
      end.join(', ')
    end

    private

    def path_title(item)
      t("#{path_key}.item", index: item.position)
    end

    def path_url(item)
      if item.is_a? WorkItem
        edit_nsm_steps_work_item_path(@claim, work_item_id: item.id)
      elsif item.is_a? Disbursement
        edit_nsm_steps_disbursements_path(@claim, disbursement_id: item.id)
      # :nocov:
      else
        #  no test coverage needed as inaccessible  due to initializer
        false
      end
      # :nocov:
    end

    def path_key
      "nsm.steps.#{@type}.edit"
    end
  end
end
