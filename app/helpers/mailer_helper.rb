module MailerHelper
  # Email clients ignore Tailwind and most <style> blocks, so the theme tokens from
  # app/assets/tailwind/application.css are repeated here as hex values for inline styles.
  MAIL_COLORS = {
    board: "#0e2a26",
    rule: "#2a5a52",
    paper: "#f1ede2",
    muted: "#9db8b0",
    signal: "#ffc72c"
  }.freeze

  def mail_color(name) = MAIL_COLORS.fetch(name)
end
