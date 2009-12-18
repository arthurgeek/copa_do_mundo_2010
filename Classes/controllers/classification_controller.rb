class ClassificationController

  # interface elements
  attr_accessor :table_view, :parent

  # NSTableDataSource informal protocol

  def numberOfRowsInTableView(table_view)
    parent.group_teams.size
  end

  def tableView(table_view, objectValueForTableColumn:column, row:index)
    case column.identifier
      when 'positions'
        parent.group_teams[index]['position'].to_s
      when 'flags'
        return NSImage.imageNamed(parent.group_teams[index]['flag'])
      when 'teams'
        return parent.group_teams[index]['name']
    end
  end

end