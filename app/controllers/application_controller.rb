class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_record

    def record_not_found(exception)
        render json: exception.message, status: 404
    end

    def invalid_record(exception)
        render json: exception.record.errors, status: 422
    end

end
