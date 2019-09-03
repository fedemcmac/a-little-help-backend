class Api::UsersController < ApplicationController

    # skip_before_action :set_current_user, only: [:create]
     
    def index
        users = User.all
        render json: users
    end

    def create
        user = User.create(user_params)
        if user.valid?
            # render json: { user: UserSerializer.new(user), token: user.token }, status: :created
            render json: { user: FullUserSerializer.new(user), token: encode_token({user_id: user.id}) }, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :not_accepted
        end
    end

    def show
        user = User.find(params[:id])
        render json: { user: FullUserSerializer.new(user) }
    end 
    
    def drop_job
        user_job = UserJob.find_by(job_id: params[:job_id], user_id: @current_user.id )
        user_job.destroy
        

        # render json: { job: JobSerializer.new(job) }

        # @cocktail.destroy

    #     user_job = UserJob.create(job_id: params[:job_id], user_id: @current_user.id )
    #     render json: { user: FullUserSerializer.new(@current_user) }
    end

    def update
        user = User.find(params[:id])
        user.update(user_params)
        if user.valid?
            render json: user
        else 
            ############################################### not doing anything?????
            render json: { errors: user.errors.full_messages }
        end
    end

    private 

    def user_params
        params.require(:user).permit(:username, :email, :password, :instructions)
    end

end
