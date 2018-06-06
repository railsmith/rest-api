class Company
	include Mongoid::Document
	include Utils

	field :name, type: String
	field :website, type: String
	field :reg_id, type: Integer
	field :timings, type: String
	field :established_date, type: Date

	embeds_many :branches

	validates_numericality_of :reg_id, greater_than: 0
	validates_presence_of :name
end