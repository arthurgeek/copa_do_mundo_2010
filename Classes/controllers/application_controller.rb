require 'yaml'

class ApplicationController

  # interface elements
  attr_accessor :stage_tab_view, :groups_tab_view
  
  attr_accessor :teams
  
  def initialize
    @teams = YAML::load(File.open(teams_file))
  end

  def teams_file
    main_bundle = NSBundle.mainBundle
    teams_file = main_bundle.pathForResource("teams", ofType:"yml", inDirectory:nil)
  end
  
end
