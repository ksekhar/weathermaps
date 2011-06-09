require 'rubygems'
require 'test/unit'
require 'shoulda'

module ActionView
  module Partials
   def render_partial
    #so that we do not have to load action view but can still alias this method
   end
  end
end

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rails_dm_datastore'

class Test::Unit::TestCase
end
