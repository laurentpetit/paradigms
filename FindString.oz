declare
fun {Prefix L1 L2}
   case L1
   of nil then true
   [] H|T then
      case L2
      of nil then false
      [] H1|T1 then
	 if H==H1 then {Prefix T T1}
	 else false end
      end
   end
end

{Browse {Prefix nil nil}}

declare
fun {FindString L1 L2}
   if {Prefix L1 L2} then true
   elseif L2==nil then false
   else {FindString L1 L2.2} end
end

{Browse {FindString [a] [a]}}