# frozen_string_literal: true

class ThingMenuList < ApplicationMenuList
  has_menu(
    :actions,
    image: 'fa-ellipsis-v',
    menus: -> { action_menu_items }
  )

  private

  def action_menu_items
    [
      edit_menu_item(resource),
      delete_menu_item(resource),
      copy_menu_item(resource.iri),
    ]
  end
end
