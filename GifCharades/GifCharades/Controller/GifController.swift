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

    @IBAction func fetchGif(_ sender: Any) {
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
