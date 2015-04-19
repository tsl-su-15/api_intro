Rails.application.routes.draw do
  get('/weather_form', { :controller => "api", :action => "weather_form"})
  get('/weather_output', { :controller => "api", :action => "weather_output"})
end
