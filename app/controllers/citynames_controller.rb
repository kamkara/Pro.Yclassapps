class CitynamesController < ApplicationController
  before_action :set_cityname, only: %i[ show edit update destroy ]

  # GET /citynames or /citynames.json
  def index
    @citynames = Cityname.all
  end

  # GET /citynames/1 or /citynames/1.json
  def show
  end

  # GET /citynames/new
  def new
    @cityname = Cityname.new
  end

  # GET /citynames/1/edit
  def edit
  end

  # POST /citynames or /citynames.json
  def create
    @cityname = Cityname.new(cityname_params)

    respond_to do |format|
      if @cityname.save
        format.html { redirect_to cityname_url(@cityname), notice: "Cityname was successfully created." }
        format.json { render :show, status: :created, location: @cityname }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cityname.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /citynames/1 or /citynames/1.json
  def update
    respond_to do |format|
      if @cityname.update(cityname_params)
        format.html { redirect_to cityname_url(@cityname), notice: "Cityname was successfully updated." }
        format.json { render :show, status: :ok, location: @cityname }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cityname.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /citynames/1 or /citynames/1.json
  def destroy
    @cityname.destroy

    respond_to do |format|
      format.html { redirect_to citynames_url, notice: "Cityname was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cityname
      @cityname = Cityname.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cityname_params
      params.require(:cityname).permit(:title, :slug, :user_id)
    end
end
