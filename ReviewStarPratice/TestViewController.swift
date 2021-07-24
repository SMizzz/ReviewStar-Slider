//
//  TestViewController.swift
//  ReviewStarPratice
//
//  Created by 신미지 on 2021/07/22.
//

import UIKit

class TestViewController: UIViewController {
  
  var floatValue: Float = 0.0
  var intValue: Int = 0
  var senderValue: Float = 0.0
  
  @IBOutlet weak var slider: UISlider!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    slider.value = senderValue
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
  }
}
