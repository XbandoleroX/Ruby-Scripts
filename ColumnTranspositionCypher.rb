def c_cipher(msg, keyword)
  msg.match(/[A-Z\W\s]/) ? encode(msg, keyword) : decode(msg, keyword)
end

def encode msg, keyword
  clean = msg.downcase.gsub(" ","").gsub(".", "")
  divisible = clean.size % keyword.size
  divisible.eql?(0) ? 0 : (keyword.size - divisible).times{matched.insert(-1, "x")}
  payload = clean.scan(/.{#{keyword.size}}/)
  charmap = keyword.chars.zip([*0..keyword.chars.size-1]).to_h
	charmap.sort_by{|key,value| key}.to_h.map{|key, val| payload.inject(""){|res, line| res += line[val]}}.join
end

def decode msg, keyword

  keyword_sorted = (0..keyword.size-1).inject([]){|res, x| res[x]=keyword.chars.sort.index(keyword[x]);res }
  payload = msg.scan(/.{#{msg.size / keyword.size}}/)
  (0..(msg.size / keyword.size)-1).map{|y| keyword_sorted.map{|x| payload[x][y]}.join}.join
  
end


p c_cipher('Meet me by the lake at midnight. Bring shovel.','python')
p 'thaiivelmhglmetgnembaitsetenroeykdbh'

p c_cipher('meeanbsleyamgioxebltirhxttkihnvxmhedtgex','monty')
p 'meetmebythelakeatmidnightbringshovelxxxx'
