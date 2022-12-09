class PackageController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    skip_before_action :verify_authenticity_token
    #Get /package
    def index
        render json: Package.all, except: [:created_at, :updated_at]
    end
    #POST /package
    def create
        package = Package.create(title: params[:title], image:params[:image], description:params[:description], tutorname:params[:tutorname])
        render json: package, status: :created
    end
    #Get /package/:id
    def show
        package = find_tutor
        if package
            render json: package, except: [:created_at, :updated_at]
        else
            render json: {error: "Package not found"}
        end
    end
    #PATCH /package/:id
    def update
    package = find_tutor
        if package
            package.update(tutor_params)
            render json: package, except: [:created_at, :updated_at]
        else
            render json: {error: "Package not found"}, status: :not_found
        end
    end
    #DELETE /package/:id
    def destroy
        package = find_tutor
        if package
            package.destroy
            head :no_content
        else
            render json: { error: "Package not found"}, status: :not_found
        end
    end
    private
    def find_tutor
        Package.find(params[:id])
    end
    def tutor_params
        params.permit(:title, :image, :tutorname, :description)
    end
    def render_not_found_response
        render json: {error: "Package not found"}, status: :not_found
    end
end
