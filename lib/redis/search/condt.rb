class Redis
  module Search
    class Condt
      def self.make_condition(json)
        if json == "null" or MultiJson.decode(json).blank?
          return "true"
        end
        hash = MultiJson.decode(json)
        c = ""
        hash.keys.each_with_index do |key,i|
          if key.to_s.include? " "
            str = "self.#{key.to_s}" + hash[key].to_s
          else
            str = "self.#{key.to_s} == " + hash[key].to_s
          end
          if i == 0
            c = str
          else
            c = c + " and " + str
          end
        end
        c
      end
    end
  end
end