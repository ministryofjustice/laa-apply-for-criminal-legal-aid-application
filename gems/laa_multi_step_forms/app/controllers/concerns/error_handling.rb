module ErrorHandling
  extend ActiveSupport::Concern

  included do
    rescue_from Exception do |exception|
      case exception
      when Errors::InvalidSession, ActionController::InvalidAuthenticityToken
        redirect_to laa_msf.invalid_session_errors_path
      when Errors::ApplicationNotFoundRedux
        redirect_to laa_msf.application_not_found_errors_path
      # NOTE: Add more custom errors as they are needed, for instance:
      # when Errors::ApplicationSubmitted
      #   redirect_to application_submitted_errors_path
      else
        raise unless ENV.fetch('RAILS_ENV', nil) == 'production'

        Sentry.capture_exception(exception)
        Rails.logger.error(exception)
        redirect_to laa_msf.unhandled_errors_path
      end
    end
  end

  private

  def check_application_presence
    raise Errors::ApplicationNotFoundRedux unless current_application
  end
end
