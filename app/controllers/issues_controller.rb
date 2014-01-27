class IssuesController < ApplicationController
  before_filter :signed_in_admin, only: [:new_entry, :create]

  def new
  end

  def index
    @issues = Issues.all
  end

  def create
    @new_entry = Issues.new(issue_param)
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
      @issue = db_swiss_knife(Issues.find(params[:id]))
    rescue ActiveRecord::RecordNotFound
      return render 'not_found'
    end
  end

  def about
  end

  def new_entry
  end

  def home
    @issue = db_swiss_knife(Issues.last)
  end

  private
  def issue_param
    params.require(:issues).permit(:tip1, :tip2, :tip3,
                                   :tip4, :tip5, :release_date)
  end

  def signed_in_admin
    redirect_to root_path unless signed_in?
  end

  # Because we don't have any fancy join tables or
  # whatsover, we simply save each entry by dimacating
  # its use to that particular, this method on the other
  # hand extracts the data in a format that we can use
  # this swiss knife method does the job by returning a hash
  # of what we care about from the db
  def db_swiss_knife(id)
      Issues.find_by_id(id)
      #single_week_entry = @archive.select { |key, value| key.to_s.match(/^tip\d+/) }
      #single_week_entry.each do |key, value|
      #@tip_number = key
      #end
      #db_content = @archive
      #split_array = %w[headline: content: code:]
      #words_regex = /(?:#{ Regexp.union(split_array).source })/i
      #db_content.split(words_regex).map(&:strip)
      #@headline = db_content[1]
      #@content = db_content[2]
      #@code = db_content[3]

  end
end
