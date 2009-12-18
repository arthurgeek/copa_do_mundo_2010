class GroupsController

  # interface elements
  attr_accessor :groups_view, :classification_object, :parent

  # NSTabViewDelegate informal protocol

  def tabView(tab_view, didSelectTabViewItem:item)
    item.view = @groups_view
    parent.populate_group_teams
    classification_object.table_view.reloadData
  end

end