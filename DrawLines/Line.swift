//
//  Line.swift
//  DrawLines
//
//  Created by Onur Işık on 10.11.2018.
//  Copyright © 2018 Onur Işık. All rights reserved.
//
import UIKit

class Line {
    
    var start: CGPoint
    var end: CGPoint
    var drawColor: UIColor
    var width: CGFloat
    var blendMode: CGBlendMode
    var join: CGLineJoin
    var cap: CGLineCap
    
    init(start _start: CGPoint, end _end: CGPoint, color _color: UIColor, width _width: CGFloat, blendMode _blendMode: CGBlendMode, join _join: CGLineJoin, cap _cap: CGLineCap) {
        self.start = _start
        self.end = _end
        self.drawColor = _color
        self.width = _width
        self.blendMode = _blendMode
        self.join = _join
        self.cap = _cap
    }
}
