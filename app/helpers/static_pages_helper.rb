module StaticPagesHelper
  def limited_infection(desired_number)

    valid_options = []
    @users.each do |student|
      result = student.total_infection
      if (result[0] === desired_number)
        valid_options.push(result)
      end
    end
      p 77
    if (valid_options.length === 0)
      return "Limited Infection Not Possible"
    else
      return valid_options
    end
  end
end
