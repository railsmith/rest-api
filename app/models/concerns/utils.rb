require 'date'

module Utils # Cloud Insulation Layer for Infrastructure Development
  extend ActiveSupport::Concern
  
   included do
   end
   
   module ClassMethods
   	 def since(year)
		Date.new((Date.today.year - year), Date.today.month, Date.today.day)
	 end
   end
end