# frozen_string_literal: true

class ThingsController < ApplicationController
  active_response :show, :index

  has_collection_create_action
  has_resource_update_action
  has_resource_destroy_action
end
