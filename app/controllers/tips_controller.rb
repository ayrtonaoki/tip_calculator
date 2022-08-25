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
    respond_to do |format|
      if @tip.update(tip_params)
        format.html { redirect_to tip_url(@tip), notice: "Tip was successfully updated." }
        format.json { render :show, status: :ok, location: @tip }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tips/1 or /tips/1.json
  def destroy
    @tip.destroy

    respond_to do |format|
      format.html { redirect_to tips_url, notice: "Tip was successfully destroyed." }
      format.json { head :no_content }
    end
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
