module Api::V1
  class NotesController < BaseController
    before_action -> { doorkeeper_authorize! :read }, only: %i[index show]
    before_action -> { doorkeeper_authorize! :write }, only: %i[create update destroy]

    def index
      render json: current_resource_owner.notes
    end

    def show
      render json: current_resource_owner.notes.find(params[:id])
    end

    def create
      @note = current_resource_owner.notes.new(note_params)

      if @note.save
        render json: @note
      else
        render json: @note.errors, status: :unprocessable_entity
      end
    end

    def update
      @note = current_resource_owner.notes.find(params[:id])
      if @note.update(note_params)
        render json: @note
      else
        render json: @note.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @note.destroy
      render :ok
    end

    private

      def note_params
        params.require(:note).permit(:description)
      end
  end
end
