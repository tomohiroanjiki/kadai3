class UsersController < ApplicationController
  before_action :authenticate_user!,except: [:top]

  def index
    @users = User.all
    @book = Book.new
    @user = current_user

  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if current_user.id != @user.id
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:seiko] = 'You have updated user successfully.'
    redirect_to user_path(@user.id)

    else
      flash[:danger] = "error"
      render :edit
    end
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to @book
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
