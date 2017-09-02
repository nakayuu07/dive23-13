 100.times do |n|
  email = Faker::Internet.email
  name = Faker::HarryPotter.character
  profile = Faker::HarryPotter.quote
  password = Faker::Internet.password
  User.create!(email: email,
               name: name,
               profile: profile,
               password: password,
               password_confirmation: password,
               )
end

@users = User.order(:id).all

@users.each do |user|
  title = Faker::Friends.character
  content = Faker::Friends.quote
  created_at = Faker::Time.between(DateTime.now - 3.days, DateTime.now - 2.days)
  updated_at = created_at + 1.day
  user_id = user.id
  Question.create!(title: title,
               content: content,
               created_at: created_at,
               updated_at: updated_at,
               user_id: user_id,
               )
end

@questions = Question.reorder(:id).where(id: 1..99)

@questions.each do |question|
  content = Faker::Friends.quote
  created_at = question.created_at  + 1.hour
  user_id = question.user_id + 1
  question_id = question.id
  Answer.create!(content: content,
               created_at: created_at,
               updated_at: created_at,
               user_id: user_id,
               question_id: question_id,
               )
end

@questions.each do |question|
  user_id = question.user_id + 1
  question_id = question.id
  Favorite.create!(user_id: user_id,
               question_id: question_id,
               )
end

@questions_1 = Question.reorder(:id).where(id: 1..50)
@questions_2 = Question.reorder(:id).where(id: 51..98)

@questions_1.each do |question|
  user_id = question.user_id + 1
  question_id = question.id
  Vote.create!(user_id: user_id,
               question_id: question_id,
               plus_or_minus: 1
               )
end

@questions_2.each do |question|
  user_id = question.user_id + 1
  question_id = question.id
  Vote.create!(user_id: user_id,
               question_id: question_id,
               plus_or_minus: -1
               )
end

@answers_1 = Answer.reorder(:id).where(id: 1..49)
@answers_2 = Answer.reorder(:id).where(id: 50..98)

@answers_1.each do |answer|
  user_id = answer.user_id + 1
  answer_id = answer.id
  Vote.create!(user_id: user_id,
               answer_id: answer_id,
               plus_or_minus: 1
               )
end

@answers_2.each do |answer|
  user_id = answer.user_id + 1
  answer_id = answer.id
  Vote.create!(user_id: user_id,
               answer_id: answer_id,
               plus_or_minus: -1
               )
end

20.times do |n|
 name = Faker::Color.color_name
 Tag.create!(name: name)
end

@questions.each do |question|
  tag_id = rand(1..20)
  question_id = question.id
  Tagging.create!(tag_id: tag_id,
               question_id: question_id
               )
end
