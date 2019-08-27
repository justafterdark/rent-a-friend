class MobfriendsController < ApplicationController
  before_action :set_mobfriends, only: [:index]
  before_action :set_mobfriend, only: [:show, :edit, :update, :destroy]

  # CREATE: new (form) & create
  def new
    @mobfriend = Mobfriend.new
  end

  def create
    @mobfriend = Mobfriend.new(mobfriend_new_params)
    @mobfriend.user = current_user
    if @mobfriend.save
      redirect_to mobfriend_path(@mobfriend)
    else
      render 'new'
    end
  end

  # READ: index & show
  def index
  end

  def show
  end

  # UPDATE: edit (form) & update
  def edit
  end

  def update
    if @mobfriend.update(mobfriend_edit_params)
      redirect_to mobfriend_path(@mobfriend)
    else
      render 'edit'
    end
  end

  # DELETE: destroy
  def destroy
    @mobfriend.destroy
    # redirect_to dashboard_path(current_user)
  end

  private

  def set_mobfriends
    @mobfriends = Mobfriend.all
  end

  def set_mobfriend
    @mobfriend = Mobfriend.find(params[:id])
  end

  def mobfriend_new_params
    params.require(:mobfriend).permit(:first_name, :last_name, :hourly_rate, :tagline, :age, :gender, :language, :photo, :bio)
  end

  def mobfriend_edit_params
    params.require(:mobfriend).permit(:tagline, :hourly_rate, :language, :photo_url, :bio)
  end
end
