declare
Tree=btree(1
	   left:btree(2 left:leaf right:leaf)
	   right:btree(3
		       left:btree(2 left:leaf right:leaf)
		       right:leaf))

{Browse Tree}

declare
fun {NumLeaves Tree}
   local Help in
      fun {Help Trees Acc}
	 case Trees
	 of nil then Acc
	 [] T|Ts then
	    case T
	    of leaf then {Help Ts Acc+1}
	    [] btree(V left:T1 right:T2) then
	       {Help T1|T2|Ts Acc}
	    end	    
	 end
      end
      {Help [Tree] 0}
   end   
end

{Browse {NumLeaves leaf}}
{Browse {NumLeaves btree(1 left:leaf right:leaf)}}
{Browse {NumLeaves Tree}}

declare
fun {IsBalanced Tree}
   case Tree
   of leaf then true
   [] btree(V left:T1 right:T2) then
      {And
       {And {IsBalanced T1} {IsBalanced T2}}
       {Abs {NumLeaves T1} - {NumLeaves T2}} < 2}
   end
end

{Browse {Abs 1-2}}
{Browse {NumLeaves 3}}
{Browse {And [true false false]}}
{Browse {IsBalanced leaf}}
{Browse {IsBalanced Tree}}