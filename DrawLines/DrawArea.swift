//
//  DrawArea.swift
//  DrawLines
//
//  Created by Onur Işık on 10.11.2018.
//  Copyright © 2018 Onur Işık. All rights reserved.
//


import UIKit

class DrawArea: UIView {
    
    var lines: [Line] = []
    var lastpoint: CGPoint!
    var isDrawable: Bool = true
    var lineWidth: CGFloat = 4
    var drawColor: UIColor = .black
    var blendMode: CGBlendMode = .normal
    var lineJoin: CGLineJoin = .round
    var lineCap: CGLineCap = .round
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            if isDrawable {
                
                lastpoint = touch.location(in: self)
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            if isDrawable {
                
                let newPoint = touch.location(in: self)
                lines.append(Line(start: lastpoint, end: newPoint, color: drawColor, width: lineWidth, blendMode: blendMode, join: lineJoin, cap: lineCap))
                lastpoint = newPoint
                
                // Redraw the view
                self.setNeedsDisplay()
                
            }
            
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if let context = UIGraphicsGetCurrentContext() {
            lines.forEach { (line) in
                context.setLineCap(line.cap)
                context.setStrokeColor(line.drawColor.cgColor)
                context.setLineWidth(line.width)
                context.setBlendMode(line.blendMode)
                context.setLineJoin(line.join)
                context.interpolationQuality = .high
                context.move(to: CGPoint(x: line.start.x, y: line.start.y))
                context.addLine(to: CGPoint(x: line.end.x, y: line.end.y))
                context.strokePath()
            }
        }
        
    }
}

