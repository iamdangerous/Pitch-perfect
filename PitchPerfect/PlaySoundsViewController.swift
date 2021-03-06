//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Rahul Lohra on 06/01/18.
//  Copyright © 2018 Rahul Lohra. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!

    var recordedAudioURL: URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!

    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print(recordedAudioURL)
        setupAudio()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
        squeeshButtons()
    }
    

    @IBAction func playSoundForButton(_ sender: UIButton) {
        print("Play Sound Button Pressed")

        switch(ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }

        configureUI(.playing)

    }

    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        print("Stop Audio Button Pressed")
        stopAudio()
    }
    
    func squeeshButtons(){
        var buttons =  [UIButton]()
        
        buttons.append(snailButton)
        buttons.append(chipmunkButton)
        buttons.append(rabbitButton)
        buttons.append(vaderButton)
        buttons.append(echoButton)
        buttons.append(reverbButton)
        buttons.append(stopButton)
        
        for btn in buttons {
            btn.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        }
    }

}
