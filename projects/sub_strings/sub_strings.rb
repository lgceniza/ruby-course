def substrings(words, dictionary)
  cleaned = words.gsub(/[^a-zA-Z\s]/, '').downcase
  subs = dictionary.reduce(Hash.new) do |res, dword|
    c = cleaned.scan(dword).length
    if c > 0
      res[dword] = c
    end
    res
  end
  subs
end
