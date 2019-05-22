import UIKit
import Firebase
class viewViewController: UIViewController {
    var images = [UIImage]()
    var imagess = [UIImage]()
    var timer: Timer?
    @IBOutlet weak var userName: UITextField!
    var names : [Int:String] = [0: "灰色打妖精",1 : "台灣不加冰一條柴",2 : "越南一定要羅漢", 3 : "這看到婆",4: "正直一08",5:"粉紅色之成功"]
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var Qone: UIImageView!
    @IBOutlet weak var wtwo: UIImageView!
    @IBOutlet weak var etree: UIImageView!
    @IBOutlet weak var rFour: UIImageView!
    @IBOutlet weak var qtext: UILabel!
    @IBOutlet weak var wtext: UITextView!
    @IBOutlet weak var etext: UITextView!
    @IBOutlet weak var rtext: UITextView!
    
    @IBAction func segmented(_ sender: UISegmentedControl) {
        
        
        if sender.selectedSegmentIndex == 0 {
            for i in stride(from: 24, to: 1, by: -1) {
                images.append(UIImage(named:"\(i).png")!)
            }
            imageview.animationImages = images
            imagess.removeAll()
            qtext.text = "鋼鐵暴雪（Q）\n短暫延遲後，犽宿朝游標位置向前突刺，在 6 秒內共可使用 3 次"
            wtext.text = "風牆鐵壁（W）\n犽宿朝目標方向發出一道緩緩前進的風牆，持續 3.75 秒。風牆能阻擋所有發射攻擊，包括遠程普攻、指向和指定技能，但無法阻擋防禦塔的攻擊。"
            etext.text = "刃敵千軍 （E）\n犽宿衝向敵人造成 100 點魔法傷害，並標記目標 6 秒"
            rtext.text = "奪命氣息（R）\n犽宿瞬間移動到滯空的敵方英雄身邊，延長他們 1 秒滯空時間，並造成 200點物理傷害"
            Qone.image = UIImage(named: "Q")
            wtwo.image = UIImage(named: "W")
            etree.image = UIImage(named: "E")
            rFour.image = UIImage(named: "R")
            imageview.image = UIImage(named: "0")
            
        }
        else {
            
            for i in stride(from: 43, to: 25, by: -1) {
                imagess.append(UIImage(named: "\(i).png")!)
            }
            imageview.animationImages = imagess
            images.removeAll()
            qtext.text = "雷電手裡劍 （Q）\n凱能向目標方向投擲手裡劍，對第一個擊中的敵人造成 235魔法傷害"
            wtext.text = "電能釋放 （W）\n被動：凱能每 5 次普攻附加50點魔法傷害，並附加一層風暴印記"
            etext.text = "閃電衝擊 （E）\n凱能變身為球形閃電，最多持續 3 秒。期間內增加 230 點跑速，無視單位碰撞，對穿越的敵人造成 235魔法攻擊）點魔法傷害，並附加一層風暴印記。小兵只會受到一半傷害。"
            rtext.text = "雷霆風暴 （R）\n凱能召喚魔法風暴，每 0.5 秒發動一波攻擊，持續 3 秒。每波攻擊傷害會增加 10%，最多增加 50%，對範圍內任一敵人最多共造成 300點魔法傷害。"
            Qone.image = UIImage(named: "Q1")
            wtwo.image = UIImage(named: "Q2")
            etree.image = UIImage(named: "Q3")
            rFour.image = UIImage(named: "Q4")
            imageview.image = UIImage(named: "25")
            
            
        }
        
    }
    
    
    override func viewDidLoad() {
        for i in stride(from: 24, to: 1, by: -1) {
            images.append(UIImage(named:"\(i).png")!)
        }
        imageview.animationImages = images
        super.viewDidLoad()
    }
    
    @IBAction func randonName(_ sender: Any) {
        let randonNames = Int.random(in: 0...5)
        userName.text = "\(names[randonNames]!)"
    }
    
        
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        if !imageview.isAnimating {
            _ = Double(images.count)
            imageview.animationDuration = 1.5
            imageview.animationRepeatCount = 0
            imageview.startAnimating()
        } else {
            imageview.stopAnimating()
            if timer != nil {
                timer!.invalidate()
                timer = nil
            }
        }
        
    }
    
    @IBAction func insName(_ sender: Any) {
        upload()
    }
    func upload () {
        let userNames = userName.text ?? ""
        let db = Firestore.firestore()
        let data: [String: Any] = ["name": userNames]
        var songReferences: DocumentReference?
        songReferences = db.collection("Name").addDocument(data: data) {
            (error) in
            guard error == nil else {
                return
            }

}
}
}

