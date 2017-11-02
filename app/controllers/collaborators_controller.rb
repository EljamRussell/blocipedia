class CollaboratorsController < ApplicationController

  def new
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.new

    @current_collaborators = @wiki.collaborators
    @not_current_collaborators = @wiki.possible_collaborators(current_user.id)  
  end

  def create
    @wiki = Wiki.find(params[:wiki_id])

    @collaborator = Collaborator.new(collaborator_params)
    authorize @collaborator
    if @collaborator.save
      flash[:notice] = "#{@collaborator.user.email} was successfully added a a collaborator."
      redirect_to @wiki
    else
      flash[:notice] = "Collaborator was not added. Please try again."
      redirect_to @wiki
    end
  end

  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.find(params[:id])
    @user = @collaborator.user

    if @collaborator.destroy
      flash[:notice] = "Collaborator #{@user.email} is no longer a collaborator on this wiki."
      redirect_to @wiki
    else
      flash.now[:alert] = "An error occurred while deleting that collaborator."
      redirect_to @wiki
    end
  end

  private

  def collaborator_params
    params.require(:collaborator).permit(:wiki_id, :user_id)
  end
end
