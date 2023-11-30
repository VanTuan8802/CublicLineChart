//
//  ViewController.swift
//  CublicLineChart
//
//  Created by VanTuan on 29/11/2023.
//

import UIKit
import Charts
import TinyConstraints

class ViewController: UIViewController, ChartViewDelegate {
    
    //Create 1 LineChartView
    lazy var lineChartView: LineChartView = {
        let chartView = LineChartView()
        chartView.backgroundColor = .black
        
        //Don't show right Axis
        chartView.rightAxis.enabled = false

        //Set up LeftAxis y
        chartView.leftAxis.labelFont = .boldSystemFont(ofSize: 12 )
        chartView.leftAxis.setLabelCount(10, force: false)
        chartView.leftAxis.labelTextColor = .white
//        chartView.leftAxis.axisLineColor = UIColor(red: 0.46, green: 0.21, blue: 1.00, alpha: 1.00)
        chartView.leftAxis.labelPosition = .outsideChart //Set value outside between Chart
        chartView.leftAxis.drawGridLinesEnabled = false // Don't show horizontal line
        
        //Set up xAxis
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.labelFont = .boldSystemFont(ofSize: 7)
        chartView.xAxis.setLabelCount(7, force: false)
        chartView.xAxis.labelTextColor = .white
        chartView.xAxis.drawGridLinesEnabled = false // Don't show horizontal line
        
        //Add animatiom
        chartView.animate(xAxisDuration: 1.0)
        
        return chartView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.16, green: 0.17, blue: 0.18, alpha: 1.00)
        
        view.addSubview(lineChartView)
        
        lineChartView.centerInSuperview()
        lineChartView.width(to: view)
        lineChartView.heightToWidth(of: view)
        
        setData()
    }
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }
    
    func setData(){
        let set1 = LineChartDataSet(entries: dataValue, label: "")
        
        set1.mode = .cubicBezier
        set1.drawCirclesEnabled = false
        set1.lineWidth = 2
        set1.setColor(UIColor(red: 0.46, green: 0.21, blue: 1.00, alpha: 1.00))
        
        //Add gradient
        let gradientColors = [UIColor(red: 0.46, green: 0.21, blue: 1.00, alpha: 1.00).cgColor,
                              UIColor(red: 0.46, green: 0.21, blue: 1.00, alpha: 0.00).cgColor] as CFArray // Colors of the gradient
        let colorLocations:[CGFloat] = [0.5, 1.0] // Positioning of the gradient
        let gradient = CGGradient.init(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: gradientColors, locations: colorLocations) // Gradient Object
        set1.fill = RadialGradientFill(gradient: gradient!)
        set1.drawFilledEnabled = true
        
        let data = LineChartData(dataSet: set1)
        data.setDrawValues(false)
        lineChartView.data = data
    }
    
    //Create fake data
    let dataValue: [ChartDataEntry] = [
        ChartDataEntry(x: 0.0, y: 4.0),
        ChartDataEntry(x: 1.0, y: 2.0),
        ChartDataEntry(x: 2.0, y: 0.0),
        ChartDataEntry(x: 3.0, y: 6.0),
        ChartDataEntry(x: 4.0, y: 3.0),
        ChartDataEntry(x: 5.0, y: 8.0),
        ChartDataEntry(x: 6.0, y: 9.0),
        ChartDataEntry(x: 7.0, y: 1.0),
        ChartDataEntry(x: 8.0, y: 2.0),
        ChartDataEntry(x: 9.0, y: 4.0),
        ChartDataEntry(x: 10.0, y: 5.0),
        ChartDataEntry(x: 11.0, y: 7.0),
        ChartDataEntry(x: 12.0, y: 3.0),
        ChartDataEntry(x: 13.0, y: 1.0),
        ChartDataEntry(x: 14.0, y: 2.0),
        ChartDataEntry(x: 15.0, y: 8.0)
    ]
    
}

