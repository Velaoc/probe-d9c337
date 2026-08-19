# A handful of welcome notes so the wall looks alive on first load.
# Seeds are idempotent: re-running them never duplicates messages.
if Message.count.zero?
  sample = [
    [ "Mira", "First! Glad this little board could hold a whole guestbook." ],
    [ "Nova", "Small, dense, relentless — the wall approves." ],
    [ "", "Signed from somewhere with great coffee." ],
    [ "Aregus", "The server's first words, preserved for posterity." ],
    [ "Vela", "ping me anything, this is the one-page kind of app I like." ]
  ]
  sample.each do |name, body|
    Message.create!(author_name: name, body: body, created_at: 1.hour.ago + sample.index([name, body]).hours)
  end
end
