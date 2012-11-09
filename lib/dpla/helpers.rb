module DPLA
  module Helpers
    PRINT_MAP = {
      "Title" => "title",
      "Publisher" => "publisher",
      "Contributing organization" => ["dplaContributor", "name"]
    }

    def lovely_print record
      result = ""
      PRINT_MAP.each do |label, key|
        if key.is_a? String
          value = record[key]
        else
          value = record[key.first][key.last]
        end

        result << "#{label}: #{value}\n" if value
      end

      if record["subject"]
        subject = record["subject"].first["name"]
        result << "Subject: #{subject}\n"
      end

      result << "DPLA address: http://api.dp.la/v1/items/#{record["_id"]}"

      $stdout.puts result
    end

    def parse options
      options.each do |opt|
        next if opt.key == 'help'

        if not DPLA::Query::PARAMETERS.include? opt.key.to_s.split('.').first
          raise "#{opt.key} is not a valid DPLA option!"
        end
      end

      options.to_hash.reject {|_,v| v.nil?}
    end
  end
end
