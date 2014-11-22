class StatsWorker
  include Sidekiq::Worker

  def perform(n, w, s, e)

    msg_count = Message.where{st_contains( st_makeenvelope(w,s,e,n, 4326), CAST(lonlat.as geometry) )}.count

    p "There are #{msg_count} messages inside of (#{n}, #{w}, #{s}, #{e})"
  end
end
