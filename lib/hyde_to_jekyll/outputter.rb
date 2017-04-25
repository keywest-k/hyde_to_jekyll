require 'hyde_to_jekyll'

module HydeToJekyll
  class Outputter
    def initialize(dynamic_table, dynamic_records)
      @dynamic_table = dynamic_table
      @dynamic_records = dynamic_records
    end

    def output
      File.open(output_path, "w") do |f|
        f.puts(output_str)
      end
    end

    private
      def output_str
        case type
        when :data
          @dynamic_records.to_yaml
        when :post
        when :page
        end
      end

      def output_path
        path_list = [Dir.pwd]

        case type
        when :data
          path_list << "_data"
        when :post
          path_list << "_post"
        when :page
          # none
        end

        path_list << "#{@dynamic_table[:uid]}.yml"
        File.join(*path_list)
      end

      def type
        @dynamic_table[:type].to_sym
      end
  end
end
