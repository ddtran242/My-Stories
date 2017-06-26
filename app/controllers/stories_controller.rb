class StoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_story, only: [:edit, :update]
  before_action :authorize_story, only: [:edit, :update]

  def new
    @story = current_user.stories.new
    @story.steps.build
  end

  def create
    @story = current_user.stories.new story_params
    if @story.save
      flash[:success] = t "success_created_plan"
      redirect_to root_path
    else
      flash[:danger] = t "false_created_plan"
      render :new
    end
  end

  def edit
  end

  def update
    if @story.update_attributes story_params
      flash[:success] = t "success_updated_plan"
      redirect_to root_path
    else
      flash[:danger] = t "failse_updated_plan"
      render :edit
    end
  end

  private
  def story_params
    params.require(:story).permit(:name, :description, :is_public, :due_date,
      steps_attributes: [:id, :content, :_destroy])
  end

  def find_story
    @story = Story.find_by id: params[:id]
    unless @story
      flash[:wanning] = t "story_not_found"
      redirect_to root_path
    end
  end

  def authorize_story
    authorize @story
  end
end
