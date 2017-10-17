class WikiPolicy < ApplicationPolicy
  class Scope < Scop
    def resolve
      scope
    end
  end
end
