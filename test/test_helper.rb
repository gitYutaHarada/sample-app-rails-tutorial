ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "minitest/reporters"
Minitest::Reporters.use!

ENV["RAILS_ENV"] ||= "test"
module ActiveSupport
  class TestCase
    # 指定のワーカー数でテストを並列実行する
    parallelize(workers: :number_of_processors)
    fixtures :all
    include ApplicationHelper
    # Add more helper methods to be used by all tests here...
  end
end
