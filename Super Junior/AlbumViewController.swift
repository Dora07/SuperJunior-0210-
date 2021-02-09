import UIKit

class AlbumViewController: UIViewController {
    //ImageView
    @IBOutlet weak var AlbumPhoto: UIImageView!
    //DatePicker
    @IBOutlet weak var AlbumDatePickker: UIDatePicker!
    //Slider
    @IBOutlet weak var AlbumSlider: UISlider!
    
    let dateFormatter = DateFormatter()
        var dateString:String = ""
        var SliderNum = 0
        var ImgNum = 0
        var timer:Timer?
        let Album = ["20060210","20070713","20071209","20080627","20090807","20100115","20100520","20101119","20110930","20120302","20120601","20120807","20120914","20130724","20131129","20140110","20140902","20141224","20150716","20150917","20151106","20151109","20171106","20180413","20181008","20191014","20200129","20200306","20201106","20210127"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        time()
        //設定為中文
        AlbumDatePickker.locale=Locale(identifier: "zh_TW")
        dateFormatter.dateFormat = "yyyy/MM/dd"
       
    }
    ////比對陣列內的專輯圖片,預設專輯圖片為0
        func compare(){
    //如果到最後一張照片時則從第一張開始,不是的話繼續跑照片num+=1
            if ImgNum>=Album.count{
                ImgNum = 0
               AlbumPicture(num2: ImgNum)
                AlbumPhoto.image=UIImage(named: Album[ImgNum])
            }else{
                AlbumPicture(num2: ImgNum)
                AlbumPhoto.image=UIImage(named: Album[ImgNum])
            }
    //連動Slider
           AlbumSlider.value = Float(ImgNum)
            ImgNum+=1
            
        }
    
    func time(){
        timer=Timer.scheduledTimer(withTimeInterval: 2, repeats: true){(timer) in self.compare()}
    }

    @IBAction func SliderValueChanged(_ sender: UISlider)
    {  //將 value 四捨五入，讓 slider 的圓點滑動到整數的位置
      sender.value.round()
        //變成整數
        SliderNum = Int(sender.value)
        AlbumPhoto.image = UIImage(named: Album[SliderNum])
        AlbumPicture(num2: SliderNum)
    }
    @IBAction func SwitchValueChanged(_ sender: UISwitch)
    {
        if sender.isOn {
            time()
            ImgNum = SliderNum
            AlbumSlider.value = Float(ImgNum)
        }else{
            timer?.invalidate()
        }
    }
    //用switch列出Case選照片
        func AlbumPicture(num2:Int) {
            switch num2 {
            case 0:
                dateString = "2006/02/10"
            case 1:
                dateString = "2007/07/13"
            case 2:
                dateString = "2007/12/09"
            case 3:
                dateString = "2008/06/27"
            case 4:
                dateString = "2009/08/07"
            case 5:
                dateString = "2010/01/15"
            case 6:
                dateString = "2010/05/20"
            case 7:
                dateString = "2010/11/19"
            case 8:
                dateString = "2011/09/30"
            case 9:
                dateString = "2012/03/02"
            case 10:
                dateString = "2012/06/01"
            case 11:
                dateString = "2012/08/07"
            case 12:
                dateString = "2012/09/14"
            case 13:
                dateString = "2013/07/24"
            case 14:
                dateString = "2013/11/29"
            case 15:
                dateString = "2014/01/10"
            case 16:
                dateString = "2014/09/02"
            case 17:
                dateString = "2014/12/24"
            case 18:
                dateString = "2015/07/16"
            case 19:
                dateString = "2015/09/17"
            case 20:
                dateString = "2015/11/06"
            case 21:
                dateString = "2015/11/09"
            case 22:
                dateString = "2017/11/06"
            case 23:
                dateString = "2018/04/13"
            case 24:
                dateString = "2018/10/08"
            case 25:
                dateString = "2019/10/14"
            case 26:
                dateString = "2020/11/06"
            case 27:
                dateString = "2020/01/29"
            case 28:
                dateString = "2020/03/06"
            default:
                dateString = "2021/01/27"
            }
            //修改datapicker顯示日期為dateString內字串的日期
            let date = dateFormatter.date(from: dateString)
         AlbumDatePickker.date=date!
          
        }
    //關閉app畫面即停止timer，以防止在背景持續執行
    override func viewDidDisappear(_ animated: Bool)
    {
        timer?.invalidate()
    }
    
    
    

}
