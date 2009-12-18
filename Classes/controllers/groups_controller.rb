class GroupsController

  # interface elements
  attr_accessor :groups_view, :parent

  # NSTabViewDelegate informal protocol

  def tabView(tab_view, didSelectTabViewItem:item)
    item.view = @groups_view
    parent.parent.populate_group_teams
    parent.table_view.reloadData
  end

end