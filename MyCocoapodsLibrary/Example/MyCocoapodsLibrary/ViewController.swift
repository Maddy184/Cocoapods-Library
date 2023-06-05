//
//  ViewController.swift
//  MyCocoapodsLibrary
//
//  Created by gothham on 05/26/2023.
//  Copyright (c) 2023 gothham. All rights reserved.
//

import UIKit
import MyCocoapodsLibrary

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabbarController()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     func tabbarController () {
        let firstViewController = UINavigationController(rootViewController: AudioPlayerViewController())//AudioViewController()
//        let layout = UICollectionViewFlowLayout()
//        let Vc = PhotoCollectionViewController(collectionViewLayout: layout)
//        Vc.collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: "dataCell")
        let secondViewController = UINavigationController(rootViewController: VideoPreviewViewController())
        firstViewController.navigationItem.title = "Music"
        firstViewController.tabBarItem = UITabBarItem(title: "Music", image: UIImage(systemName:"music.note.list"), tag: 0)
        firstViewController.view.backgroundColor = .white
        secondViewController.tabBarItem = UITabBarItem(title: "Album", image: UIImage(systemName: "photo"), tag: 1)
        self.viewControllers = [firstViewController,secondViewController]
        view.backgroundColor = .white
    }

}



