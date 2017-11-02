class CollaboratorPolicy
  attr_reader :current_user, :collaborator

  def initialize(current_user, model)
    @current_user = current_user
    @collaborator = model
  end

  def wiki_owner?
    current_user.present? && ((collaborator.wiki.user == current_user) || current_user.admin?)
  end

  def new?
    wiki_owner?
  end

  def create?
    wiki_owner?
  end

  def destroy?
    wiki_owner?
  end
end
