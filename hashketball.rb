# Write your code here!
require 'pry'
def game_hash
  game_hash = {
    home: {
      team_name: "Brooklyn Nets" ,
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {number: 0, shoe: 16, points: 22, rebounds: 12, assists:12, steals:3, blocks: 1, slam_dunks: 1 },
        "Reggie Evans" => {number: 30, shoe: 14, points: 12, rebounds: 12, assists:12, steals:12, blocks: 12, slam_dunks: 7 },
        "Brook Lopez"  => {number: 11, shoe: 17, points: 17, rebounds: 19, assists:10, steals:3, blocks: 1, slam_dunks: 15 },
        "Mason Plumlee"  => {number: 1, shoe: 19, points: 26, rebounds: 12, assists:6, steals:3, blocks: 8, slam_dunks: 5 },
        "Jason Terry"  => {number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1 }
      },
    },
    away: {
      team_name: "Charlotte Hornets" ,
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2 },
        "Bismak Biyombo" => {number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10 },
        "DeSagna Diop" => {number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5 },
        "Ben Gordon" => {number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0 },
        "Brendan Haywood" => {number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12 }
      },
    }
  }
end

# def good_practices
#   game_hash.each do |location, team_data|
#     #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
#     # binding.pry
#       team_data.each do |attribute, data|
#         #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
#         # binding.pry
#
#         #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
#         if data.kind_of?(Array) || data.kind_of?(Hash)
#           data.each do |data_item|
#             binding.pry
#           end
#         end
#     end
#   end
# end
#
# good_practices


def num_points_scored (player)
  game_hash
  if game_hash[:home][:players][player]
    game_hash[:home][:players][player][:points]
  elsif game_hash[:away][:players][player]
    game_hash[:away][:players][player][:points]
  end
end

def shoe_size (player)
  game_hash
  if game_hash[:home][:players][player]
    game_hash[:home][:players][player][:shoe]
  elsif game_hash[:away][:players][player]
    game_hash[:away][:players][player][:shoe]
  end
end

def team_colors(team)
  game_hash
  colors_array = []
  game_hash.each do |location, team_data|
     team_data.each do |attribute, data|
       if data === team
         game_hash[location][:colors].each {|color| colors_array.push(color)}
       end
     end
   end
   return colors_array
 end

def team_names
  game_hash
  team_list = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute === :team_name
        team_list.push(game_hash[location][attribute])
      end
    end
  end
  team_list
end
team_names

def player_numbers (team_name)
  game_hash
  player_number = []
  game_hash.each do |location, team_data|
    team_data.each do|attribute, data|
      if attribute === :team_name && data === team_name
        game_hash[location][:players].each do |player, player_data|
          player_data.each do |key, index|
            if key === :number
              player_number.push(index)
            end
          end
        end
      end
    end
  end
  player_number
end

def player_stats(player_for)
  player_stats_arr = []
  game_hash.each do |location, team_data|
    team_data.each do|attribute, data|
      if attribute === :players
          data.each do |player, player_stats|
            if player === player_for
              player_stats_arr.push(player_stats)
            end
          end
      end
    end
  end
  player_stats_arr[0]
end

def big_shoe_rebounds
  player_collection = 0
  shoe_size = 0
  game_hash.each do |location, team_data|
    team_data.each do|attribute, data|
      if attribute === :players
        data.each do |player, player_stats|
          player_stats.each do |key, index|
            if key === :shoe
              if index > shoe_size
                shoe_size = index
              end
            end
          end
          # player_collection.push(player)
        end
      end
    end
  end
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute === :players
        data.each do |player, player_stats|
          player_stats.each do |key, index|
            if key === :shoe && index === shoe_size
              player_collection = game_hash[location][:players][player][:rebounds]
            end
          end
        end
      end
    end
  end
  player_collection
end
