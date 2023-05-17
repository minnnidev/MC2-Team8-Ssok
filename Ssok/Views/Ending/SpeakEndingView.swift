//
//  SpeakEndingView.swift
//  Ssok
//
//  Created by 김용주 on 2023/05/14.
//

import SwiftUI

struct SpeakEndingView: View {
    
    @State var next = false
    @State var wheresentence: String = ""
    @State var whatsentence: String = ""
    
    @EnvironmentObject var random: RandomMember
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @State var missionTitle: String
    @State var missionTip: String
    @State var missionColor: Color
    @State var goal: String
    @State var timer: Double
    @Binding var st: Bool
    
    
    var body: some View {
        ZStack{
            ZStack(alignment: .top) {
                Image("endingtop").resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: wid).position(x:wid/2, y:190)
                HStack {
                    Spacer()
                    HStack {
                        Image("retry")
                        Text("다시뽑기")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(.white)
                    }
                    .onTapGesture {
                        random.randomWho = setRandomMember(random.members)
                        random.randomWhat = setRandomMission(missions)
                        random.randomWhere = setRandomWhere(whereList)
                        st = false
                    }
                    .padding(.trailing, 20)
                    .padding(.top, 56)
                    
                }
            }
            
            ZStack{
                Text(random.randomWho)
                    .font(.system(size: 20, weight: .bold))
                    .rotationEffect(Angle(degrees: -30))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.1)
                    .frame(width: 75, height: 75)
                    .lineLimit(2)
                    .position(x:wid/2.9, y:210)
                
                Text(random.randomWhere)
                    .font(.system(size: 20, weight: .bold))
                    .rotationEffect(Angle(degrees: -30))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.1)
                    .frame(width: 75, height: 75)
                    .lineLimit(2)
                    .position(x:wid/1.81, y:210)
                
                Text(String(random.randomWhat.missionTitle.dropLast(2)))
                    .font(.system(size: 20, weight: .bold))
                    .rotationEffect(Angle(degrees: -30))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.1)
                    .frame(width: 75, height: 75)
                    .lineLimit(2)
                    .position(x:wid/1.155, y:210)
            }
            ZStack{
                Circle()
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
                    .shadow(color: Color("Bg_bottom2"), radius: 2)
                Text("📖")
                    .frame(width: 50, height: 50)
            }
            
            VStack(spacing: 8){
                Text("따라 읽기")
                    .font(.system(size: 24, weight: .black))
                
                Text("주어진 문장을 정확하게 따라 읽어서 인식시켜요")
                    .font(.system(size:13, weight: .light))
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .strokeBorder(Color("Border"), lineWidth: 1.5)
                        .frame(width: 295, height: 175)
                    
                    Text("미션 성공 TIP")
                        .font(.system(size: 20, weight: .black))
                        .foregroundColor(Color("Bg_bottom2"))
                    
                    VStack(spacing: 50){
                        MissionTitleView(missionTitle: missionTitle, backgroundColor: missionColor.opacity(0.35), borderColor: missionColor.opacity(0.71))
                        
                        Text(missionTip)
                            .font(.system(size: 13, weight: .medium))
                            .multilineTextAlignment(.center)
                    }
                }.offset(y:32)
            }.offset(y:150)
            
            NavigationLink(destination: MissionSpeechView(missionTitle: missionTitle, missionTip: missionTip, missionColor: missionColor, answerText: goal, speechTime: timer, st: $st)) {
                Text("미션하기").foregroundColor(.white)
                    .fontWeight(.bold)
                    .frame(maxWidth: 350, maxHeight: 50, alignment: .center)
                    .background(Color("Bg_bottom2"))
                    .cornerRadius(12)
            }.position(x:wid/2, y:hei-59)
        }
        .ignoresSafeArea(.all)
        .navigationBarHidden(true)
        
    }
}
//
//struct SpeakEndingView_Previews: PreviewProvider {
//    static let random = RandomMember()
//
//    static var previews: some View {
//        SpeakEndingView(missionTitle: "소리 지르기 💥", missionTip: "장소로 이동해서 미션하기 버튼을 누르고\n주어진 문장을 읽을 준비 후 말하기 버튼을 눌러\n시간 안에 크고 정확하게 따라 읽어요!", missionColor: Color("MissionOrange"), goal: "간장공장장", timer: 10)
//            .environmentObject(random)
//    }
//}
//
