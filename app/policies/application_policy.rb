# frozen_string_literal: true

class ApplicationPolicy
  include LinkedRails::Policy

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
