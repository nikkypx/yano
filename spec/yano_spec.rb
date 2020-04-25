# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Yano do
  TRUTHY_CASES = [
    'y',
    'Y',
    'yes',
    'YES',
    'Yes',
    'true',
    'TRUE',
    'True',
    true,
    '1',
    1,
    'on',
    'On',
    'ON'
  ].freeze

  FALSEY_CASES = [
    'n',
    'N',
    'no',
    'NO',
    'No',
    'false',
    'FALSE',
    'False',
    false,
    '0',
    0,
    'off',
    'Off',
    'OFF'
  ].freeze

  it 'recognizes a truthy value' do
    TRUTHY_CASES.each do |val|
      expect(Yano.parse(val)).to be(true)
    end
  end

  it 'recognizes a falsey value' do
    FALSEY_CASES.each do |val|
      expect(Yano.parse(val)).to be(false)
    end
  end

  it 'correctly identifies truthy lenient values' do
    expect(Yano.parse('ues', lenient: true)).to eq(true)
    expect(Yano.parse('ywa', lenient: true)).to eq(true)
    expect(Yano.parse('tes', lenient: true)).to eq(true)
    expect(Yano.parse('twa', lenient: true)).to eq(true)
    expect(Yano.parse('urd', lenient: true)).to eq(true)
  end

  it 'correctly identifies falsey lenient values' do
    expect(Yano.parse('ni', lenient: true)).to eq(false)
    expect(Yano.parse('bi', lenient: true)).to eq(false)
    expect(Yano.parse('mo', lenient: true)).to eq(false)
  end
end
