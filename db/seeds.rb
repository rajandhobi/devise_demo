# Create some users
users = User.create!([
  { email: "user1@example.com", password: "password", password_confirmation: "password" },
  { email: "user2@example.com", password: "password", password_confirmation: "password" },
  { email: "user3@example.com", password: "password", password_confirmation: "password" }
])

puts "Created #{users.count} users."

# Create some articles
articles = Article.create!([
  { title: "How to Learn Ruby on Rails", body: "Start with the official Rails Guides. Practice regularly and build projects!", user: users.first },
  { title: "Understanding MVC Architecture", body: "MVC stands for Model-View-Controller. It's a design pattern widely used in web development.", user: users.second },
  { title: "10 Tips for Better Web Development", body: "Always write clean code, follow conventions, and test your applications!", user: users.third },
  { title: "Why Devise is Great for Authentication", body: "Devise provides an easy and robust authentication system for Rails.", user: users.first },
  { title: "Deploying a Rails App to Heroku", body: "Heroku is a great platform for deploying your Rails applications. Use it to quickly get your app live!", user: users.second }
])

puts "Created #{articles.count} articles."