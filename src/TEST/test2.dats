
#include "share/atspre_staload.hats"

#define ATS_DYNLOADFLAG 0

#include "./../HATS/extlib.hats"


fn
  __free_opt
  ( i: Option_vt(int)
  ):<> void =
let
in
  ( case+ i of
  | ~None_vt() => ()
  | ~Some_vt(_) => ()
  )
end

fn test1():<> void = {
  val some = Some_vt(0)
  val v = ( __free_opt(some)) eafter
    (( case+ some of
    | None_vt() => None_vt()
    | Some_vt(v) => Some_vt(0)
    ):Option_vt(int))
  val () = __free_opt(v)
}
implement main0() = {
  val () = test1()
}