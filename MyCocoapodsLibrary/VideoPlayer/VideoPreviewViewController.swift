//
//  VideoPreviewViewController.swift
//  MyCocoapodsLibrary
//
//  Created by Madesh on 02/06/23.
//

import UIKit

public class VideoPreviewViewController: UIViewController {
    
    private var VideoView:UIView = UIView()
    private var nextButtonOutlet:UIButton = UIButton()
    private var pauseButtonOutlet:UIButton = UIButton()
    private var playButtonOutlet:UIButton = UIButton()
    private var PreviousOutlet : UIButton = UIButton()
    private var stackView : UIStackView = UIStackView()
    private var videoSlider:UISlider = UISlider()
    private var videoCurrentTimeLabel:UILabel = UILabel()
    private  var videoDurationTimeLabel:UILabel = UILabel()
    private var playerCustomStactView:UIStackView = UIStackView()
    private var dur = String()
    
    private let videoPreviewVC = VideoPreview()
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        VideoSetup()
        
    }
    
    func VideoSetup(){
        //        avplayerControl()
        
        VideoView.translatesAutoresizingMaskIntoConstraints = false
        VideoView.backgroundColor = .black
        self.view.addSubview(VideoView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        self.view.addSubview(stackView)
        nextButtonOutlet.translatesAutoresizingMaskIntoConstraints = false
        nextButtonOutlet.setImage(UIImage(systemName: "arrow.clockwise"), for: .normal)
        stackView.addArrangedSubview(PreviousOutlet)
        stackView.addArrangedSubview(playButtonOutlet)
        //        stackView.addArrangedSubview(pauseButtonOutlet)
        stackView.addArrangedSubview(nextButtonOutlet)
        PreviousOutlet.addTarget(self, action: #selector(videoPreviewVC.SkippingPreviousTenSeconds), for: .touchUpInside)
        nextButtonOutlet.addTarget(self, action: #selector(videoPreviewVC.SkippingNextTenSeconds), for: .touchUpInside)
        
        
        playButtonOutlet.addTarget(self, action: #selector(videoPreviewVC.PlayerPlayandPauseAction), for: .touchUpInside)
        pauseButtonOutlet.addTarget(self, action: #selector(videoPreviewVC.PlayerPlayandPauseAction), for: .touchUpInside)
        
        videoSlider.translatesAutoresizingMaskIntoConstraints = false
        videoSlider.isUserInteractionEnabled = true
        //        self.view.addSubview(videoSlider)
        
        
        
        
        PreviousOutlet.translatesAutoresizingMaskIntoConstraints = false
        PreviousOutlet.setImage(UIImage(systemName: "arrow.counterclockwise"), for: .normal)
        playButtonOutlet.translatesAutoresizingMaskIntoConstraints = false
        playButtonOutlet.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        pauseButtonOutlet.translatesAutoresizingMaskIntoConstraints = false
        pauseButtonOutlet.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        
        videoCurrentTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        videoDurationTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        playerCustomStactView.translatesAutoresizingMaskIntoConstraints = false
        
        playerCustomStactView.addArrangedSubview(videoCurrentTimeLabel)
        playerCustomStactView.addArrangedSubview(videoSlider)
        playerCustomStactView.addArrangedSubview(videoDurationTimeLabel)
        
        self.view.addSubview(playerCustomStactView)
        
        
        
        
        NSLayoutConstraint.activate([VideoView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
                                     VideoView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
                                     VideoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                                     VideoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                                     stackView.bottomAnchor.constraint(equalTo: VideoView.bottomAnchor, constant: -30),
                                     stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
                                     stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                                     videoSlider.heightAnchor.constraint(equalToConstant: 30),videoSlider.widthAnchor.constraint(equalToConstant: 250),
                                     videoSlider.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -30),
                                     videoSlider.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
                                     videoCurrentTimeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),videoCurrentTimeLabel.bottomAnchor.constraint(equalTo: videoSlider.topAnchor, constant: -20),
                                     playerCustomStactView.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 0),
                                     playerCustomStactView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                                     playerCustomStactView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),playerCustomStactView.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -20)])
        
    }
    
    
}
