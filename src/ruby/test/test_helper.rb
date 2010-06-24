ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'test_help'

class ActiveSupport::TestCase
        
      #not using database!

end

class ApplicadtionController
  def _renderizer;  render params[:args];  end
end

class ActionController::TestCase # or Test::Unit::TestCase, for Rails <2.0
  def render(args);  get :_renderizer, :args => args;  end
end

