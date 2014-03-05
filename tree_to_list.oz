declare
fun {FromTreeToList Tree}
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

declare
FromTreeToList=Infix

declare
fun {FromListToTree L}
   local InsertTree Helper in
      fun {InsertTree Value Tree}
	 case Tree
	 of leaf then btree(Value left:leaf right:leaf)
	 [] btree(V left:L right:R) then
	    if Value==V then Tree
	    elseif Value<V then btree(V left:{InsertTree Value L} right:R)
	    else btree(V left:L right:{InsertTree Value R})
	    end
	 end
      end
      fun {Helper L Tree}
	 case L
	 of nil then Tree
	 [] H|T then {Helper T {InsertTree H Tree}}
	 end
      end
      {Helper L leaf}
   end
end

declare
List=[42 24 12]

{Browse {FromListToTree [1 2]}}
{Browse {FromListToTree List}}

declare
Tree=btree(42
	   left:btree(24
		      left:btree(12 left:leaf right: leaf)
		      right:leaf)
	   right:leaf)

{Browse {FromTreeToList Tree}}