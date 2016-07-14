require 'rspec'
require 'rabin_karp'

describe "Rabin Karp" do
  let(:text) { "ATGCGTGACGGAGC" }
  context "#compute_pattern_hash" do
    it "correctly generate a hash for a pattern" do
      expect(compute_pattern_hash("AG")).to eq(721)
      expect(compute_pattern_hash("ZX")).to eq(988)
      expect(compute_pattern_hash("ZYX")).to eq(8)
      expect(compute_pattern_hash("ABCD")).to eq(554)
    end
  end

  context "#rabin_karp" do
    it "returns -1 if pattern is not found in text" do
      expect(rabin_karp(text, "AGGGA")).to eq(-1)
      expect(rabin_karp(text, "AA")).to eq(-1)
    end

    it "returns the starting position if a pattern is found" do
      expect(rabin_karp(text, "GACGG")).to eq(6)
      expect(rabin_karp(text, "TGCG")).to eq(1)
      expect(rabin_karp(text, "TG")).to eq(1)
      expect(rabin_karp(text, "AG")).to eq(11)
    end
  end
end