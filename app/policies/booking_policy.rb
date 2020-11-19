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
    return true
  end

  def destroy?
    return true
  end

  def user_is_creator?
    return user == record.user
  end
end
