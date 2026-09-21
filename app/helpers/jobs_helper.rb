module JobsHelper
  # Compact age for the board's Posted column: "Today", "3d ago", "2w ago", "4mo ago".
  def job_age(time)
    days = (Time.current.to_date - time.to_date).to_i
    case days
    when 0 then "Today"
    when 1..6 then "#{days}d ago"
    when 7..59 then "#{days / 7}w ago"
    else "#{days / 30}mo ago"
    end
  end
end
