require 'rspec'
require 'knuth_morris_pratt'

describe "Knuth Morris Pratt" do
  let(:pat) { "ATCAAT" }
  let(:pat2) { "CATCAG"}
  let(:text) { "AGCATCAGAAGTCATCAAT" }

  context "#generate_prefix_table" do
    it "generates the right prefix" do
      expect(generate_prefix_table(pat)).to eq([0, 0, 0, 1, 1, 2])
      expect(generate_prefix_table(pat2)).to eq([0, 0, 0, 1, 2, 0])
    end
  end

  context "#knuth_morris_pratt" do
    it "returns -1 if a string is not found" do
      expect(knuth_morris_pratt(text, "AAAAGG")).to eq(-1)
    end

    it "correctly locates a substring" do
      expect(knuth_morris_pratt(text, pat)).to eq(13)
      expect(knuth_morris_pratt(text, pat2)).to eq(2)
    end
  end
end