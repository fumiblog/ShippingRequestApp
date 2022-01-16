class Users::JobsController < ApplicationController
  def index
    @job = Job.new
    @jobs = Job.all
    # @jobs = Job.where(person_id: params[:id])
    @person = Person.find(params[:id])
    # byebug
  end

  def create
    @job = Job.new(job_params)
    @job.save!
    redirect_to root_path
  end

  def edit
    @job = Job.find(praarams[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.update
    redirect_to root
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to root
  end

  private
  def job_params
    params.require(:job).permit(
      :date,
      :type,
      :content,
      :person_id,
      :completed
    )
  end
end
