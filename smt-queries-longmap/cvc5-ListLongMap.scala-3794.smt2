; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52058 () Bool)

(assert start!52058)

(declare-fun b!568461 () Bool)

(declare-fun res!358664 () Bool)

(declare-fun e!327089 () Bool)

(assert (=> b!568461 (=> (not res!358664) (not e!327089))))

(declare-datatypes ((array!35638 0))(
  ( (array!35639 (arr!17112 (Array (_ BitVec 32) (_ BitVec 64))) (size!17476 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35638)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!568461 (= res!358664 (validKeyInArray!0 (select (arr!17112 a!3118) j!142)))))

(declare-fun b!568463 () Bool)

(declare-fun res!358663 () Bool)

(assert (=> b!568463 (=> (not res!358663) (not e!327089))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35638 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!568463 (= res!358663 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!568464 () Bool)

(declare-fun res!358666 () Bool)

(assert (=> b!568464 (=> (not res!358666) (not e!327089))))

(assert (=> b!568464 (= res!358666 (validKeyInArray!0 k!1914))))

(declare-fun b!568465 () Bool)

(declare-fun e!327088 () Bool)

(assert (=> b!568465 (= e!327089 e!327088)))

(declare-fun res!358668 () Bool)

(assert (=> b!568465 (=> (not res!358668) (not e!327088))))

(declare-datatypes ((SeekEntryResult!5561 0))(
  ( (MissingZero!5561 (index!24471 (_ BitVec 32))) (Found!5561 (index!24472 (_ BitVec 32))) (Intermediate!5561 (undefined!6373 Bool) (index!24473 (_ BitVec 32)) (x!53350 (_ BitVec 32))) (Undefined!5561) (MissingVacant!5561 (index!24474 (_ BitVec 32))) )
))
(declare-fun lt!258956 () SeekEntryResult!5561)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!568465 (= res!358668 (or (= lt!258956 (MissingZero!5561 i!1132)) (= lt!258956 (MissingVacant!5561 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35638 (_ BitVec 32)) SeekEntryResult!5561)

(assert (=> b!568465 (= lt!258956 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!568466 () Bool)

(declare-fun e!327090 () Bool)

(assert (=> b!568466 (= e!327088 e!327090)))

(declare-fun res!358669 () Bool)

(assert (=> b!568466 (=> (not res!358669) (not e!327090))))

(declare-fun lt!258959 () (_ BitVec 32))

(declare-fun lt!258958 () SeekEntryResult!5561)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35638 (_ BitVec 32)) SeekEntryResult!5561)

(assert (=> b!568466 (= res!358669 (= lt!258958 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258959 (select (store (arr!17112 a!3118) i!1132 k!1914) j!142) (array!35639 (store (arr!17112 a!3118) i!1132 k!1914) (size!17476 a!3118)) mask!3119)))))

(declare-fun lt!258957 () (_ BitVec 32))

(assert (=> b!568466 (= lt!258958 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258957 (select (arr!17112 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!568466 (= lt!258959 (toIndex!0 (select (store (arr!17112 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!568466 (= lt!258957 (toIndex!0 (select (arr!17112 a!3118) j!142) mask!3119))))

(declare-fun b!568467 () Bool)

(declare-fun lt!258961 () SeekEntryResult!5561)

(assert (=> b!568467 (= e!327090 (not (or (not (is-Intermediate!5561 lt!258958)) (undefined!6373 lt!258958) (= (select (arr!17112 a!3118) (index!24473 lt!258958)) (select (arr!17112 a!3118) j!142)) (not (= (select (arr!17112 a!3118) (index!24473 lt!258958)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!258961 (MissingZero!5561 (index!24473 lt!258958))))))))

(assert (=> b!568467 (= lt!258961 (Found!5561 j!142))))

(assert (=> b!568467 (= lt!258961 (seekEntryOrOpen!0 (select (arr!17112 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35638 (_ BitVec 32)) Bool)

(assert (=> b!568467 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17824 0))(
  ( (Unit!17825) )
))
(declare-fun lt!258960 () Unit!17824)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35638 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17824)

(assert (=> b!568467 (= lt!258960 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!568468 () Bool)

(declare-fun res!358670 () Bool)

(assert (=> b!568468 (=> (not res!358670) (not e!327089))))

(assert (=> b!568468 (= res!358670 (and (= (size!17476 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17476 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17476 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!568469 () Bool)

(declare-fun res!358667 () Bool)

(assert (=> b!568469 (=> (not res!358667) (not e!327088))))

(declare-datatypes ((List!11192 0))(
  ( (Nil!11189) (Cons!11188 (h!12206 (_ BitVec 64)) (t!17420 List!11192)) )
))
(declare-fun arrayNoDuplicates!0 (array!35638 (_ BitVec 32) List!11192) Bool)

(assert (=> b!568469 (= res!358667 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11189))))

(declare-fun res!358665 () Bool)

(assert (=> start!52058 (=> (not res!358665) (not e!327089))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52058 (= res!358665 (validMask!0 mask!3119))))

(assert (=> start!52058 e!327089))

(assert (=> start!52058 true))

(declare-fun array_inv!12908 (array!35638) Bool)

(assert (=> start!52058 (array_inv!12908 a!3118)))

(declare-fun b!568462 () Bool)

(declare-fun res!358662 () Bool)

(assert (=> b!568462 (=> (not res!358662) (not e!327088))))

(assert (=> b!568462 (= res!358662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!52058 res!358665) b!568468))

(assert (= (and b!568468 res!358670) b!568461))

(assert (= (and b!568461 res!358664) b!568464))

(assert (= (and b!568464 res!358666) b!568463))

(assert (= (and b!568463 res!358663) b!568465))

(assert (= (and b!568465 res!358668) b!568462))

(assert (= (and b!568462 res!358662) b!568469))

(assert (= (and b!568469 res!358667) b!568466))

(assert (= (and b!568466 res!358669) b!568467))

(declare-fun m!546999 () Bool)

(assert (=> b!568469 m!546999))

(declare-fun m!547001 () Bool)

(assert (=> b!568466 m!547001))

(declare-fun m!547003 () Bool)

(assert (=> b!568466 m!547003))

(assert (=> b!568466 m!547001))

(declare-fun m!547005 () Bool)

(assert (=> b!568466 m!547005))

(declare-fun m!547007 () Bool)

(assert (=> b!568466 m!547007))

(assert (=> b!568466 m!547001))

(declare-fun m!547009 () Bool)

(assert (=> b!568466 m!547009))

(assert (=> b!568466 m!547005))

(declare-fun m!547011 () Bool)

(assert (=> b!568466 m!547011))

(assert (=> b!568466 m!547005))

(declare-fun m!547013 () Bool)

(assert (=> b!568466 m!547013))

(declare-fun m!547015 () Bool)

(assert (=> b!568464 m!547015))

(assert (=> b!568461 m!547001))

(assert (=> b!568461 m!547001))

(declare-fun m!547017 () Bool)

(assert (=> b!568461 m!547017))

(declare-fun m!547019 () Bool)

(assert (=> b!568463 m!547019))

(declare-fun m!547021 () Bool)

(assert (=> start!52058 m!547021))

(declare-fun m!547023 () Bool)

(assert (=> start!52058 m!547023))

(declare-fun m!547025 () Bool)

(assert (=> b!568465 m!547025))

(declare-fun m!547027 () Bool)

(assert (=> b!568462 m!547027))

(assert (=> b!568467 m!547001))

(declare-fun m!547029 () Bool)

(assert (=> b!568467 m!547029))

(declare-fun m!547031 () Bool)

(assert (=> b!568467 m!547031))

(declare-fun m!547033 () Bool)

(assert (=> b!568467 m!547033))

(assert (=> b!568467 m!547001))

(declare-fun m!547035 () Bool)

(assert (=> b!568467 m!547035))

(push 1)

(assert (not b!568462))

(assert (not b!568463))

(assert (not b!568464))

(assert (not b!568461))

(assert (not b!568465))

(assert (not b!568466))

(assert (not b!568467))

(assert (not start!52058))

(assert (not b!568469))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!84489 () Bool)

(assert (=> d!84489 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!568464 d!84489))

(declare-fun b!568546 () Bool)

(declare-fun e!327133 () Bool)

(declare-fun contains!2876 (List!11192 (_ BitVec 64)) Bool)

(assert (=> b!568546 (= e!327133 (contains!2876 Nil!11189 (select (arr!17112 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!568547 () Bool)

(declare-fun e!327134 () Bool)

(declare-fun call!32567 () Bool)

(assert (=> b!568547 (= e!327134 call!32567)))

(declare-fun b!568548 () Bool)

(declare-fun e!327132 () Bool)

(assert (=> b!568548 (= e!327132 e!327134)))

(declare-fun c!65258 () Bool)

(assert (=> b!568548 (= c!65258 (validKeyInArray!0 (select (arr!17112 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!568549 () Bool)

(assert (=> b!568549 (= e!327134 call!32567)))

(declare-fun d!84491 () Bool)

(declare-fun res!358739 () Bool)

(declare-fun e!327135 () Bool)

(assert (=> d!84491 (=> res!358739 e!327135)))

(assert (=> d!84491 (= res!358739 (bvsge #b00000000000000000000000000000000 (size!17476 a!3118)))))

(assert (=> d!84491 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11189) e!327135)))

(declare-fun bm!32564 () Bool)

(assert (=> bm!32564 (= call!32567 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!65258 (Cons!11188 (select (arr!17112 a!3118) #b00000000000000000000000000000000) Nil!11189) Nil!11189)))))

(declare-fun b!568550 () Bool)

(assert (=> b!568550 (= e!327135 e!327132)))

(declare-fun res!358737 () Bool)

(assert (=> b!568550 (=> (not res!358737) (not e!327132))))

(assert (=> b!568550 (= res!358737 (not e!327133))))

(declare-fun res!358738 () Bool)

(assert (=> b!568550 (=> (not res!358738) (not e!327133))))

(assert (=> b!568550 (= res!358738 (validKeyInArray!0 (select (arr!17112 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!84491 (not res!358739)) b!568550))

(assert (= (and b!568550 res!358738) b!568546))

(assert (= (and b!568550 res!358737) b!568548))

(assert (= (and b!568548 c!65258) b!568549))

(assert (= (and b!568548 (not c!65258)) b!568547))

(assert (= (or b!568549 b!568547) bm!32564))

(declare-fun m!547125 () Bool)

(assert (=> b!568546 m!547125))

(assert (=> b!568546 m!547125))

(declare-fun m!547127 () Bool)

(assert (=> b!568546 m!547127))

(assert (=> b!568548 m!547125))

(assert (=> b!568548 m!547125))

(declare-fun m!547129 () Bool)

(assert (=> b!568548 m!547129))

(assert (=> bm!32564 m!547125))

(declare-fun m!547131 () Bool)

(assert (=> bm!32564 m!547131))

(assert (=> b!568550 m!547125))

(assert (=> b!568550 m!547125))

(assert (=> b!568550 m!547129))

(assert (=> b!568469 d!84491))

(declare-fun d!84493 () Bool)

(declare-fun res!358744 () Bool)

(declare-fun e!327140 () Bool)

(assert (=> d!84493 (=> res!358744 e!327140)))

(assert (=> d!84493 (= res!358744 (= (select (arr!17112 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!84493 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!327140)))

(declare-fun b!568555 () Bool)

(declare-fun e!327141 () Bool)

(assert (=> b!568555 (= e!327140 e!327141)))

(declare-fun res!358745 () Bool)

(assert (=> b!568555 (=> (not res!358745) (not e!327141))))

(assert (=> b!568555 (= res!358745 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17476 a!3118)))))

(declare-fun b!568556 () Bool)

(assert (=> b!568556 (= e!327141 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!84493 (not res!358744)) b!568555))

(assert (= (and b!568555 res!358745) b!568556))

(assert (=> d!84493 m!547125))

(declare-fun m!547133 () Bool)

(assert (=> b!568556 m!547133))

(assert (=> b!568463 d!84493))

(declare-fun d!84499 () Bool)

(declare-fun res!358760 () Bool)

(declare-fun e!327162 () Bool)

(assert (=> d!84499 (=> res!358760 e!327162)))

(assert (=> d!84499 (= res!358760 (bvsge #b00000000000000000000000000000000 (size!17476 a!3118)))))

(assert (=> d!84499 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!327162)))

(declare-fun b!568580 () Bool)

(declare-fun e!327161 () Bool)

(declare-fun call!32573 () Bool)

(assert (=> b!568580 (= e!327161 call!32573)))

(declare-fun b!568581 () Bool)

(declare-fun e!327160 () Bool)

(assert (=> b!568581 (= e!327160 call!32573)))

(declare-fun b!568582 () Bool)

(assert (=> b!568582 (= e!327162 e!327160)))

(declare-fun c!65264 () Bool)

(assert (=> b!568582 (= c!65264 (validKeyInArray!0 (select (arr!17112 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!568583 () Bool)

(assert (=> b!568583 (= e!327160 e!327161)))

(declare-fun lt!259014 () (_ BitVec 64))

(assert (=> b!568583 (= lt!259014 (select (arr!17112 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!259015 () Unit!17824)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35638 (_ BitVec 64) (_ BitVec 32)) Unit!17824)

(assert (=> b!568583 (= lt!259015 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!259014 #b00000000000000000000000000000000))))

(assert (=> b!568583 (arrayContainsKey!0 a!3118 lt!259014 #b00000000000000000000000000000000)))

(declare-fun lt!259013 () Unit!17824)

(assert (=> b!568583 (= lt!259013 lt!259015)))

(declare-fun res!358759 () Bool)

(assert (=> b!568583 (= res!358759 (= (seekEntryOrOpen!0 (select (arr!17112 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5561 #b00000000000000000000000000000000)))))

(assert (=> b!568583 (=> (not res!358759) (not e!327161))))

(declare-fun bm!32570 () Bool)

(assert (=> bm!32570 (= call!32573 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(assert (= (and d!84499 (not res!358760)) b!568582))

(assert (= (and b!568582 c!65264) b!568583))

(assert (= (and b!568582 (not c!65264)) b!568581))

(assert (= (and b!568583 res!358759) b!568580))

(assert (= (or b!568580 b!568581) bm!32570))

(assert (=> b!568582 m!547125))

(assert (=> b!568582 m!547125))

(assert (=> b!568582 m!547129))

(assert (=> b!568583 m!547125))

(declare-fun m!547139 () Bool)

(assert (=> b!568583 m!547139))

(declare-fun m!547141 () Bool)

(assert (=> b!568583 m!547141))

(assert (=> b!568583 m!547125))

(declare-fun m!547143 () Bool)

(assert (=> b!568583 m!547143))

(declare-fun m!547145 () Bool)

(assert (=> bm!32570 m!547145))

(assert (=> b!568462 d!84499))

(declare-fun d!84505 () Bool)

(declare-fun lt!259040 () SeekEntryResult!5561)

(assert (=> d!84505 (and (or (is-Undefined!5561 lt!259040) (not (is-Found!5561 lt!259040)) (and (bvsge (index!24472 lt!259040) #b00000000000000000000000000000000) (bvslt (index!24472 lt!259040) (size!17476 a!3118)))) (or (is-Undefined!5561 lt!259040) (is-Found!5561 lt!259040) (not (is-MissingZero!5561 lt!259040)) (and (bvsge (index!24471 lt!259040) #b00000000000000000000000000000000) (bvslt (index!24471 lt!259040) (size!17476 a!3118)))) (or (is-Undefined!5561 lt!259040) (is-Found!5561 lt!259040) (is-MissingZero!5561 lt!259040) (not (is-MissingVacant!5561 lt!259040)) (and (bvsge (index!24474 lt!259040) #b00000000000000000000000000000000) (bvslt (index!24474 lt!259040) (size!17476 a!3118)))) (or (is-Undefined!5561 lt!259040) (ite (is-Found!5561 lt!259040) (= (select (arr!17112 a!3118) (index!24472 lt!259040)) (select (arr!17112 a!3118) j!142)) (ite (is-MissingZero!5561 lt!259040) (= (select (arr!17112 a!3118) (index!24471 lt!259040)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5561 lt!259040) (= (select (arr!17112 a!3118) (index!24474 lt!259040)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!327210 () SeekEntryResult!5561)

(assert (=> d!84505 (= lt!259040 e!327210)))

(declare-fun c!65296 () Bool)

(declare-fun lt!259038 () SeekEntryResult!5561)

(assert (=> d!84505 (= c!65296 (and (is-Intermediate!5561 lt!259038) (undefined!6373 lt!259038)))))

(assert (=> d!84505 (= lt!259038 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17112 a!3118) j!142) mask!3119) (select (arr!17112 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!84505 (validMask!0 mask!3119)))

(assert (=> d!84505 (= (seekEntryOrOpen!0 (select (arr!17112 a!3118) j!142) a!3118 mask!3119) lt!259040)))

(declare-fun b!568668 () Bool)

(declare-fun e!327211 () SeekEntryResult!5561)

(assert (=> b!568668 (= e!327211 (MissingZero!5561 (index!24473 lt!259038)))))

(declare-fun b!568669 () Bool)

(declare-fun e!327209 () SeekEntryResult!5561)

(assert (=> b!568669 (= e!327210 e!327209)))

(declare-fun lt!259039 () (_ BitVec 64))

(assert (=> b!568669 (= lt!259039 (select (arr!17112 a!3118) (index!24473 lt!259038)))))

(declare-fun c!65295 () Bool)

(assert (=> b!568669 (= c!65295 (= lt!259039 (select (arr!17112 a!3118) j!142)))))

(declare-fun b!568670 () Bool)

(declare-fun c!65297 () Bool)

(assert (=> b!568670 (= c!65297 (= lt!259039 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!568670 (= e!327209 e!327211)))

(declare-fun b!568671 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35638 (_ BitVec 32)) SeekEntryResult!5561)

(assert (=> b!568671 (= e!327211 (seekKeyOrZeroReturnVacant!0 (x!53350 lt!259038) (index!24473 lt!259038) (index!24473 lt!259038) (select (arr!17112 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!568672 () Bool)

(assert (=> b!568672 (= e!327209 (Found!5561 (index!24473 lt!259038)))))

(declare-fun b!568673 () Bool)

(assert (=> b!568673 (= e!327210 Undefined!5561)))

(assert (= (and d!84505 c!65296) b!568673))

(assert (= (and d!84505 (not c!65296)) b!568669))

(assert (= (and b!568669 c!65295) b!568672))

(assert (= (and b!568669 (not c!65295)) b!568670))

(assert (= (and b!568670 c!65297) b!568668))

(assert (= (and b!568670 (not c!65297)) b!568671))

(assert (=> d!84505 m!547001))

(assert (=> d!84505 m!547003))

(assert (=> d!84505 m!547003))

(assert (=> d!84505 m!547001))

(declare-fun m!547179 () Bool)

(assert (=> d!84505 m!547179))

(declare-fun m!547181 () Bool)

(assert (=> d!84505 m!547181))

(assert (=> d!84505 m!547021))

(declare-fun m!547183 () Bool)

(assert (=> d!84505 m!547183))

(declare-fun m!547185 () Bool)

(assert (=> d!84505 m!547185))

(declare-fun m!547187 () Bool)

(assert (=> b!568669 m!547187))

(assert (=> b!568671 m!547001))

(declare-fun m!547189 () Bool)

(assert (=> b!568671 m!547189))

(assert (=> b!568467 d!84505))

(declare-fun d!84515 () Bool)

(declare-fun res!358788 () Bool)

(declare-fun e!327214 () Bool)

(assert (=> d!84515 (=> res!358788 e!327214)))

(assert (=> d!84515 (= res!358788 (bvsge j!142 (size!17476 a!3118)))))

(assert (=> d!84515 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!327214)))

(declare-fun b!568674 () Bool)

(declare-fun e!327213 () Bool)

(declare-fun call!32574 () Bool)

(assert (=> b!568674 (= e!327213 call!32574)))

(declare-fun b!568675 () Bool)

(declare-fun e!327212 () Bool)

(assert (=> b!568675 (= e!327212 call!32574)))

(declare-fun b!568676 () Bool)

(assert (=> b!568676 (= e!327214 e!327212)))

(declare-fun c!65298 () Bool)

(assert (=> b!568676 (= c!65298 (validKeyInArray!0 (select (arr!17112 a!3118) j!142)))))

(declare-fun b!568677 () Bool)

(assert (=> b!568677 (= e!327212 e!327213)))

(declare-fun lt!259046 () (_ BitVec 64))

(assert (=> b!568677 (= lt!259046 (select (arr!17112 a!3118) j!142))))

(declare-fun lt!259047 () Unit!17824)

(assert (=> b!568677 (= lt!259047 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!259046 j!142))))

(assert (=> b!568677 (arrayContainsKey!0 a!3118 lt!259046 #b00000000000000000000000000000000)))

(declare-fun lt!259045 () Unit!17824)

(assert (=> b!568677 (= lt!259045 lt!259047)))

(declare-fun res!358787 () Bool)

(assert (=> b!568677 (= res!358787 (= (seekEntryOrOpen!0 (select (arr!17112 a!3118) j!142) a!3118 mask!3119) (Found!5561 j!142)))))

(assert (=> b!568677 (=> (not res!358787) (not e!327213))))

(declare-fun bm!32571 () Bool)

(assert (=> bm!32571 (= call!32574 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(assert (= (and d!84515 (not res!358788)) b!568676))

(assert (= (and b!568676 c!65298) b!568677))

(assert (= (and b!568676 (not c!65298)) b!568675))

(assert (= (and b!568677 res!358787) b!568674))

(assert (= (or b!568674 b!568675) bm!32571))

(assert (=> b!568676 m!547001))

(assert (=> b!568676 m!547001))

(assert (=> b!568676 m!547017))

(assert (=> b!568677 m!547001))

(declare-fun m!547191 () Bool)

(assert (=> b!568677 m!547191))

(declare-fun m!547193 () Bool)

(assert (=> b!568677 m!547193))

(assert (=> b!568677 m!547001))

(assert (=> b!568677 m!547035))

(declare-fun m!547195 () Bool)

(assert (=> bm!32571 m!547195))

(assert (=> b!568467 d!84515))

(declare-fun d!84521 () Bool)

(assert (=> d!84521 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!259062 () Unit!17824)

(declare-fun choose!38 (array!35638 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17824)

(assert (=> d!84521 (= lt!259062 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!84521 (validMask!0 mask!3119)))

(assert (=> d!84521 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!259062)))

(declare-fun bs!17638 () Bool)

(assert (= bs!17638 d!84521))

(assert (=> bs!17638 m!547031))

(declare-fun m!547197 () Bool)

(assert (=> bs!17638 m!547197))

(assert (=> bs!17638 m!547021))

(assert (=> b!568467 d!84521))

(declare-fun d!84527 () Bool)

(assert (=> d!84527 (= (validKeyInArray!0 (select (arr!17112 a!3118) j!142)) (and (not (= (select (arr!17112 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17112 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!568461 d!84527))

(declare-fun b!568732 () Bool)

(declare-fun lt!259086 () SeekEntryResult!5561)

(assert (=> b!568732 (and (bvsge (index!24473 lt!259086) #b00000000000000000000000000000000) (bvslt (index!24473 lt!259086) (size!17476 (array!35639 (store (arr!17112 a!3118) i!1132 k!1914) (size!17476 a!3118)))))))

(declare-fun res!358796 () Bool)

(assert (=> b!568732 (= res!358796 (= (select (arr!17112 (array!35639 (store (arr!17112 a!3118) i!1132 k!1914) (size!17476 a!3118))) (index!24473 lt!259086)) (select (store (arr!17112 a!3118) i!1132 k!1914) j!142)))))

(declare-fun e!327245 () Bool)

(assert (=> b!568732 (=> res!358796 e!327245)))

(declare-fun e!327247 () Bool)

(assert (=> b!568732 (= e!327247 e!327245)))

(declare-fun b!568733 () Bool)

(declare-fun e!327246 () SeekEntryResult!5561)

(declare-fun e!327249 () SeekEntryResult!5561)

(assert (=> b!568733 (= e!327246 e!327249)))

(declare-fun lt!259085 () (_ BitVec 64))

(declare-fun c!65324 () Bool)

(assert (=> b!568733 (= c!65324 (or (= lt!259085 (select (store (arr!17112 a!3118) i!1132 k!1914) j!142)) (= (bvadd lt!259085 lt!259085) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!568734 () Bool)

(assert (=> b!568734 (= e!327246 (Intermediate!5561 true lt!258959 #b00000000000000000000000000000000))))

(declare-fun b!568736 () Bool)

(assert (=> b!568736 (and (bvsge (index!24473 lt!259086) #b00000000000000000000000000000000) (bvslt (index!24473 lt!259086) (size!17476 (array!35639 (store (arr!17112 a!3118) i!1132 k!1914) (size!17476 a!3118)))))))

(declare-fun res!358799 () Bool)

(assert (=> b!568736 (= res!358799 (= (select (arr!17112 (array!35639 (store (arr!17112 a!3118) i!1132 k!1914) (size!17476 a!3118))) (index!24473 lt!259086)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!568736 (=> res!358799 e!327245)))

(declare-fun b!568737 () Bool)

(declare-fun e!327248 () Bool)

(assert (=> b!568737 (= e!327248 e!327247)))

(declare-fun res!358795 () Bool)

(assert (=> b!568737 (= res!358795 (and (is-Intermediate!5561 lt!259086) (not (undefined!6373 lt!259086)) (bvslt (x!53350 lt!259086) #b01111111111111111111111111111110) (bvsge (x!53350 lt!259086) #b00000000000000000000000000000000) (bvsge (x!53350 lt!259086) #b00000000000000000000000000000000)))))

(assert (=> b!568737 (=> (not res!358795) (not e!327247))))

(declare-fun b!568738 () Bool)

(assert (=> b!568738 (= e!327248 (bvsge (x!53350 lt!259086) #b01111111111111111111111111111110))))

(declare-fun b!568735 () Bool)

(assert (=> b!568735 (= e!327249 (Intermediate!5561 false lt!258959 #b00000000000000000000000000000000))))

(declare-fun d!84529 () Bool)

(assert (=> d!84529 e!327248))

(declare-fun c!65325 () Bool)

(assert (=> d!84529 (= c!65325 (and (is-Intermediate!5561 lt!259086) (undefined!6373 lt!259086)))))

(assert (=> d!84529 (= lt!259086 e!327246)))

(declare-fun c!65323 () Bool)

(assert (=> d!84529 (= c!65323 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84529 (= lt!259085 (select (arr!17112 (array!35639 (store (arr!17112 a!3118) i!1132 k!1914) (size!17476 a!3118))) lt!258959))))

(assert (=> d!84529 (validMask!0 mask!3119)))

(assert (=> d!84529 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258959 (select (store (arr!17112 a!3118) i!1132 k!1914) j!142) (array!35639 (store (arr!17112 a!3118) i!1132 k!1914) (size!17476 a!3118)) mask!3119) lt!259086)))

(declare-fun b!568739 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!568739 (= e!327249 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!258959 #b00000000000000000000000000000000 mask!3119) (select (store (arr!17112 a!3118) i!1132 k!1914) j!142) (array!35639 (store (arr!17112 a!3118) i!1132 k!1914) (size!17476 a!3118)) mask!3119))))

(declare-fun b!568741 () Bool)

(assert (=> b!568741 (and (bvsge (index!24473 lt!259086) #b00000000000000000000000000000000) (bvslt (index!24473 lt!259086) (size!17476 (array!35639 (store (arr!17112 a!3118) i!1132 k!1914) (size!17476 a!3118)))))))

(assert (=> b!568741 (= e!327245 (= (select (arr!17112 (array!35639 (store (arr!17112 a!3118) i!1132 k!1914) (size!17476 a!3118))) (index!24473 lt!259086)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!84529 c!65323) b!568734))

(assert (= (and d!84529 (not c!65323)) b!568733))

(assert (= (and b!568733 c!65324) b!568735))

(assert (= (and b!568733 (not c!65324)) b!568739))

(assert (= (and d!84529 c!65325) b!568738))

(assert (= (and d!84529 (not c!65325)) b!568737))

(assert (= (and b!568737 res!358795) b!568732))

(assert (= (and b!568732 (not res!358796)) b!568736))

(assert (= (and b!568736 (not res!358799)) b!568741))

(declare-fun m!547225 () Bool)

(assert (=> b!568741 m!547225))

(declare-fun m!547227 () Bool)

(assert (=> b!568739 m!547227))

(assert (=> b!568739 m!547227))

(assert (=> b!568739 m!547005))

(declare-fun m!547229 () Bool)

(assert (=> b!568739 m!547229))

(declare-fun m!547231 () Bool)

(assert (=> d!84529 m!547231))

(assert (=> d!84529 m!547021))

(assert (=> b!568732 m!547225))

(assert (=> b!568736 m!547225))

(assert (=> b!568466 d!84529))

(declare-fun b!568749 () Bool)

(declare-fun lt!259088 () SeekEntryResult!5561)

(assert (=> b!568749 (and (bvsge (index!24473 lt!259088) #b00000000000000000000000000000000) (bvslt (index!24473 lt!259088) (size!17476 a!3118)))))

(declare-fun res!358807 () Bool)

(assert (=> b!568749 (= res!358807 (= (select (arr!17112 a!3118) (index!24473 lt!259088)) (select (arr!17112 a!3118) j!142)))))

(declare-fun e!327256 () Bool)

(assert (=> b!568749 (=> res!358807 e!327256)))

(declare-fun e!327258 () Bool)

(assert (=> b!568749 (= e!327258 e!327256)))

(declare-fun b!568750 () Bool)

(declare-fun e!327257 () SeekEntryResult!5561)

(declare-fun e!327260 () SeekEntryResult!5561)

(assert (=> b!568750 (= e!327257 e!327260)))

(declare-fun lt!259087 () (_ BitVec 64))

(declare-fun c!65327 () Bool)

(assert (=> b!568750 (= c!65327 (or (= lt!259087 (select (arr!17112 a!3118) j!142)) (= (bvadd lt!259087 lt!259087) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!568751 () Bool)

(assert (=> b!568751 (= e!327257 (Intermediate!5561 true lt!258957 #b00000000000000000000000000000000))))

(declare-fun b!568753 () Bool)

(assert (=> b!568753 (and (bvsge (index!24473 lt!259088) #b00000000000000000000000000000000) (bvslt (index!24473 lt!259088) (size!17476 a!3118)))))

(declare-fun res!358808 () Bool)

(assert (=> b!568753 (= res!358808 (= (select (arr!17112 a!3118) (index!24473 lt!259088)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!568753 (=> res!358808 e!327256)))

(declare-fun b!568754 () Bool)

(declare-fun e!327259 () Bool)

(assert (=> b!568754 (= e!327259 e!327258)))

(declare-fun res!358806 () Bool)

(assert (=> b!568754 (= res!358806 (and (is-Intermediate!5561 lt!259088) (not (undefined!6373 lt!259088)) (bvslt (x!53350 lt!259088) #b01111111111111111111111111111110) (bvsge (x!53350 lt!259088) #b00000000000000000000000000000000) (bvsge (x!53350 lt!259088) #b00000000000000000000000000000000)))))

(assert (=> b!568754 (=> (not res!358806) (not e!327258))))

(declare-fun b!568755 () Bool)

(assert (=> b!568755 (= e!327259 (bvsge (x!53350 lt!259088) #b01111111111111111111111111111110))))

(declare-fun b!568752 () Bool)

(assert (=> b!568752 (= e!327260 (Intermediate!5561 false lt!258957 #b00000000000000000000000000000000))))

(declare-fun d!84535 () Bool)

(assert (=> d!84535 e!327259))

(declare-fun c!65328 () Bool)

(assert (=> d!84535 (= c!65328 (and (is-Intermediate!5561 lt!259088) (undefined!6373 lt!259088)))))

(assert (=> d!84535 (= lt!259088 e!327257)))

(declare-fun c!65326 () Bool)

(assert (=> d!84535 (= c!65326 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84535 (= lt!259087 (select (arr!17112 a!3118) lt!258957))))

(assert (=> d!84535 (validMask!0 mask!3119)))

(assert (=> d!84535 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258957 (select (arr!17112 a!3118) j!142) a!3118 mask!3119) lt!259088)))

(declare-fun b!568756 () Bool)

(assert (=> b!568756 (= e!327260 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!258957 #b00000000000000000000000000000000 mask!3119) (select (arr!17112 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!568757 () Bool)

(assert (=> b!568757 (and (bvsge (index!24473 lt!259088) #b00000000000000000000000000000000) (bvslt (index!24473 lt!259088) (size!17476 a!3118)))))

(assert (=> b!568757 (= e!327256 (= (select (arr!17112 a!3118) (index!24473 lt!259088)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!84535 c!65326) b!568751))

(assert (= (and d!84535 (not c!65326)) b!568750))

(assert (= (and b!568750 c!65327) b!568752))

(assert (= (and b!568750 (not c!65327)) b!568756))

(assert (= (and d!84535 c!65328) b!568755))

(assert (= (and d!84535 (not c!65328)) b!568754))

(assert (= (and b!568754 res!358806) b!568749))

(assert (= (and b!568749 (not res!358807)) b!568753))

(assert (= (and b!568753 (not res!358808)) b!568757))

(declare-fun m!547235 () Bool)

(assert (=> b!568757 m!547235))

(declare-fun m!547237 () Bool)

(assert (=> b!568756 m!547237))

(assert (=> b!568756 m!547237))

(assert (=> b!568756 m!547001))

(declare-fun m!547239 () Bool)

(assert (=> b!568756 m!547239))

(declare-fun m!547241 () Bool)

(assert (=> d!84535 m!547241))

(assert (=> d!84535 m!547021))

(assert (=> b!568749 m!547235))

(assert (=> b!568753 m!547235))

(assert (=> b!568466 d!84535))

(declare-fun d!84539 () Bool)

(declare-fun lt!259111 () (_ BitVec 32))

(declare-fun lt!259110 () (_ BitVec 32))

(assert (=> d!84539 (= lt!259111 (bvmul (bvxor lt!259110 (bvlshr lt!259110 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84539 (= lt!259110 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17112 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!17112 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84539 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!358813 (let ((h!12211 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17112 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!17112 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53358 (bvmul (bvxor h!12211 (bvlshr h!12211 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53358 (bvlshr x!53358 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!358813 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!358813 #b00000000000000000000000000000000))))))

(assert (=> d!84539 (= (toIndex!0 (select (store (arr!17112 a!3118) i!1132 k!1914) j!142) mask!3119) (bvand (bvxor lt!259111 (bvlshr lt!259111 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!568466 d!84539))

(declare-fun d!84547 () Bool)

(declare-fun lt!259113 () (_ BitVec 32))

(declare-fun lt!259112 () (_ BitVec 32))

(assert (=> d!84547 (= lt!259113 (bvmul (bvxor lt!259112 (bvlshr lt!259112 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84547 (= lt!259112 ((_ extract 31 0) (bvand (bvxor (select (arr!17112 a!3118) j!142) (bvlshr (select (arr!17112 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84547 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!358813 (let ((h!12211 ((_ extract 31 0) (bvand (bvxor (select (arr!17112 a!3118) j!142) (bvlshr (select (arr!17112 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53358 (bvmul (bvxor h!12211 (bvlshr h!12211 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53358 (bvlshr x!53358 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!358813 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!358813 #b00000000000000000000000000000000))))))

(assert (=> d!84547 (= (toIndex!0 (select (arr!17112 a!3118) j!142) mask!3119) (bvand (bvxor lt!259113 (bvlshr lt!259113 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!568466 d!84547))

(declare-fun d!84549 () Bool)

(declare-fun lt!259117 () SeekEntryResult!5561)

(assert (=> d!84549 (and (or (is-Undefined!5561 lt!259117) (not (is-Found!5561 lt!259117)) (and (bvsge (index!24472 lt!259117) #b00000000000000000000000000000000) (bvslt (index!24472 lt!259117) (size!17476 a!3118)))) (or (is-Undefined!5561 lt!259117) (is-Found!5561 lt!259117) (not (is-MissingZero!5561 lt!259117)) (and (bvsge (index!24471 lt!259117) #b00000000000000000000000000000000) (bvslt (index!24471 lt!259117) (size!17476 a!3118)))) (or (is-Undefined!5561 lt!259117) (is-Found!5561 lt!259117) (is-MissingZero!5561 lt!259117) (not (is-MissingVacant!5561 lt!259117)) (and (bvsge (index!24474 lt!259117) #b00000000000000000000000000000000) (bvslt (index!24474 lt!259117) (size!17476 a!3118)))) (or (is-Undefined!5561 lt!259117) (ite (is-Found!5561 lt!259117) (= (select (arr!17112 a!3118) (index!24472 lt!259117)) k!1914) (ite (is-MissingZero!5561 lt!259117) (= (select (arr!17112 a!3118) (index!24471 lt!259117)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5561 lt!259117) (= (select (arr!17112 a!3118) (index!24474 lt!259117)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!327275 () SeekEntryResult!5561)

(assert (=> d!84549 (= lt!259117 e!327275)))

(declare-fun c!65337 () Bool)

(declare-fun lt!259115 () SeekEntryResult!5561)

(assert (=> d!84549 (= c!65337 (and (is-Intermediate!5561 lt!259115) (undefined!6373 lt!259115)))))

(assert (=> d!84549 (= lt!259115 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!84549 (validMask!0 mask!3119)))

(assert (=> d!84549 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!259117)))

(declare-fun b!568778 () Bool)

(declare-fun e!327276 () SeekEntryResult!5561)

(assert (=> b!568778 (= e!327276 (MissingZero!5561 (index!24473 lt!259115)))))

(declare-fun b!568779 () Bool)

(declare-fun e!327274 () SeekEntryResult!5561)

(assert (=> b!568779 (= e!327275 e!327274)))

(declare-fun lt!259116 () (_ BitVec 64))

(assert (=> b!568779 (= lt!259116 (select (arr!17112 a!3118) (index!24473 lt!259115)))))

(declare-fun c!65336 () Bool)

(assert (=> b!568779 (= c!65336 (= lt!259116 k!1914))))

(declare-fun b!568780 () Bool)

(declare-fun c!65338 () Bool)

(assert (=> b!568780 (= c!65338 (= lt!259116 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!568780 (= e!327274 e!327276)))

(declare-fun b!568781 () Bool)

(assert (=> b!568781 (= e!327276 (seekKeyOrZeroReturnVacant!0 (x!53350 lt!259115) (index!24473 lt!259115) (index!24473 lt!259115) k!1914 a!3118 mask!3119))))

(declare-fun b!568782 () Bool)

(assert (=> b!568782 (= e!327274 (Found!5561 (index!24473 lt!259115)))))

(declare-fun b!568783 () Bool)

(assert (=> b!568783 (= e!327275 Undefined!5561)))

(assert (= (and d!84549 c!65337) b!568783))

(assert (= (and d!84549 (not c!65337)) b!568779))

(assert (= (and b!568779 c!65336) b!568782))

(assert (= (and b!568779 (not c!65336)) b!568780))

(assert (= (and b!568780 c!65338) b!568778))

(assert (= (and b!568780 (not c!65338)) b!568781))

(declare-fun m!547269 () Bool)

(assert (=> d!84549 m!547269))

(assert (=> d!84549 m!547269))

(declare-fun m!547271 () Bool)

(assert (=> d!84549 m!547271))

(declare-fun m!547273 () Bool)

(assert (=> d!84549 m!547273))

(assert (=> d!84549 m!547021))

(declare-fun m!547275 () Bool)

(assert (=> d!84549 m!547275))

(declare-fun m!547277 () Bool)

(assert (=> d!84549 m!547277))

(declare-fun m!547279 () Bool)

(assert (=> b!568779 m!547279))

(declare-fun m!547281 () Bool)

(assert (=> b!568781 m!547281))

(assert (=> b!568465 d!84549))

(declare-fun d!84553 () Bool)

(assert (=> d!84553 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!52058 d!84553))

(declare-fun d!84559 () Bool)

(assert (=> d!84559 (= (array_inv!12908 a!3118) (bvsge (size!17476 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!52058 d!84559))

(push 1)

(assert (not b!568739))

(assert (not b!568677))

(assert (not d!84521))

(assert (not b!568781))

(assert (not d!84549))

(assert (not b!568550))

(assert (not b!568556))

(assert (not d!84535))

(assert (not b!568546))

(assert (not d!84505))

(assert (not b!568676))

(assert (not bm!32564))

(assert (not bm!32571))

(assert (not b!568582))

(assert (not b!568756))

(assert (not d!84529))

(assert (not bm!32570))

(assert (not b!568671))

(assert (not b!568548))

(assert (not b!568583))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

