#Whitelist additional fields for devise User objects.
module UserLogged
     extend ActiveSupport::Concern

   included do
      attr_writer :logged
   end
  
  ################## LOGGED  #########
  #permet la connexion avec le matricule
  def logged
    @logged || self.matricule || self.email
  end
  
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (logged = conditions.delete(:logged))
      where(conditions.to_h).where(["lower(email) = :value OR lower(matricule) = :value", { :value => logged.downcase }]).first
    elsif conditions.has_key?(:email) || conditions.has_key?(:matricule)
      where(conditions.to_h).first
    end
  end

end
