//
//  ViewController.swift
//  youtube-onedaybuild
//
//  Created by Artur Svirin on 8/30/23.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        model.getVideos()
    }
}

