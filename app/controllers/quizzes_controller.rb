class QuizzesController < ApplicationController

  def new
    @question = Question.all.sample
  end

  def submit_quiz
    quiz_question = params[:quiz_question]
    question = Question.find(quiz_question[:question_id])
    user_answer = quiz_question[:user_answer].strip
    if user_answer.present?
      if question.answer == user_answer.downcase
        answer_message = "Correct!! Your answer is #{user_answer}"
        status = 'success'
      else
        word_analyze = Converter::WordToNumber.analyze!(user_answer)
        if question.answer == word_analyze.to_s
          answer_message = "Correct!! Your answer is #{user_answer}"
          status = 'success'
        else
          answer_message = "Incorrect, Your answer is #{user_answer}"
          status = 'danger'
        end
      end
      redirect_to quiz_result_quizzes_path(question: question.content,
                                           answer: question.answer,
                                           message: answer_message,
                                           status: status)
    else
      redirect_to :back
    end
  end

end
