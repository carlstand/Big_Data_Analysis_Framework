require "rubygems"
require "highline/import"

@C = 299792458

def accel_calc
  mass = ask("Mass? ", Float)
  speed = ask("Speed? ", Float)
  puts
  puts("mass * speed = #{mass*speed}")
  puts
end

def energy_calc
  mass = ask("Mass? ", Float)
  puts
  puts("E=MC^2 gives #{mass*@C**2}")
  puts
end

def update_database
  puts
  puts "About 1 minute!"
  load "inbox.rb"
  load "outbox.rb"
  puts
  puts "Database Load Successfuly!!!"
  puts
end 

def day_of_month
  load "../00mails_by_day_of_month/mails_by_day_of_month_orig.rb"  
end

def day_of_week
  puts "Will be added!"
end

def day_of_hour
  puts "Will be added!"
end

def interactions
  puts
  load "../02interactions/interactions.rb"
end

def comparative_interactions
  puts
  load "../01comparative_interactions/comparative_interactions.rb"
end

begin
  puts
  loop do
    choose do |menu|
      menu.prompt = "Please select your action: "
      menu.choice(:Demo_Day_of_MONTH) { day_of_month() }
      menu.choice(:Demo_Day_of_WEEK) { day_of_week() }
      menu.choice(:Demo_Day_of_HOUR) { day_of_hour() }
      menu.choice(:Demo_Interactions) { interactions() }
      menu.choice(:Demo_Comparative_Interactions) { comparative_interactions() }
      menu.choice(:UpdateDatabase) { update_database() }
      menu.choice(:Quit, "Exit program.") { exit }
    end
  end
end