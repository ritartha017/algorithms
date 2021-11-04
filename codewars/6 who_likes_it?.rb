# frozen_string_literal: true

# []                                -->  "no one likes this"
# ["Peter"]                         -->  "Peter likes this"
# ["Jacob", "Alex"]                 -->  "Jacob and Alex like this"
# ["Max", "John", "Mark"]           -->  "Max, John and Mark like this"
# ["Alex", "Jacob", "Mark", "Max"]  -->  "Alex, Jacob and 2 others like this"

# NOTE: For 4 or more names, the number in "and 2 others" simply increases.

def likes(names)
  case names.size
  when 0 then 'no one likes this'
  when 1 then "#{names * ''} likes this"
  when 2 then "#{names * ' and '} like this"
  when 3 then '%s, %s and %s like this' % names
  else format('%s, %s and %d others like this', (names[0, 2] + [names.size - 2]))
  end
end

raise 'This is wrong' unless likes([]) == 'no one likes this'
raise 'This is wrong' unless likes(['Peter']) == 'Peter likes this'
raise 'This is wrong' unless likes(%w[Jacob Alex]) == 'Jacob and Alex like this'
raise 'This is wrong' unless likes(%w[Max John Mark]) == 'Max, John and Mark like this'
raise 'This is wrong' unless likes(%w[Alex Jacob Mark Max]) == 'Alex, Jacob and 2 others like this'
