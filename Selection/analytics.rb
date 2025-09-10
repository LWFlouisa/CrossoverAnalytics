def evaluate_malicious_users(e, f, g, h)
  user_percents = [ e, f, g ], [ :version0p1p0, :version0p1p1, :version_all ]

  github_clones = h

  human_users = user_percents[0][0], user_percents[1][1]
  bot_users   = user_percents[0][1], user_percents[1][0]
  malicious   = user_percents[0][2], user_percents[1][2]

  a = human_users
  b = bot_users
  c = malicious

  malicious_humans = human_users[0] * malicious[0], human_users[1]
  malicious_bots   = bot_users[0]   * malicious[0], bot_users[1]
  
  d = malicious_humans
  e = malicious_bots

  puts "[ #{malicious_humans[0]}, #{malicious_humans[1]} ] About #{malicious_humans[0] * 10} of malicious users are humans."
  puts "[ #{malicious_bots[0]}, #{malicious_bots[1]} ] About #{malicious_bots[0] * 10} of malicious users are bots."

  # [ 0.09889181074248685, version0p1p1 ] Nine percent of malicious users are humans
  # [ 0.06846356125751316, version0p1p0 ] Seven percent of malicious users are bots.

  # Result: 0.777777778 of users are malicious bots.

  user_types = [
    [[a[0], a[0]], [a[0], b[0]], [a[0], c[0]], [a[0], d[0]], [a[0], e[0]]],
    [[b[0], a[0]], [b[0], b[0]], [b[0], c[0]], [b[0], d[0]], [b[0], e[0]]],
    [[c[0], a[0]], [c[0], b[0]], [c[0], c[0]], [c[0], d[0]], [c[0], e[0]]],
    [[d[0], a[0]], [d[0], b[0]], [d[0], c[0]], [d[0], d[0]], [d[0], e[0]]],
    [[e[0], a[0]], [e[0], b[0]], [e[0], c[0]], [e[0], d[0]], [e[0], e[0]]],
  ], [
    [[a[1], a[1]], [a[1], b[1]], [a[1], c[1]], [a[1], d[1]], [a[1], e[1]]],
    [[b[1], a[1]], [b[1], b[1]], [b[1], c[1]], [b[1], d[1]], [b[1], e[1]]],
    [[c[1], a[1]], [c[1], b[1]], [c[1], c[1]], [c[1], d[1]], [c[1], e[1]]],
    [[d[1], a[1]], [d[1], b[1]], [d[1], c[1]], [d[1], d[1]], [d[1], e[1]]],
    [[e[1], a[1]], [e[1], b[1]], [e[1], c[1]], [e[1], d[1]], [e[1], e[1]]],
  ]

  ## Snatch the a random current version and probability
  #versions = user_types[1]
  #probabilities = user_types

  row_options = [0, 1, 2, 3, 4]
  col_options = [0, 1, 2, 3, 4]
  arr_options = [0, 1]

  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample

  current_version     = user_types[1][cur_row][cur_col][cur_arr]
  current_probability = user_types[0][cur_row][cur_col][cur_arr]

  puts "[ #{current_version}, #{current_probability} ]"

  malicious_github_humans = malicious_humans[0] / github_clones, user_percents[1][1]
  malicious_github_bots   = malicious_bots[0] / github_clones,   user_percents[1][0]

  print "[ #{malicious_github_humans[0]}, #{malicious_github_humans[1]} ] About #{malicious_github_humans[0]} malicious github users are humans."; puts " "
  print "[ #{malicious_github_bots[0]}, #{malicious_github_bots[1]} ] About #{malicious_github_bots[0]} malicious github users are bots."; puts " "
end

def evaluate_yt_stats(a, b, c, d, e, f, specified_percent)
  user_channels = [:main_channel, :secondary_channel, :tertiary_channel], [a, c, e]
  
  subscriber_count = [b, d, f]
  
  mc_human_users     = user_channels[0][0], subscriber_count[0]
  sc_human_users     = user_channels[0][1], subscriber_count[1]
  tc_human_users     = user_channels[0][2], subscriber_count[2]

  #puts mc_human_users[1]
  
  husers_mc = 1 - ( 1 / ( 166 * 0.55 ) )
  husers_sc = 1 - ( 1 / ( 87 * 0.55 ) )
  husers_tc = 1 - ( 1 / ( 17 * 0.55 ) )

  #puts husers_mc
  
  hbot_mc = 1 - husers_mc
  hbot_sc = 1 - husers_sc
  hbot_tc = 1 - husers_tc
 
  hmal_mc = hbot_mc * hbot_mc
  hmal_sc = hbot_sc * hbot_sc
  hmal_tc = hbot_tc * hbot_tc
  
  malicious_users_mc = 0.9 * ( specified_percent*mc_human_users[1] )
  malicious_users_sc = 0.9 * ( specified_percent*sc_human_users[1] )
  malicious_users_tc = 0.9 * ( specified_percent*tc_human_users[1] )
  
  puts "[ #{mc_human_users[0]} #{husers_mc}, #{hbot_mc} #{hmal_mc} ] The amount of malicious users is #{malicious_users_mc}"
  puts "[ #{sc_human_users[0]} #{husers_sc}, #{hbot_sc} #{hmal_sc} ] The amount of malicious users is #{malicious_users_sc}"
  puts "[ #{tc_human_users[0]} #{husers_tc}, #{hbot_tc} #{hmal_tc} ] The amount of malicious users is #{malicious_users_tc}"
end

def difference_in_traffic(a, b)
  differential_percent = a.to_f / b.to_f
  
  puts "The difference between Rubygems #{a} and Youtube #{b} is #{differential_percent} percent."
end

#evaluate_malicious_users(0.633333333, 0.366666667, 0.162461546, 128)

#evaluate_yt_stats(:bequest_de_cendres, 166,
#                  :mochitere,           87,
#                  :electrorequiem,      17,
#                  
#                  0.54)
                  
#difference_in_traffic(128, 166)

