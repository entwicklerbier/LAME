class ViewStatsWorker
  include Sidekiq::Worker

  def perform(n, w, s, e)

    msg_count = MessageView.where{message_id.in(Message.where{st_contains( st_makeenvelope(w,s,e,n, 4326), CAST(lonlat.as geometry))})}.count

    p "There are #{msg_count} message views inside of (#{n}, #{w}, #{s}, #{e})"
  end
end
