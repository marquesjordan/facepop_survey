class ContactsController < ApplicationController
  # before_action :set_visitor, only: [:show, :edit, :update, :destroy]

  # GET /visitors/new
  def new
    @contact = Contact.new
  end

  # GET /visitors/1/edit
  def edit
  end

  # POST /visitors
  # POST /visitors.json
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to root_path, notice: 'Visitor was successfully created.' }
        format.json { redirect_to root_path, status: :created, location: @contact }
        format.js
      else
        format.html { redirect_to root_path }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:email)
    end
end
