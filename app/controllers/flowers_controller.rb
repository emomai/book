class FlowersController < ApplicationController

    before_action :authenticate_user!, only: [:new, :create]
def top

  end
    def index
      @flowers = Flower.all
      search = params[:search]
      @flowers = @flowers.joins(:user).where("body LIKE ?", "%#{search}%") if search.present?
        end
   end




    def new
        @flower= Flower.new
    end

    def create
      flower = Flower.new(flower_params)

      flower.user_id = current_user.id
      if flower.save
        flash[:notice] = "診断が完了しました"
        redirect_to perfume_path(perfume.id) 
      else
        redirect_to :action => "new"
      end
    end

     def show
        @Flower=Flower.find(params[:id])
      end

      def edit
        @Flower = Flower.find(params[:id])
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
    params.require(:flower).permit(:body, :image,:question1, :question2, :question3, :question4)
  end




