require 'byebug'
def knuth_morris_pratt(text, pattern)
  prefix_table = generate_prefix_table(pattern)
  a, j = 0, 0
  while a < text.length
    while pattern[j] == text[a] && pattern[j] && text[a]
      a += 1
      j += 1
    end

    return a - j if j == pattern.length
    break if a >= text.length

    if j != 0
      j = prefix_table[j - 1]
    else
      a += 1
    end

  end

  -1
end

def generate_prefix_table(pattern)
  prefix, j = [0], 0

  1.upto(pattern.length - 1) do |i|
    while j > 0 && pattern[j] != pattern[i]
      j -= 1
    end

    j += 1 if pattern[j] == pattern[i]
    prefix[i] = j
  end

  prefix
end

if __FILE__ == $PROGRAM_NAME
  pat = "ATCAAT"
  text = "AGCATCAGAAGTCATCAAT"
  knuth_morris_pratt(text, pat)
end