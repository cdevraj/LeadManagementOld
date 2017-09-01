class LeadsController < ApplicationController
	before_action :set_lead, only: [:show, :edit, :update, :destroy]

  # GET /Leads
  # GET /Leads.json
  def index
    @leads = Lead.where(params[:lead_id])
  end

  # GET /Leads/1
  # GET /Leads/1.json
  def show
  end

  # GET /Leads/new
  def new
    @lead = Lead.new
  end

  # GET /Leads/1/edit
  def edit
  end

  # POST /Leads
  # POST /Leads.json
  def create
    @lead = Lead.new(lead_params)

    respond_to do |format|
      if @lead.save
        format.html { redirect_to root_url, notice: 'Lead created' }
        format.json { render :show, status: :created, location: @lead }
      else
        format.html { render :new }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Leads/1
  # PATCH/PUT /Leads/1.json
  def update
    respond_to do |format|
      if @lead.update(Lead_params)
        format.html { redirect_to @lead, notice: 'Lead was successfully updated.' }
        format.json { render :show, status: :ok, location: @lead }
      else
        format.html { render :edit }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Leads/1
  # DELETE /Leads/1.json
  def destroy
    @lead.destroy
    respond_to do |format|
      format.html { redirect_to leads_url, notice: 'Lead Logged out.' }
      format.json { head :no_content }
    end
  end

  def show_leads
  	puts "params --- #{params.inspect}"
  	@lead_generators_leads = Lead.where(lead_id: params[:lead_id])
    respond_to do |format|
      format.html
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lead
      @lead = Lead.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lead_params
      params.require(:lead).permit(:first_name, :last_name, :email, :email2, :phone_number, :phone_number2, :category, :company_url, :about_me, :status, :comment, :lead_id)
    end
end