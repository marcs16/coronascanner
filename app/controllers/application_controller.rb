class ApplicationController < ActionController::Base
	before_action :get_browser_language
	def get_browser_language
		begin
			unless session[:selected_language].present?
				# Select Languages created in the system
				languages = Language.select(:abbreviation)
				# Get Language browser client
				language_browser = request.env['HTTP_ACCEPT_LANGUAGE'].split(',')[0].split(';')[0].sub('-', '_')

				if languages.exists?(:abbreviation => language_browser)
					session[:selected_language] = language_browser
				else
					session[:selected_language] = I18n.default_locale
				end
			end
		rescue Exception => e
			session[:selected_language] = I18n.default_locale
		end

		I18n.locale = session[:selected_language]
		
	end
end
