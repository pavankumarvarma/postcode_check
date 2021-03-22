# frozen_string_literal: true

class PostcodeService
  require 'rest-client'
  include LsoaHelper
  include CustomPostcodeHelper
  attr_reader :search

  def initialize(search)
    @search_code = search.gsub(/\s+/, '').downcase
  end

  def validate_post_code
    message = ''
    if CustomPostcodeHelper.list.include? @search_code.upcase
      message = "<span style='color: green;'>Service Availale for #{@search_code.upcase}</span>"
    else
      begin
        response = RestClient.get(Rails.application.config.post_code_url + @search_code.to_s)
        lsoa = JSON.parse(response)['result']['lsoa'].downcase
        message = if lsoa.starts_with?(*LsoaHelper.list.map(&:downcase))
                    "<span style='color: green;'>Service available for #{@search_code.upcase}</span>"
                  else
                    "<span style='color: orange;'>Service is not available for #{@search_code.upcase}</span>"
                  end
      rescue RestClient::ExceptionWithResponse => e
        message = "<span style='color: red;'> Invalid post code #{@search_code.upcase}</span>"
      end
    end
    message
  end
end
