module VotesHelper
  def is_vote?(question)
    Vote.find_by(user_id: current_user.id, question_id: question.id) != nil
  end
end
