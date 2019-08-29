class MobfriendPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    return true
  end

  def create?
    record.user.nil?
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
