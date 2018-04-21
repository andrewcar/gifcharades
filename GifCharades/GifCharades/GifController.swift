//
//  GifController.swift
//  GifCharades
//
//  Created by Dulio Denis on 4/20/18.
//  Copyright © 2018 Dulio Denis. All rights reserved.
//

import UIKit

class GifController: UIViewController {

    @IBOutlet weak var gifImageView: UIImageView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let g = Giphy(apiKey: Giphy.PublicBetaAPIKey)
        
        g.random("dogs", rating: nil) { gif, err in
            
            DispatchQueue.main.async {
                self.gifImageView.image = UIImage.gif(url: (gif?.giphyURL.absoluteString)!)
            }
            
        }

    }
}
