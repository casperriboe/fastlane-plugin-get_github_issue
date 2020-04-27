require 'json'
require 'fastlane/action'
require_relative '../helper/get_github_issue_helper'

module Fastlane
  module Actions
    class GetGithubIssueAction < Action
      def self.run(params)
        response = other_action.github_api(
          server_url: "https://api.github.com",
          api_token: params[:api_token],
          http_method: 'GET',
          path: "/repos/#{params[:user]}/#{params[:repository]}/issues/#{params[:issue_number]}"
        )
        return JSON.parse(response[:body])
      end

      def self.description
        "Fetches Github issue details."
      end

      def self.authors
        ["Casper Riboe"]
      end

      def self.return_value
        "Issue in JSON. If no issue exists an exception is raised."
      end

      def self.details
        # Optional:
        "Fetches single Github issues using the Github REST API. Returned issue is formatted in JSON. If no issue is found an exception is raised."
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :user,
                                  env_name: "GET_GITHUB_ISSUE_USER",
                               description: "Github user the repository belongs to",
                                  optional: false,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :repository,
                                  env_name: "GET_GITHUB_ISSUE_REPOSITORY",
                               description: "Github repository to fetch issue from",
                                  optional: false,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :issue_number,
                                  env_name: "GET_GITHUB_ISSUE_ISSUE_NUMBER",
                               description: "Github issue to fetch",
                                  optional: false,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :api_token,
                                  env_name: "GET_GITHUB_ISSUE_API_TOKEN",
                               description: "Github API token to authenticate",
                                  optional: false,
                                      type: String)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
