class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_record
    rescue_from ActionController::ParameterMissing, with: :invalid_params

    def record_not_found(exception)
        render json: exception.message, status: :not_found
    end

    def invalid_record(exception)
        render json: exception.record.errors, status: :unprocessable_entity
    end

    def invalid_params(exception)
        render json: exception.message, status: :bad_request
    end

end
