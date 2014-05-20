class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy, :openInfoModal, :uploadAttachment, :addComment]

  # GET /cards
  # GET /cards.json
  def index
    @cards = Card.all
  end

  # GET /cards/1
  # GET /cards/1.json
  def show
  end

  # GET /cards/new
  def new
    @card = Card.new
  end

  # GET /cards/1/edit
  def edit
  end

  # POST /cards
  # POST /cards.json
  def create
    @card = Card.new(card_params)

    respond_to do |format|
      if @card.save
        format.html { redirect_to @card, notice: 'Card was successfully created.' }
        format.json { render action: 'show', status: :created, location: @card }
      else
        format.html { render action: 'new' }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cards/1
  # PATCH/PUT /cards/1.json
  def update
    respond_to do |format|
      if @card.update(card_params)
        format.html { redirect_to @card, notice: 'Card was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.json
  def destroy
    @card.destroy
    respond_to do |format|
      format.html { redirect_to cards_url }
      format.json { head :no_content }
    end
  end

  def openInfoModal
    render :partial => "/cards/popUps/info"
  end

  def uploadAttachment
    if !params[:upload].blank?
      attachment = @card.attachments.create(:file_name => params[:upload], :url => params[:upload], :user_id => current_user.id)
    end

    redirect_to(:back)
  end

  def removeAttachment
    attachment = Attachment.find(params[:id])
    attachment.nodeAttachments.destroy
    attachment.destroy

    redirect_to(:back)
  end

  def addComment
    @card.comments.create(:comment => params[:comment], :user_id => current_user.id)
    
    redirect_to(:back)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = Card.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_params
      params.require(:card).permit(:name, :description, :genre, :bookOfKnowledge, :educators, :language)
    end
end
