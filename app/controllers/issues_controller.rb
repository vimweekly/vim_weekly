class IssuesController < ApplicationController
  def new
  end

  def index
    @issues = Issues.all
  end

  def create
    @new_entry = Issues.new(issue_param)
    puts "Tawheed #{params[:issues]}"
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
      # Because we don't have any fancy join tables or
      # whatsover, we simply save each entry by dimacating
      # its use to that particular, this method on the other
      # hand extracts the data in a format that we can use
      @archive = Issues.find(params[:id]) 
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
    rescue ActiveRecord::RecordNotFound
      return render 'not_found'
    end
  end

  def about
  end

  def new_entry
  end

  def home
    @tip = Issues.last
  end

  private
    def issue_param
      params.require(:issues).permit(:tip1, :tip2, :tip3,
                                     :tip4, :tip5, :release_date)
    end

end
