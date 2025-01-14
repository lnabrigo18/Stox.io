class UsersController < ApplicationController
  skip_before_action :authorized, only: %i[new create]

  def new
    @user = User.new
  end

  def new_admin
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      redirect_to '/users/new'
    end
  end

  def create_admin
    @user = User.new(user_params)
    if @user.save
      @user.update(status: 'approved') if @user.broker_role.downcase == 'broker'
      redirect_to '/dashboard_admin'
    else
      redirect_to users_new_admin_path
    end
  end

  def details
    @user = User.find_by(id: params[:id])
    stocks = BuyerStock.where(user_id: @user.id)
    @user_stocks = stocks.where('quantity > ?', 0).reverse
    array = Transaction.where(buyer_id: @user.id) + Transaction.where(broker_id: @user.id)
    @transactions = array.sort_by(&:created_at).reverse
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update(update_params)
    redirect_to users_details_path(id: @user.id)
  end

  def request_status
    users = User.find_by(id: params[:id])
    users.update(status: 'pending') if users.money >= 30_000
    redirect_to '/dashboard'
  end

  def add_money
    @user = User.find_by(id: params[:id])
    new_money = money_params[:money].to_f + @user.money
    @user.update(money: new_money)
    redirect_to '/dashboard'
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :role, :money, :broker_role, :status, :first_name, :last_name)
  end

  def update_params
    params.require(:user).permit(:first_name, :last_name)
  end

  def broker_params
    params.require(:user).permit(:broker_role)
  end

  def money_params
    params.require(:user).permit(:money)
  end
end
