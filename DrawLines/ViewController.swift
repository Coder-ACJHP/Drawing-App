//
//  ViewController.swift
//  DrawLines
//
//  Created by Onur Işık on 10.11.2018.
//  Copyright © 2018 Onur Işık. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var drawArea: DrawArea!
    @IBOutlet weak var blendModePicker: UIPickerView!
    @IBOutlet weak var colorPickerCollectionView: UICollectionView!
    private let colorList:[UIColor] = [.white, .red, .yellow, .green, .black, .brown, .blue, .purple, .gray, .darkGray, .cyan, .magenta, .orange]
    private let blendModeList: [CGBlendMode] = [.normal, .multiply, .screen, .overlay, .colorBurn, .hardLight, .exclusion]
    private let blendNames: [String] = ["Normal", "Multiply", "Ghost", "Overlay lights", "Burn lights", "Hard light", "Exclusion"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blendModePicker.delegate = self
        blendModePicker.dataSource = self
        colorPickerCollectionView.delegate = self
        colorPickerCollectionView.dataSource = self
        
        drawArea.isDrawable = true
    }

    @IBAction func lineWidthSlider(_ sender: UISlider) {
        drawArea.lineWidth = CGFloat(sender.value)
        drawArea.setNeedsDisplay()
    }
    
    @IBAction func undoPressed(_ sender: UIBarButtonItem) {
        
        if drawArea.lines.count > 0 {
            sender.isEnabled = true
            self.drawArea.lines.removeLast()
            self.drawArea.setNeedsDisplay()
        } else {
            sender.isEnabled = false
        }
    }
    

    @IBAction func clearPressed(_ sender: Any) {
        drawArea.lines.removeAll(keepingCapacity: false)
        drawArea.setNeedsDisplay()
    }
    
    
    @IBAction func eraserPressed(_ sender: UIBarButtonItem) {
        
        drawArea.drawColor = .white
        drawArea.blendMode = .normal
        drawArea.setNeedsDisplay()
    }
    
    @IBAction func fillArea(_ sender: UIBarButtonItem) {
        drawArea.backgroundColor = drawArea.drawColor
        drawArea.setNeedsDisplay()
    }
    
    @IBAction func actionButtonsPressed(_ sender: UIButton) {
        
        switch sender.tag {
        case 10:
            drawArea.lineCap = .round
            drawArea.lineJoin = .round
        case 11:
            drawArea.lineCap = .square
            drawArea.lineJoin = .miter
        default:
            break
        }
        
        drawArea.setNeedsDisplay()
    }
    
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // CollectionView delegate methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let colorCell = collectionView.dequeueReusableCell(withReuseIdentifier: "colorCell", for: indexPath)
        colorCell.contentView.layer.masksToBounds = true
        colorCell.contentView.layer.cornerRadius = colorCell.contentView.bounds.height/2
        colorCell.contentView.backgroundColor = colorList[indexPath.item]
        return colorCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pickedColorCell = collectionView.cellForItem(at: indexPath)
        drawArea.drawColor = pickedColorCell!.contentView.backgroundColor!
    }
    
    // PickerView delegate methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return blendModeList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(blendModeList[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        drawArea.blendMode = blendModeList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label = UILabel()
        if let v = view as? UILabel { label = v }
        label.font = UIFont (name: "Helvetica Neue", size: 12)
        label.text =  blendNames[row]
        label.textAlignment = .center
        return label
    }
}
