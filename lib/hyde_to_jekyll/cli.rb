require 'hyde_to_jekyll'
require 'thor'

module HydeToJekyll
  class CLI < Thor
    desc "pull [site_host]", "Pull data from hyde"
    def pull(site_host)
      agent = ApiAgent.new(site_host)

      agent.dynamic_tables.each do |dynamic_table|
        dynamic_records = agent.dynamic_records(dynamic_table[:id])
        Outputter.new(dynamic_table, dynamic_records).output
      end
    end
  end
end
