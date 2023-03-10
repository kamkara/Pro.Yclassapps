class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :courses, class_name: "Course", foreign_key: "user_id", dependent: :destroy
  has_many :exercises, class_name: "Exercise", foreign_key: "user_id", dependent: :destroy
  has_many :levels, class_name: "Level", foreign_key: "user_id"
  has_many :materials, class_name: "Material", foreign_key: "user_id"
  has_many :questions, class_name: "Question", foreign_key: "user_id"
  has_many :articles, class_name: "Article", foreign_key: "user_id"

 
  # Avant la validation de l'utilisateur, assigner first_name et last_name à partir de full_name
  before_validation :assign_names_from_full_name

  # Valide que les noms ont été assignés
  validates :first_name, presence: { message: "Le nom est obligatoire" }
  validates :last_name, presence: { message: "Le prénom est obligatoire" }

  
  # Avant de sauvegarder l'utilisateur, mettre en majuscule la première lettre de chaque nom
  before_save :capitalize_names


  private

  def assign_names_from_full_name
    # Vérifie si le full_name est renseigné
    return if self.full_name.blank?

    # Sépare le full_name en mots individuels
    name_parts = self.full_name.split(" ")

    # Le dernier mot est le last_name
    self.last_name = name_parts.pop

    # Les mots restants sont le first_name
    self.first_name = name_parts.join(" ")


    # Retourne les valeurs de first_name et last_name
    return self.first_name, self.last_name

    # Vérifie que les noms ont été assignés
    unless self.first_name.present? && self.last_name.present?
      errors.add(:full_name, "Le nom et le prénom sont obligatoires")
    end
  end

  def capitalize_names
    # Met en majuscule la première lettre de chaque nom
    self.full_name = self.full_name.split.map(&:capitalize).join(' ')
    self.first_name  = self.first_name.split.map(&:capitalize).join(' ')
    self.last_name = self.last_name.capitalize
  end

  
end
