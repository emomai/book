class FlowersController < ApplicationController

    before_action :authenticate_user!, only: [:new, :create]
def top

  end
    def index
      @flowers = Flower.all
      search = params[:search]
      @flowers = @flowers.joins(:user).where("body LIKE ?", "%#{search}%") if search.present?
        
   end




    def new
        @flower= Flower.new
    end

    def create
      flower = Flower.new(flower_params)
      if flower.save!
        redirect_to :action => "index"
      else
        redirect_to :action => "new"
      end
    end

     def show
        @flower = Flower.find(params[:id])
      end

      def edit
        @flower = Flower.find(params[:id])
      end


def update
    flower = Flower.find(params[:id])
    if flower.update(flower_params)
      redirect_to :action => "show", :id => flower.id
    else
      redirect_to :action => "new"
    end
  end

  def destroy
    flower = Flower.find(params[:id])
    flower.destroy
    redirect_to action: :index
  end


      private
  def flower_params
    params.require(:flower).permit(:title, :body, :image)
  end
end



