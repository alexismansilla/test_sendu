class Api::V1::ShipmentsController < ActionController::API

    def create 
        @shipment = Shipment.new(shipment_params)

        if @shipment.save 
            render json: @shipment, status: :created
        else
            render json: @shipment.errors, status: :unprocessable_entity
        end
    end

    def index 
        @shipments = Shipment.includes(:packages)
        render json: @shipments.as_json(
            include: { 
                packages: { only: [:id, :weight, :description] }
            }, 
            methods: :total_weight
        )
    end

    def show
        shipment = Shipment.find(params[:id])
        render json: { shipment: shipment.as_json(include: :packages), total_weight: shipment.total_weight }
    end

    def pending 
        @shipments = Shipment.pending_shipments
        render json: @shipments.includes(:packages), include: :packages 
    end

    private

    def shipment_params
        params.require(:shipment).permit(:tracking_number, :status, :carrier_name, :origin_city)
    end
end