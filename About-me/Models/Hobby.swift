//
//  Hobby.swift
//  About-me
//
//  Created by Trần Quang Tuấn on 29/7/24.
//

import Foundation

struct Hobby {
    let title: String
    let description: String
    let action: String
    let image: String
    
    init(title: String, description: String, action: String, image: String) {
        self.title = title
        self.description = description
        self.action = action
        self.image = image
    }
}

class HobbyList {
    static let hobbies = [
        Hobby(
            title: "Thiên văn",
            description: "Thiên văn hông chỉ đơn thuần là quan sát những vì sao lấp lánh trên bầu trời đêm, mà còn là hành trình đi tìm lời giải đáp cho những câu hỏi lớn về nguồn gốc vũ trụ, sự hình thành các thiên hà. Bất cứ ai, dù là trẻ em hay người lớn, đều có thể chiêm ngưỡng vẻ đẹp của bầu trời đêm và cảm nhận sự nhỏ bé của con người trước vũ trụ rộng lớn.",
            action: "Khám phá",
            image: "universe"
        ),
        Hobby(
            title: "Âm nhạc",
            description: "Trong cuộc sống hối hả, âm nhạc như một liều thuốc tinh thần giúp xoa dịu tâm hồn mệt mỏi. Những giai điệu nhẹ nhàng có thể đưa con người vào trạng thái thư giãn, giảm stress và lo âu. Âm nhạc kết nối con người, tạo nên sự đồng cảm và sẻ chia.",
            action: "Các bài hát yêu thích",
            image: "music"
        ),
        Hobby(
            title: "Đồ ăn",
            description: "Thức ăn không chỉ đơn thuần là nguồn cung cấp năng lượng cho cơ thể hoạt động mà còn có ảnh hưởng sâu sắc đến sức khỏe thể chất và tinh thần của con người. Một chế độ ăn uống cân bằng và lành mạnh là nền tảng cho một cơ thể khỏe mạnh, giúp phòng ngừa bệnh tật",
            action: "Chi tiết",
            image: "food"
        ),
    ]
}
