require 'pry'
holiday_hash = {
  :winter => {
    :christmas => ["Lights", "Wreath"],
    :new_years => ["Party Hats"]
  },
  :summer => {
    :fourth_of_july => ["Fireworks", "BBQ"]
  },
  :fall => {
    :thanksgiving => ["Turkey"]
  },
  :spring => {
    :memorial_day => ["BBQ"]
  }
}

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array

  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays

  holiday_hash[:winter].each do |attribute, data|
    data.push(supply)
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array

  holiday_hash[:spring][:memorial_day].push(supply)
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash

  holiday_hash[season][holiday_name] = supply_array
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season

  holiday_hash[:winter].values.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.

  holiday_hash.each do |season, holidays|
    puts "#{season.to_s.capitalize}:"
    holidays.each do |holiday, supplies|
      capitalized_holiday = format_words(holiday)
      supplies_formatted = supplies.map {|supply| format_words(supply)}
      puts "  #{capitalized_holiday}: #{supplies_formatted.join(", ")}"
    end
  end
end

#Formats passed in strings and symbols to be parsed to string, capitalized, and have removed space/underscore.
#Returns original string if whole string is already uppercase.
def format_words(word)
  word_s = word.to_s
  return word_s if word_s.upcase == word_s
  if word_s.include?("_")
    word_s.split("_").map {|word| word.capitalize}.join(" ")
  elsif word_s.include?(" ")
    word_s.split(" ").map {|word| word.capitalize}.join(" ")
  else
    word_s.capitalize
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  bbq_included_holidays = []
  holiday_hash.values.each do |holiday, supplies|
    bbq_included_holidays.push(holiday.to_s) if supplies.include?("BBQ")
  end
  bbq_included_holidays
end
