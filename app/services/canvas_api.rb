require "net/http"
require "json"

class CanvasApi
  BASE_URL = "https://boisestatecanvas.instructure.com"

  class CanvasError < StandardError
  end

  def initialize
    @token = ENV["CANVAS_API_TOKEN"]

    if @token.nil? || @token.empty?
      raise CanvasError, "Canvas API token is missing. Check your .env file."
    end
  end

  def courses
    get_all_pages("#{BASE_URL}/api/v1/courses")
  end

  def assignments(course_id)
    get_all_pages(
      "#{BASE_URL}/api/v1/courses/#{course_id}/assignments"
    )
  end

  private

  def get_all_pages(url)
    results = []
    next_url = url

    while next_url
      uri = URI(next_url)

      request = Net::HTTP::Get.new(uri)
      request["Authorization"] = "Bearer #{@token}"

      begin
        response = Net::HTTP.start(
          uri.hostname,
          uri.port,
          use_ssl: true
        ) do |http|
          http.request(request)
        end
      rescue StandardError
        raise CanvasError, "Unable to connect to Canvas. Please try again."
      end

      unless response.is_a?(Net::HTTPSuccess)
        raise CanvasError,
              "Canvas returned an error (#{response.code})."
      end

      results.concat(JSON.parse(response.body))

      next_url = find_next_link(response["Link"])
    end

    results
  end

  def find_next_link(link_header)
    return nil unless link_header

    links = link_header.split(",")

    next_link = links.find do |link|
      link.include?('rel="next"')
    end

    return nil unless next_link

    next_link[/<([^>]+)>/, 1]
  end
end