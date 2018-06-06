json.array! @companies do |company|
 json.(company, :name, :website, :reg_id, :timings, :established_date)
 json.branches company.branches, :name, :line1, :line2, :city, :state, :country, :zip
end