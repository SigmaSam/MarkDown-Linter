require_relative '../lib/mb_scaner.rb'

describe Scaner do
  let(:file_error) { File.open('./docs/test.MD', 'r') }
  let(:file) { File.open('./docs/test_2.MD', 'r') }
  let(:scan) { Scaner.new }

  it 'It returns an empty array  when it finds no irregularities' do
    expect(scan.find_pair?(file, 34)).to be_an_instance_of(Array)
  end

  it 'It returns an array with a list of index with the location of the errors.' do
    expect(scan.find_pair?(file_error, 34)).to be_an_instance_of(Array)
  end

  it 'It raises an exception for invalid input' do
    expect { scan.find_pair? }.to raise_error(ArgumentError)
  end
end
