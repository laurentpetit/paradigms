% non primes
declare
fun {Prod X Stop}
   if X>Stop then nil
   else X|{Prod X+1 Stop}
   end
end

declare
fun {Filter Xs C}
   case Xs of nil then nil
   [] X|Xr then
      if (X mod C)==0 then
	 {Filter Xr C}
      else
	 X|{Filter Xr C}
      end
   end
end

declare
fun {Sieve Xs}
   case Xs of nil then nil
   [] X|Xr then
      X|{Sieve thread {Delay 1000} {Filter Xr X} end}
   end
end

declare
fun {NotPrime S1 S2}
   case S2
   of nil then S1
   [] X2|X2r then
      case S1
      of nil then nil
      [] X1|X1r then
	 if X1==X2 then
	    {NotPrime X1r X2r}
	 else
	    X1|{NotPrime X1r S2}
	 end
      end
   end      
end

local P S NP in
   P=thread {Prod 2 100} end
   S=thread {Sieve P} end
   NP=thread {NotPrime P S} end
   {Browse NP}
end 