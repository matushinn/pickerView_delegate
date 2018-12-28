//
//  ViewController.swift
//  pickerView_delegate
//
//  Created by 大江祥太郎 on 2018/12/28.
//  Copyright © 2018年 shotaro. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak var myPickerView: UIPickerView!
    //コンポーネントを表示する項目名
    let comps = [["月","火","水","木","金","土","日"],["早朝","午前中","昼間","夜間"]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myPickerView.delegate = self
        myPickerView.dataSource = self
    }
    //pickerViewのコンポーネントの個数を返す
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return comps.count
    }
    //各コンポーネントの行数を返す
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let compo = comps[component]
        return compo.count
    }
    //各コンポーネントの横幅を返す
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        if component == 0{
            //月から金
            return 50
        }else{
            //時間帯
            return 100
        }
    }
    
    //指定のコンポーネント、行の項目名を返す
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //指定のコンポーネントから指定行の項目名を取り出す
        let item = comps[component][row]
        return item
    }
    
    //ドラムが回転して選ばれた
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //選ばれた項目名
        let item = comps[component][row]
        print("\(item)が選ばれた")
        
        //現在選択されている行番号
        let row1 = pickerView.selectedRow(inComponent: 0)
        let row2 = pickerView.selectedRow(inComponent: 1)
        print("現在選択されている行番号\(row1,row2)")
        
        //現在選択している項目名
        let item1 = self.pickerView(pickerView, titleForRow: row1, forComponent: 0)
        let item2 = self.pickerView(pickerView, titleForRow: row2, forComponent: 1)
        
        print("現在選択されている項目名\(item1,item2)")
    }
}

