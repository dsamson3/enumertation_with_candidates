# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
@candidates.detect {|candidate| candidate[:id] == id}
end

def experienced?(candidate)
candidate[:years_of_experience] >= 2
end

def qualified_candidates(candidates)
@candidates.select { |candidate| experienced?(candidate) &&
  more_than_100_github_points?(candidate) && know_ruby_python?(candidate) &&
  applied_last_15_days?(candidate) && legal_age?(candidate)
}
end

# More methods will go below

def ordered_by_qualifications(candidates)
  if [:years_of_experience] == [:years_of_experience]
  @candidates.sort_by { |experience| experience[:years_of_experience] }.reverse
  else
    @candidates.sort_by { |github| github[:github_points]}.reverse
  end
end



def more_than_100_github_points?(candidate)
  candidate[:github_points] > 100
end

def know_ruby_python?(candidate)
  candidate[:languages].include?("Ruby") || candidate[:languages].include?("Python")
end

def applied_last_15_days?(candidate)
  candidate[:date_applied] >= 15.days.ago.to_date
end

def legal_age?(candidate)
  candidate[:age] > 17
end