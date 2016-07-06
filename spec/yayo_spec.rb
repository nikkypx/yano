require 'spec_helper'

RSpec.describe Yayo do
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
    1
  ];

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
    0
  ];

  it "recognizes a truthy value" do
    TRUTHY_CASES.each do |val|
      expect(Yayo.parse(val)).to be(true)
    end
  end

  it "recognizes a falsey value" do
    FALSEY_CASES.each do |val|
      expect(Yayo.parse(val)).to be(false)
    end
  end

  it "correctly identifies truthy lenient values" do
    expect(Yayo.parse("ues", lenient: true)).to eq(true)
    expect(Yayo.parse('ywa', lenient: true)).to eq(true)
    expect(Yayo.parse('tes', lenient: true)).to eq(true)
    expect(Yayo.parse('twa', lenient: true)).to eq(true)
    expect(Yayo.parse('urd', lenient: true)).to eq(true)
  end

  it "correctly identifies falsey lenient values" do
    expect(Yayo.parse('ni', lenient: true)).to eq(true)
    # expect(Yayo.parse('bi', lenient: true)).to eq(true)
    # expect(Yayo.parse('mo', lenient: true)).to eq(true)
  end
end
