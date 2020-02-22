use "fileExt"
use "flow"
use "bitmap"

use "lib:yoga-osx" if osx
use "lib:yoga-ios" if ios

use "lib:c++"


class YGNode
  """
  Given how closely tied a layout engine might be to its view framework, this "YGNode" class is here simply
  as an example of how one might wrap libyoga in Pony.
  """
  let node:_YgnodeRef
  
  new create() =>
    node = @YGNodeNew()
  
  fun ref setWidth(w:F32) =>
    @YGNodeStyleSetWidth(node, w)
  
  fun ref setHeight(h:F32) =>
    @YGNodeStyleSetHeight(node, h)
  
  fun addChild(child:YGNode) =>
    @YGNodeInsertChild(node, child.node, @YGNodeGetChildCount(node))
  
  fun layout() =>
    @YGNodeCalculateLayout(node, 800, 600, _YgdirectionEnum.ltr())
  
  fun print() =>
    @YGNodePrint(node, _YgprintOptionsEnum.layout() or _YgprintOptionsEnum.style() or _YgprintOptionsEnum.children())

    
    
    
    
    
    
    

