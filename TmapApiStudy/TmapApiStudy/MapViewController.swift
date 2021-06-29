//
//  MapViewController.swift
//  TmapApiStudy
//
//  Created by 박익범 on 2021/06/29.
//

import UIKit
import TMapSDK

class MapViewController: UIViewController,TMapViewDelegate {

    @IBOutlet weak var mapStartView: UIView!
    var mapView : TMapView?
    let apiKey : String = "l7xx2752c71746744fc0989158214763201e"
    var markers:Array<TMapMarker> = []
    var polylines:Array<TMapPolyline> = []

    public func objFunc01() {
        let position = self.mapView?.getCenter()
        if let position = position {
            let marker = TMapMarker(position: position)
            marker.title = "제목없음"
            marker.subTitle = "내용없음"
            marker.draggable = true
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 50))
            label.text = "좌측"
            marker.leftCalloutView = label
            let label2 = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 50))
            label2.text = "우측"
            marker.rightCalloutView = label2
            
            marker.map = self.mapView
            self.markers.append(marker)
        }
    }
    //MARK: mapViewLoad
    func setMap(){
        self.mapView = TMapView(frame: mapStartView.frame)
        self.mapView?.delegate = self
        self.mapView?.setApiKey(apiKey)
        mapStartView.addSubview(self.mapView!)
    }
    //MARK: findRoute
    func setRoute(){
        let pathData = TMapPathData()
        let startPoint = CLLocationCoordinate2D(latitude: 37.723867, longitude: 127.059322)
        let endPoint = CLLocationCoordinate2D(latitude: 37.403049, longitude: 127.103318)

        pathData.findPathData(startPoint: startPoint, endPoint: endPoint) { (result, error)->Void in
                    if let polyline = result {
                        DispatchQueue.main.async {
                            let marker1 = TMapMarker(position: startPoint)
                                              marker1.map = self.mapView
                                              marker1.title = "출발지"
                                              self.markers.append(marker1)
                            
                                              let marker2 = TMapMarker(position: endPoint)
                                              marker2.map = self.mapView
                            marker2.title = "목적지"
                                              self.markers.append(marker2)

                                              polyline.map = self.mapView
                                              self.polylines.append(polyline)
                                              self.mapView?.fitMapBoundsWithPolylines(self.polylines)
                                          }
                                      }
                          }

                                              
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMap()
        setRoute()
    }
    @IBAction func reduceButtonClicked(_ sender: Any) {
        var zoom: Int =  self.mapView?.getZoom() ?? 0
        zoom = zoom - 1
        self.mapView?.setZoom(zoom)
        print("zoom:\(zoom)")
    }
    @IBAction func zoomButtonClicked(_ sender: Any) {
        var zoom: Int = self.mapView?.getZoom() ?? 0
        zoom = zoom + 1
        self.mapView?.setZoom(zoom)
        print("zoom:\(zoom)")
    }
    @IBAction func routeSearchButtonClicked(_ sender: Any) {
        setRoute()
    }
    
}
