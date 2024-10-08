class RestaurantPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def new?
    create?
  end

  def create?
    true
  end

  def edit?
    update?
  end

  def update?
    record.user_id == user.id
  end

  def destroy?
    user.admin? || record.user_id == user.id
  end
end
