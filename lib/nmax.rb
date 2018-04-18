require "nmax/version"

module Nmax
  def self.nmax_text(text, n)
    max_numbers_array = []

    text.each_line do |line|
      if !line.valid_encoding?
        line = line.encode("UTF-16be", :invalid=>:replace, :replace=>"?").encode('UTF-8')
      end
      line_numbers = line.gsub(/[0-9]{1,1000}/)
      line_numbers = line_numbers.map(&:to_i)
      max_numbers_array.concat(line_numbers)
      max_numbers_array.sort!.reverse!
      max_numbers_array = max_numbers_array.slice(0 , n)
    end

    max_numbers_array
  end
end
