class Exercise < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_many :questions, class_name: "Question", foreign_key: "exercise_id", dependent: :destroy

  #Slugged concern
  include ItemsSlugged

  # Valide que les noms ont été assignés
  validates :title, presence: { message: "Le titre est obligatoire" }
  validates :user_id, presence: { message: "L'exercice doit etre associer obligatoirement a une personne" }
  validates :course_id, presence: { message: "L'exercice doit etre associer obligatoirement a une leçon" }
  
  #############  Scopes ##############
  scope :ready, -> { where("published == true")}
  scope :chrono, -> { order(created_at: :desc)}
  
  ########### completed exercice  #########
  def completed_by(user)
    results.any? {|result| result.user == user}
  end
  
  ########### user grade  #########
  def user_grade(user)
    results.where(user_id: user).last.grade()
  end

  ############ Result ###################
  def build_result
    result = self.results.build()
    self.questions.each {|exercise| result.answered_questions.build(question: exercise)}
    return result
  end
  
end
