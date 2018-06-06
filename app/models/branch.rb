class Branch
	include Mongoid::Document

	field :name, type: String
	field :line1, type: String
	field :line2, type: String
	field :city, type: String
	field :state, type: String
	field :country, type: String
	field :zip, type: Integer

	embedded_in :company

	validates_presence_of :name, :line1, :city, :state, :country, :zip
end