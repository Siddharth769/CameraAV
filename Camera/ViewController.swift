//
//  ViewController.swift
//  Camera
//
//  Created by siddharth on 24/01/19.
//  Copyright © 2019 clarionTechnologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let cameraController = CameraController()
    
    @IBOutlet fileprivate var capturePreviewView: UIView!
    
    @IBOutlet fileprivate var photoModeButton: UIButton!
    
    @IBOutlet fileprivate var toggleFlashButton: UIButton!
    
    @IBOutlet fileprivate var toggleCameraButton: UIButton!
    
    @IBOutlet fileprivate var videoModeButton: UIButton!
    

    @IBOutlet weak var captureButton: UIButton!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

extension ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureCameraController()
    }

    func configureCameraController() {
        cameraController.prepare { (error) in
            if let error = error {
                print(error)
            }
            try? self.cameraController.displayPreview(on: self.capturePreviewView)
        }
    }
}

