class TransparentTableView < NSTableView

	def	awakeFromNib
		self.backgroundColor = NSColor.clearColor
	end

	def	drawBackgroundInClipRect(clipRect)
		# don't draw a background rect
	end

end