//
//  ChatListCollectionViewCell.swift
//  ChatList
//
//  Created by joonwon lee on 2022/04/24.
//

import UIKit

class ChatListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var chatLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    //썸네일의 사각형 image를 둥그렇게 해라
    //awakefromNib 함수는 실제로 사용전에 스토리보드에서 꺼내올 때 불린 함수
    override func awakeFromNib() {
        super.awakeFromNib()
        thumbnail.layer.cornerRadius = 10
    }
    
    func configure(_ chat: Chat) {
        thumbnail.image = UIImage(named: chat.name)
        nameLabel.text = chat.name
        chatLabel.text = chat.chat
        dateLabel.text = formattedDateString(dateString: chat.date)
    }
    
    //날짜 짧게 나오도록 변경하기 위한 코드
    func formattedDateString(dateString: String) -> String {
        // String -> Date -> String
        // 2022-04-01 > 4/1
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        // 1) 문자열 String -> date
        if let date = formatter.date(from: dateString) {
            formatter.dateFormat = "M/d"
        // 2) date -> String
            return formatter.string(from: date)
        } else {
            return ""
        }
    }
    
}
