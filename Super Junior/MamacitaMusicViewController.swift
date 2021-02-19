import UIKit
import AVFoundation
import AVKit
class MamacitaMusicViewController: UIViewController {

    //音樂循環播放
    var looper: AVPlayerLooper?
    //影片循環播放
    @IBAction func Play(_ sender: Any)
    {
        if let url = URL(string: "https://bit.ly/3qHUS4Y")
        {  //利用 AVPlayerItem 生成要播放的影片
           let item = AVPlayerItem(url: url)
            //生成 AVQueuePlayer 物件
           let player = AVQueuePlayer()
            //AVPlayerLooper 將讓 item 重覆播放
           looper = AVPlayerLooper(player: player, templateItem: item)
        //必須另外生成 AVPlayerViewController 顯示影片。
           let playerViewController = AVPlayerViewController()
           playerViewController.player = player
           present(playerViewController, animated: true, completion: {
              playerViewController.player?.play()
           })
    }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //漸層背景
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        
        gradientLayer.colors =
            [UIColor(red: 0/255, green: 39/255, blue: 115/255, alpha: 0.5).cgColor,
             UIColor(red: 0/255, green: 73/255, blue: 144/255, alpha: 0.5).cgColor,
             UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 0.5).cgColor,
             UIColor(red: 113/255, green: 38/255, blue: 113/255, alpha: 0.5).cgColor,
             UIColor(red: 84/255, green: 10/255, blue: 84/255, alpha: 0.5).cgColor
            
            ]
        view.layer.addSublayer(gradientLayer)
        
        //音樂循環播放
        if let url = URL(string: "https://audio-ssl.itunes.apple.com/itunes-assets/Music4/v4/2a/f1/6c/2af16c69-337b-b45d-621e-ee9184dba3e8/mzaf_4758296399370607837.plus.aac.p.m4a") {
          //生成 AVQueuePlayer 物件
            let player = AVQueuePlayer()
            //利用 AVPlayerItem 生成要播放的音樂
           let item = AVPlayerItem(url: url)
            //AVPlayerLooper 將讓 item 重覆播放
           looper = AVPlayerLooper(player: player, templateItem: item)
           player.play()

       
    }
    
      
        
        
        
        
        
}
}


