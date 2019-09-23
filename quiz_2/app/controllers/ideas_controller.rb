class IdeasController < ApplicationController
    before_action :find_idea, only: [:edit, :update, :show, :destroy]
    def new
        @idea = Idea.new
    end

    def create
        @idea = Idea.new idea_params
        if @idea.save
            redirect_to @idea
          else
            render :new
          end
    end

    def show
        
    end

    def index
        @ideas = Idea.all
    end

    def destroy
        flash[:notice] = "Idea destroyed!"
        @idea.destroy
        redirect_to ideas_path
    end

    def edit
        
    end

    def update
        if @idea.update idea_params
          redirect_to idea_path(@idea)
        else
          render :edit
        end 
    end

    private

    def idea_params
        params.require(:idea).permit(:title,:description)
    end

    def find_idea
        @idea = Idea.find(params[:id])
    end
end
