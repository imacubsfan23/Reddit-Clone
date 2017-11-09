class UsersController < ApplicationController
    def new
        @user = User.new
    end
    
    def confirm
        @user = User.new
        @user.name = params[:user].permit![:name]
        @user.email = params[:user].permit![:email]
        @user.password = params[:user].permit![:password]
        @user.password_confirmation = params[:user].permit![:password_confirmation]
    end
    
    def create
        @user = User.new
        @user.name = params[:user].permit![:name]
        @user.email = params[:user].permit![:email]
        @user.password = params[:user].permit![:password]
        @user.password_confirmation = params[:user].permit![:password_confirmation]
        
        if @user.save
            flash[:notice] = "Welcome to Bloccit #{@user.name}!"
            redirect_to root_path
        else
            flash.now[:alert] = "There was an error creating your account. Please Try Again."
            render :new
        end
    end
end
