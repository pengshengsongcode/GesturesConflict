//
//  ViewController.swift
//  手势冲突
//
//  Created by pengshengsong on 2021/11/4.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testView: UIView!
    
    var tap1: UITapGestureRecognizer?
    var tap2: UITapGestureRecognizer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap1 = UITapGestureRecognizer.init(target: self, action: #selector(singleTap(_:)))
        self.tap1 = tap1
        tap1.numberOfTapsRequired = 1
        tap1.delegate = self
        testView.addGestureRecognizer(tap1)
        
        let tap2 = UITapGestureRecognizer.init(target: self, action: #selector(doubleTap(_:)))
        self.tap2 = tap2
        tap2.numberOfTapsRequired = 2
        tap2.delegate = self
        testView.addGestureRecognizer(tap2)
        
//        tap1.require(toFail: tap2)
        
        
    }
    
    @objc func singleTap(_ g: UITapGestureRecognizer) {
        self.perform(#selector(realSingleTap), with: self, afterDelay: 0.25)
    }
    
    @objc func realSingleTap(_ g: UITapGestureRecognizer) {
        print("单击手势")
    }

    @objc func doubleTap(_ g: UITapGestureRecognizer) {
        NSObject.cancelPreviousPerformRequests(withTarget: self)
        print("双击手势")
    }
    
}

extension ViewController: UIGestureRecognizerDelegate {
//    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
//
//        if gestureRecognizer == tap1 {
//            return false
//        }
//        return true
//    }
    
    
    // called when the recognition of one of gestureRecognizer or otherGestureRecognizer would be blocked by the other
    // return YES to allow both to recognize simultaneously. the default implementation returns NO (by default no two gestures can be recognized simultaneously)
    //
    // note: returning YES is guaranteed to allow simultaneous recognition. returning NO is not guaranteed to prevent simultaneous recognition, as the other gesture's delegate may return YES
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return false
    }
    
}

