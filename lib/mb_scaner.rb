# rubocop:disable Metrics/AbcSize Metrics/CyclomaticComplexity Metrics/PerceivedComplexity)
# rubocop:disable Layout/LineLength Style/HashSyntax
require 'colorize'
class Scaner
  def scan_line(file)
    file.readlines.each_with_index do |line, loc|
      if line.split(' ') != []
        sym_check(line, loc)
      end
    end
  end

  def sym_check(test, ind)
    if test =~ /[\*\`\[\(]/
      find_pair(test, ind)
    end
  end

  def find_pair(pair, ubi)
    case pair
    when /\*/
      puts "You need to close your Asterisks at line #{ubi + 1}".colorize(:background => :red) if pair.count('*').odd?
    when /\`/
      puts "You need to close your Grave Accent line #{ubi + 1}".colorize(:background => :red) if pair.count('`').odd?
    when /[\[\]]/ && /[\(\)]/
      puts "You have an irregular number of [ at line #{ubi + 1}".colorize(:background => :red) if pair.count('[').even? && !pair.count('[').zero?
      puts "You have an irregular number of ] at line #{ubi + 1}".colorize(:background => :red) if pair.count(']').even? && !pair.count(']').zero?
      puts "You need to close your Square Bracket at line #{ubi + 1}".colorize(:background => :red) if (pair.count('[') + pair.count(']')).odd?
      puts "You have an irregular number of () at line #{ubi + 1}".colorize(:background => :red) if pair.count('(').even? && !pair.count('(').zero?
      puts "You have an irregular number of ) at line #{ubi + 1}".colorize(:background => :red) if pair.count(')').even? && !pair.count(')').zero?
      puts "You need to close your Parenthesis at line #{ubi + 1}".colorize(:background => :red) if (pair.count('(') + pair.count(')')).odd?
    end
  end
end

# rubocop:enable Metrics/AbcSize Metrics/CyclomaticComplexity Metrics/PerceivedComplexity)
# rubocop:enable  Layout/LineLength Style/HashSyntax


