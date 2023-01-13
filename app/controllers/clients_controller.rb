class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    #GET
    def show
        client = find_client
        render json: client, serializer: ClientsSerializer, status: :ok 
    end

    private

    def find_client_costs
        client = find_client
        costs = client

    def find_client
        Client.find(params[:id])
    end

    def render_not_found_response
        render json: { error: "Client not found" }, status: :not_found
    end
end

