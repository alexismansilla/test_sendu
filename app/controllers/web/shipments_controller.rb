class Web::ShipmentsController < ApplicationController 
    def search 
        @shipments = nil

        if params[:tracking_number].present?
            @shipments = Shipment.find_by(tracking_number: params[:tracking_number])
        end
    end

    def show 
        @shipments = Shipment.find_by(tracking_number: params[:id])

        if @shipments.nil? 
            flash[:alert] = "Shipment not found"
            redirect_to web_shipments_search_path
        end
    end
end