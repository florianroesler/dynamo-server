get '/job/launch' do
  job_name = params['name']

  if job_name.nil?
    haml :launch_job
  else
    case job_name
    when 'matrix'
      JobExecutor.matrix
    when 'kmeans'
      JobExecutor.kmeans
    when 'mandelbrot'
      JobExecutor.mandelbrot
    end

    redirect '/'
  end
end
