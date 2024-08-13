require "test_helper"

class TeamTest < ActiveSupport::TestCase
  test 'should create a team' do
    team = Team.create!(name: 'Team A')
    assert_not_nil team.name
  end 
end
