class TipsController < ApplicationController
  before_action :set_tip, only: %i[ show edit update destroy ]

  # GET /tips or /tips.json
  def index
    @tips = Tip.all
    @tips_value = Tip.values_sum
  end

  # GET /tips/1 or /tips/1.json
  def show
  end

  # GET /tips/new
  def new
    @tip = Tip.new
  end

  # GET /tips/1/edit
  def edit
  end

  # POST /tips or /tips.json
  def create
    @tip = Tip.new(tip_params)
    if @tip.save
      flash[:notice] = "Tip created with success!"
      redirect_to action: 'index'
    else
      flash.now[:alert] = @tip.errors.objects.first.full_message
      render action: 'new', status: 422
    end
  end

  # PATCH/PUT /tips/1 or /tips/1.json
  def update
    if @tip.update(tip_params)
      flash[:notice] = "Tip updated with success!"
      redirect_to action: 'index'
    else
      flash.now[:alert] = @tip.errors.objects.first.full_message
      render action: 'new', status: 422
    end
  end

  # DELETE /tips/1 or /tips/1.json
  def destroy
    @tip.destroy

    redirect_to action: 'index'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tip
      @tip = Tip.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tip_params
      params.require(:tip).permit(:value, :description)
    end
end
