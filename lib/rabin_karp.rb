def rabin_karp(text, pattern)
  pattern_hash = compute_pattern_hash(pattern)
  len, rolling_hash = pattern.length, 0

  text.each_char.with_index do |char, k|
    if k < len
      rolling_hash = (rolling_hash + char.ord * (10 ** (len - k - 1))) % 997
    else
      rolling_hash = (rolling_hash - (10 ** (len - 1) * text[k - len].ord)) % 997
      rolling_hash = (rolling_hash * 10 + char.ord) % 997

      return k - len + 1 if rolling_hash == pattern_hash
    end
    
    return -1 if text.length - k < len
  end

  -1
end

def compute_pattern_hash(pattern)
  hash, len = 0, pattern.length

  pattern.each_char.with_index do |char, i|
    hash = (hash + char.ord * (10 ** (len - i - 1))) % 997
  end

  hash
end