require 'fastlane_core/ui/ui'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?("UI")

  module Helper
    class GetGithubIssueHelper
      # class methods that you define here become available in your action
      # as `Helper::GetGithubIssueHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the get_github_issue plugin helper!")
      end
    end
  end
end
