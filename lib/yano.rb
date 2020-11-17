# frozen_string_literal: true

require 'yano/version'
require 'yano/lenient'

module Yano
  VALID_YES_VALUE = /^(y|yes|true|1|on)$/i.freeze
  VALID_NO_VALUE  = /^(n|no|false|0|off)$/i.freeze

  def self.parse(val, opts = {})
    val = val.to_s.strip
    return true  if val =~ VALID_YES_VALUE
    return false if val =~ VALID_NO_VALUE

    Lenient.check_lenient_values(val) if opts.delete(:lenient)
  end
end
