class Question < ApplicationRecord

  ################## Relations  ###############
  belongs_to :exercise
  belongs_to :user
  has_many :answers, class_name: "Answer", foreign_key: "question_id", dependent: :destroy

  ################## Validations  ###############
  validates :title, :detail, :exercise_id, :user_id, presence: true
  accepts_nested_attributes_for :answers
  #validates_with QuestionValidator

end
