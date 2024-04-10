; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49780 () Bool)

(assert start!49780)

(declare-fun b!547070 () Bool)

(declare-fun e!316108 () Bool)

(declare-datatypes ((array!34518 0))(
  ( (array!34519 (arr!16585 (Array (_ BitVec 32) (_ BitVec 64))) (size!16949 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34518)

(assert (=> b!547070 (= e!316108 (and (bvsle #b00000000000000000000000000000000 (size!16949 a!3118)) (bvsge (size!16949 a!3118) #b01111111111111111111111111111111)))))

(declare-fun b!547071 () Bool)

(declare-fun res!340787 () Bool)

(assert (=> b!547071 (=> (not res!340787) (not e!316108))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34518 (_ BitVec 32)) Bool)

(assert (=> b!547071 (= res!340787 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!547072 () Bool)

(declare-fun res!340786 () Bool)

(declare-fun e!316110 () Bool)

(assert (=> b!547072 (=> (not res!340786) (not e!316110))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!547072 (= res!340786 (validKeyInArray!0 (select (arr!16585 a!3118) j!142)))))

(declare-fun res!340788 () Bool)

(assert (=> start!49780 (=> (not res!340788) (not e!316110))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49780 (= res!340788 (validMask!0 mask!3119))))

(assert (=> start!49780 e!316110))

(assert (=> start!49780 true))

(declare-fun array_inv!12381 (array!34518) Bool)

(assert (=> start!49780 (array_inv!12381 a!3118)))

(declare-fun b!547073 () Bool)

(declare-fun res!340789 () Bool)

(assert (=> b!547073 (=> (not res!340789) (not e!316110))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!547073 (= res!340789 (and (= (size!16949 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16949 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16949 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!547074 () Bool)

(declare-fun res!340785 () Bool)

(assert (=> b!547074 (=> (not res!340785) (not e!316110))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!547074 (= res!340785 (validKeyInArray!0 k0!1914))))

(declare-fun b!547075 () Bool)

(assert (=> b!547075 (= e!316110 e!316108)))

(declare-fun res!340784 () Bool)

(assert (=> b!547075 (=> (not res!340784) (not e!316108))))

(declare-datatypes ((SeekEntryResult!5034 0))(
  ( (MissingZero!5034 (index!22363 (_ BitVec 32))) (Found!5034 (index!22364 (_ BitVec 32))) (Intermediate!5034 (undefined!5846 Bool) (index!22365 (_ BitVec 32)) (x!51310 (_ BitVec 32))) (Undefined!5034) (MissingVacant!5034 (index!22366 (_ BitVec 32))) )
))
(declare-fun lt!249415 () SeekEntryResult!5034)

(assert (=> b!547075 (= res!340784 (or (= lt!249415 (MissingZero!5034 i!1132)) (= lt!249415 (MissingVacant!5034 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34518 (_ BitVec 32)) SeekEntryResult!5034)

(assert (=> b!547075 (= lt!249415 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!547076 () Bool)

(declare-fun res!340790 () Bool)

(assert (=> b!547076 (=> (not res!340790) (not e!316110))))

(declare-fun arrayContainsKey!0 (array!34518 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!547076 (= res!340790 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!49780 res!340788) b!547073))

(assert (= (and b!547073 res!340789) b!547072))

(assert (= (and b!547072 res!340786) b!547074))

(assert (= (and b!547074 res!340785) b!547076))

(assert (= (and b!547076 res!340790) b!547075))

(assert (= (and b!547075 res!340784) b!547071))

(assert (= (and b!547071 res!340787) b!547070))

(declare-fun m!524425 () Bool)

(assert (=> b!547076 m!524425))

(declare-fun m!524427 () Bool)

(assert (=> b!547075 m!524427))

(declare-fun m!524429 () Bool)

(assert (=> b!547072 m!524429))

(assert (=> b!547072 m!524429))

(declare-fun m!524431 () Bool)

(assert (=> b!547072 m!524431))

(declare-fun m!524433 () Bool)

(assert (=> b!547071 m!524433))

(declare-fun m!524435 () Bool)

(assert (=> start!49780 m!524435))

(declare-fun m!524437 () Bool)

(assert (=> start!49780 m!524437))

(declare-fun m!524439 () Bool)

(assert (=> b!547074 m!524439))

(check-sat (not b!547075) (not start!49780) (not b!547072) (not b!547071) (not b!547074) (not b!547076))
(check-sat)
(get-model)

(declare-fun d!82397 () Bool)

(declare-fun res!340816 () Bool)

(declare-fun e!316124 () Bool)

(assert (=> d!82397 (=> res!340816 e!316124)))

(assert (=> d!82397 (= res!340816 (= (select (arr!16585 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!82397 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!316124)))

(declare-fun b!547102 () Bool)

(declare-fun e!316125 () Bool)

(assert (=> b!547102 (= e!316124 e!316125)))

(declare-fun res!340817 () Bool)

(assert (=> b!547102 (=> (not res!340817) (not e!316125))))

(assert (=> b!547102 (= res!340817 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16949 a!3118)))))

(declare-fun b!547103 () Bool)

(assert (=> b!547103 (= e!316125 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82397 (not res!340816)) b!547102))

(assert (= (and b!547102 res!340817) b!547103))

(declare-fun m!524457 () Bool)

(assert (=> d!82397 m!524457))

(declare-fun m!524459 () Bool)

(assert (=> b!547103 m!524459))

(assert (=> b!547076 d!82397))

(declare-fun d!82399 () Bool)

(assert (=> d!82399 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!49780 d!82399))

(declare-fun d!82409 () Bool)

(assert (=> d!82409 (= (array_inv!12381 a!3118) (bvsge (size!16949 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!49780 d!82409))

(declare-fun b!547152 () Bool)

(declare-fun e!316158 () SeekEntryResult!5034)

(assert (=> b!547152 (= e!316158 Undefined!5034)))

(declare-fun d!82411 () Bool)

(declare-fun lt!249453 () SeekEntryResult!5034)

(get-info :version)

(assert (=> d!82411 (and (or ((_ is Undefined!5034) lt!249453) (not ((_ is Found!5034) lt!249453)) (and (bvsge (index!22364 lt!249453) #b00000000000000000000000000000000) (bvslt (index!22364 lt!249453) (size!16949 a!3118)))) (or ((_ is Undefined!5034) lt!249453) ((_ is Found!5034) lt!249453) (not ((_ is MissingZero!5034) lt!249453)) (and (bvsge (index!22363 lt!249453) #b00000000000000000000000000000000) (bvslt (index!22363 lt!249453) (size!16949 a!3118)))) (or ((_ is Undefined!5034) lt!249453) ((_ is Found!5034) lt!249453) ((_ is MissingZero!5034) lt!249453) (not ((_ is MissingVacant!5034) lt!249453)) (and (bvsge (index!22366 lt!249453) #b00000000000000000000000000000000) (bvslt (index!22366 lt!249453) (size!16949 a!3118)))) (or ((_ is Undefined!5034) lt!249453) (ite ((_ is Found!5034) lt!249453) (= (select (arr!16585 a!3118) (index!22364 lt!249453)) k0!1914) (ite ((_ is MissingZero!5034) lt!249453) (= (select (arr!16585 a!3118) (index!22363 lt!249453)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5034) lt!249453) (= (select (arr!16585 a!3118) (index!22366 lt!249453)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!82411 (= lt!249453 e!316158)))

(declare-fun c!63490 () Bool)

(declare-fun lt!249454 () SeekEntryResult!5034)

(assert (=> d!82411 (= c!63490 (and ((_ is Intermediate!5034) lt!249454) (undefined!5846 lt!249454)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34518 (_ BitVec 32)) SeekEntryResult!5034)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!82411 (= lt!249454 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!82411 (validMask!0 mask!3119)))

(assert (=> d!82411 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!249453)))

(declare-fun b!547153 () Bool)

(declare-fun e!316156 () SeekEntryResult!5034)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34518 (_ BitVec 32)) SeekEntryResult!5034)

(assert (=> b!547153 (= e!316156 (seekKeyOrZeroReturnVacant!0 (x!51310 lt!249454) (index!22365 lt!249454) (index!22365 lt!249454) k0!1914 a!3118 mask!3119))))

(declare-fun b!547154 () Bool)

(declare-fun e!316157 () SeekEntryResult!5034)

(assert (=> b!547154 (= e!316158 e!316157)))

(declare-fun lt!249455 () (_ BitVec 64))

(assert (=> b!547154 (= lt!249455 (select (arr!16585 a!3118) (index!22365 lt!249454)))))

(declare-fun c!63489 () Bool)

(assert (=> b!547154 (= c!63489 (= lt!249455 k0!1914))))

(declare-fun b!547155 () Bool)

(assert (=> b!547155 (= e!316156 (MissingZero!5034 (index!22365 lt!249454)))))

(declare-fun b!547156 () Bool)

(assert (=> b!547156 (= e!316157 (Found!5034 (index!22365 lt!249454)))))

(declare-fun b!547157 () Bool)

(declare-fun c!63491 () Bool)

(assert (=> b!547157 (= c!63491 (= lt!249455 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!547157 (= e!316157 e!316156)))

(assert (= (and d!82411 c!63490) b!547152))

(assert (= (and d!82411 (not c!63490)) b!547154))

(assert (= (and b!547154 c!63489) b!547156))

(assert (= (and b!547154 (not c!63489)) b!547157))

(assert (= (and b!547157 c!63491) b!547155))

(assert (= (and b!547157 (not c!63491)) b!547153))

(declare-fun m!524485 () Bool)

(assert (=> d!82411 m!524485))

(declare-fun m!524487 () Bool)

(assert (=> d!82411 m!524487))

(declare-fun m!524489 () Bool)

(assert (=> d!82411 m!524489))

(declare-fun m!524491 () Bool)

(assert (=> d!82411 m!524491))

(declare-fun m!524493 () Bool)

(assert (=> d!82411 m!524493))

(assert (=> d!82411 m!524435))

(assert (=> d!82411 m!524485))

(declare-fun m!524495 () Bool)

(assert (=> b!547153 m!524495))

(declare-fun m!524497 () Bool)

(assert (=> b!547154 m!524497))

(assert (=> b!547075 d!82411))

(declare-fun d!82421 () Bool)

(assert (=> d!82421 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!547074 d!82421))

(declare-fun d!82425 () Bool)

(assert (=> d!82425 (= (validKeyInArray!0 (select (arr!16585 a!3118) j!142)) (and (not (= (select (arr!16585 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16585 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!547072 d!82425))

(declare-fun b!547196 () Bool)

(declare-fun e!316184 () Bool)

(declare-fun e!316185 () Bool)

(assert (=> b!547196 (= e!316184 e!316185)))

(declare-fun lt!249472 () (_ BitVec 64))

(assert (=> b!547196 (= lt!249472 (select (arr!16585 a!3118) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16950 0))(
  ( (Unit!16951) )
))
(declare-fun lt!249471 () Unit!16950)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34518 (_ BitVec 64) (_ BitVec 32)) Unit!16950)

(assert (=> b!547196 (= lt!249471 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!249472 #b00000000000000000000000000000000))))

(assert (=> b!547196 (arrayContainsKey!0 a!3118 lt!249472 #b00000000000000000000000000000000)))

(declare-fun lt!249470 () Unit!16950)

(assert (=> b!547196 (= lt!249470 lt!249471)))

(declare-fun res!340841 () Bool)

(assert (=> b!547196 (= res!340841 (= (seekEntryOrOpen!0 (select (arr!16585 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5034 #b00000000000000000000000000000000)))))

(assert (=> b!547196 (=> (not res!340841) (not e!316185))))

(declare-fun bm!32153 () Bool)

(declare-fun call!32156 () Bool)

(assert (=> bm!32153 (= call!32156 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!547197 () Bool)

(assert (=> b!547197 (= e!316185 call!32156)))

(declare-fun b!547198 () Bool)

(assert (=> b!547198 (= e!316184 call!32156)))

(declare-fun d!82427 () Bool)

(declare-fun res!340840 () Bool)

(declare-fun e!316183 () Bool)

(assert (=> d!82427 (=> res!340840 e!316183)))

(assert (=> d!82427 (= res!340840 (bvsge #b00000000000000000000000000000000 (size!16949 a!3118)))))

(assert (=> d!82427 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!316183)))

(declare-fun b!547199 () Bool)

(assert (=> b!547199 (= e!316183 e!316184)))

(declare-fun c!63506 () Bool)

(assert (=> b!547199 (= c!63506 (validKeyInArray!0 (select (arr!16585 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!82427 (not res!340840)) b!547199))

(assert (= (and b!547199 c!63506) b!547196))

(assert (= (and b!547199 (not c!63506)) b!547198))

(assert (= (and b!547196 res!340841) b!547197))

(assert (= (or b!547197 b!547198) bm!32153))

(assert (=> b!547196 m!524457))

(declare-fun m!524529 () Bool)

(assert (=> b!547196 m!524529))

(declare-fun m!524531 () Bool)

(assert (=> b!547196 m!524531))

(assert (=> b!547196 m!524457))

(declare-fun m!524533 () Bool)

(assert (=> b!547196 m!524533))

(declare-fun m!524535 () Bool)

(assert (=> bm!32153 m!524535))

(assert (=> b!547199 m!524457))

(assert (=> b!547199 m!524457))

(declare-fun m!524537 () Bool)

(assert (=> b!547199 m!524537))

(assert (=> b!547071 d!82427))

(check-sat (not bm!32153) (not b!547199) (not b!547196) (not b!547153) (not d!82411) (not b!547103))
(check-sat)
