class Issues < ActiveRecord::Base

  [:tip1, :tip2, :tip3, :tip4, :tip5, :release_date].each do |attribute|
    validates attribute, presence: true
  end

end
