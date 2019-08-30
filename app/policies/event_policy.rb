class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(public: true)
    end
  end

  def show?
    record.user == user
  end

  def create?
    return true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
