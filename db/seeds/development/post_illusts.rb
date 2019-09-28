body = "カービィはかわいいです。"

%w(Taro Jiro Hana).each do |name|
    member = Member.find_by(name: name)
    0.upto(9) do |idx|
        post = PostIllust.create(
            poster: member,
            title: "イラスト#{idx}",
            body: body,
            posted_at: 10.days.ago.advance(days: idx)
        )
    end
end