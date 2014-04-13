require 'github_api'

SCHEDULER.every '60s', :first_in => 0 do
  github = Github.new
  commit_message = github.repos.commits.all('becpr', 'my_dash').first.commit.message
  send_event('recent_git_commit', { text: commit_message })
end