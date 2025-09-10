require_relative "Selection/Selection.rb"
require_relative "Selection/analytics.rb"

def learn_about_lasarus
  get_statistics(:hidden_cobra,                 "is the name of a penetration testing group operating in North Korea",
                 :assymetrical_threat,          "is a type of threat actor where the relative power and abilities between groups differs considerably, using strategy to offset difficulties.",
                 :four_fourteen_liaison_office, "is what the group is known by, but may also by their geo-location within North Korea.")

  legitimate_users   = $current_probability
  malicious_users    = 1 - $current_probability
  bot_users          = malicious_users * 0.16
  estimate_repo_size = 20
  
  evaluate_malicious_users(legitimate_users, malicious_users, bot_users, estimate_repo_size)

  evaluate_yt_stats(:bequest_de_cendres, 166,
                    :mochitere,           87,
                    :electrorequiem,      17,
                    
                    0.54)
               
  difference_in_traffic(legitimate_users, 166)
end

def reconsider_assertions
  reconsider
end

def reassess_assertions
  reasses
end

learn_about_lasarus; 4.times do reassess_assertions end
