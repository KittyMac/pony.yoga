use "fileExt"
use "flow"
use "bitmap"

use "lib:yoga-osx" if osx
use "lib:yoga-ios" if ios

use "lib:c++"


class YGNode
  let node:_YgnodeRef
  
  new create() =>
    node = @YGNodeNew()
    @YGNodeStyleSetWidth(node, 500)
    @YGNodeStyleSetHeight(node, 400)
  
  fun layout() =>
    @YGNodeCalculateLayout(node, 800, 600, _YgdirectionEnum.ltr())
  
  fun print() =>
    @YGNodePrint(node, _YgprintOptionsEnum.layout() or _YgprintOptionsEnum.style() or _YgprintOptionsEnum.children())

    
    
    
    
    
    
    

