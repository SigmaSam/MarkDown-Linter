# rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
require 'colorize'
class Scaner
  def scan_line(file)
    c = false
    index_loc = []
    file.readlines.each_with_index do |line, loc|
      if line.split(' ') != []
        c = sym_check(line, loc)
        c == true ? index_loc << loc : nil
      end
    end
    index_loc.size.zero? ? false : true
  end

  def sym_check(test, ind)
    c = false
    c = find_pair(test, ind) if test =~ /[\*\`\[\]\(\)]/
    c
  end

  def find_pair(pair, ubi)
    c = false
    case pair
    when /\*/
      if pair.count('*').odd?
        puts "You need to close your Asterisks at line #{ubi + 1}".colorize(background: :red)
        c = true
      end
    when /\`/
      if pair.count('`').odd?
        puts "You need to close your Grave Accent line #{ubi + 1}".colorize(background: :red)
        c = true
      end
    when /[\[\]]/ && /[\(\)]/
      if pair.count('[').even? && !pair.count('[').zero?
        puts "You have an irregular number of [ at line #{ubi + 1}".colorize(background: :red)
        c = true
      end
      if pair.count(']').even? && !pair.count(']').zero?
        puts "You have an irregular number of ] at line #{ubi + 1}".colorize(background: :red)
        c = true
      end
      if (pair.count('[') + pair.count(']')).odd?
        puts "You need to close your Square Bracket at line #{ubi + 1}".colorize(background: :red)
        c = true
      end
      if pair.count('(').even? && !pair.count('(').zero?
        puts "You have an irregular number of () at line #{ubi + 1}".colorize(background: :red)
        c = true
      end
      if pair.count(')').even? && !pair.count(')').zero?
        puts "You have an irregular number of ) at line #{ubi + 1}".colorize(background: :red)
        c = true
      end
      if (pair.count('(') + pair.count(')')).odd?
        puts "You need to close your Parenthesis at line #{ubi + 1}".colorize(background: :red)
        c = true
      end
    end
    c
  end
end
# rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
