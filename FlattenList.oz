declare
fun {FlattenList L}
   case L
   of nil then nil
   [] nil|T then {FlattenList T}
   [] (H1|T1)|T then {FlattenList H1|T1|T}
   [] X|T then X | {FlattenList T}
   end
end

{Browse {FlattenList [[1 nil [3] 4]]}}
