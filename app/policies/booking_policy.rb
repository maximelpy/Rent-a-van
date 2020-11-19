class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    return false
  end

  def show?
    return user
  end

  def create?
    return true
  end

  def update?
    return user_is_creator?
  end

  def destroy?
    return user_is_creator?
  end

  def user_is_creator?
    return user == record.user
  end
end
