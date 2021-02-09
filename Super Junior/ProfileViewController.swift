

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()

        let logo = UIImage(named: "profile")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
    }
    

  
    
}
