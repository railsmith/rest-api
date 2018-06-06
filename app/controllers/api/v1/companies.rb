class API::V1::Companies < Grape::API
  include API::V1::Defaults
  
  
  resource :companies do
    
    params do
      requires :company, type: Hash do
        requires :name, type: String
        optional :reg_id, type: Integer
        optional :branches, type: Array do
          requires :name, type: String 
          requires :line1, type: String
          optional :line2, type: String 
          requires :city, type: String
          requires :state, type: String
          requires :country, type: String
          requires :zip, type: String
        end
      end
    end
    post '/', jbuilder: 'v1/companies/create_company' do
     @company = Company.create!(params[:company])
    end

    params do
      requires :company, type: Hash do
        optional :branches, type: Array do
          requires :name, type: String
        end
      end
      requires :id, type: String
    end
    patch ':id', jbuilder: 'v1/companies/update_company' do
     company = Company.find(params[:id])
     branches = params[:company].delete("branches")
     company.update!(params[:company])
     branches.each do |b|
      branch = company.branches.find_or_create_by(name: b["name"])
      branch.update!(b)
     end
     @company = Company.find(params[:id])
    end

    get '/', jbuilder: 'v1/companies/list' do
     @companies = Company.all.to_a
    end

    get :startup, jbuilder: 'v1/companies/startup' do
     age = Company.since(8)
     @companies = Company.where(:established_date.gte => age).to_a
    end

    get :mid_size, jbuilder: 'v1/companies/mid_size' do
     range = Company.since(8)
     age = Company.since(18)
     @companies = Company.where(:established_date.lte => range, :established_date.gte => age).to_a
    end

    get :established, jbuilder: 'v1/companies/established' do
     age = Company.since(18)
     @companies = Company.where(:established_date.lte => age).to_a
    end

    params do
      requires :id, type: String
    end
    get ':id', jbuilder: 'v1/companies/company' do
      @company = Company.find(params[:id])
    end

    params do
    	requires :id, type: String
    end
    delete ':id', jbuilder: 'v1/companies/delete_company' do
    	@company = Company.find(params[:id])
    	@company.delete
      @company
    end
  end
end