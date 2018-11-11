# Drawing-App
2D drawing app with UIGraphics -> UIKit -> Swift

<img src="https://github.com/Coder-ACJHP/Drawing-App/blob/master/ScreenShot.png" width=250 height="450">

#### Line class:
Including line object and it's properties, you can modify it as you want.

##### Line Options:
* Color: UIColor<br>
* Width: CGFloat<br>
* Start: CGPoint<br>
* End: CGPoint<br>
* Cap: CGLineCap<br>
* Join: CGLineJoin<br>
* BlendMode: CGBlendMode<br>

#### DrawingArea:
Extended from UIView class drawing lines with options, listening touches on screen and tracking the locations.

##### DrawingArea Options:
It is flexible, class you can modify it like normal UIView just added 
<br>
* isDrawable : Bool // For controlling drawing mode
* Fill background: UIColor (tool)
* Eraser (tool)
* Color Picker (tool)
* Undo (tool)
* Clear (tool)
