require 'rspec'
require 'boyer_moore'

describe "Boyer Moore" do
  context "::bad_character_table" do
    it "creates a bad character table" do
      pattern1 = "ACGGAC"
      pattern2 = "ATGACGT"
      bad_char1 = { "A" => 1, "C" => 0, "G" => 2 }
      bad_char2 = { "A" => 3, "C" => 2, "G" => 1, "T" => 0}
      expect(BoyerMoore.bad_character_table(pattern1)).to eq(bad_char1)
      expect(BoyerMoore.bad_character_table(pattern2)).to eq(bad_char2)
    end
  end

  context "::good_suffix_table" do
    it "creates a good suffix table" do
      pattern1 = "ACGGAC"
      pattern2 = "TCGCTGA"
      pattern3 = "TCGCTTCG"
      good_suf1 = [1, 7, 6, 7, 8, 9]
      good_suf2 = [1, 8, 9, 10, 11, 12, 13]
      good_suf3 = [1, 9, 10, 8, 9, 10, 11, 12]
      expect(BoyerMoore.good_suffix_table(pattern1)).to eq(good_suf1)
      expect(BoyerMoore.good_suffix_table(pattern2)).to eq(good_suf2)
      expect(BoyerMoore.good_suffix_table(pattern3)).to eq(good_suf3)
    end
  end

  context "::is_suffx?" do
    it "returns true if is suffix" do
      expect(BoyerMoore.is_suffix?("ACGGAC", 4)).to eq(true)
      expect(BoyerMoore.is_suffix?("AACAAC", 3)).to eq(true)
    end

    it "returns false if is not a suffix" do
      expect(BoyerMoore.is_suffix?("ACGGAC", 3)).to eq(false)
      expect(BoyerMoore.is_suffix?("TACGAC", 4)).to eq(false)
    end
  end

  context "::suffix_length" do
    it "accurately measures a suffix length from a starting pos" do
      expect(BoyerMoore.suffix_length("ACGGAC", 1)).to eq(2)
      expect(BoyerMoore.suffix_length("AACAAC", 2)).to eq(3)
      expect(BoyerMoore.suffix_length("AACTAC", 3)).to eq(0)
    end
  end

  context "::index_of" do
    let(:text) { "ACGCGTGCAGCG"}
    it "gives the correct index of matching pattern" do
      expect(BoyerMoore.index_of(text, "GCGTG")).to eq(2)
      expect(BoyerMoore.index_of(text, "TGCAG")).to eq(5)
    end

    it "returns -1 if pattern is not found" do
      expect(BoyerMoore.index_of(text, "GCGTGA")).to eq(-1)
    end
  end
end