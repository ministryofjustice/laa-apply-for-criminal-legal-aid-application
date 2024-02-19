module PriorAuthority
  module CheckAnswers
    class Report
      GROUPS = %w[
        application_detail
        contact_details
        about_case
        about_request
      ].freeze

      attr_reader :application

      def initialize(application)
        @application = application
      end

      def section_groups
        GROUPS.map do |group_name|
          section_group(group_name, public_send(:"#{group_name}_section"))
        end
      end

      def section_group(name, section_list)
        {
          heading: group_heading(name),
          sections: sections(section_list),
        }
      end

      def sections(section_list)
        section_list.map do |section|
          {
            card: {
              title: section.title,
              actions: section.actions,
            },
            rows: section.rows,
          }
        end
      end

      def application_detail_section
        [UfnCard.new(application)]
      end

      def contact_details_section
        [CaseContactCard.new(application)]
      end

      def about_case_section
        [
          ClientDetailCard.new(application),
          *case_and_hearing_detail_cards,
        ]
      end

      def case_and_hearing_detail_cards
        if application.prison_law?
          [
            NextHearingCard.new(application)
          ]
        else
          [
            CaseDetailCard.new(application),
            HearingDetailCard.new(application),
          ]
        end
      end

      def about_request_section
        [
          PrimaryQuoteCard.new(application),
          AlternativeQuotesCard.new(application),
          ReasonWhyCard.new(application),
        ]
      end

      private

      def group_heading(group_key, **)
        I18n.t("prior_authority.steps.check_answers.groups.#{group_key}.heading", **)
      end
    end
  end
end
