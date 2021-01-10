(* This module defines some routines, that are missing from the standard library
*)
#define ATS_PACKNAME "extlib"
#define ATS_EXTERN_PREFIX "extlib_"

(*
  this operator runs 'cleanup' expression right after evalutating 'work' expression
  the initial goal of this operator is to be used like this:
  ```
  val resource = resource_new()
  val result = (free_resource(resource)) after ((do_something_with_resource_not_consuming_it(resource)))
  val () = use_result( result) // here resource had already been released
  ```
*)
macdef after(cleanup,work) = result where {
  val result = ( ,(work) )
  val () = ( ,(cleanup) )
}
infix 99 after

(*
  the same as 'after', but evaluates 'cleanup' even if 'work' raises an exception
  TODO: this function can't be used because compiler will fail to infer type of raise-expression
*)
macdef eafter(cleanup,work) = result where {
  val result = 
    try ( ,(work) ) 
    with some_exception =>
    let
      val () = ( ,(cleanup) ) // cleanup in case if any exception happend
    in
      $raise some_exception // rethrow the exception
    end
  val () = ( ,(cleanup) ) // cleanup in case if no exceptions happend
}
infix 99 eafter