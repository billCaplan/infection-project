module StaticPagesHelper
    def limited_infection(desired_number)

      seen_students = Hash.new("no")

      valid_options = []

      @users.each do |student|

        if seen_students[student] === "yes"
          next
        else
          result = student.total_infection
          if (result[0] === desired_number)
            result[4] = student
            valid_options.push(result)
          end
          seen_students[student] = "yes"
          result[2].each do |infected_student|
            seen_students[infected_student] = "yes"
          end

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
