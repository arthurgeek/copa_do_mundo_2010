class MatchesController

  # interface elements
  attr_accessor :table_view

  # NSTableDataSource informal protocol

  def numberOfRowsInTableView(table_view)
    $group_matches.size
  end

  def tableView(table_view, objectValueForTableColumn:column, row:index)
    team_1 = $group_teams.select { |team| team["id"] == $group_matches[index]['team_1'] }.first
    team_2 = $group_teams.select { |team| team["id"] == $group_matches[index]['team_2'] }.first
    
    case column.identifier
      when 'date'
        return DateTime.parse($group_matches[index]['date']).strftime("%d/%m %H:%M")
      when 'vs'
        return '-'
      when /flag_(\d)/
        return NSImage.imageNamed($group_matches[index]["team_#{$1}"])
      when /team_(\d)/
        return eval("team_#{$1}['name']")
      else
        return $group_matches[index][column.identifier]
    end
  end

end