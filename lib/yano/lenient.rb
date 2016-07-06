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
    }

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
    }

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
    }

    N_MATCH = {
      'h' => 0.25,
      'j' => 0.25,
      'k' => 0.25,
      'b' => 0.75,
      'n' => 1,
      'm' => 0.75
    }

    O_MATCH = {
      '9' => 0.25,
      '0' => 0.25,
      'i' => 0.75,
      'o' => 1,
      'p' => 0.75,
      'k' => 0.25,
      'l' => 0.25
    }

    def self.get_yes_match_score(val)
      y, e, s = val[0], val[1], val[2]
      [].tap do |score|
        score << (Y_MATCH.key?(y) ? Y_MATCH[y] : 0)
        score << (E_MATCH.key?(e) ? E_MATCH[e] : 0)
        score << (S_MATCH.key?(s) ? S_MATCH[s] : 0)
      end.reduce(:+)
    end

    def self.get_no_match_score(val)
      n, o = val[0], val[1]

      [].tap do |score|
        score << (N_MATCH.key?(n) ? N_MATCH[n] : 0)
        score << (O_MATCH.key?(o) ? O_MATCH[o] : 0)
      end.reduce(:+)
    end

    def self.check_lenient_values(val)
      return true  if get_yes_match_score(val) >= YES_MATCH_SCORE_THRESHOLD
      return false if get_no_match_score(val)  >= NO_MATCH_SCORE_THRESHOLD
    end
  end
end
