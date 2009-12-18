require 'yaml'

class ApplicationController

  # interface elements
  attr_accessor :stage_tab_view, :groups_tab_view

  attr_accessor :all_teams

  def initialize
    @main_bundle = NSBundle.mainBundle

    @all_teams = YAML::load(File.open(teams_file))
    @all_matches = YAML::load(File.open(matches_file))

    $group_teams = []
    $group_matches = []
  end

  def awakeFromNib
    populate_group_teams
    populate_group_matches
  end

  def populate_group_teams
    $group_teams = @all_teams[self.groups_tab_view.selectedTabViewItem.identifier]
  end

  def populate_group_matches
    $group_matches = @all_matches[self.groups_tab_view.selectedTabViewItem.identifier]
  end

  def teams_file
    @main_bundle.pathForResource("teams", ofType:"yml", inDirectory:nil)
  end

  def matches_file
    @main_bundle.pathForResource("matches", ofType:"yml", inDirectory:nil)
  end

end
