//
//  ViewController.swift
//  ReviewStarPratice
//
//  Created by 신미지 on 2021/07/22.
//

import UIKit

protocol VCToTestVCDelegate: AnyObject {
  func valueDelegate(
    float: Float,
    int: Int)
}

class ViewController: UIViewController {
  weak var delegate: VCToTestVCDelegate?
  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var numberLabel: UILabel!
  
  var sliderFloatValue: Double = 0.0
  var sliderIntValue = 0
  var senderValue = 0.0
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBAction func onDragStarSlider(_ sender: UISlider) {
    print(sender.value)
    let floatValue = floor(sender.value * 10) / 10
    let intValue = Int(floor(sender.value))
    print("floatValue is \(floatValue), intValue is \(intValue)")
    for index in 0...5 {
      if let starImage = view.viewWithTag(index) as? UIImageView {
        if index <= intValue / 2 {
          starImage.image = UIImage(named: "star_full")
        } else {
          if (2 * index - intValue) <= 1 {
            starImage.image = UIImage(named: "star_half")
          } else {
            starImage.image = UIImage(named: "star_empty")
          }
        }
      }
    }
    senderValue = Double(sender.value)
    sliderFloatValue = Double(floatValue)
    sliderIntValue = intValue
  }
  @IBAction func btnTap(_ sender: Any) {
    guard let testVC = self.storyboard?.instantiateViewController(withIdentifier: "TestVC") as? TestViewController else { return }
    testVC.floatValue = Float(sliderFloatValue)
    testVC.intValue = sliderIntValue
    testVC.senderValue = Float(senderValue)
    present(testVC, animated: true, completion: nil)
  }
}

class StarRatingUISlider: UISlider {
  
  override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
    let width = self.frame.size.width
    let tapPoint = touch.location(in: self)
    let fPercent = tapPoint.x / width
    let nNewValue = self.maximumValue + Float(fPercent)
    if nNewValue != self.value {
      self.value = Float(fPercent)
    }
    return true
  }
  
}
