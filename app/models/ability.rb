# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user
      can :manage, User, id: user.id
      can :manage, Language
      can :manage, Record
  end
end
