class TutorController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    skip_before_action :verify_authenticity_token
    #Get /tutor
    def index
        render json: Tutor.all, except: [:created_at, :updated_at]
    end
    #POST /tutor
    def create
        tutor = Tutor.create(title: params[:title], image:params[:image], rating:params[:rating], reviews:params[:reviews], nooflesson:params[:nooflesson])
        render json: tutor, status: :created
    end
    #Get /tutor/:id
    def show
        tutor = find_tutor
        if tutor
            render json: tutor, except: [:created_at, :updated_at]
        else
            render json: {error: "Tutor not found"}
        end
    end
    #PATCH /tutor/:id
    def update
    tutor = find_tutor
        if tutor
            tutor.update(tutor_params)
            render json: tutor, except: [:created_at, :updated_at]
        else
            render json: {error: "Tutor not found"}, status: :not_found
        end
    end
    #DELETE /tutor/:id
    def destroy
        tutor = find_tutor
        if tutor
            tutor.destroy
            head :no_content
        else
            render json: { error: "Tutor not found"}, status: :not_found
        end
    end
    private
    def find_tutor
        Tutor.find_by(id: params[:id])
    end
    def tutor_params
        params.permit(:title, :image, :reviews, :rating, :nooflesson)
    end
    def render_not_found_response
        render json: {error: "Tutor not found"}, status: :not_found
    end
end
