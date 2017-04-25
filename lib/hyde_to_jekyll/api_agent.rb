require 'hyde_to_jekyll'
require 'httparty'

module HydeToJekyll
  class ApiAgent
    include HTTParty
    base_uri 'darknessdevildb.local:3000'

    def initialize(site_host)
      @site_host = site_host
    end

    def dynamic_tables
      res = self.class.get("/api/#{@site_host}/dynamic_tables")
      JSON.parse(res.body, {:symbolize_names => true})
    end

    def dynamic_records(dynamic_table_id)
      res = self.class.get("/api/#{@site_host}/dynamic_tables/#{dynamic_table_id}/dynamic_records")
      JSON.parse(res.body, {:symbolize_names => true})
    end
  end
end
