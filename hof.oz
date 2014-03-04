declare
fun {M Int}
   fun {$} Int|{M Int-1} end
end

{Browse M}

{Browse {{M 5}}}

declare
fun {FunnyFunc FunL L}
   case L of H|T then {FunL.1 H}|{FunnyFunc FunL.2 T}
   else nil
   end
end

declare
proc {Test FunL L SolL}
   {Browse {FunnyFunc FunL L} == SolL}
end

declare 
fun {Add1 I} I+1 end

declare
fun {Add2 I} I+2 end

{Test [Add1 Add2] [1 2] [2 4]}

{Test [fun {$ I} I+1 end fun {$ I} I+2 end] [1 2] [2 4]}

declare
fun {Build D C}
   fun {$ V}
      local Helper in
	 fun {Helper D C}
	    if D==nil then bottom
	    elseif D.1==V then C.1
	    else {Helper D.2 C.2}
	    end
	 end
	 {Helper D C}
      end
   end
end

local F D C in
   D = [1 2 3]
   C = ['1' '2' '3']
   F = {Build D C}
   {Browse {F 1}}
   {Browse {F 3}}
   {Browse {F 4}}
end
