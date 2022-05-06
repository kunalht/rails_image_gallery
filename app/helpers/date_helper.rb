module DateHelper
  def format_date(date)
    date.strftime("%Y-%m-%d %-l:%M %p %Z")
  end
end