class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response


    #GET all 
    def index
        clients = Client.all
        render json: clients, status: :ok
    end

    #GET one
    def show
        client = find_client
        render json: client, serializer: ClientsSerializer, status: :ok 
    end

    #PATCH
    def update
        client = find_client
        client.update(client_params)
        render json: client, status: :accepted
    end

    private

    def find_client_costs
        find_client.memberships.to_a.sum(&:charge)
    end

    def client_params
        params.permit(:name, :age)
    end

    def find_client
        Client.find(params[:id])
    end

    def render_not_found_response
        render json: { error: "Client not found" }, status: :not_found
    end

    def render_invalid_response (e)
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end
end

