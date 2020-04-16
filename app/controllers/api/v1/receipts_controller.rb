module Api
  module V1
    class ReceiptsController < ApplicationController

      def index
        receipts = Receipt.order('created_at DESC');
        render json: {status: 'SUCCESS', message:'Loaded Receipts', data:receipts},status: :ok
      end

      def show
        receipt = Receipt.find(params[:id])
        render json: {status: 'SUCCESS', message:'Receipt', data:receipt},status: :ok
      end

      def create
        receipt = Receipt.new(receipt_params)

        if receipt.save
          render json: {status: 'SUCCESS', message:'Save Receipt', data:receipt},status: :ok
        else
          render json: {status: 'ERROR', message:'Save FAILED', data:receipt.errors},status: :unprocessable_entity
        end
      end

      def destroy
        receipt = Receipt.find(params[:id])
        receipt.destroy
        render json: {status: 'SUCCESS', message:'Delete Receipt', data:receipt},status: :ok
      end

      def update
        receipt = Receipt.find(params[:id])

        if receipt.update_attributes(receipt_params)
          render json: {status: 'SUCCESS', message:'Update Receipt', data:receipt},status: :ok
        else
          render json: {status: 'ERROR', message:'Update FAILED', data:receipt.errors},status: :unprocessable_entity
        end
      end

      private def receipt_params
        params.permit(:user, :quantity, :product, :price, :total)
      end

    end
  end
end
