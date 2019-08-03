class UsersController < ApplicationController
    before_action :check_status, except: [:index, :create, :login, :logout]

    def index

    end

    def create
        user = User.create(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
        if user.valid?
            session[:user_id] = user.id
            redirect_to '/show'
        else
            flash[:errors] = user.errors.full_messages.to_sentence
            # render json: user.errors
            # redirect_to ('/show/' + user.id.to_s)
            redirect_to '/'
        end
    end

    def login
        user = User.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to '/show'
        else
            flash[:message] = "Something was wrong with login credentials"
            redirect_to '/'
        end
        # redirect_to '/'
    end

    def show
        @user = User.find(session[:user_id])
        @users = User.all
        @conditions = Condition.where(user_id: session[:user_id]).order(enddate: :desc)
        @conditionfirst = @conditions.first(1)
        # render json: params
    end

    def info
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
            redirect_to '/show'
        else
            flash[:note] = "Password and Password Confirmation need to match"
            redirect_to ("/edit/#{@user.id}")
        end
    end

    def logout
        session[:user_id] = nil
        redirect_to '/'
    end

    private

    def check_status
        if !session[:user_id]
            redirect_to '/'
        end
    end

end
