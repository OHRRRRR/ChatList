//
//  ChatListViewController.swift
//  ChatList
//
//  Created by joonwon lee on 2022/04/24.
//

import UIKit

class ChatListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    // Data, presentation, layout
    
    var chatList: [Chat] = Chat.list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Data, Presentaion, Layout
        
        //data와 presentation을 담당할 사람 = self
        collectionView.dataSource = self
        collectionView.delegate = self
        //layout 담당할 사람 = self
        //위임당하는 객체 = self = ChatListViewController
        
        //채팅창 날짜 내림차순으로 배열함
        //앞 뒤로 두개씩 비교해서 조건에 참이되게 배열해라 1,4,5,2 -> 5,4,2,1
        chatList = chatList.sorted(by: { chat1, chat2 in
            return chat1.date > chat2.date
        })
    }
}
//ChatListViewController는 UICollectionViewDataSource에 대한 정의,규칙들을 준수하겠다
extension ChatListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chatList.count
    } //collectionView에 포함된 item개수 알려줘야함
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChatListCollectionViewCell", for: indexPath) as? ChatListCollectionViewCell else {
            return UICollectionViewCell()
        } //presentation 셀을 어떻게 표현할지 알려줘야함
        
        let chat = chatList[indexPath.item]
        cell.configure(chat)
        return cell
    }
}

//ChatListViewController가 FlowLayout에 대한 위임을 받을 것이다
extension ChatListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 100)
    }
}
