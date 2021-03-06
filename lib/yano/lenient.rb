# frozen_string_literal: true

module Yano
  module Lenient
    YES_MATCH_SCORE_THRESHOLD = 2
    NO_MATCH_SCORE_THRESHOLD  = 1.25

    Y_MATCH = {
      '5' => 0.25,
      '6' => 0.25,
      '7' => 0.25,
      't' => 0.75,
      'y' => 1,
      'u' => 0.75,
      'g' => 0.25,
      'h' => 0.25,
      'k' => 0.25
    }.freeze

    E_MATCH = {
      '2' => 0.25,
      '3' => 0.25,
      '4' => 0.25,
      'w' => 0.75,
      'e' => 1,
      'r' => 0.75,
      's' => 0.25,
      'd' => 0.25,
      'f' => 0.25
    }.freeze

    S_MATCH = {
      'q' => 0.25,
      'w' => 0.25,
      'e' => 0.25,
      'a' => 0.75,
      's' => 1,
      'd' => 0.75,
      'z' => 0.25,
      'x' => 0.25,
      'c' => 0.25
    }.freeze

    N_MATCH = {
      'h' => 0.25,
      'j' => 0.25,
      'k' => 0.25,
      'b' => 0.75,
      'n' => 1,
      'm' => 0.75
    }.freeze

    O_MATCH = {
      '9' => 0.25,
      '0' => 0.25,
      'i' => 0.75,
      'o' => 1,
      'p' => 0.75,
      'k' => 0.25,
      'l' => 0.25
    }.freeze

    def self.get_yes_match_score(val)
      y = val[0]
      e = val[1]
      s = val[2]
      [].tap do |score|
        score << Y_MATCH[y].to_f
        score << E_MATCH[e].to_f
        score << S_MATCH[s].to_f
      end.reduce(:+)
    end

    def self.get_no_match_score(val)
      n = val[0]
      o = val[1]

      [].tap do |score|
        score << N_MATCH[n].to_f
        score << O_MATCH[o].to_f
      end.reduce(:+)
    end

    def self.check_lenient_values(val)
      return true  if get_yes_match_score(val) >= YES_MATCH_SCORE_THRESHOLD
      return false if get_no_match_score(val)  >= NO_MATCH_SCORE_THRESHOLD
    end
  end
end
