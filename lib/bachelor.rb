
def get_first_name_of_season_winner(data, season)
winner = ""
  data.each do |season_number, info|
    if season_number == season
      info.each do |hash|
        hash.each do |category, contains|
          if contains == "Winner"
            hash.each do |category, contains|
              if category == "name"
                winner = contains.split.first
              end
            end
          end
        end
      end
    end
  end
  winner
end


def get_contestant_name(data, occupation)
  contestant_name = ""
  data.each do |season_number, statistics|
    statistics.each do |category_hash|
      category_hash.each do |category, contains|
        if contains == occupation
          category_hash.each do |category, contains|
            if category == "name"
              contestant_name = contains
            end
          end
        end
      end
    end
  end
  contestant_name
end

def count_contestants_by_hometown(data, hometown)
  hometown_count = 0
  data.each do |season_number, statistics|
    statistics.each do |category_hash|
      category_hash.each do |category, contains|
        if contains == hometown
          hometown_count += 1
        end
      end
    end
  end
  hometown_count
end

def get_occupation(data, hometown)
  data.each do |season_number, statistics|
    statistics.each do |category_hash|
      category_hash.each do |category, contains|
        if contains == hometown
          return category_hash["occupation"]
        end
      end
    end
  end
end

def get_average_age_for_season(data, season)
  average_age = 0
  i = 0
  data.each do |season_number, statistics|
    if season_number == season
      statistics.each do |category_hash|
        category_hash.each do |category, contains|
          if category == "age"
            average_age += contains.to_f
            i += 1
          end
        end
      end
    end
  end
  (average_age / i).round
end
