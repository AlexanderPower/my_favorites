class FavoritesController < ApplicationController
  before_action :check_model_name, only: [:add_favorite, :delete_favorite]
  before_action :set_model, only: [:add_favorite, :delete_favorite]

  AVAILABLE_MODEL_NAMES= %w(company person)

  # POST /add_favorite
  def add_favorite
    begin
      favorite= @model.find favorite_params[:id]
      # logger.info favorite
      current_user.mark_as_favorite favorite
      head status: 200
    rescue
      head status: 406
    end
  end

  # DELETE /delete_favorite
  def delete_favorite
    begin
      favorite= @model.find favorite_params[:id]
      # logger.info favorite
      current_user.remove_mark :favorite, favorite
      head status: 200
    rescue
      head status: 406
    end
  end

  # GET /favorites
  def favorites
    @favorites=current_user.favorites
  end

  private

  def check_model_name
    head status: 406 unless AVAILABLE_MODEL_NAMES.include? favorite_params[:klass].downcase
  end

  def set_model
    @model = Object.const_get favorite_params[:klass].titleize
  end

  def favorite_params
    params.require(:favorite).permit(:id, :klass)
  end
end
