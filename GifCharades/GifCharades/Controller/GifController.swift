//
//  GifController.swift
//  GifCharades
//
//  Created by Dulio Denis on 4/20/18.
//  Copyright © 2018 Dulio Denis. All rights reserved.
//

import UIKit
import SDWebImage

class GifController: UIViewController {

    @IBOutlet weak var gifImageView: UIImageView!
    @IBOutlet weak var progressBar: UIView!
    var animationTimer : Timer?
    var currentTime = 0.0
    var totalTime = 10.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressBar.frame.size.width = 0
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        invalidateTimer()
    }
    
    fileprivate func invalidateTimer() {
        animationTimer?.invalidate()
        animationTimer = nil
    }
    
    fileprivate func timeUp() {
        print("TIMES UP")
    }
    
    fileprivate func invokeTimer() {
        if animationTimer == nil {
            self.currentTime = 0
            self.progressBar.frame.size.width = 0
            
            animationTimer = Timer.scheduledTimer(withTimeInterval: 0.1,
                                                  repeats: true,
                                                  block: { (timer) in
                                                    self.currentTime += timer.timeInterval
                                                    
                                                    if self.currentTime > self.totalTime {
                                                        self.invalidateTimer()
                                                        self.timeUp()
                                                        
                                                    } else {
                                                        self.progressBar.frame.size.width = (self.view.frame.size.width/CGFloat(self.totalTime)) * CGFloat(self.currentTime)
                                                        self.progressBar.setNeedsDisplay()
                                                    }
            })
        }
    }
    
    @IBAction func fetchGif(_ sender: Any) {
        invokeTimer()
        let g = Giphy(apiKey: Giphy.PublicBetaAPIKey)
        
        g.random("dogs", rating: nil) { gif, err in
            
            if err != nil {
                print("Error fetching gif")
                return }
            
            guard let imageData = try? Data(contentsOf: (gif?.giphyURL)!) else {
                print("Error getting gif")
                return
            }
            
            DispatchQueue.main.async {
                self.gifImageView.image = UIImage.sd_animatedGIF(with: imageData)
                // self.gifImageView.sd_setImage(with: gif?.giphyURL, completed: nil)
            }
            
        }
    }
}
