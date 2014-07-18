class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show] 

 def index
   require 'will_paginate/array'
   @pins = Pin.all.sort_by { |pin| pin.votes.count }.reverse.paginate(:page => params[:page], :per_page => 25)
   # MARK @pins = Pin.joins(:votes).group("votes.pin_id").all.paginate(:page => params[:page], :per_page => 25)
 end


  def show
  end

  def new
    @pin = current_user.pins.build
  end

  def edit
  end


  def create
    @pin = current_user.pins.build(pin_params)

      if @pin.save
        redirect_to @pin, notice: 'Pin was successfully created.'
      else
        render action: 'new'
      end
  end


  def update
      if @pin.update(pin_params)
        redirect_to @pin, notice: 'Pin was successfully updated.'
      else
        render action: 'edit'
      end
  end


  def destroy
    @pin.destroy
    redirect_to pins_url
  end

  def upvote
    @pin = Pin.find(params[:id])
    @vote = Vote.where(:user_id => current_user.id, :pin_id => @pin.id).first
    @pin.votes.create({:user_id => current_user.id }) unless @vote
    redirect_to(pins_path)

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def correct_user
      @pin = current_user.pins.find_by(id: params[:id])
      redirect_to pins_path, notice: "Not authorized to edit this pin" if @pin.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pin_params
      params.require(:pin).permit(:description, :image)
    end
end
