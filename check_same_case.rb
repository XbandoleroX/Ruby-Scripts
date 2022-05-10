def same_case(a, b)
  return -1 if /^.{0}[^a-zA-Z]/.match(a) || /^.{0}[^a-zA-Z]/.match(b)
  
  (!!/^.{0}[A-Z]/.match(a)).eql?(!!/^.{0}[A-Z]/.match(b)) ? 1 : 0
end
