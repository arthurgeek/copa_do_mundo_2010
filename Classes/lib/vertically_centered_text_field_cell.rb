# Original code by Daniel Jalkut from http://www.red-sweater.com/blog/148/what-a-difference-a-cell-makes
# Ported to Ruby by Arthur Zapparoli

class VerticallyCenteredTextFieldCell < NSTextFieldCell
  
  def awakeFromNib
    @mIsEditingOrSelecting = false
  end
  
  def drawingRectForBounds(theRect)
    # Get the parent's idea of where we should draw
    newRect = super(theRect)

    # When the text field is being
    # edited or selected, we have to turn off the magic because it screws up
    # the configuration of the field editor.  We sneak around this by
    # intercepting selectWithFrame and editWithFrame and sneaking a
    # reduced, centered rect in at the last minute.
    if @mIsEditingOrSelecting == false
      # Get our ideal size for current text
      textSize = self.cellSizeForBounds(theRect)

      # Center that in the proposed rect
      heightDelta = newRect.size.height - textSize.height
      if heightDelta > 0
        newRect.size.height -= heightDelta
        newRect.origin.y += (heightDelta / 2)
      end
    end
	
    return newRect
  end
  
  def selectWithFrame(aRect, inView:controlView, editor:textObj, delegate:anObject, start:selStart, length:selLength)
    aRect = self.drawingRectForBounds(aRect)
    @mIsEditingOrSelecting = true
    super(aRect, inView:controlView, editor:textObj, delegate:anObject, start:selStart, length:selLength)
    @mIsEditingOrSelecting = false
  end
  
  def editWithFrame(aRect, inView:controlView, editor:textObj, delegate:anObject, event:theEvent)
    aRect = self.drawingRectForBounds(aRect)
    @mIsEditingOrSelecting = true
    super(aRect, inView:controlView, editor:textObj, delegate:anObject, event:theEvent)
    @mIsEditingOrSelecting = false
  end
  
end