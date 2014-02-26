declare X1 X2 in
X1=6|X2

{Browse X1}

declare X3 in
X2=7|X3

X3 = nil

{Browse X1}

{Browse [6 7]=6|7|nil}

{Browse X1.1}
{Browse X1.2}
{Browse X1.2.1}

declare
fun {Sum L}
   local SumHelp in
      fun {SumHelp L A}
	 case L
	 of nil then A
	 [] H|T then {SumHelp T H+A}
	 end
      end
      {SumHelp L 0}
   end
end

{Browse {Sum X1}}

declare
fun {Nth L N}
   if N==1 then L.1
   else {Nth L.2 N-1} end
end

{Browse {Nth [1 2 3] 3}}

declare
fun {Fact N}
   local FactHelp in
      fun {FactHelp X F}
	 if X > N then nil
	 else F*X | {FactHelp X+1 F*X} end
      end
      {FactHelp 1 1}
   end   
end

{Browse {Fact 4}}