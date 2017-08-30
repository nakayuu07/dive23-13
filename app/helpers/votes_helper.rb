module VotesHelper
  def is_vote?(question)
    Vote.find_by(user_id: current_user.id, question_id: question.id) != nil
  end

  def is_answer_vote?(question, answer)
    Vote.find_by(user_id: current_user.id, question_id: question.id, answer_id: answer.id) != nil
  end
end
