# frozen_string_literal: true

class ThingPolicy < ApplicationPolicy
  permit_attributes %i[name text]

  def create?
    false
  end

  def update?
    false
  end

  def destroy?
    false
  end
end
