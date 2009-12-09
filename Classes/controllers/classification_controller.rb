class ClassificationController
  
  # interface elements
  attr_accessor :table_view, :parent
  
  def initialize
    @teams = []
  end
  
  def awakeFromNib
    @teams = parent.teams[parent.groups_tab_view.selectedTabViewItem.identifier]
  end
  
  # NSTableDataSource informal protocol
  
  def numberOfRowsInTableView(table_view)
    @teams.size
  end
  
  def tableView(table_view, objectValueForTableColumn:column, row:index)
    case column.identifier
      when 'positions'
        @teams[index]['position'].to_s
      when 'flags'
        return NSImage.imageNamed(@teams[index]['flag'])
      when 'teams'
        return @teams[index]['name']
    end
  end
    
end