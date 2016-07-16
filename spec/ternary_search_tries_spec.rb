require 'rspec'
require 'ternary_search_tries'

describe "Ternary Search Tries" do
  let(:tstries){ TernarySearchTries.new }
  context "#put" do
    it "inserts characters correctly" do
      tstries.put("lie", 1)
      expect(tstries.root.left.char).to eq("l")
      expect(tstries.root.left.value).to be_nil
      expect(tstries.root.left.middle.char).to eq("i")
      expect(tstries.root.left.middle.value).to be_nil
      expect(tstries.root.left.middle.middle.char).to eq("e")
      expect(tstries.root.left.middle.middle.value).to eq(1)
    end
  end
  context "#get" do
    before(:each) do
      paragraph = "The crash mercury examines a holy rumor. How does a tourist sufferer pipeline the soul? The concert hunts before the unused patience. An optional peasant antiques every chase."
      paragraph.gsub(/[^a-zA-Z\s]/, "").downcase.split(" ").each_with_index do |str, i|
        tstries.put(str, i)
      end
    end
    it "can retrieve the position of the word" do
      expect(tstries.get("mercury")).to eq(2)
      expect(tstries.get("holy")).to eq(5)
    end

    it "returns -1 if a word is not found" do
      expect(tstries.get("rumour")).to eq(nil)
      expect(tstries.get("piano")).to eq(nil)
    end
  end

end