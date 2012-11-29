class TasksController < ApplicationController

	def create
		@task = Task.new(params[:task])
		@list = List.find(params[:task][:list_id])
		tasks = @list.tasks
  		tasks.each do |task|
    	task.position = task.position + 1
    	task.save
  	end

		if @task.save
			redirect_to @list
		end
	end

	def update
		@task = Task.find(params[:id])
		@list = @task.list
    @task.content = params[:content]
    @task.save

    render :nothing => true
	end

	def destroy
		@task = Task.find(params[:id])
		@list = @task.list
    @task.destroy

    respond_to do |format|
      format.html { redirect_to list_path(@list) }
      format.json { head :no_content }
    end
	end

	def complete
		@task = Task.find(params[:id])
		@list = @task.list
		if @task.complete == false
			@task.complete = true
		else
			@task.complete = false
		end
 		@task.save  

 		redirect_to @list
	end

	def sort
		params[:task].each_with_index do |task, index|
	    t = Task.find(task.to_i)
	    t.position = index
	    t.save # might be expensive 
	 	end

	 	 render :nothing => true
	end


end
