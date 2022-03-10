//
//  ViewController.swift
//  Meghana_pratical
//
//  Created by Meghna on 12/08/21.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var NewsTableview: UITableView!
    var timeline_title = "", just_date = "", time = "" , reporterName = "" ,reporterCity = "", slug = "" , before_description = "" ,before_image = "" ,after_description = "" ,after_image = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        JSONDATA()
        
        NewsTableview.delegate = self
        NewsTableview.delegate = self
        
        NewsTableview.tableFooterView = UIView()
        self.NewsTableview.rowHeight = UITableView.automaticDimension
        
        self.NewsTableview.setNeedsLayout()
        self.NewsTableview.layoutIfNeeded()
    }
    func JSONDATA(){
        let jsonString = "{\"Status\":true,\"StatusMessage\":\"Daily Timeline Listing Successfully\",\"Result\":[{\"question_answer_array\":[],\"company_logo_color\":\"\",\"captured_data_from\":\"\",\"box_heading\":\"\",\"box_color\":\"\",\"bullets\":[],\"type\":\"before_and_after\",\"timeline_id\":451,\"timeline_title\":\"Railway ministry shares pictures of Gandhinagar railway station before and after revamp: All you nee\",\"just_date\":\"2021-07-17\",\"time\":\"05:00:00\",\"is_show_disclaimer\":0,\"courtesy_line\":\"Deepak Patidar\",\"is_show_logo_on_top\":1,\"photo_crediter_name\":\"\",\"is_show_red_color_line\":0,\"reporterName\":\"Yogesh Rewani\",\"reporterCity\":\"Ahmedabad\",\"isHeaderBlinkingDot\":0,\"headerBlinkingColor\":\"\",\"emojiHtmlCode\":\"\",\"emoji\":\"\",\"pintab\":null,\"slug\":\"Gandhinagar\",\"audioFile\":null,\"description\":\"<ul><li>From a luxury hotel to an interfaith prayer hall and an external facade with changing theme-based lighting, here is all you need to know about the facilities at the Gandhinagar Capital railway station<\\/li><li>The railway station has many first to its name, the main attraction being a five-star hotel being constructed in a railway station which is a first of it kind by the Indian Railways.<\\/li><\\/ul>\",\"URL\":\"https:\\/\\/dcrm.testingbeta.in\\/images\\/just_in_timeline\\/7b1a10dd808b19d6add5bfbbb58e6c6d.png\",\"justinDescription\":[],\"photoAlbumArray\":[],\"story_by_name\":\"admin\",\"approved_by_name\":\"admin\",\"big_headlines_theme_color\":\"\",\"stoke_up\":[],\"Poll\":[],\"advertisement\":[],\"stock_price_detail\":[],\"heading_with_two_photo_second_image\":null,\"after_heading\":\"Before\",\"before_heading\":\"After\",\"after_description\":\"<ul><li>The Union ministry of Railways on Thursday shared images of the Gandhinagar Capital railway station in Gujarat before and after its redevelopment. The visuals shared by the ministry showed ticket booking counters of the station before and after their transformation.<\\/li><li>The luxury hotel, having 318 rooms and to be operated by a private entity, is spread across 7,400 square meters and has been built at a cost of \\u20b9790 crore, said the release.<\\/li><\\/ul>\",\"after_image\":\"https:\\/\\/dcrm.testingbeta.in\\/images\\/just_in_timeline\\/797ee3606843a16cc637c487b42b6ce6.png\",\"name\":\"\",\"email\":\"\",\"designation\":\"\",\"address\":\"\",\"contact_no\":\"\",\"location\":\"\",\"website\":\"\",\"credit_logo\":null,\"headlineColorArray\":[],\"threadBugArray\":[],\"threadDescriptionArray\":[],\"story_upload\":[]}]}"


        let dict = jsonString.toJSON() as? [String:AnyObject]
        let result = dict!["Result"]
        if let rawArray = result as? NSArray,
           let castArray = rawArray as? Array< Dictionary< String, AnyObject > >
           {
            for cast_array in castArray
            {
                timeline_title = cast_array["timeline_title"] as? String ?? ""
                just_date = cast_array["just_date"] as? String ?? ""
                time = cast_array["time"] as? String ?? ""
                reporterName = cast_array["reporterName"] as? String ?? ""
                reporterCity = cast_array["reporterCity"]as? String ?? ""
                slug = cast_array["slug"] as? String ?? ""
                before_description = cast_array["description"] as? String ?? ""
                before_image = cast_array["URL"] as? String ?? ""
                after_description = cast_array["after_description"] as? String ?? ""
                after_image = cast_array["after_image"] as? String ?? ""
            }
           }
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
                let cell = NewsTableview.dequeueReusableCell(withIdentifier: "SlugnameCell") as! SlugnameCell
            cell.Sulg_nm_lbl.text = slug
                return cell
            } else if indexPath.row == 1 {
                let cell = NewsTableview.dequeueReusableCell(withIdentifier: "TimelineTitleCell") as! TimelineTitleCell
                cell.Timeline_title_lbl.text = timeline_title
                return cell
            } else if  indexPath.row == 2{
                let cell = NewsTableview.dequeueReusableCell(withIdentifier: "RepoterNameCell") as! RepoterNameCell
                cell.Repoter_nm_lbl.text = reporterName + " , " + reporterCity
                cell.Date_lbl.text = just_date + " , " + time
                return cell
            }
            else {
                let cell = NewsTableview.dequeueReusableCell(withIdentifier: "DetailCell") as! DetailCell
                cell.Before_img.downloaded(from: before_image)
                cell.Before_lbl.attributedText = before_description.convertToAttributedString()
                cell.Before_lbl.attributedText?.size()
                cell.After_lbl.attributedText = after_description.convertToAttributedString()

                cell.After_img.downloaded(from: after_image)

                return cell
            }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0
        {
            return 50
        }
        else if indexPath.row == 1
        {
            return 95
        }
        else if indexPath.row == 2
        {
            return 70
        }
        else {
            return NewsTableview.frame.size.height - 50 - 95 - 70 + 200
        }

    }
}

extension String {
    func toJSON() -> Any? {
        guard let data = self.data(using: .utf8, allowLossyConversion: false) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    }
    var htmlToAttributedString: NSAttributedString? {
           guard let data = data(using: .utf8) else { return nil }
           do {
               return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
           } catch {
               return nil
           }
       }
       var htmlToString: String {
           return htmlToAttributedString?.string ?? ""
       }
    func convertToAttributedString() -> NSAttributedString? {
        let modifiedFontString = "<span style=\"font-family: Lato-Regular; font-size: 20; color: rgb(60, 60, 60)\">" + self + "</span>"
        return modifiedFontString.htmlToAttributedString
    }
}
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}


    
    
    
