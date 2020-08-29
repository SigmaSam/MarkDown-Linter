require_relative '../lib/mb_scaner.rb'

include Scaner

Dir.glob('../docs/*').each do |filename|
  next if File.directory?(filename)

  File.open(filename, 'r') do |file|
    scan_file(file)
  end
end
