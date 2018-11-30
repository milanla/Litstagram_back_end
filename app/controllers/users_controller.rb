class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]
    
    # GET /users 
    def index 
        @users = User.all 

        render json: @users
    end 

    # GET /users/:id
    def show 
        render json: @user
    end 

    # POST /users
    def create 
        @user = User.new(user_params)
        if @user.save 
            render json: @user 
        else 
            render json: @user.errors.full_messages 
        end 
    end 

    # PATCH/PUT /users/:id
    def update 
        if @user.update(user_params)
            render json: @user 
        else 
            render json: @user.errors.full_messages
        end 
    end 

    # DELETE /users/:id
    def destroy
        @user.destroy 
    end 

    private 

    def set_user 
        @user = User.find(params[:id])
    end 

    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :password)
    end
end