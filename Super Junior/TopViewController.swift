
import UIKit

class TopViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
      //Navigation bar with UIImage for title

        let logo = UIImage(named: "logo")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
    }
    

    
}
