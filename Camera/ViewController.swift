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
    
    @IBAction func toggleFlash(_ sender: Any) {
        if cameraController.flashMode == .on {
            cameraController.flashMode = .off
            toggleFlashButton.setImage(#imageLiteral(resourceName: "Flash Off Icon"), for: .normal)
        }
            
        else {
            cameraController.flashMode = .on
            toggleFlashButton.setImage(#imageLiteral(resourceName: "Flash On Icon"), for: .normal)
        }
    }
    
    @IBAction func switchCamera(_ sender: Any) {
        do {
            try cameraController.switchCameras()
        }catch {
            print(error)
        }
        switch cameraController.currentCameraPosition {
            case .some(.front): toggleCameraButton.setImage(#imageLiteral(resourceName: "Front Camera Icon"), for: .normal)
            case .some(.rear): toggleCameraButton.setImage(#imageLiteral(resourceName: "Rear Camera Icon"), for: .normal)
            case .none: return
        }
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

