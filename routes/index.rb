get '/' do
  @jobs = Jobs.all
  haml :index
end
