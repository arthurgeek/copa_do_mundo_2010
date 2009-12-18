class GroupsController

  # interface elements
  attr_accessor :groups_view, :classification_object, :matches_object, :parent

  # NSTabViewDelegate informal protocol

  def tabView(tab_view, didSelectTabViewItem:item)
    parent.populate_group_teams
    parent.populate_group_matches

    item.view = @groups_view

    classification_object.table_view.reloadData
    matches_object.table_view.reloadData
  end

end