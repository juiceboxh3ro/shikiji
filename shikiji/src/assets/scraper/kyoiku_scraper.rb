require "HTTParty"
require "nokogiri"
require "json"

url = "https://en.wikipedia.org/wiki/Ky%C5%8Diku_kanji"
html = HTTParty.get(url)
doc = Nokogiri::HTML(html)

File.open("datas.json", "a") do |f|
  rows = doc.css("table tbody tr").each do |row|
    row_as_array = row.content.split(" ")
    r1 = row_as_array[0]

    unless r1 == "Traditional" || r1 == "Group" || r1 == "#"
      item = {
        "_id": row_as_array[0].to_i,
        "kanji": row_as_array[1],
        "strokes": row_as_array[2].to_i,
        "meaning": row_as_array[3],
        "onyomi": row_as_array[4],
        "kunyomi": row_as_array[5]
      }.to_json

      f.write(item)
      f.write(",")
    end
  end
  f.close()

end
