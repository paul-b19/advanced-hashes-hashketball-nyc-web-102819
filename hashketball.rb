require 'pp'

def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {player_name: "Alan Anderson",
        number: 0,
        shoe: 16,
        points: 22,
        rebounds: 12,
        assists: 12,
        steals: 3,
        blocks: 1,
        slam_dunks: 1},
        {player_name: "Reggie Evans",
        number: 30,
        shoe: 14,
        points: 12,
        rebounds: 12,
        assists: 12,
        steals: 12,
        blocks: 12,
        slam_dunks: 7},
        {player_name: "Brook Lopez",
        number: 11,
        shoe: 17,
        points: 17,
        rebounds: 19,
        assists: 10,
        steals: 3,
        blocks: 1,
        slam_dunks: 15},
        {player_name: "Mason Plumlee",
        number: 1,
        shoe: 19,
        points: 26,
        rebounds: 11,
        assists: 6,
        steals: 3,
        blocks: 8,
        slam_dunks: 5},
        {player_name: "Jason Terry",
        number: 31,
        shoe: 15,
        points: 19,
        rebounds: 2,
        assists: 2,
        steals: 4,
        blocks: 11,
        slam_dunks: 1}
      ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        {player_name: "Jeff Adrien",
        number: 4,
        shoe: 18,
        points: 10,
        rebounds: 1,
        assists: 1,
        steals: 2,
        blocks: 7,
        slam_dunks: 2},
        {player_name: "Bismack Biyombo",
        number: 0,
        shoe: 16,
        points: 12,
        rebounds: 4,
        assists: 7,
        steals: 22,
        blocks: 15,
        slam_dunks: 10},
        {player_name: "DeSagna Diop",
        number: 2,
        shoe: 14,
        points: 24,
        rebounds: 12,
        assists: 12,
        steals: 4,
        blocks: 5,
        slam_dunks: 5},
        {player_name: "Ben Gordon",
        number: 8,
        shoe: 15,
        points: 33,
        rebounds: 3,
        assists: 2,
        steals: 1,
        blocks: 1,
        slam_dunks: 0},
        {player_name: "Kemba Walker",
        number: 33,
        shoe: 15,
        points: 6,
        rebounds: 12,
        assists: 12,
        steals: 7,
        blocks: 5,
        slam_dunks: 12}
      ]
    }
  }
end

def num_points_scored(player_name)
  points = 0
  game_hash.each_value do |v|
    v.each_value do |vv|
      if vv.class == Array
        vv.each do |i|
          if i.class == Hash
            points = i[:points] if i[:player_name] == player_name
          end
        end
      end
    end
  end
  #puts "#{player_name} -> #{points}"
  points
end

def shoe_size (player_name)
  shoe_size = 0
  game_hash.each_value do |v|
    v.each_value do |vv|
      if vv.class == Array
        vv.each do |i|
          if i.class == Hash
            shoe_size = i[:shoe] if i[:player_name] == player_name
          end
        end
      end
    end
  end
  #puts "#{player_name} -> #{shoe_size}"
  shoe_size
end

def team_colors (team)
  colors = []
  game_hash.each do |k, v|
    colors = v[:colors] if v[:team_name] == team
  end
  #puts "#{team} -> #{colors}"
  colors
end

def team_names
  teams = []
  game_hash.each {|k, v| teams << v[:team_name]}
  #puts teams
  teams
end

def player_numbers (team)
  numbers = []
  game_hash.each do |k, v|
    if v[:team_name] == team
      v[:players].each do |i|
        numbers << i[:number]
      end
    end
  end
  #puts "#{team} -> #{numbers}"
  numbers
end

def player_stats (name)
  stats = {}
  game_hash.each_value do |v|
    v[:players].each do |i|
      if i[:player_name] == name
        stats = i.select do |kk, vv|
          kk != :player_name
        end
      end
    end
  end
  #pp "#{name} -> #{stats}"
  stats
end

def big_shoe_rebounds
  shoe_size = 0
  rebounds = 0 
  game_hash.each_value do |v|
    v[:players].each do |i|
      if i[:shoe] > shoe_size
        shoe_size = i[:shoe]
        rebounds = i[:rebounds]
      end
    end
  end
  #puts "#{shoe_size} -> #{rebounds}"
  rebounds
end

# bonus

def most_points_scored
  name = ""
  points = 0 
  game_hash.each_value do |v|
    v[:players].each do |i|
      if i[:points] > points
        name = i[:player_name]
        points = i[:points]
      end
    end
  end
  #puts "#{name} -> #{points}"
  name
end

def winning_team
  team_points = {}
  team = ""
  game_hash.each_value do |v|
    points = 0
    v[:players].each do |i|
      points += i[:points]
    end
    team_points[v[:team_name]] = points
    pp team_points
  end
  team = team_points.key(team_points.values.max)
end

def player_with_longest_name
  names = []
  game_hash.each_value do |v|
    v[:players].each do |i|
      names << i[:player_name]
    end
  end
  longest_name = names.max_by{|i| i.length}
end

# super bonus

def long_name_steals_a_ton?
  longest_name = player_with_longest_name
  max_steals_player = ""
  steals = 0 
  game_hash.each_value do |v|
    v[:players].each do |i|
      if i[:steals] > steals
        max_steals_player = i[:player_name]
        steals = i[:steals]
      end
    end
  end
  longest_name == max_steals_player
end



















