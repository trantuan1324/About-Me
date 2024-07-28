//
//  File.swift
//  About-me
//
//  Created by Trần Quang Tuấn on 28/7/24.
//

import Foundation

struct Member {
    let fullName: String
    let job: String
    let hobbies: [String]
    let image: String
    
    init(fullName: String, job: String, hobbies: [String], image: String) {
        self.fullName = fullName
        self.job = job
        self.hobbies = hobbies
        self.image = image
    }
}

class MemberList {
    static let memberInFam = [
        Member(fullName: "Bố: Trần Kim Cương", job: "Giáo viên (về hưu)", hobbies: ["Đọc sách", "Bonsai"], image: "dad"),
        Member(fullName: "Mẹ: Đỗ Thị Chinh", job: "Giáo viên", hobbies: ["Tám chuyện", "Aerobic"], image: "mom"),
        Member(fullName: "Sữa", job: "Thất nghiệp", hobbies: ["Ngủ", "Đi bụi"], image: "milk"),
        Member(fullName: "Bít", job: "Ăn bám", hobbies: ["Báo nhà", "Trêu Sữa"], image: "bit")
    ]
}
