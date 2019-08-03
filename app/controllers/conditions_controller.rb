class ConditionsController < ApplicationController
  before_action :check_status
  def index
    @user = User.find(session[:user_id])
    # @users = User.all
    @conditions = Condition.where(user_id: session[:user_id]).order(enddate: :desc)
    # @conditionfirst = @conditions.first(1)
  end

  def new

  end

  def show
    @user = User.find(session[:user_id])
    @condition = Condition.find(params[:id])
  end
  def create
    user = User.find(session[:user_id])
    Condition.create(object: params[:object], startdate: params[:startdate], enddate: params[:enddate], user:user)
    redirect_to '/show'
  end
  def yes
    Ye.where(user_id: session[:user_id], condition_id: params[:id]).create(content: params[:add])
    redirect_to "/show"
  end
  def yes_show
    @condition = Condition.find(params[:id])
    Ye.where(user_id: session[:user_id], condition_id: params[:id]).create(content: params[:add])
    redirect_to "/conditions/show/#{@condition.id}"
  end
  def maybe
    Maybe.where(user_id: session[:user_id], condition_id: params[:id]).create(content: params[:add])
    redirect_to "/show"
  end
  def maybe_show
    @condition = Condition.find(params[:id])
    Maybe.where(user_id: session[:user_id], condition_id: params[:id]).create(content: params[:add])
    redirect_to "/conditions/show/#{@condition.id}"
  end
  def no
    Nope.where(user_id: session[:user_id], condition_id: params[:id]).create(content: params[:add])
    redirect_to "/show"
  end
  def no_show
    @condition = Condition.find(params[:id])
    Nope.where(user_id: session[:user_id], condition_id: params[:id]).create(content: params[:add])
    redirect_to "/conditions/show/#{@condition.id}"
  end
  
  private

  def check_status
      if !session[:user_id]
          redirect_to '/'
      end
  end
end
