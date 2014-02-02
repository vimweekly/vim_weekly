class IssuesController < ApplicationController
  before_filter :signed_in_admin, only: [:new_entry, :create]

  def new
  end

  def index
    @issues = Issue.all
  respond_to do |format|
    format.html
    format.xml { render xml: @issues }
    format.json { render json: @issues }
  end
  end

  def create
    @new_entry = Issue.new(issue_param)
    if @new_entry.save
      flash[:success] = "New entry added"
      redirect_to root_url
    else
      flash[:error] = "Submission failed!"
      render 'new_entry'
    end
  end

  def show
    begin
      @issue = Issue.find(params[:id])
      issue_db_values(params[:id])
    rescue ActiveRecord::RecordNotFound
      return render 'not_found'
    end
  end

  def about
  end

  def new_entry
  end

  def home
    @issue = Issue.last
    issue_db_values(Issue.last.id)
  end

  def issue_db_values(id)
    @issue_number = id
    @issue_release_date = Issue.find(@issue_number).release_date
    @tip_val = Issue.find(id).tip
  end

  private
  # This is to allow mass assignment
  def issue_param
    params.require(:tip).permit(:author, :code, :summary,
                                :description)
  end

  def signed_in_admin
    redirect_to root_path unless signed_in?
  end
end
