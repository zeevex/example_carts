# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

require 'yaml'

class ApplicationController < ActionController::Base

  helper :all # include all helpers, all the time
#  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  def index
        properties = YAML::load_file(File.join( RAILS_ROOT, 'config/site.yml'))
        @zesa_url = properties['zesa_host_url']
        @cancel_url = properties['cancel_url'] 
        @reciept_url = properties['receipt_url']
        @ipn_url = properties['ipn_url']
  end

  def cancel_callback
  end

  def receipt_callback
  end

  def ipn_callback
  
      puts params.inspect
      puts @response.inspect
      puts @request.inspect
  end
  
end
