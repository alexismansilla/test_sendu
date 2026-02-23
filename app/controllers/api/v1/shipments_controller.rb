class Api::V1::ShipmentsController < ApplicationController
    def index
        @shipments = Shipment.includes(:packages).all.order(created_at: :desc)
        render json: @shipments, include: [:packages], status: :ok
    end

    def create
      shipment = Shipment.new(shipment_params)

      if shipment.save
        render json: shipment, status: :created
      else
        render json: shipment.errors, status: :unprocessable_entity
      end
    end

    def show
      shipment = Shipment.find(params[:id])
      render json: shipment
    end

    private 

    def shipment_params
      params.require(:shipment).permit(:tracking_number, :status, :carrier_name, :origin_city)
    end
end