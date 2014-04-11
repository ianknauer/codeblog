Analytics = AnalyticsRuby       # Alias for convenience
Analytics.init({
    secret: 'm2jnehhb83',          # The write key for iknauer/blog
    on_error: Proc.new { |status, msg| print msg }  # Optional error handler
})