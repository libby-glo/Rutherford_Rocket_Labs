require 'rails_helper'

describe ApplicationHelper, type: :helper do
  describe '#logged_in?' do
    context "when a user is logged in" do
      it "returns true" do
        session[:user_id] = 3
        expect(logged_in?).to be true
      end
    end
    context "when a user is not logged in" do
      it "returns false" do
        expect(logged_in?).to be false
      end
    end
  end

  describe "#manager_logged_in" do
    let!(:warehouse) { Warehouse.create!(city: "Seattle", location_code: "SEA-001") }
    let!(:manager) { Employee.create!(first_name: "doctor", last_name: "rutherford", employee_id: 0000, password: "password", is_manager: true, warehouse: warehouse) }
    context "when a manager is logged in" do
      it 'returns true' do
        session[:user_id] = manager.id
        expect(manager_logged_in?).to be true
      end
    end
  end

end
