//
//  LiveVCViewController.swift
//  RealVision
//
//  Created by Sushma Mundlamuri on 4/12/24.
//

import UIKit
import AVKit
import Vision

class LiveVC: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    override var prefersStatusBarHidden:Bool{
        return true
    }

    @IBOutlet weak var Live: UIView!
    
    @IBOutlet weak var Objectdescription: UILabel!
    
    @IBOutlet weak var Accuracy: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //var model = Resnet50().model
        let captureSession = AVCaptureSession()
                
                guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
                guard let input = try? AVCaptureDeviceInput(device: captureDevice) else { return }
                captureSession.addInput(input)
                
                captureSession.startRunning()
                
                let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                view.layer.addSublayer(previewLayer)
                previewLayer.frame = view.frame
                // The camera is now created!
                
                view.addSubview(Live)
                
                Live.clipsToBounds = true
                Live.layer.cornerRadius = 15.0
                Live.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
                
                
                let  dataOutput = AVCaptureVideoDataOutput()
                dataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
                captureSession.addOutput(dataOutput)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
