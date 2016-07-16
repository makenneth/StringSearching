require 'rspec'
require 'tries'

describe "Tries" do
  let(:tries){ Tries.new }
  context "#put" do
    it "inserts characters correctly" do
      tries.put("life", 0)
      expect(tries.root.nexts["l"]).to_not be_falsey
      expect(tries.root.nexts["l"].nexts["i"]).to_not be_falsey
      expect(tries.root.nexts["l"].nexts["i"].nexts["f"]).to_not be_falsey
      expect(tries.root.nexts["l"].nexts["i"].nexts["f"].nexts["e"].value).to eq(0)
    end
  end
  context "#get" do
    before(:each) do
      paragraph = "The crash mercury examines a holy rumor. How does a tourist sufferer pipeline the soul? The concert hunts before the unused patience. An optional peasant antiques every chase."
      paragraph.gsub(/[^a-zA-Z\s]/, "").downcase.split(" ").each_with_index do |str, i|
        tries.put(str, i)
      end
    end
    it "can retrieve the position of the word" do
      expect(tries.get("mercury")).to eq(2)
      expect(tries.get("holy")).to eq(5)
    end

    it "returns -1 if a word is not found" do
      expect(tries.get("rumour")).to eq(-1)
      expect(tries.get("piano")).to eq(-1)
    end
  end

end