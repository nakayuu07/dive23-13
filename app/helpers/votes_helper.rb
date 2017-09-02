module VotesHelper
  def vote_question_plusorminus(question)
    vote = Vote.find_by(user_id: current_user.id, question_id: question.id)
    if vote.present?
      vote.plus_or_minus
    end
  end

  def vote_answer_plusorminus(answer)
    vote = Vote.find_by(user_id: current_user.id, answer_id: answer.id)
    if vote.present?
      vote.plus_or_minus
    end
  end

  def vote_question_sum(question)
    Vote.where(question_id: question.id).sum(:plus_or_minus)
  end

  def vote_answer_sum(answer)
    Vote.where(answer_id: answer.id).sum(:plus_or_minus)
  end
end
