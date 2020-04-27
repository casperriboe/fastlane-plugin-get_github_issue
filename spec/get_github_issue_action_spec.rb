describe Fastlane::Actions::GetGithubIssueAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The get_github_issue plugin is working!")

      Fastlane::Actions::GetGithubIssueAction.run(nil)
    end
  end
end
