require 'yaml'

class ApplicationController

  # interface elements
  attr_accessor :stage_tab_view, :groups_tab_view

  attr_accessor :all_teams

  def initialize
    @all_teams = YAML::load(File.open(teams_file))
    $group_teams = []
  end

  def awakeFromNib
    populate_group_teams
  end

  def populate_group_teams
    $group_teams = @all_teams[self.groups_tab_view.selectedTabViewItem.identifier]
  end

  def teams_file
    main_bundle = NSBundle.mainBundle
    teams_file = main_bundle.pathForResource("teams", ofType:"yml", inDirectory:nil)
  end

end
