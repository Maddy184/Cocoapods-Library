//
//  PhotoViewerViewController.swift
//  MyCocoapodsLibrary_Example
//
//  Created by Madesh on 01/06/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit
import AVKit

class PhotoCollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    // Intialize the variables
    var count = 0
    var imgs :[UIImage] = []
    var imageFileURLs: [URL] = []
    var videoFileURLs: [URL] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView!.collectionViewLayout = creatingLayout()
        self.collectionView!.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(changingToNextVC))
        loadImagesFromFileManager()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
        self.navigationItem.title = "Album"
    }
    
    func loadImagesFromFileManager() {
        let fileManager = FileManager.default
//        print(fileManager)
        guard let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return
        }
        do {
            let fileURLs = try fileManager.contentsOfDirectory(at: documentsURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            print(fileURLs)
             imageFileURLs = fileURLs.filter { $0.pathExtension.lowercased() == "jpg" }
             videoFileURLs = fileURLs.filter { $0.pathExtension.lowercased() == "mp4" }
            print(imageFileURLs)
            print(imageFileURLs.count)
            print(videoFileURLs)
            print(videoFileURLs.count)

//            print(videoFileURLs)
            
            
            for imageURL in imageFileURLs {
                if let image = UIImage(contentsOfFile: imageURL.path) {
                    imgs.append(image)
                }
            }
            collectionView!.reloadData()
        } catch {
            print("Error while enumerating files: \(error.localizedDescription)")
        }
    }
    
    @objc func changingToNextVC(){
        

        // Declare Alert message
        let dialogMessage = UIAlertController(title: "Alert", message: "Enter a video link ", preferredStyle: .alert)
        
        // Add text field
        dialogMessage.addTextField(configurationHandler: { textField in
            textField.placeholder = ""
        })
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
            let me = dialogMessage.textFields?.first?.text
//            let vid = VideoPreviewerViewController()
//            vid.videoLink = me!
//            self.navigationController?.pushViewController(vid, animated: true)
        })
        dialogMessage.addAction(ok)
        self.present(dialogMessage, animated: true)
        
        
        
        
    }
    
    
    // MARK: UICollectionViewDataSource
    // Returning the number of the section
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageFileURLs.count + videoFileURLs.count
//        return imgs.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as! PhotoCollectionViewCell
//        cell.PhotoImage.image = imgs[indexPath.row]
        //        let data = images[indexPath.row]
        //
        //        if imgs.$0.pathextens == "video"{
        //
        //                    let videoPreviewVC = VideoPreviewerViewController()
        //                    let dur = videoPreviewVC.videoDurationTimeLabel
        //
        //                    cell.PhotoImage.image = UIImage(named: "Dog")
        //                    let videoURL = URL(fileURLWithPath: "/Users/madesh/Desktop/ZS2025/Video Player/Video/\(data.PhotoImages).mp4")
        //                    let asset = AVAsset(url: videoURL)
        //                    let durationVideo  = Int(CMTimeGetSeconds(asset.duration))
        //                    let totalMinutes1 = durationVideo / 60
        //                    let totalSeconds1 = durationVideo % 60
        //                    let durStart1 = NSString(format: "%d:%02d", totalMinutes1, totalSeconds1) as String
        //
        //                    let imgGenerator = AVAssetImageGenerator(asset: asset)
        //                    let imageGenerator = AVAssetImageGenerator(asset: asset)
        //                    imageGenerator.appliesPreferredTrackTransform = true
        //
//                            let time = CMTime(seconds: 1, preferredTimescale: 1)
        //
        //
        //            do {
        //                // Generate the thumbnail
        //                let thumbnailCGImage = try imageGenerator.copyCGImage(at: time, actualTime: nil)
        //                let thumbnail = UIImage(cgImage: thumbnailCGImage)
        //
        //                // Use the thumbnail image
        //                let imageView = UIImageView(image: thumbnail)
        //
        //                cell.PhotoImage.image = UIImage(cgImage: thumbnailCGImage )
        //                cell.imageDuration.image = UIImage(systemName: "play.fill")
        //                print(durStart1)
        //                cell.videoDurationLabel.text = durStart1
        //
        //
        //
        //            }
        //            catch let error {
        //                print("Error generating thumbnail: \(error.localizedDescription)")
        //            }
        //
        ////            cell.PhotoImage.image = UIImage(cgImage: thumbnailCGImage )
        //        }
        //        else{
        //            cell.PhotoImage.image = UIImage(named: data.PhotoImages)
        
        
        //        cell.backgroundColor = .blue
        if indexPath.item < imageFileURLs.count {
            // Handle image file
            let imageURL = imageFileURLs[indexPath.item]
            cell.PhotoImage.image = UIImage(contentsOfFile: imageURL.path)
            cell.playIconImageView.isHidden = true
        } else {
            // Handle video file
            let videoURL = videoFileURLs[indexPath.item - imageFileURLs.count]
            let asset = AVAsset(url: videoURL)
            let imageGenerator = AVAssetImageGenerator(asset: asset)
            imageGenerator.appliesPreferredTrackTransform = true
            
            do {
                let time = CMTime(seconds: 1, preferredTimescale: 1)
                let thumbnailCGImage = try imageGenerator.copyCGImage(at: time, actualTime: nil)
                let thumbnailImage = UIImage(cgImage: thumbnailCGImage)
                cell.PhotoImage.image = thumbnailImage
            } catch {
                print("Error generating thumbnail: \(error.localizedDescription)")
            }
            cell.playIconImageView.isHidden = false

        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: 250, height: 150)
        }
        return CGSize(width: 175, height: 100 )
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//            let ima = imgs[indexPath.row]
//            let imagePreviewVC = imagePreviewViewController()
//            self.navigationController?.pushViewController(imagePreviewVC, animated: true)
//            imagePreviewVC.animal = imgs[indexPath.row]
//            imagePreviewVC.img = imgs
//            imagePreviewVC.currentIndex = indexPath.row
        
        if indexPath.item >= imageFileURLs.count {
            // Play video
            let videoURL = videoFileURLs[indexPath.item - imageFileURLs.count]
            let player = AVPlayer(url: videoURL)
//            let videoVC = VideoPreviewerViewController()
//            videoVC.videoURLs = videoURL
//            self.navigationController?.pushViewController(videoVC, animated: true)
//            let playerViewController = AVPlayerViewController()
//            playerViewController.player = player
//            present(playerViewController, animated: true) {
//                player.play()
//            }
        } else {
            // Handle image selection
//            let imageURL = imageURLs[indexPath.item]
//            let ima = imgs[indexPath.row]
//            let imagePreviewVC = imagePreviewViewController()
//            self.navigationController?.pushViewController(imagePreviewVC, animated: true)
//            imagePreviewVC.animal = imgs[indexPath.row]
//            imagePreviewVC.img = imgs
//            imagePreviewVC.currentIndex = indexPath.row
            // Add your logic for displaying the image
        }
    
            
        
    }
    func creatingLayout() -> UICollectionViewCompositionalLayout{
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33333333), heightDimension: .fractionalHeight(1.0))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(100))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item,item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        collectionView!.collectionViewLayout = layout
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    
}
