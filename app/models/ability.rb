class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role? :driver
      can :manage, :all
    elsif user.has_role? :passenger
      can :read, :all
    else
      can :read, :all
    end
  end
end
