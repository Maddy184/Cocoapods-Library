//
//  AudioPlayer.swift
//  MyCocoapodsLibrary
//
//  Created by Madesh on 27/05/23.


import Foundation
import AVKit


public class AudioPlayerView {
    
    // Variable declaration
    
    public init() {
    }
    
    public var audioPlayer = AVAudioPlayer()
    // public var musicFileURL: URL?
    public var currentIndex = 0
    public var audioFiles: [URL]?
    
    public func musicPlayerLoading(from fileURL: URL) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: fileURL)
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        } catch {
            print("audioPlayer is not working: \(error.localizedDescription)")
        }
    }
    
    @objc func previousTrackChanging() {
        audioPlayer.stop()
        
        do {
            let previousIndex = currentIndex - 1
            if previousIndex >= 0 {
                let previousMusicFileURL = audioFiles![previousIndex]
                currentIndex = previousIndex
                do {
                    let previousMusicFile = previousMusicFileURL.deletingPathExtension()
                    // musicLabel.text = previousMusicFile.lastPathComponent
                    audioPlayer = try AVAudioPlayer(contentsOf: previousMusicFileURL)
                    audioPlayer.prepareToPlay()
                    audioPlayer.play()
                } catch {
                    print("Could not load audio file")
                }
            }
        }
    }
    
    @objc func musicPlayButtonTapped(_ sender: Any) {
        if audioPlayer.isPlaying {
            audioPlayer.stop()
            // playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        } else {
            audioPlayer.play()
            // playButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        }
    }
    
    @objc func ChangingActionTime(_ sender: UISlider) {
        //        audioPlayer.stop()
        //        audioPlayer.currentTime = TimeInterval(Slider.value)
        //        audioPlayer.prepareToPlay()
        //        audioPlayer.play()
    }
    
    @objc func nextTrackChanging() {
        audioPlayer.stop()
        let nextIndex = currentIndex + 1
        if nextIndex < audioFiles!.count {
            let nextMusicFileURL = audioFiles![nextIndex]
            currentIndex = nextIndex
            // playMusic(from: nextMusicFileURL)
            print(currentIndex)
            do {
                let nextMusicFile = nextMusicFileURL.deletingPathExtension()
                // musicLabel.text = nextMusicFile.lastPathComponent
                audioPlayer = try AVAudioPlayer(contentsOf: nextMusicFileURL)
                audioPlayer.prepareToPlay()
                audioPlayer.play()
            } catch {
                print("Could not load audio file")
            }
        } else {
            audioPlayer.stop()
            // currentIndex = nil
        }
        print(currentIndex)
        updateInMusicTimer()
        sliderTime()
    }
    
    public func updateInMusicTimer() {
        let duration = Int(audioPlayer.duration)
        let minutes2 = duration / 60
        let seconds2 = duration - minutes2 * 60
        var durStart = NSString(format: "%02d:%02d", minutes2, seconds2) as String
        // print("Hello")
        let totalTime = Int(audioPlayer.duration)
        let totalMinutes = totalTime / 60
        let totalSeconds = totalTime % 60
        var durationEndTrack = String(format: "%d:%02d", totalMinutes, totalSeconds)
    }
    
    public func sliderTime() {
        // Slider.value = Float(audioPlayer.currentTime ?? 0 )
        // Slider.maximumValue = Float(audioPlayer.duration)
    }
    
    public func musicPlayerTimeUpdater(_ sender: Any) {
        let currentTime1 = Int(audioPlayer.currentTime)
        let minutes = currentTime1 / 60
        let seconds = currentTime1 - minutes * 60
        var durEnd = NSString(format: "%02d:%02d", minutes, seconds) as String
        // durationStartTrack.text = durEnd
    }
}

