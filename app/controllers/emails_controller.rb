class EmailsController < ApplicationController
  before_action :set_email, only: [:show, :edit, :update, :destroy]

  # GET /emails
  # GET /emails.json
  def index
    @emails = Email.where(sender_id: current_user.id)
  end

  # GET /emails/1
  # GET /emails/1.json
  def show
  end

  # GET /emails/new
  def new
    @email = Email.new
    puts "current_user----#{current_user.lead_generators.inspect}"
    @leads_email_map = Lead.where(lead_id: current_user.lead_generators.pluck(:id)).inject([]) do |array, obj|
      array << ["#{obj.first_name} #{obj.last_name}", [obj.email, obj.email2].reject(&:blank?)].reject(&:blank?)
    end
  end

  # GET /emails/1/edit
  def edit
  end

  # POST /emails
  # POST /emails.json
  def create
    sending_emails = email_params['reciever_id'].tap { |hs| hs.delete('reciever_id') }
    # send_mails here 
    sending_params = {subject: email_params['subject'], body: email_params['body']}
    unless email_params['to_be_sent_in'].blank?
      UserMailer.send_email(current_user, sending_emails.reject(&:blank?), sending_params).deliver_later(wait_untill: email_params['to_be_sent_in'].to_i.minutes)
    else
      UserMailer.send_email(current_user, sending_emails.reject(&:blank?), sending_params).deliver
    end
    email_params['reciever_id'].reject(&:blank?).each do |reciever_email|
      lead  = Lead.where("email OR email2 IN (?)", reciever_email).first rescue nil
      next(reciever_email) unless lead
      @email = Email.new(email_params.merge(reciever_id: lead.id, lead_generator_id: lead.lead_generator.id, reciever_email: reciever_email))  
      @email.save
    end
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Email will be send at scheduled time' }
    end
  end

  # PATCH/PUT /emails/1
  # PATCH/PUT /emails/1.json
  def update
    respond_to do |format|
      if @email.update(email_params)
        format.html { redirect_to @email, notice: 'Email was successfully updated.' }
        format.json { render :show, status: :ok, location: @email }
      else
        format.html { render :edit }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emails/1
  # DELETE /emails/1.json
  def destroy
    @email.destroy
    respond_to do |format|
      format.html { redirect_to emails_url, notice: 'Email was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email
      @email = Email.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def email_params
      params.require(:email).permit(:sender_id, :subject, :content, :smtp, :to_be_sent_in,  :reciever_id => [])
    end
end
