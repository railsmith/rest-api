FactoryBot.define do
  factory :start_up, class: Company do
     name "Google"
	 website "google.com"
	 reg_id 1234
	 timings "09:00-18:00"
	 established_date Date.new(2014, 12, 6)
     factory :start_up_with_branches do
		 transient do
	        branch_count 3
	     end

		 after(:create) do |company, evaluator|
	    	create_list(:branch, evaluator.branch_count, company: company)
	     end
	 end
  end
end