//
//     public class MusicView: UIView {
//
//        let imageView = UIImageView()
//        let musicLabel = UILabel()
//        let slider = UISlider()
//        let volumeSlider = UISlider()
//        let durationStack = UIStackView()
//        let durationStartTrack = UILabel()
//        let durationEndTrack = UILabel()
//        let previousButton = UIButton()
//        let playButton = UIButton()
//        let nextButton = UIButton()
//        let stackView = UIStackView()
//        var audioPlayer = AudioPlayerView()
//
//    //    var musicClass = MusicPlayerView()
//
//
//
//        override init(frame: CGRect) {
//            super.init(frame: frame)
//            setupView()
//        }
//
//        required init?(coder aDecoder: NSCoder) {
//            super.init(coder: aDecoder)
//            setupView()
//        }
//
//        private func setupView() {
//            // Set up imageView
//            imageView.translatesAutoresizingMaskIntoConstraints = false
//            imageView.contentMode = .scaleAspectFit
//            imageView.image = UIImage(named: "Image")
//            addSubview(imageView)
//
//            // Set up musicLabel
//            musicLabel.translatesAutoresizingMaskIntoConstraints = false
//            musicLabel.textAlignment = .center
//            addSubview(musicLabel)
//
//            // Set up slider
//            slider.translatesAutoresizingMaskIntoConstraints = false
//            slider.isUserInteractionEnabled = true
//    //        slider.addTarget(self, action: #selector(ChangingActionTime), for: .touchUpInside)
//            addSubview(slider)
//
//            // Set up volumeSlider
//            volumeSlider.translatesAutoresizingMaskIntoConstraints = false
//            volumeSlider.isUserInteractionEnabled = true
//            addSubview(volumeSlider)
//
//            // Set up durationStack
//            durationStack.translatesAutoresizingMaskIntoConstraints = false
//            addSubview(durationStack)
//            durationStack.addArrangedSubview(durationStartTrack)
//            durationStack.addArrangedSubview(slider)
//            durationStack.addArrangedSubview(durationEndTrack)
//
//            // Set up previousButton
//            previousButton.translatesAutoresizingMaskIntoConstraints = false
//            previousButton.setImage(UIImage(systemName: "arrowshape.left"), for: .normal)
//    //        previousButton.addTarget(self, action: #selector(previousTrackButtonTapped), for: .touchUpInside)
//
//            // Set up playButton
//            playButton.translatesAutoresizingMaskIntoConstraints = false
//            playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
//    //        playButton.addTarget(self, action: #selector(audioPlayer.MusicPlayButtonTapped()), for: .touchUpInside)
//
//            // Set up nextButton
//            nextButton.translatesAutoresizingMaskIntoConstraints = false
//            nextButton.setImage(UIImage(systemName: "arrowshape.right"), for: .normal)
//    //        nextButton.addTarget(self, action: #selector(NextTrackButtonTapped), for: .touchUpInside)
//
//            // Set up stackView
//            stackView.axis = .horizontal
//            stackView.alignment = .fill
//            stackView.distribution = .equalSpacing
//            stackView.translatesAutoresizingMaskIntoConstraints = false
//            stackView.addArrangedSubview(previousButton)
//            stackView.addArrangedSubview(playButton)
//            stackView.addArrangedSubview(nextButton)
//            addSubview(stackView)
//
//            // Activate constraints
//            NSLayoutConstraint.activate([
//                imageView.topAnchor.constraint(equalTo: topAnchor, constant: 200),
//                imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
//                imageView.heightAnchor.constraint(equalToConstant: 250),
//                imageView.widthAnchor.constraint(equalToConstant: 300),
//                musicLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
//                musicLabel.heightAnchor.constraint(equalToConstant: 30),
//                musicLabel.widthAnchor.constraint(equalToConstant: 350),
//                musicLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
//                slider.heightAnchor.constraint(equalToConstant: 30),
//                slider.widthAnchor.constraint(equalToConstant: 250),
//                durationStack.centerXAnchor.constraint(equalTo: centerXAnchor),
//                durationStack.topAnchor.constraint(equalTo: musicLabel.bottomAnchor, constant: 50),
//                stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
//                stackView.heightAnchor.constraint(equalToConstant: 70),
//                stackView.widthAnchor.constraint(equalToConstant: 250),
//                stackView.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 60),
//                volumeSlider.heightAnchor.constraint(equalToConstant: 30),
//                volumeSlider.widthAnchor.constraint(equalToConstant: 250),
//                volumeSlider.centerXAnchor.constraint(equalTo: centerXAnchor),
//                volumeSlider.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10)
//            ])
//        }
//    }
