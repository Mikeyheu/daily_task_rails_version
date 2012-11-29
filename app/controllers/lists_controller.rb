class ListsController < ApplicationController
	def index
		@list = List.new
		@lists = List.all
		@tasks = Task.all
	end

	def show
		@lists = List.all
		@list = List.find(params[:id])
		@tasks = @list.tasks.order('position')
		@task = Task.new
	end

	def create
		@list = List.new(params[:list])
		if @list.save
			redirect_to lists_path
		end
	end

	def destroy
		@list = List.find(params[:id])
		@list.destroy
		respond_to do |format|
      format.html { redirect_to lists_path }
      format.json { head :no_content }
    end
	end

	


end
