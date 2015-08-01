module ApplicationHelper
  def icon_for_favorite(model)
    star_class= model.marked_as?(:favorite, by: current_user) ? 'fa-star' : 'fa-star-o'
    content_tag :i,'', class: "fa fa-2x #{star_class}", data: {id: model.id, klass: model.class.to_s}
  end
end
