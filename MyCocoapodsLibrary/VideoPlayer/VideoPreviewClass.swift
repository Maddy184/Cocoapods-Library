//
//  VideoPreviewClass.swift
//  MyCocoapodsLibrary
//
//  Created by Madesh on 02/06/23.
//

import Foundation
import AVKit

public class VideoPreview {
    
    // Here Declaring the Variable
    
    public var player = AVPlayer()
    public var playerlayer = AVPlayerLayer()
    public var VideoMediaLink = String()
    public var VideoView:UIView = UIView()
    
    // Handle the LoadingVideoFromRemotely
    
    public func LoadingVideoRemotely () {
        
        guard let videoURLlink = URL(string: VideoMediaLink) else {return}
        player = AVPlayer(url: videoURLlink)
        playerlayer = AVPlayerLayer(player: player)
        playerlayer.frame = VideoView.bounds
        playerlayer.videoGravity = .resizeAspect
        VideoView.layer.addSublayer(playerlayer)
        player.play()
        
        
    }
    // Handle the VideoPlayingFromLocally
    
    public func VideoPlayFromLocal () {
        
        let VideoURLLocalPath = URL(fileURLWithPath: "")
        player = AVPlayer(url: VideoURLLocalPath)
        playerlayer = AVPlayerLayer(player: player)
        playerlayer.frame = VideoView.bounds
        playerlayer.videoGravity = .resizeAspect
        VideoView.layer.addSublayer(playerlayer)
        player.play()
        
    }
    
    // Here Handle for Skipping Video Seconds for PreviousTenSeconds
    
    @objc func SkippingPreviousTenSeconds () {
        
        let currentTime = player.currentTime()
        let targetTime = CMTimeSubtract(currentTime, CMTime(seconds: 10, preferredTimescale: currentTime.timescale))
        player.seek(to: targetTime)
        
    }
    
    // Here Handle for SkippingVideo for NextTenSeconds 
    
    @objc func SkippingNextTenSeconds () {
        let currentTime = player.currentTime()
        let targetTime = CMTimeAdd(currentTime, CMTime(seconds: 10, preferredTimescale: currentTime.timescale))
        player.seek(to: targetTime)
    }
    
    @objc func HandleVolumeMuteAndUnmute () {
        if player.volume == 0 {
            player.volume = 1
        }
        else {
            player.volume = 0
        }
    }
    
    @objc func PlayerPlayandPauseAction () {
        if player.timeControlStatus == .playing {
            player.pause()
        }
        else {
            player.play()
        }
    }
    
    
    
    
}
