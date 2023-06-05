//
//  AudioPlayerViewController.swift
//  MyCocoapodsLibrary
//
//  Created by Madesh on 02/06/23.
//

import UIKit

public class AudioPlayerViewController: UIViewController {
    
    private var imageView : UIImageView = UIImageView()
    private var musicLabel: UILabel = UILabel()
    private var durationStartTrack:UILabel = UILabel()
    private var durationEndTrack:UILabel = UILabel()
    private var Slider:UISlider = UISlider()
    private var stackView:UIStackView = UIStackView()
    private var durationStack:UIStackView = UIStackView()
    private var previousButton:UIButton = UIButton()
    private var playButton:UIButton = UIButton()
    private var nextButton:UIButton = UIButton()
    private var volumeSlider:UISlider = UISlider()
    
    // Here intializing the AudioView Class
    
    let audioClass = AudioPlayerView()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupImageView()
    }
    
    private func setupImageView(){
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "Image")
        self.view.addSubview(imageView)
        
        musicLabel.translatesAutoresizingMaskIntoConstraints = false
        musicLabel.textAlignment = .center
        //        musicLabel.text = musicName
        
        self.view.addSubview(musicLabel)
        
        Slider.translatesAutoresizingMaskIntoConstraints = false
        self.Slider.isUserInteractionEnabled = true
        Slider.addTarget(self, action: #selector(audioClass.ChangingActionTime), for: .touchUpInside)
        
        volumeSlider.translatesAutoresizingMaskIntoConstraints = false
        self.volumeSlider.isUserInteractionEnabled = true
        self.view.addSubview(Slider)
        
        durationStack.translatesAutoresizingMaskIntoConstraints = false
        //        durationStartTrack.text = durEnd
        //        durationEndTrack.text = durStart
        self.view.addSubview(durationStack)
        durationStack.addArrangedSubview(durationStartTrack)
        durationStack.addArrangedSubview(Slider)
        durationStack.addArrangedSubview(durationEndTrack)
        
        
        
        
        
        
        
        previousButton.translatesAutoresizingMaskIntoConstraints = false
        previousButton.setImage(UIImage(systemName: "arrowshape.left"), for: .normal)
        previousButton.addTarget(self, action: #selector(audioClass.previousTrackChanging), for: .touchUpInside)
        
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        playButton.addTarget(self, action: #selector(audioClass.musicPlayButtonTapped), for: .touchUpInside)
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setImage(UIImage(systemName: "arrowshape.right"), for: .normal)
        nextButton.addTarget(self, action: #selector(audioClass.nextTrackChanging), for: .touchUpInside)
        
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(previousButton)
        stackView.addArrangedSubview(playButton)
        stackView.addArrangedSubview(nextButton)
        self.view.addSubview(stackView)
        self.view.addSubview(volumeSlider)
        
        
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant:0),
            //        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            imageView.heightAnchor.constraint(equalToConstant: 250),
            imageView.widthAnchor.constraint(equalToConstant: 300),
            musicLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            musicLabel.heightAnchor.constraint(equalToConstant: 30),
            musicLabel.widthAnchor.constraint(equalToConstant: 350),
            musicLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            Slider.heightAnchor.constraint(equalToConstant: 30),
            Slider.widthAnchor.constraint(equalToConstant: 250),
            durationStack.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            durationStack.topAnchor.constraint(equalTo: musicLabel.bottomAnchor,constant: 50),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            //            stackView.heightAnchor.constraint(equalToConstant: 40),
            //            stackView.widthAnchor.constraint(equalToConstant: 200),
            //            stackView.topAnchor.constraint(equalTo: view.bottomAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 70),
            stackView.widthAnchor.constraint(equalToConstant: 250),
            stackView.topAnchor.constraint(equalTo: Slider.bottomAnchor, constant: 60),
            volumeSlider.heightAnchor.constraint(equalToConstant: 30),
            volumeSlider.widthAnchor.constraint(equalToConstant: 250),
            volumeSlider.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            volumeSlider.topAnchor.constraint(equalTo: stackView.bottomAnchor,constant: 10),])
    }




}
