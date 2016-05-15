class ArifactsController < ApplicationController
  before_action :set_arifact, only: [:show, :edit, :update, :destroy]

  # GET /arifacts
  # GET /arifacts.json
  def index
    @arifacts = Arifact.all
  end

  # GET /arifacts/1
  # GET /arifacts/1.json
  def show
  end

  # GET /arifacts/new
  def new
    @arifact = Arifact.new
    @arifact.project_id = params[:project_id]
  end

  # GET /arifacts/1/edit
  def edit
  end

  # POST /arifacts
  # POST /arifacts.json
  def create
    @arifact = Arifact.new(arifact_params)

    respond_to do |format|
      if @arifact.save
        format.html { redirect_to tenant_project_url(tenant_id: Tenant.current_tenant_id, id: @arifact.project.id), notice: 'Arifact was successfully created.' }
        format.json { render :show, status: :created, location: @arifact }
      else
        format.html { render :new }
        format.json { render json: @arifact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /arifacts/1
  # PATCH/PUT /arifacts/1.json
  def update
    respond_to do |format|
      if @arifact.update(arifact_params)
        format.html { redirect_to @arifact, notice: 'Arifact was successfully updated.' }
        format.json { render :show, status: :ok, location: @arifact }
      else
        format.html { render :edit }
        format.json { render json: @arifact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /arifacts/1
  # DELETE /arifacts/1.json
  def destroy
    @arifact.destroy
    respond_to do |format|
      format.html { redirect_to tenant_project_url(tenant_id: Tenant.current_tenant_id, id: @arifact.project_id), notice: 'Arifact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_arifact
      @arifact = Arifact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def arifact_params
      params.require(:arifact).permit(:name, :project_id, :upload)
    end
end
