class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    return user_is_owner?
  end

   def create?
    return true
  end

  def update?
    return user_is_owner?
  end

  def destroy?
    return user_is_owner?
  end

  private

  def user_is_owner?
    return user == record.user
  end
end
