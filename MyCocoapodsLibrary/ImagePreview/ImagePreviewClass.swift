//
//  ImagePreviewClass.swift
//  MyCocoapodsLibrary
//
//  Created by Madesh on 31/05/23.
//

import Foundation
import UIKit

public class ImagePreview: UIView {
    
    // Declare variables
    
    public var imagePreviewView: UIImageView = UIImageView()
    public var scrollView: UIScrollView = UIScrollView()
    public var currentIndex: Int = Int()
    public var imageStoredArray = [UIImage]()
    
    // Handle left swipe gesture to display the next image
    
    public func handleLeftSwipeGesture(_ gesture: UISwipeGestureRecognizer) {
        
        if scrollView.zoomScale == 1 {
            if gesture.direction == .left{
                
                let nextImageIndex = currentIndex + 1
                if nextImageIndex < imageStoredArray.count {
                    let nextImage = imageStoredArray[nextImageIndex]
                    currentIndex = nextImageIndex
                    
                    do{
                        imagePreviewView.image = nextImage
                    }
                }
                
            }
        }
    }
    
    // Handle right swipe gesture to display the previous image
    
    public func handleRightSwipeGesture(_ gesture: UISwipeGestureRecognizer) {
        
        if scrollView.zoomScale == 1 {
            if gesture.direction == .right{
                
                let previousImageIndex = currentIndex + 1
                if previousImageIndex < imageStoredArray.count {
                    let previousImage = imageStoredArray[previousImageIndex]
                    currentIndex = previousImageIndex
                    
                    do{
                        imagePreviewView.image = previousImage
                    }
                }
                
            }
        }
    }
    
    // Handle double tap gesture to reset zoom level
    
    @objc func handleDoubleTapGesture(_ gesture: UITapGestureRecognizer) {
        
        if scrollView.zoomScale > 1{
            scrollView.setZoomScale(1, animated: true)
        }
    }
    
    // Handle zoom-in / zoom-out gesture on the scroll view
    
    public func handleScrollViewZoomGesture(_ gesture: UIPinchGestureRecognizer) {
        
        guard let view = gesture.view else {return}
        
        // Scale the imageView according to the gesture
        view.transform = view.transform.scaledBy(x: gesture.scale, y: gesture.scale)
        gesture.scale = 1
        
        // Set the minimum and maximum limits for scaling the imageView
        let minimumScale: CGFloat = 1
        let maximumScale: CGFloat = 4
        view.transform = view.transform.scaledBy(x: min(maximumScale, max(minimumScale, view.transform.a)), y: min(maximumScale, max(minimumScale, view.transform.d)))
    }
    
}

// Declare Functions

// * handleLeftSwipeGesture
// * handleRightSwipeGesture
// * handleDoubleTapGesture
// * handleScrollViewZoomGesture

