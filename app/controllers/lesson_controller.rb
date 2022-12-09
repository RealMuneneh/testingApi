class LessonController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    skip_before_action :verify_authenticity_token
    #Get /lesson
    def index
        render json: Lesson.all, except: [:created_at, :updated_at]
    end
    #POST /lesson
    def create
        lesson = Lesson.create(title: params[:title], image:params[:image], description:params[:description], tutorname:params[:tutorname])
        render json: lesson, status: :created
    end
    #Get /lesson/:id
    def show
        lesson = find_tutor
        if lesson
            render json: lesson, except: [:created_at, :updated_at]
        else
            render json: {error: "Lesson not found"}
        end
    end
    #PATCH /lesson/:id
    def update
    lesson = find_tutor
        if lesson
            lesson.update(tutor_params)
            render json: lesson, except: [:created_at, :updated_at]
        else
            render json: {error: "Lesson not found"}, status: :not_found
        end
    end
    #DELETE /lesson/:id
    def destroy
        lesson = find_tutor
        if lesson
            lesson.destroy
            head :no_content
        else
            render json: { error: "Lesson not found"}, status: :not_found
        end
    end
    private
    def find_tutor
        Lesson.find(params[:id])
    end
    def tutor_params
        params.permit(:title, :image, :tutorname, :description)
    end
    def render_not_found_response
        render json: {error: "Lesson not found"}, status: :not_found
    end
end
