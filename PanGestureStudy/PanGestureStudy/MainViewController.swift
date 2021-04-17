//
//  MainViewController.swift
//  PangestureStudy
//
//  Created by 박익범 on 2021/04/16.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var panGestureRecognizer: UIPanGestureRecognizer!

    
    
    @IBAction func PanAction(_ sender: Any) {
        let transition = panGestureRecognizer.translation(in: imageView)
        // setTanslation은 지정된 view의 좌표계에서 translation vlaue을 설정함.
        // transtlation에서 파라미터로 받는 view는 우리가 변환을 계산해야하는 view임
        // 여기서 인식하면 새로운 좌표가 return됨
        // func translation(in view: UIView?) -> CGPoint 이함수를 이용하는거임
        
        let changedX = imageView.center.x + transition.x
        let changedY = imageView.center.y + transition.y
        //그래서 여기서 바뀌는 x,y값을 중앙x값 + 바뀐값으로 받아옴
        imageView.center = CGPoint(x: changedX, y:changedY)
        //그 후 이미지 뷰에 적용.
      panGestureRecognizer.setTranslation(CGPoint.zero, in: imageView)
        //우선 UIPanGestureRecognizer의 translation은 이 벡터의 원래 위치가 0,0이지만 현재 드래그해서 끌어온 위치의 벡터를 나타냄.
        //그래서 드래그 한 거리를 결정하는데 필요한 것은 이벡터의 또다른 점 뿐임.
        // 여기서 또다른 점은 translation메소드로 얻어온 값을 의미
        //근데 UIPanGestureRecognizer은 우리가 translation의 부분을 다 쓴걸 모르고, 마지막위치부터 계산하는게 아니라, 원래 끌기 시작했던 위치 (처음 PanGesture을 시작한 위치)로 부터 계산하는거임.... 그래서 recognizer에 settanslation의 값을 0,0으로 만들어주지 않으면 이미지가 지혼자 요동침,,
        let velocity = panGestureRecognizer.velocity(in: imageView)
        if abs(velocity.x) > abs(velocity.y){
            //좌우판단
            velocity.x<0 ? print("left"): print("right")
            //x가 작아진다는건 내가 그림을 왼쪽으로 옮긴다는거...!
        }
        else if abs(velocity.y) > abs(velocity.x){
            velocity.y<0 ? print("up"): print("down")
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
