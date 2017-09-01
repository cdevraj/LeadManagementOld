class EmailNotesController < ApplicationController
  before_action :set_email_note, only: [:show, :edit, :update, :destroy]

  # GET /email_notes
  # GET /email_notes.json
  def index
    @email_notes = EmailNote.all
  end

  # GET /email_notes/1
  # GET /email_notes/1.json
  def show
  end

  # GET /email_notes/new
  def new
    @email_note = EmailNote.new
  end

  # GET /email_notes/1/edit
  def edit
  end

  # POST /email_notes
  # POST /email_notes.json
  def create
    @email_note = EmailNote.new(email_note_params)

    respond_to do |format|
      if @email_note.save
        format.html { redirect_to '/emails', notice: 'Email note was successfully created.' }
        format.json { render :show, status: :created, location: @email_note }
      else
        format.html { render :new }
        format.json { render json: @email_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /email_notes/1
  # PATCH/PUT /email_notes/1.json
  def update
    respond_to do |format|
      if @email_note.update(email_note_params)
        format.html { redirect_to @email_note, notice: 'Email note was successfully updated.' }
        format.json { render :show, status: :ok, location: @email_note }
      else
        format.html { render :edit }
        format.json { render json: @email_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /email_notes/1
  # DELETE /email_notes/1.json
  def destroy
    @email_note.destroy
    respond_to do |format|
      format.html { redirect_to email_notes_url, notice: 'Email note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email_note
      @email_note = EmailNote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def email_note_params
      params.require(:email_note).permit(:email_id, :notes, :user_id)
    end
end
