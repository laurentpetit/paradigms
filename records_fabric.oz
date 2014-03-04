% L = [ alabel [features] [values] ]

declare
fun {Transform L}
   local R in
      R = {Record.make L.1 L.2}
   end
   R
end

{Browse {Transform [ 'lolo' [ 'f1' 'f2' ] [ 'val1' 'val2' ] ]}}