//
//  CustomControl.swift
//  Custom Control
//
//  Created by Stephanie Bowles on 6/10/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import Foundation
import UIKit


class CustomControl: UIControl {
    var value: Int = 1
    var labels: [UILabel] = []  // in case we use it for other purposes

    private let componentDimension: CGFloat = 40.0
    
    private let componentCount: Int = 5
    
    private let componentActiveColor: UIColor = .black
    
    private let componentInactiveColor: UIColor = .gray
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
    private func setup(){
      
        let spacing: CGFloat = 8.0  /// has to be called here for some reason  - Why?
        var x: CGFloat = spacing   /// has to be called here for some reason  - Why?
     
        
        for i in 0..<self.componentCount {
       
            let label = UILabel()
            addSubview(label)
        
            
               //        In setup use a loop to create five labels (using the UILabel() constructor). Add each one as a subview. Store each label into a local array with append.
            label.tag = i + 1
            labels.append(label)
         
            //        In your loop, add a tag for each view that represents which star it is. The first star is tag 1. The fifth is tag 5. The tags let you quickly update the control's value.
 
            label.frame.size = CGSize(width: componentDimension, height: componentDimension)
            label.frame.origin = CGPoint(x: x, y: 0.0)
            x += componentDimension + spacing
//            Set each label's frame to size componentDimension by componentDimension. (Yes, they are all square). Lay out the labels in a row with 8 points of space between each one. The first label should be at (8.0, 0), which allows a small pad between it and the edge of the control. The next one starts at (componentDimension + 16.0, 0.0), and so forth.
            
            
            
            // wanna do an x / y plane drawing to understand
            
            
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            label.text = "✯"
            label.textAlignment = .center
            //        Set the font (bold system font, size 32.0), text (pick your favorite Unicode star from the character picker), and alignment (center) for your label.
            
            
            //        Set the label's textColor to either the active (for the first) or inactive (for the others) component color.
            if label.tag == 1 {
                label.textColor = componentActiveColor
            } else {
                label.textColor = componentInactiveColor
            }
            
           
        }
    }
        

        


        
//        Add the following method to your type. This method tells Auto Layout how big your custom control should be.
        
        override var intrinsicContentSize: CGSize {
            let componentsWidth = CGFloat(componentCount) * componentDimension
            let componentsSpacing = CGFloat(componentCount + 1) * 8.0
            let width = componentsWidth + componentsSpacing
            return CGSize(width: width, height: componentDimension)
        }
    
    
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        sendActions(for: .touchDown)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
         
            sendActions(for: [.touchDragInside, .valueChanged] )
            updateValue(at: touch)
            
        
        } else {
            sendActions(for: .touchDragOutside)
        }
        return true
    }
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else {return}
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchUpInside, .valueChanged])
        } else {
            sendActions(for: .touchUpOutside)
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
        
    }
    
    func updateValue(at touch: UITouch) {
        
    }
    }
    

