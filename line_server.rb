# frozen_string_literal: true

require 'sinatra/base'

class LineServer < Sinatra::Base
  get '/lines/:index' do
    File.foreach(ENV['FILE_PATH']).with_index do |line, line_num|
      if params[:index].to_i == (line_num + 1)
        status 200
        return body(line)
      end

      next
    end

    status 413
  end
end
