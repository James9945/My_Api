class ApplicationController < ActionController::API
    before_action :skip_session
    respond_to :json
    private
  
    def skip_session
      request.session_options[:skip] = true
    end
  end
  