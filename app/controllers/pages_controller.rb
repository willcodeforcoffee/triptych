class PagesController < ApplicationController
  def index
    Rails.logger.info "--- PagesController params[:page]: [#{params[:page]}]"
    # Check if page exists
    page_path = "../../views/pages/#{params[:page]}.html.erb"
    Rails.logger.info "*** Looking for [#{page_path}] (#{File.expand_path(page_path)})"
    Rails.logger.info "*** Exists? [#{File.exist?(page_path)}]"

    # Render as template
    render :template => "page_errors/not_found", :layout => "application"
  end
end
