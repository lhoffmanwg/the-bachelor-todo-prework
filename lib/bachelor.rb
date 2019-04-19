require 'pry'

def get_first_name_of_season_winner(data, season)
  winner_array = []
  winner = ""
  data.each do |hash_season, contestant_info|
     if hash_season == season
      contestant_info.each do |details|
        details.each do |key, value|
          if value == "Winner"
            winner_array = details["name"].split
            winner = winner_array[0]
            #binding.pry
            return winner
          end 
        end
      end
    end  
  end
end

def get_contestant_name(data, occupation)
  data.each do |hash_season, contestant_info_array|
    contestant_info_array.each do |info_hash|
      info_hash.each do |info_key, info_value|
        if occupation == info_value
          return info_hash["name"]
        end  
      end  
    end    
  end  
end

def count_contestants_by_hometown(data, hometown)
  town_count = 0
  data.each do |hash_season, contestant_info_array|
    contestant_info_array.each do |details_hash|
      details_hash.each do |detail_key, detail_value|
        if detail_value == hometown
          town_count = town_count + 1
        end  
      end  
    end  
  end    
  return town_count
end

def get_occupation(data, hometown)
 #hometown_counter = 0  
 #contestant_occupation = ""
 data.each do |hash_season, contestant_info_array|
   contestant_info_array.each do |info_hash|
     info_hash.each do |info_key, info_value|
       if info_value == hometown
           return info_hash["occupation"]
       end   
     end     
   end   
 end   
 #return contestant_occupation
end

def get_average_age_for_season(data, season)
  age_counter = 0
  total_age = 0
  average_age = 0 
  contestant_info_array = data[season]
  contestant_info_array.each do |info_hash|
    total_age = total_age + info_hash ["age"].to_i 
    age_counter = age_counter + 1
   end
   average_age = (total_age + age_counter/2)/age_counter
   binding.pry
   return average_age
end
