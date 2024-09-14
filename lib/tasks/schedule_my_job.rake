namespace :jobs do
  desc "Enqueue MyJob to run via Sidekiq"
  task enqueue_my_job: :environment do
    # Pass any arguments needed to the job
    MyJob.perform_async
    puts "Job enqueued successfully"
  end
end
