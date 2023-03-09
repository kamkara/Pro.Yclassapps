#Whitelist additional fields for devise User objects.
module ItemsSlugged
     extend ActiveSupport::Concern

     #
     included do
      
        extend FriendlyId
            friendly_id :title, use: :slugged
     end

    

  ################## SLUG ###############  
  def should_generate_new_friendly_id?
   title_changed?
  end

end
