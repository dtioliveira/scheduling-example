class PagesController < ApplicationController

  def index
    if params[:diary]
      current_date = Date.current
      selected_date = Date.parse("#{params[:diary][:month]}-1")
      params[:diary].reject{|p| p if p == "month"}.each do |key, value|
        if value
          value[:hours].delete(" ").split(",").each do |hour|
            (selected_date.beginning_of_month.. selected_date.end_of_month).each do |date|
              Schedule.create!(attendance: "#{current_date.year}-#{selected_date.month}-#{date.day} #{hour}") if date.strftime("%A").downcase == key.to_s
            end
          end
        end
      end
    end
  end
end
