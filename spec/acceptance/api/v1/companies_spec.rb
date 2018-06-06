require 'acceptance_helper'

resource "companies" do
  include_context :headers


    post 'api/companies' do
      parameter :company, "A company JSON Object"
      
      let(:company) { 
          company = build(:company) do |company|
                      company.branches.build(attributes_for(:branch))
                    end
          company.as_json(:except => :_id)
         }

      let(:raw_post) {
        params.to_json 
      }
      
      example "create a company" do
        do_request

        expect(status).to eq(201)
      end
    end

    patch 'api/companies/:id' do
      parameter :company, "A company JSON Object"
      
      let(:company_with_branches) { 
          company_with_branches = create(:company_with_branches)
      }

      let(:id) {
        company_with_branches.id.to_s
      }

      let(:company) {
        company_with_branches.as_json(:except => :_id)
      }


      let(:raw_post) {
        params.to_json 
      }
      
      example "update a company" do
        do_request

        expect(status).to eq(200)
      end
    end

    patch 'api/companies/:id' do
      parameter :company, "A company JSON Object"
      
      let(:company_without_branch) { 
          company_without_branch = create(:company)
      }

      let(:id) {
        company_without_branch.id.to_s
      }

      let(:company) { 
          company = build(:company) do |company|
                      company.branches.build(attributes_for(:branch))
                    end
          company.as_json(:except => :_id)
         }


      let(:raw_post) {
        params.to_json 
      }
      
      example "update a company with new branch" do
        do_request
        
        expect(status).to eq(200)
      end
    end

    post 'api/companies' do
      parameter :company, "A company JSON Object"
      
      let(:company) { 
          company = build(:company) do |company|
                      company.branches.build(attributes_for(:branch))
                    end
          company.as_json(:except => [:_id, :name])
         }

      let(:raw_post) {
        params.to_json 
      }
      
      example "create a company without a name" do
        do_request

        expect(status).to eq(422)
      end
    end

    post 'api/companies' do
      parameter :company, "A company JSON Object"
      
      let(:company) { 
          company = build(:company) do |company|
                      company.branches.build(attributes_for(:branch))
                    end
          company.reg_id = "ABCD"
          company.as_json(:except => :_id)
         }

      let(:raw_post) {
        params.to_json 
      }
      
      example "create a company with reg_id as alphanumeric" do
        do_request

        expect(status).to eq(422)
      end
    end

    post 'api/companies' do
      parameter :company, "A company JSON Object"
      
      let(:company) { 
          company = build(:company) do |company|
                      company.branches.build(attributes_for(:branch))
                    end
          company.branches.first.name = ""
          company.as_json(:except => :_id)
         }

      let(:raw_post) {
        params.to_json 
      }
      
      example "create a company with an empty branch name" do
        do_request

        expect(status).to eq(422)
      end
    end

    get 'api/companies' do
        before do
          create_list(:company_with_branches, 3)
        end

        example "get all companies" do
          do_request
          
          expect(status).to eq(200)
        end
    end

    get 'api/companies/startup' do
        before do
          create_list(:start_up_with_branches, 3)
        end

        example "get all start_ups" do
          do_request
          
          expect(JSON.parse(response_body).count).to eq(3)
          expect(status).to eq(200)
        end
    end

    get 'api/companies/mid_size' do
        before do
          create_list(:mid_size_with_branches, 3)
        end

        example "get all mid_size" do
          do_request
          
          expect(JSON.parse(response_body).count).to eq(3)
          expect(status).to eq(200)
        end
    end

    get 'api/companies/established' do
        before do
          create_list(:established_with_branches, 3)
        end

        example "get all established" do
          do_request
          
          expect(JSON.parse(response_body).count).to eq(3)
          expect(status).to eq(200)
        end
    end

    get 'api/companies/:id' do
        let(:id) {
         company = create(:company_with_branches)
         company.id.to_s
        }

        let(:raw_post) {
          params.to_json 
        }

        example "get a company" do
        do_request
        
        expect(status).to eq(200)
      end
    end

    delete 'api/companies/:id' do
        let(:id) {
          company = create(:company_with_branches)
          company.id.to_s
        }
        
        let(:raw_post) {
          params.to_json 
        }

        example "delete a company" do
        do_request
        
        expect(status).to eq(200)
      end
    end
    
    post 'api/companies' do
      parameter :company, "A company JSON Object"
      
      let(:company) { 
          company = build(:company) do |company|
                      company.branches.build(attributes_for(:branch))
                    end
          company.as_json(:except => :_id)
         }

      let(:raw_post) {
        params.to_json 
      }

      before do
        header "Content-Type", "application/xml"
      end
      
      example "create a company with content type xml" do
        do_request
        
        expect(status).to eq(406)
      end
    end
end
