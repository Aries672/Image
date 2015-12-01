//
//  ViewController.swift
//  Image
//
//  Created by Aries on 12/1/15.
//  Copyright © 2015 star. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    var imageView:UIImageView!

    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationItem.title = "图片获取器"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "拍照片", style: .Plain, target: self, action: "takePhotos")
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "取照片", style: .Plain, target: self, action: "obtainPhotos")
        imageView = UIImageView(frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height))
        imageView.backgroundColor = UIColor.grayColor()
        self.view.addSubview(imageView)

        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
//    func setNavigation (){
//        
//        navigationItem.title = "图片获取器"
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "拍照片", style: .Plain, target: self, action: "takePhotos")
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "取照片", style: .Plain, target: self, action: "obtainPhotos")
//        
//        
//    }
    
//    
//    func setImageView(){
//        
//        imageView = UIImageView(frame: CGRectMake(0, 0, view.frame.width, 300))
//        imageView.backgroundColor = UIColor.grayColor()
//        view.addSubview(imageView)
//    }
    
    //获取照片
    func obtainPhotos(){
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum
        self.presentViewController(picker, animated: true, completion: nil)
        
    }
    //拍摄照片(模拟器不能模拟拍照)
    
    func takePhotos(){
        
        let picker = UIImagePickerController()
        picker.delegate = self
        let sourceType = UIImagePickerControllerSourceType.Camera
        if(UIImagePickerController.isSourceTypeAvailable(sourceType)){
            
            picker.sourceType = UIImagePickerControllerSourceType.Camera
            
            let frontCamera = UIImagePickerControllerCameraDevice.Front
            let rearCamera = UIImagePickerControllerCameraDevice.Rear
            
            if(UIImagePickerController.isCameraDeviceAvailable(frontCamera)){
                picker.cameraDevice = frontCamera
            }
            else{
                picker.cameraDevice = rearCamera
            }
            
            
            self.presentViewController(picker, animated: true, completion: nil)
            
        }
        else {
            print("模拟器没有摄像头")
            
        }
    }
    
    //实现UIImagePickController的代理协议

    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image:UIImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.imageView.image = image
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

