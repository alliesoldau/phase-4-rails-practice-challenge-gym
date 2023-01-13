class GymsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response


    #GET all 
    def index
        gyms = Gym.all
        render json: gyms, status: :ok
    end

    #GET one
    def show
        gym = find_gym
        render json: gym, serializer: GymsSerializer, status: :ok 
    end

    #DELETE
    def destroy
        gym = find_gym
        gym.destroy
        head :no_content, status: :destroyed
    end

    #PATCH
    def update
        gym = find_gym
        gym.update(gym_params)
        render json: gym, status: :accepted
    end


    private

    def find_gym
        Gym.find(params[:id])
    end

    def gym_params
        params.permit(:name, :address)
    end

    def render_not_found_response
        render json: { error: "Gym not found" }, status: :not_found
    end

    def render_invalid_response (e)
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end
end
