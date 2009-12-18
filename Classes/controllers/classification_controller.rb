class ClassificationController

  # interface elements
  attr_accessor :table_view

  # NSTableDataSource informal protocol

  def numberOfRowsInTableView(table_view)
    $group_teams.size
  end

  def tableView(table_view, objectValueForTableColumn:column, row:index)
    case column.identifier
      when 'positions'
        "#{index + 1}"
      when 'flags'
        return NSImage.imageNamed($group_teams[index]['id'])
      when 'teams'
        return $group_teams[index]['name']
    end
  end

end