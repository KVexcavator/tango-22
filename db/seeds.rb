user1 = User.create!(
  first_name: "Masha",
  last_name: "Petrova",
  email: "masha@example.org",
  username: "mashmash"
)
user2 = User.create!(
  first_name: "Petrovich",
  last_name: "Goremikin",
  email: "colem@example.org",
  username: "colem",
)

Bond.create(user: user1, friend: user2, state: Bond::FOLLOWING)
Bond.create(user: user2, friend: user1, state: Bond::FOLLOWING)

place = Place.create!(
  locale: "en",
  name: "Hotel RoyalBabay",
  place_type: "hotel",
  coordinate: "POINT (112.739898 -7.259836 0)"
)
post = Post.create!(user: user1, postable: Status.new(
  text: "Whohoo! I am in Huyznaet!!!!"
))

Post.create!(user: user2, postable: Status.new(
  text: "Wow! Looks great! Have fun, Masha!"
), thread: post)
Post.create!(user: user1, postable: Status.new(
  text: "Ya! Ya! Ya! Are you in town?"
), thread: post)
Post.create!(user: user2, postable: Status.new(
  text: "Yups! Let's explore the city!"
), thread: post)
Post.create(user: user1, postable: Signt.new(
  place: place, activity_type: Signt::CHECKIN
))
