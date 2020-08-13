class Employers::JobsController < ApplicationController
	  before_action :authenticate_user!

	def index
		@jobs = current_user.jobs.page params[:page]
		@company = current_user.company
	end
	def new
		@jobs = Job.new
	end

	def create
		@job = current_user.jobs.build job_params
		if @job.save
			flash[:success] = "Job created!"
      redirect_to root_url
		else
			flash[:success] = "Job error!"
			redirect_to root_url
		end
	end

	def show
		@job = Job.find params[:id]
		@users = @job.applyjobs

	end

	private
  def job_params
    params.require(:job).permit :title, :sex ,
     :time_work, :grade, :exp, :salary, :number, :area, :info
  end

end
