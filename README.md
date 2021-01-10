# ATS2 Extended library

This repo contains some useful stuff, that is yet missing from the standard library

# Usage

at the moment, the usage is about to clone the repo into 'libs' directory:

```
cd /path/to/project
mkdir libs
cd libs
git submodule init
git submodule add https://github.com/dambaev/extlib.git
```

and now you will be able to use it in .dats file like this:

```
#define LIBS_targetloc "../libs" (* search path for external libs *)

#include "{$LIBS}/extlib/src/HATS/extlib.hats"

fn test(): void = {
  val resource = resource_new()
  val result = (resource_free( resource)) after (resource_use( resource))
  val () = println!(result)
}

```
