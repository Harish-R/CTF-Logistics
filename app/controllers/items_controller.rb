class ItemsController < ApplicationController

  def create
    @item = Item.new
    @item.item_name = params[:item_name]
    @item.item_total = Integer(params[:item_total])
    @item.item_requested = 0
    @item.item_approved = 0
    @item.item_remaining = params[:item_total]
    @item.save

    if @item.save
      if session[:user_type] == 'admin'
        redirect_to(:action => 'admin_dashboard')
      else
        redirect_to(:action => 'user_dashboard')
      end
    end
  end


  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    if session[:user_type] == "admin"
      redirect_to(:action => admin_dashboard)
    else
      redirect_to(:action => user_dashboard)
    end
  end

  def update
  end

  def show
  end

  def admin_dashboard
    @items = Item.all
  end

  # def user_dashboard
  #   @team = Team.where(:team_name => session[:user_team])
  #   @requests = Request.where(:team_id => @team.id)
  # end

  def list_by_team
    @team = Team.where(:team_name => params[:team_name])
    @requests = Request.where(:team_id => @team[:id])
  end

  def list_by_item
    @item = Item.where(:item_name => params[:item_name])
    @requests = Request.where(:product_id => Integer(@item[:id]))
  end

end
