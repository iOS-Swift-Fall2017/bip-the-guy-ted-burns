//
//  ViewController.swift
//  Bip-The-Guy
//
//  Created by Teddy Burns on 9/19/17.
//  Copyright © 2017 Teddy Burns. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    //MARK: Proprerties
    
    @IBOutlet weak var imageToPunch: UIImageView!
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //MARK: Functions
    func animateImage() {
        let bounds = self.imageToPunch.bounds
        let additiveShrink: CGFloat = 60
        
        //Shrink by 60 pixels
        self.imageToPunch.bounds = CGRect(x: bounds.origin.x+additiveShrink, y: bounds.origin.y+additiveShrink, width: bounds.size.width-additiveShrink, height: bounds.size.height-additiveShrink)
        
        UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options:[], animations: {self.imageToPunch.bounds = bounds}, completion: nil)
    }
    
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer) {
        if let sound = NSDataAsset(name: soundName) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("ERROR: data in \(soundName) couldm't be played as a sound.")
            }
        } else {
            print("ERROR: file \(soundName) didn't load")
        }
    }
    
    //MARK: Actions
    @IBAction func libraryPressed(_ sender: UIButton) {
    }
    
    @IBAction func cameraPressed(_ sender: UIButton) {
    }

    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        animateImage()
        playSound(soundName: "punch", audioPlayer: &audioPlayer)
    }
    
    
}

