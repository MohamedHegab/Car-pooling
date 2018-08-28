class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role? :admin
      can :manage, :all
    if user.has_role? :driver
      can :manage, Trip
      can :read, :all
    elsif user.has_role? :passenger
      can :read, :all
    else
      can :read, :all
    end
  end
end
