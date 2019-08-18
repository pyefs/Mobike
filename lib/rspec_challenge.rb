def addition_of_two(num1, num2)
  if num1.is_a?(Integer) && num2.is_a?(Integer)
    num1 + num2
  else
    'MUST BE NUMBER!!'
  end
end

def star_wars(name)
  jedi = ['luke', 'ben']
  sith = ['vader', 'palpatine']

  if jedi.include?(name.downcase)
    'I am a Jedi'
  elsif sith.include?(name.downcase)
    'I am a Sith'
  else
    'I am no one. :('
  end
end

def name_to_array(name)
  name.gsub(/\s+/, '').split(//)
end