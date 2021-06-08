//
//  ExerciseInfo.swift
//  VigorV2
//
//  Created by Dewone Westerfield on 6/6/21.
//

import Foundation

class Fitness: Identifiable{
    enum `Type` : String{
        case dumbbellDragCurl = "dumbbellDragCurl"; //1
        case dumbbellWaiterCurl = "dumbbellWaiterCurl";//2
        case closeGripBenchPress = "closeGripBenchPress";//3
        case offsetGripRopePushDown = "offsetGripRopePushDown";//4
        case crossBodyHammerCurls = "crossBodyHammerCurls"; //5
        case lyingTricepExtension = "lyingTricepExtension"; //6
        case dumbbellOverHeadExtension = "dumbbellOverHeadExtension"; //7
        case cableFacePulls = "cableFacePulls"; //8
        case lateralRaise = "lateralRaise"; //9
        case inclineDumbbellBenchPress = "inclineDumbbellBenchPress"; //10
        case horizontalCableCrossOver = "horizontalCableCrossOver"; //11
        case straightArmPushDown = "straightArmPushDown"; //12
        case deadLift = "deadLift"; //13
    }
    var name: String;
    var type: Type;
    var exerciseTarget: String;
    var longDescription: String;
    var imageRef: String;
    init(name:String,type:Type,exerciseTarget:String,longDescription:String,imageRef:String){
        self.name = name;
        self.type = type;
        self.exerciseTarget = exerciseTarget;
        self.longDescription = longDescription;
        self.imageRef = imageRef;
    }
}
/*
 let exercises = [
     Fitness(name: "Dumb Bell Drag Curl", type: .dumbbellDragCurl, exerciseTarget: "Biceps(Long Head)", longDescription: "The dumbbell drag curl is a variation of the dumbbell curl and is used to build bicep muscles. The dumbbell drag curl is a unique bicep curl variation in that you don’t completely bring the weight in front of your body, thus you have a more difficult time swinging and using momentum to get the weight up. Instructions: Select the desired weight from the rack and assume a shoulder width stance. Using a supinated (palms up) grip, take a deep breath and curl the dumbbells directly up the front of your body. The elbows will actually drift behind the body as you try to keep the weight as close to your body as possible. Once the biceps are fully shortened, slowly lower the weight back to the starting position. Repeat for the desired number of repetitions.", imageRef: <#T##String#>)
 ]
 */


