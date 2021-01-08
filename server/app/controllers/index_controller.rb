require 'nokogiri'
require 'open-uri'

class IndexController < ApplicationController
  def index
    render xml: "<body></body>"
  end

  def palindrome
    n = params[:val]
    @res = []
    @errors = 0
    if is_number?(n)
      if n.to_i <= 10 ** 6
        (0..n.to_i).each do |x|
          @res << [x, x.to_s(2)] if x.to_s.reverse.to_i == x.to_i and x.to_s(2) == x.to_s(2).reverse
        end
        xml = Nokogiri::XML::Builder.new { |table|
          table.body do
            @res.each { |row|
              table.row do
                table.binary row[0]
                table.decimal row[1]
              end
            }
          end
        }
        render xml: xml
        return
      else
        @errors +=1
      end
    else
      @errors +=1
    end

    xml = Nokogiri::XML::Builder.new { |table|
      table.body do
        table.error  "Неверный формат данных"
      end
    }

    render xml: xml
  end

  def is_number? string
    true if Float(string) rescue false
  end

end
