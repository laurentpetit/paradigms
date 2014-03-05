declare
fun {Infix Tree}
   case Tree
   of leaf then nil
   [] btree(K left:L right:R) then
      {Append {Append {Infix L} [K]} {Infix R}}
   end
end

declare
fun {Infix Tree}
   local Helper in
      fun {Helper Trees}
	 case Trees
	 of nil then nil
	 [] T|Ts then
	    case T
	    of leaf then {Helper Ts}
	    [] btree(K left:L right:R) then {Helper L|K|R|Ts}
	    [] K then K | {Helper Ts}
	    end
	 end
      end
      {Helper [Tree]}
   end
end

{Browse {Infix
	 btree(4
	       left:btree(2
			  left:btree(1 left:leaf right:leaf)
			  right:btree(3 left:leaf right:leaf))
	       right:btree(5 left:leaf right:leaf))}}

{Browse {Append [1] nil}}