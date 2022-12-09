class LoginController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    skip_before_action :verify_authenticity_token
    #Get /login
    def index
        render json: Login.all, except: [:created_at, :updated_at]
    end
    #POST /login
    def create
        login = Login.create(username: params[:username], password:params[:password])
        render json: login, status: :created
    end
    #Get /login/:id
    def show
        login = find_tutor
        if login
            render json: login, except: [:created_at, :updated_at]
        else
            render json: {error: "Login not found"}
        end
    end
    #PATCH /login/:id
    def update
    login = find_tutor
        if login
            login.update(tutor_params)
            render json: login, except: [:created_at, :updated_at]
        else
            render json: {error: "Login not found"}, status: :not_found
        end
    end
    #DELETE /login/:id
    def destroy
        login = find_tutor
        if login
            login.destroy
            head :no_content
        else
            render json: { error: "Login not found"}, status: :not_found
        end
    end
    private
    def find_tutor
        Login.find(params[:id])
    end
    def tutor_params
        params.permit(:username, :password)
    end
    def render_not_found_response
        render json: {error: "Login not found"}, status: :not_found
    end
end
