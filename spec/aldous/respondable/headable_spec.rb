RSpec.describe Aldous::Respondable::Headable do
  subject(:headable) {described_class.new(status, view_data, view_context)}

  let(:status) {:foo}
  let(:view_data) {double("view_data")}
  let(:view_context) {double("view context")}

  describe "::action" do
    let(:controller) {double("controller")}

    it "returns a head response action object" do
      expect(headable.action(controller)).to be_kind_of Aldous::Respondable::Headable::HeadAction
    end

    it 'creates a head response action with the relevant parameters' do
      expect(Aldous::Respondable::Headable::HeadAction).to receive(:new).with(controller, status)
      headable.action(controller)
    end
  end
end
