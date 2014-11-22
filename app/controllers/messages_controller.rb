class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  skip_before_filter :authenticate_user!, only: [:index]

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
    @geo = []

    @messages.each do |message|
      @geo << {
        type: 'Feature',
        geometry: {
          type: message.lonlat.geometry_type.type_name,
          coordinates: [message.lonlat.y, message.lonlat.x]
        },
        properties: {
          title: message.content,
          :'marker-color'  => '#FD8204',
          :'marker-symbol' => 'circle',
          :'marker-size'   => 'large'
        }
      }
    end

    respond_to do |format|
      format.html
      format.json { render json: @geo }
    end
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = current_user.messages.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = current_user.messages.new(message_params)
    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = current_user.messages.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:content, :lonlat)
    end
end
