class HackersController < ApplicationController
  # before_action :signed_in_hacker, only: [:index, :edit, :update]
  before_action :correct_hacker, only: [:edit, :update]

  def index
    @hackers = Hacker.all
  end

  def new
    @hacker = Hacker.new
  end

  def show
    @hacker = Hacker.find(params[:id])
  end

  def create
    @hacker = Hacker.new(hacker_params)
    if @hacker.save
      sign_in @hacker
      flash[:success] = "Welcome to HackLink."
      redirect_to @hacker
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @hacker.update_attirubutes(hacker_params)
      flash[:success] = "Profile updated."
      redirect_to @hacker
    else
      render 'edit'
    end
  end

  def destroy
  end

<<<<<<< HEAD
  def login
  end

  def register
  end
=======
  private
    def hacker_params
      params.require(:hacker).permit(:name, :username, :password, :password_confirmation)
    end

    def correct_hacker
      @hacker = Hacker.find(params[:id])
      redirect_to(root_url) unless current_hacker?(@hacker)
    end
>>>>>>> sd-branch
end
