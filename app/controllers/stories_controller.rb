class StoriesController < ApplicationController
  def new
    current_user = User.first
    @story = current_user.stories.new
    @story.steps.build
  end

  def create
    current_user = User.first
    @story = current_user.stories.new story_params
    if @story.save
      flash[:success] = t "success_created_plan"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @story = Story.find_by id: params[:id]
  end

  def update
    @story = Story.find_by id: params[:id]
    if @story.update_attributes story_params
      flash[:success] = t "success_updated_plan"
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def story_params
    params.require(:story).permit(:name, :description, :is_public, :due_date,
      steps_attributes: [:id, :content, :_destroy])
  end
end
