//
//  FoldingCellTableViewController.swift
//  Budget Up
//
//  Created by Lena Ngungu on 7/29/17.
//  Copyright © 2017 Lena Ngungu. All rights reserved.
//

import UIKit
import FoldingCell

fileprivate struct C {
    struct CellHeight {
        static let close: CGFloat = 100// equal or greater foregroundView height
        static let open: CGFloat = 500 // equal or greater containerView height
    }
}

class FoldingCellTableViewController: UITableViewController {
    
    var kCloseCellHeight: CGFloat = 100
    var kOpenCellHeight: CGFloat = 456
 //   @IBOutlet var FoldingTableView: UITableView!
    
 // var cellHeights = (0..< CELLCOUNT).map { _ in C.CellHeight.close }
  
    var cellHeights = (0..<10).map{_ in C.CellHeight.close}
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeights[indexPath.row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard case let cell as FoldingCell = tableView.cellForRow(at: indexPath) else {
            return
        }
    
    var duration = 0.0
    if cellHeights[indexPath.row] == kCloseCellHeight { // open cell
        cellHeights[indexPath.row] = kOpenCellHeight
        cell.unfold(true, animated: true, completion: nil)
 
        duration = 0.5
    } else {// close cell
        cellHeights[indexPath.row] = kCloseCellHeight
        cell.unfold(false, animated: true, completion: nil)
        duration = 1.1
    }
    
    UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: { _ in
        tableView.beginUpdates()
        tableView.endUpdates()
    }, completion: nil)

    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if case let cell as FoldingCell = cell {
            if cellHeights[indexPath.row] == C.CellHeight.close {
                cell.unfold(false, animated: false, completion: nil)
            } else {
                cell.unfold(true, animated: false, completion: nil)
            }
        }
    }
    
    
   

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoldingCell", for: indexPath) as! FoldingCell
        
        return cell
    }
    
  
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }

 

}
