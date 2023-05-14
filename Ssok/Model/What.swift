//
//  What.swift
//  6Bubbles
//
//  Created by 235 on 2023/05/06.
//

import Foundation
import SwiftUI

enum MissionType {
    case decibel, shake, voice, face
}

protocol MissionProtocol {
    var missionType: MissionType { get }
    var title: String { get }
    var description: String { get }
    var mainColor: Color { get }
}

struct DecibelMission: MissionProtocol {
    let missionType: MissionType
    let title: String
    let description: String
    let mainColor: Color
    let goalDecibel: Float
}

struct PedoMeterMission: MissionProtocol {
    let missionType: MissionType
    let title: String
    let description: String
    let mainColor: Color
    let goalShaking: Float
}

struct VoiceMission: MissionProtocol {
    let missionType: MissionType
    let title: String
    let description: String
    let mainColor: Color
    let sentence: String
    let timer: Double
}

struct FaceMission: MissionProtocol {
    let missionType: MissionType
    let title: String
    let description: String
    let mainColor: Color
    let smileRight: Float
    let smileLeft: Float
    let blinkLeft: Float
    let blinkRight: Float
}

let missions: [MissionProtocol] = [
    DecibelMission(missionType: .decibel, title: "소리 지르기", description: "장소로 이동해서 미션하기 버튼을 누르고\n소리를 질러 목표 데시벨을 채우세요", mainColor: .orange, goalDecibel: "100"),
    DecibelMission(missionType: .decibel, title: "콧바람 장풍 불기", description: "장소로 이동해서 미션하기 버튼을 누르고\n콧바람을 불어서 목표 데시벨을 채우세요", mainColor: .yellow, goalDecibel: "100"),
    DecibelMission(missionType: .decibel, title: "크게 노래 부르기", description: "장소로 이동해서 미션하기 버튼을 누르고\n콧바람을 불어서 목표 데시벨을 채우세요", mainColor: .pink, goalDecibel: "100"),
    PedoMeterMission(missionType: .shake, title: "춤추기", description: "장소로 이동해서 미션하기 버튼을 누르고\n자신있는 춤을 열심히 춰서 진동 횟수를 채워요!", mainColor: .purple, goalShaking: "100"),
    VoiceMission(missionType: .voice, title: "혀놀리기", description: "장소로 이동해서 미션하기 버튼을 누르고\n주어진 문장을 읽을 준비 후 말하기 버튼을 눌러\n시간 안에 크고 정확하게 따라 읽어요!", mainColor: .blue, sentence: "간장공장공장장", timer: 5.0),
    VoiceMission(missionType: .voice, title: "혀놀리기", description: "장소로 이동해서 미션하기 버튼을 누르고\n주어진 문장을 읽을 준비 후 말하기 버튼을 눌러\n시간 안에 크고 정확하게 따라 읽어요!", mainColor: .blue, sentence: "들의 콩깍지는 깐 콩깍지인가 안 깐 콩깍지인가", timer: 10.0),
    VoiceMission(missionType: .voice, title: "영국 신사 되기", description: "장소로 이동해서 미션하기 버튼을 누르고\n주어진 문장을 읽을 준비 후 말하기 버튼을 눌러\n영국 발음으로 읽어야만 성공할 수 있어요!", mainColor: .blue, sentence: "Can i get a bottle of water?", timer: 10.0),
    FaceMission(missionType: .face, title: "플러팅하기", description: "장소를 이동해서 미션하기 버튼을 누르고\n얼굴을 인식시켜 미션 완료까지 두 눈을 윙크하세요!", mainColor: .green, smileRight: 0, smileLeft: 0, blinkLeft: 0, blinkRight: 0)
]
