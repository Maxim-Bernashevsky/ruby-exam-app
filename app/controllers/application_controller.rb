class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include SessionsHelper
  protect_from_forgery with: :exception

  # for localization
  before_filter :set_locale
  I18n.available_locales = [:en, :ru]
  I18n.default_locale = :en
  I18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}').to_s]

  def pages_of(data, records_per_pages)
    unless data.kind_of?(Array)
      data.page(params[:page]).per(records_per_pages)
    else
      Kaminari.paginate_array(data).page(params[:page]).per(records_per_pages)
    end
  end
  private
  def set_locale
    I18n.locale = params[:locale] # || I18n.default_locale
    # current_user.locale
    # request.subdomain
    # request.env["HTTP_Accept_LANGUAGE"]
    # request.remote_ip
  end
end
