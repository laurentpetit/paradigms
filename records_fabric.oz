% L = [ alabel [features] [values] ]

declare
fun {Transform L}
   case L
   of [ Label Features Values ] then
      local Ret Helper in
	 Ret = {Record.make Label Features}
	 fun {Helper Features Values}
	    case Features
	    of nil then Ret
	    [] H|T then Ret.H = {Transform Values.1} {Helper T Values.2}
	    end
	 end
	 {Helper Features Values}
      end
   else
      L
   end
end

{Browse {Transform [ 'lolo' [ 'f1' 'f2' ] [ ['lili' [2] ['A']] 'val2' ] ]}}

{Browse {Record.make 'foo' ['f1' 'f2']}}