class GroupsController
  
  # interface elements
  attr_accessor :groups_view
  
  # NSTabViewDelegate informal protocol
  def tabView(tab_view, willSelectTabViewItem:item)
    item.setView(self.groups_view)
  end
  
end