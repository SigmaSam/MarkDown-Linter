# rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/MethodLength, Metrics/BlockNesting

class Scaner
  attr_accessor :ast, :gra, :squ, :squ_open, :squ_clo, :par, :par_open, :par_clo, :big, :small, :mid, :index_loc, :posi

  def initialize
    @ast = false
    @gra = false
    @squ = false
    @squ_open = false
    @squ_clo = false
    @par = false
    @par_open = false
    @par_clo = false
    @index_loc = []
    @posi = nil
  end

  def find_pair?(pair, ubi)
    if pair =~ /[\(\)\[\]\`\*\<\>]/ && !pair.split(' ').empty?
      case pair
      when /\*/
        if pair.count('*').odd?
          @ast = true
          @posi = ubi
          @index_loc << ubi
        end
      when /\`/
        if pair.count('`').odd?
          unless pair.count('`') == 3
            @gra = true
            @posi = ubi
            @index_loc << ubi
          end
        end
      when /[\[\]]/ && /[\(\)]/
        if (pair.count('[').even? && !pair.count('[').zero?) && pair.count(']').odd?
          @squ_open = true
          @posi = ubi
          @index_loc << ubi
        end
        if (pair.count(']').even? && !pair.count(']').zero?) && pair.count('[').odd?
          @squ_clo = true
          @posi = ubi
          @index_loc << ubi
        end
        if (pair.count('[') + pair.count(']')).odd?
          @squ = true
          @posi = ubi
          @index_loc << ubi
        end
        if (pair.count('(').even? && !pair.count('(').zero?) && pair.count(')').odd?
          @par_open = true
          @posi = ubi
          @index_loc << ubi
        end
        if (pair.count(')').even? && !pair.count(')').zero?) && pair.count('(').odd?
          @par_clo = true
          @posi = ubi
          @index_loc << ubi
        end
        if (pair.count('(') + pair.count(')')).odd?
          @par = true
          @posi = ubi
          @index_loc << ubi
        end
      end
    end
    @index_loc
  end
end
# rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/MethodLength, Metrics/BlockNesting
