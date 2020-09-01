require_relative '../lib/mb_scaner.rb'

describe Scaner do
  let(:file) { File.open('./docs/test.MD', 'r') }
  let(:file_error) { File.open('./docs/mistakes test.MD', 'r') }
  let(:scan) { Scaner.new }
  it 'It returns false when it finds no errors' do
    expect(scan.scan_line?(file)).to be(true)
  end

  it 'It returns false when it finds errors' do
    expect(scan.scan_line?(file_error)).to be(false)
  end

  it 'It raises an exception for invalid input' do
    expect { scan.scan_line?('asc') }.to raise_error(NoMethodError)
  end

  it 'It returns false when it doest not find irregularities' do
    expect(scan.sym_check(file, 13)).to be(false)
  end

  it 'It raises an exception for invalid input' do
    expect { scan.sym_check }.to raise_error(ArgumentError)
  end

  it 'It returns false when it finds a symbol without irregularities' do
    expect(scan.find_pair?(file, 33)).to be(false)
  end

  it 'It raises an exception for invalid input' do
    expect { scan.find_pair? }.to raise_error(ArgumentError)
  end
end
