//
//  ViewController.swift
//  Test Facebook share(swift4)
//
//  Created by shalika lahiru on 8/7/19.
//  Copyright © 2019 shalika lahiru. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FacebookLogin
import FBSDKShareKit
import FacebookShare
import FacebookCore
import FBSDKLoginKit

class ViewController: UIViewController,SharingDelegate {
    func sharer(_ sharer: Sharing, didCompleteWithResults results: [String : Any]) {
        print(results,"tttt")
    }
    
    func sharer(_ sharer: Sharing, didFailWithError error: Error) {
        print(error,"hggf")
    }
    
    func sharerDidCancel(_ sharer: Sharing) {
        print("ok")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let loginButton = FBLoginButton(permissions: [ .publicProfile ])
        loginButton.center = view.center
        
        view.addSubview(loginButton)
    }

   
    
    @IBAction func clikcedShared(_ sender: Any) {
        let content = SharePhotoContent()
        let photo = SharePhoto(image: UIImage(named: "share")!, userGenerated: true)
        content.photos = [photo].flatMap({ $0 })
        
        let dialog = ShareDialog(fromViewController: self, content: content, delegate: self)

        dialog.mode = .native
        
        dialog.show()
    }
    
}

