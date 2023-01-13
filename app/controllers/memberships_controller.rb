class MembershipsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response

    #POST
    def create
        if find_membership 
            membership = Membership.create!(membership_params)
            render json: membership, status: :created, serializer: MembershipsSerializer 
        else
            render json: { error: "Client cannot have <1 membership to the same gym" }, status: :unprocessable_entity
        end
    end

    private 

    def find_membership 
        Membership.find_by(id: params[:id])
    end

    def membership_params
        params.permit(:gym_id, :client_id, :charge)
    end

    def render_invalid_response (e)
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end

end
