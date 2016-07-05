require_relative './question_data.rb'

Answer.destroy_all
Question.destroy_all
Subject.destroy_all
User.destroy_all

@test_user = User.create(username: "Joe", password: "moma")

question_data = get_question_data()

question_data.each do |subject, question|
  current_subject = Subject.create!({
    name:         question[:name],
    user:         @test_user
  })
    Question.create!({
      question_text:  question[:question_text],
      subject:        current_subject,
      user:           @test_user
    })
  end
