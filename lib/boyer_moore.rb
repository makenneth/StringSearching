class BoyerMoore
  def self.index_of(str, pat)
    return 0 if pat.length < 1

    bct = self.bad_character_table(pat)
    gct = self.good_suffix_table(pat)
    k = pat.length - 1
    while k < str.length
      j = pat.length - 1
      while pat[j] == str[k]
        return k if j == 0

        k -= 1
        j -= 1
      end
      k += [gct[pat.length - 1 - j], bct[str[k]]].max
    end

    -1
  end

  def self.bad_character_table(pat)
    chars = Hash.new(pat.length)
    pat.each_char.with_index do |char, index|
      chars[char] = pat.length - 1 - index
    end

    chars
  end

  def self.good_suffix_table(pat)
    chars = []
    last_prefix = pat.length
    (pat.length - 1).downto(0) do |i|
      if self.is_suffix?(pat, i + 1)
        last_prefix = i + 1
      end

      chars << last_prefix - i + pat.length - 1 
    end

    0.upto(pat.length - 2) do |j|
      slen = self.suffix_length(pat, j)
      chars[slen] = pat.length - 1 - j + slen
    end

    chars
  end
  
  def self.is_suffix?(pat, pos)
    (pos...pat.length).each_with_index.all? do |i, j|
      pat[i] == pat[j]
    end
  end

  def self.suffix_length(pat, pos)
    i, j, count = pos, pat.length - 1, 0 
    while pat[i] == pat[j] && i >= 0
      count += 1
      i -= 1
      j -= 1
    end

    count
  end
end