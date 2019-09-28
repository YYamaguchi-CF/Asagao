names = %w(Taro Jiro Hana John Mike Sophy Bill Alex Mary Tom Ana Fie Kul Sol Wee Fee Gun Soa Mel Fui Mor Gai)
fnames = ["佐藤","鈴木","高橋","田中"]
gnames = ["太郎","次郎","花子"]
0.upto(29) do |idx|
    Member.create(
        number: idx + 10,
        name: names[idx],
        full_name: "#{fnames[idx % 4]} #{gnames[idx % 3]}",
        email: "#{names[idx]}@example.com",
        birthday: "1981-12-01",
        sex: [1, 1, 2][idx % 3],
        administrator: (idx == 0),
	password: "asagao!",
	password_confirmation: "asagao!"
    )
end

filename = "profile.jpg"
path = Rails.root.join(__dir__, filename)
m = Member.find_by!(number: 10)

File.open(path) do |f|
    m.profile_picture.attach(io: f, filename: filename)
end
