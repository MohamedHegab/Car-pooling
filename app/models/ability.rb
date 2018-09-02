class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role? :driver
      can :manage, Trip
      can :manage, Place
      can :read, :all
    elsif user.has_role? :passenger
      can :manage, Pickup
      can :manage, Place
      can :read, :all
    else
      can :read, :all
    end
  end
end
