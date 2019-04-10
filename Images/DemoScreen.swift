import UIKit
import paper_onboarding

class DemoScreen: UIViewController {
    
    @IBOutlet weak var skipButton: UIButton!
    
    
    @IBOutlet weak var onboardingView: OnboardingViewClass!
    
    var userData = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onboardingView.dataSource = self
        onboardingView.delegate = self
        skipButton.isHidden = true
    }
    
    @IBAction func skipped(_ sender: UIButton) {
        userData.set(true, forKey: "skipped")
        userData.synchronize()
    }
}

extension DemoScreen: PaperOnboardingDataSource, PaperOnboardingDelegate {
    func onboardingItemsCount() -> Int {
        return 3
    }
    
    func onboardingItem(at index: Int) -> OnboardingItemInfo {
        let bc1 = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        let bc2 = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        let bc3 = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        
        let tc = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        let tf = UIFont(name: "Helvetica-Bold", size: 20)!
        let df = UIFont(name: "Helvetica", size: 16)!
        
        var pages = [OnboardingItemInfo]()
        
        pages.append(OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "illustration"), title: "Drinks", description: "Alcohol is bad for you!", pageIcon: #imageLiteral(resourceName: "active"), color: bc1, titleColor: tc, descriptionColor: tc, titleFont: tf, descriptionFont: df))
        
        pages.append(OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "card-1"), title: "Bottles", description: "Bad for environment!", pageIcon: #imageLiteral(resourceName: "active"), color: bc2, titleColor: tc, descriptionColor: tc, titleFont: tf, descriptionFont: df))
        
        pages.append(OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "post-1"), title: "Card", description: "Plastic is bad for everyone!", pageIcon: #imageLiteral(resourceName: "active"), color: bc3, titleColor: tc, descriptionColor: tc, titleFont: tf, descriptionFont: df))
        
        return pages[index]
    }
    
    func onboardingDidTransitonToIndex(_ index: Int) {
        if index == 2 {
            skipButton.isHidden = false
        }
    }
    
    func onboardingWillTransitonToIndex(_ index: Int) {
        if index != 2 {
            skipButton.isHidden = true
        }
    }
    
    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {
    }
}
