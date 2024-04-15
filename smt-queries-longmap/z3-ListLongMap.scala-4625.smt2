; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64364 () Bool)

(assert start!64364)

(declare-datatypes ((array!40962 0))(
  ( (array!40963 (arr!19604 (Array (_ BitVec 32) (_ BitVec 64))) (size!20025 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40962)

(declare-fun b!723935 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!405470 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7201 0))(
  ( (MissingZero!7201 (index!31172 (_ BitVec 32))) (Found!7201 (index!31173 (_ BitVec 32))) (Intermediate!7201 (undefined!8013 Bool) (index!31174 (_ BitVec 32)) (x!62173 (_ BitVec 32))) (Undefined!7201) (MissingVacant!7201 (index!31175 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40962 (_ BitVec 32)) SeekEntryResult!7201)

(assert (=> b!723935 (= e!405470 (= (seekEntryOrOpen!0 (select (arr!19604 a!3186) j!159) a!3186 mask!3328) (Found!7201 j!159)))))

(declare-fun e!405471 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!723936 () Bool)

(declare-fun lt!320669 () SeekEntryResult!7201)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40962 (_ BitVec 32)) SeekEntryResult!7201)

(assert (=> b!723936 (= e!405471 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19604 a!3186) j!159) a!3186 mask!3328) lt!320669))))

(declare-fun b!723938 () Bool)

(declare-fun res!485553 () Bool)

(declare-fun e!405469 () Bool)

(assert (=> b!723938 (=> (not res!485553) (not e!405469))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!723938 (= res!485553 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20025 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20025 a!3186))))))

(declare-fun b!723939 () Bool)

(declare-fun res!485558 () Bool)

(declare-fun e!405474 () Bool)

(assert (=> b!723939 (=> (not res!485558) (not e!405474))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!723939 (= res!485558 (validKeyInArray!0 k0!2102))))

(declare-fun b!723940 () Bool)

(declare-fun res!485563 () Bool)

(assert (=> b!723940 (=> (not res!485563) (not e!405474))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!723940 (= res!485563 (and (= (size!20025 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20025 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20025 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!723941 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40962 (_ BitVec 32)) SeekEntryResult!7201)

(assert (=> b!723941 (= e!405471 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19604 a!3186) j!159) a!3186 mask!3328) (Found!7201 j!159)))))

(declare-fun b!723942 () Bool)

(assert (=> b!723942 (= e!405474 e!405469)))

(declare-fun res!485562 () Bool)

(assert (=> b!723942 (=> (not res!485562) (not e!405469))))

(declare-fun lt!320668 () SeekEntryResult!7201)

(assert (=> b!723942 (= res!485562 (or (= lt!320668 (MissingZero!7201 i!1173)) (= lt!320668 (MissingVacant!7201 i!1173))))))

(assert (=> b!723942 (= lt!320668 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!723943 () Bool)

(declare-fun res!485560 () Bool)

(declare-fun e!405472 () Bool)

(assert (=> b!723943 (=> (not res!485560) (not e!405472))))

(assert (=> b!723943 (= res!485560 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19604 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!723944 () Bool)

(declare-fun res!485561 () Bool)

(assert (=> b!723944 (=> (not res!485561) (not e!405469))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40962 (_ BitVec 32)) Bool)

(assert (=> b!723944 (= res!485561 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!723937 () Bool)

(declare-fun res!485552 () Bool)

(assert (=> b!723937 (=> (not res!485552) (not e!405472))))

(assert (=> b!723937 (= res!485552 e!405471)))

(declare-fun c!79563 () Bool)

(assert (=> b!723937 (= c!79563 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!485556 () Bool)

(assert (=> start!64364 (=> (not res!485556) (not e!405474))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64364 (= res!485556 (validMask!0 mask!3328))))

(assert (=> start!64364 e!405474))

(assert (=> start!64364 true))

(declare-fun array_inv!15487 (array!40962) Bool)

(assert (=> start!64364 (array_inv!15487 a!3186)))

(declare-fun b!723945 () Bool)

(declare-fun e!405473 () Bool)

(assert (=> b!723945 (= e!405472 e!405473)))

(declare-fun res!485554 () Bool)

(assert (=> b!723945 (=> (not res!485554) (not e!405473))))

(declare-fun lt!320665 () array!40962)

(declare-fun lt!320666 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!723945 (= res!485554 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320666 mask!3328) lt!320666 lt!320665 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320666 lt!320665 mask!3328)))))

(assert (=> b!723945 (= lt!320666 (select (store (arr!19604 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!723945 (= lt!320665 (array!40963 (store (arr!19604 a!3186) i!1173 k0!2102) (size!20025 a!3186)))))

(declare-fun b!723946 () Bool)

(declare-fun res!485565 () Bool)

(assert (=> b!723946 (=> (not res!485565) (not e!405474))))

(declare-fun arrayContainsKey!0 (array!40962 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!723946 (= res!485565 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!723947 () Bool)

(assert (=> b!723947 (= e!405473 (not (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvsge resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge resIntermediateX!5 #b00000000000000000000000000000000))))))

(assert (=> b!723947 e!405470))

(declare-fun res!485557 () Bool)

(assert (=> b!723947 (=> (not res!485557) (not e!405470))))

(assert (=> b!723947 (= res!485557 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24692 0))(
  ( (Unit!24693) )
))
(declare-fun lt!320667 () Unit!24692)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40962 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24692)

(assert (=> b!723947 (= lt!320667 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!723948 () Bool)

(declare-fun res!485559 () Bool)

(assert (=> b!723948 (=> (not res!485559) (not e!405474))))

(assert (=> b!723948 (= res!485559 (validKeyInArray!0 (select (arr!19604 a!3186) j!159)))))

(declare-fun b!723949 () Bool)

(assert (=> b!723949 (= e!405469 e!405472)))

(declare-fun res!485564 () Bool)

(assert (=> b!723949 (=> (not res!485564) (not e!405472))))

(assert (=> b!723949 (= res!485564 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19604 a!3186) j!159) mask!3328) (select (arr!19604 a!3186) j!159) a!3186 mask!3328) lt!320669))))

(assert (=> b!723949 (= lt!320669 (Intermediate!7201 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!723950 () Bool)

(declare-fun res!485555 () Bool)

(assert (=> b!723950 (=> (not res!485555) (not e!405469))))

(declare-datatypes ((List!13645 0))(
  ( (Nil!13642) (Cons!13641 (h!14695 (_ BitVec 64)) (t!19951 List!13645)) )
))
(declare-fun arrayNoDuplicates!0 (array!40962 (_ BitVec 32) List!13645) Bool)

(assert (=> b!723950 (= res!485555 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13642))))

(assert (= (and start!64364 res!485556) b!723940))

(assert (= (and b!723940 res!485563) b!723948))

(assert (= (and b!723948 res!485559) b!723939))

(assert (= (and b!723939 res!485558) b!723946))

(assert (= (and b!723946 res!485565) b!723942))

(assert (= (and b!723942 res!485562) b!723944))

(assert (= (and b!723944 res!485561) b!723950))

(assert (= (and b!723950 res!485555) b!723938))

(assert (= (and b!723938 res!485553) b!723949))

(assert (= (and b!723949 res!485564) b!723943))

(assert (= (and b!723943 res!485560) b!723937))

(assert (= (and b!723937 c!79563) b!723936))

(assert (= (and b!723937 (not c!79563)) b!723941))

(assert (= (and b!723937 res!485552) b!723945))

(assert (= (and b!723945 res!485554) b!723947))

(assert (= (and b!723947 res!485557) b!723935))

(declare-fun m!677807 () Bool)

(assert (=> b!723941 m!677807))

(assert (=> b!723941 m!677807))

(declare-fun m!677809 () Bool)

(assert (=> b!723941 m!677809))

(assert (=> b!723948 m!677807))

(assert (=> b!723948 m!677807))

(declare-fun m!677811 () Bool)

(assert (=> b!723948 m!677811))

(declare-fun m!677813 () Bool)

(assert (=> b!723944 m!677813))

(declare-fun m!677815 () Bool)

(assert (=> start!64364 m!677815))

(declare-fun m!677817 () Bool)

(assert (=> start!64364 m!677817))

(declare-fun m!677819 () Bool)

(assert (=> b!723943 m!677819))

(declare-fun m!677821 () Bool)

(assert (=> b!723947 m!677821))

(declare-fun m!677823 () Bool)

(assert (=> b!723947 m!677823))

(assert (=> b!723935 m!677807))

(assert (=> b!723935 m!677807))

(declare-fun m!677825 () Bool)

(assert (=> b!723935 m!677825))

(declare-fun m!677827 () Bool)

(assert (=> b!723945 m!677827))

(declare-fun m!677829 () Bool)

(assert (=> b!723945 m!677829))

(declare-fun m!677831 () Bool)

(assert (=> b!723945 m!677831))

(declare-fun m!677833 () Bool)

(assert (=> b!723945 m!677833))

(declare-fun m!677835 () Bool)

(assert (=> b!723945 m!677835))

(assert (=> b!723945 m!677829))

(declare-fun m!677837 () Bool)

(assert (=> b!723946 m!677837))

(declare-fun m!677839 () Bool)

(assert (=> b!723942 m!677839))

(assert (=> b!723949 m!677807))

(assert (=> b!723949 m!677807))

(declare-fun m!677841 () Bool)

(assert (=> b!723949 m!677841))

(assert (=> b!723949 m!677841))

(assert (=> b!723949 m!677807))

(declare-fun m!677843 () Bool)

(assert (=> b!723949 m!677843))

(declare-fun m!677845 () Bool)

(assert (=> b!723950 m!677845))

(assert (=> b!723936 m!677807))

(assert (=> b!723936 m!677807))

(declare-fun m!677847 () Bool)

(assert (=> b!723936 m!677847))

(declare-fun m!677849 () Bool)

(assert (=> b!723939 m!677849))

(check-sat (not b!723950) (not b!723948) (not b!723935) (not start!64364) (not b!723945) (not b!723941) (not b!723947) (not b!723946) (not b!723939) (not b!723942) (not b!723936) (not b!723949) (not b!723944))
(check-sat)
(get-model)

(declare-fun d!99111 () Bool)

(declare-fun e!405531 () Bool)

(assert (=> d!99111 e!405531))

(declare-fun c!79577 () Bool)

(declare-fun lt!320705 () SeekEntryResult!7201)

(get-info :version)

(assert (=> d!99111 (= c!79577 (and ((_ is Intermediate!7201) lt!320705) (undefined!8013 lt!320705)))))

(declare-fun e!405528 () SeekEntryResult!7201)

(assert (=> d!99111 (= lt!320705 e!405528)))

(declare-fun c!79576 () Bool)

(assert (=> d!99111 (= c!79576 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!320704 () (_ BitVec 64))

(assert (=> d!99111 (= lt!320704 (select (arr!19604 a!3186) (toIndex!0 (select (arr!19604 a!3186) j!159) mask!3328)))))

(assert (=> d!99111 (validMask!0 mask!3328)))

(assert (=> d!99111 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19604 a!3186) j!159) mask!3328) (select (arr!19604 a!3186) j!159) a!3186 mask!3328) lt!320705)))

(declare-fun b!724065 () Bool)

(declare-fun e!405532 () SeekEntryResult!7201)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!724065 (= e!405532 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!19604 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!19604 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!724066 () Bool)

(declare-fun e!405530 () Bool)

(assert (=> b!724066 (= e!405531 e!405530)))

(declare-fun res!485656 () Bool)

(assert (=> b!724066 (= res!485656 (and ((_ is Intermediate!7201) lt!320705) (not (undefined!8013 lt!320705)) (bvslt (x!62173 lt!320705) #b01111111111111111111111111111110) (bvsge (x!62173 lt!320705) #b00000000000000000000000000000000) (bvsge (x!62173 lt!320705) #b00000000000000000000000000000000)))))

(assert (=> b!724066 (=> (not res!485656) (not e!405530))))

(declare-fun b!724067 () Bool)

(assert (=> b!724067 (and (bvsge (index!31174 lt!320705) #b00000000000000000000000000000000) (bvslt (index!31174 lt!320705) (size!20025 a!3186)))))

(declare-fun e!405529 () Bool)

(assert (=> b!724067 (= e!405529 (= (select (arr!19604 a!3186) (index!31174 lt!320705)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!724068 () Bool)

(assert (=> b!724068 (= e!405532 (Intermediate!7201 false (toIndex!0 (select (arr!19604 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!724069 () Bool)

(assert (=> b!724069 (and (bvsge (index!31174 lt!320705) #b00000000000000000000000000000000) (bvslt (index!31174 lt!320705) (size!20025 a!3186)))))

(declare-fun res!485657 () Bool)

(assert (=> b!724069 (= res!485657 (= (select (arr!19604 a!3186) (index!31174 lt!320705)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!724069 (=> res!485657 e!405529)))

(declare-fun b!724070 () Bool)

(assert (=> b!724070 (= e!405531 (bvsge (x!62173 lt!320705) #b01111111111111111111111111111110))))

(declare-fun b!724071 () Bool)

(assert (=> b!724071 (= e!405528 (Intermediate!7201 true (toIndex!0 (select (arr!19604 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!724072 () Bool)

(assert (=> b!724072 (= e!405528 e!405532)))

(declare-fun c!79578 () Bool)

(assert (=> b!724072 (= c!79578 (or (= lt!320704 (select (arr!19604 a!3186) j!159)) (= (bvadd lt!320704 lt!320704) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!724073 () Bool)

(assert (=> b!724073 (and (bvsge (index!31174 lt!320705) #b00000000000000000000000000000000) (bvslt (index!31174 lt!320705) (size!20025 a!3186)))))

(declare-fun res!485658 () Bool)

(assert (=> b!724073 (= res!485658 (= (select (arr!19604 a!3186) (index!31174 lt!320705)) (select (arr!19604 a!3186) j!159)))))

(assert (=> b!724073 (=> res!485658 e!405529)))

(assert (=> b!724073 (= e!405530 e!405529)))

(assert (= (and d!99111 c!79576) b!724071))

(assert (= (and d!99111 (not c!79576)) b!724072))

(assert (= (and b!724072 c!79578) b!724068))

(assert (= (and b!724072 (not c!79578)) b!724065))

(assert (= (and d!99111 c!79577) b!724070))

(assert (= (and d!99111 (not c!79577)) b!724066))

(assert (= (and b!724066 res!485656) b!724073))

(assert (= (and b!724073 (not res!485658)) b!724069))

(assert (= (and b!724069 (not res!485657)) b!724067))

(assert (=> d!99111 m!677841))

(declare-fun m!677939 () Bool)

(assert (=> d!99111 m!677939))

(assert (=> d!99111 m!677815))

(declare-fun m!677941 () Bool)

(assert (=> b!724073 m!677941))

(assert (=> b!724065 m!677841))

(declare-fun m!677943 () Bool)

(assert (=> b!724065 m!677943))

(assert (=> b!724065 m!677943))

(assert (=> b!724065 m!677807))

(declare-fun m!677945 () Bool)

(assert (=> b!724065 m!677945))

(assert (=> b!724069 m!677941))

(assert (=> b!724067 m!677941))

(assert (=> b!723949 d!99111))

(declare-fun d!99113 () Bool)

(declare-fun lt!320711 () (_ BitVec 32))

(declare-fun lt!320710 () (_ BitVec 32))

(assert (=> d!99113 (= lt!320711 (bvmul (bvxor lt!320710 (bvlshr lt!320710 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99113 (= lt!320710 ((_ extract 31 0) (bvand (bvxor (select (arr!19604 a!3186) j!159) (bvlshr (select (arr!19604 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99113 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!485659 (let ((h!14698 ((_ extract 31 0) (bvand (bvxor (select (arr!19604 a!3186) j!159) (bvlshr (select (arr!19604 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!62177 (bvmul (bvxor h!14698 (bvlshr h!14698 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!62177 (bvlshr x!62177 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!485659 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!485659 #b00000000000000000000000000000000))))))

(assert (=> d!99113 (= (toIndex!0 (select (arr!19604 a!3186) j!159) mask!3328) (bvand (bvxor lt!320711 (bvlshr lt!320711 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!723949 d!99113))

(declare-fun d!99115 () Bool)

(assert (=> d!99115 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!64364 d!99115))

(declare-fun d!99121 () Bool)

(assert (=> d!99121 (= (array_inv!15487 a!3186) (bvsge (size!20025 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!64364 d!99121))

(declare-fun b!724084 () Bool)

(declare-fun e!405543 () Bool)

(declare-fun e!405541 () Bool)

(assert (=> b!724084 (= e!405543 e!405541)))

(declare-fun c!79581 () Bool)

(assert (=> b!724084 (= c!79581 (validKeyInArray!0 (select (arr!19604 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!724085 () Bool)

(declare-fun call!34762 () Bool)

(assert (=> b!724085 (= e!405541 call!34762)))

(declare-fun b!724086 () Bool)

(declare-fun e!405542 () Bool)

(declare-fun contains!4029 (List!13645 (_ BitVec 64)) Bool)

(assert (=> b!724086 (= e!405542 (contains!4029 Nil!13642 (select (arr!19604 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!724087 () Bool)

(assert (=> b!724087 (= e!405541 call!34762)))

(declare-fun d!99123 () Bool)

(declare-fun res!485667 () Bool)

(declare-fun e!405544 () Bool)

(assert (=> d!99123 (=> res!485667 e!405544)))

(assert (=> d!99123 (= res!485667 (bvsge #b00000000000000000000000000000000 (size!20025 a!3186)))))

(assert (=> d!99123 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13642) e!405544)))

(declare-fun bm!34759 () Bool)

(assert (=> bm!34759 (= call!34762 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!79581 (Cons!13641 (select (arr!19604 a!3186) #b00000000000000000000000000000000) Nil!13642) Nil!13642)))))

(declare-fun b!724088 () Bool)

(assert (=> b!724088 (= e!405544 e!405543)))

(declare-fun res!485666 () Bool)

(assert (=> b!724088 (=> (not res!485666) (not e!405543))))

(assert (=> b!724088 (= res!485666 (not e!405542))))

(declare-fun res!485668 () Bool)

(assert (=> b!724088 (=> (not res!485668) (not e!405542))))

(assert (=> b!724088 (= res!485668 (validKeyInArray!0 (select (arr!19604 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!99123 (not res!485667)) b!724088))

(assert (= (and b!724088 res!485668) b!724086))

(assert (= (and b!724088 res!485666) b!724084))

(assert (= (and b!724084 c!79581) b!724087))

(assert (= (and b!724084 (not c!79581)) b!724085))

(assert (= (or b!724087 b!724085) bm!34759))

(declare-fun m!677947 () Bool)

(assert (=> b!724084 m!677947))

(assert (=> b!724084 m!677947))

(declare-fun m!677949 () Bool)

(assert (=> b!724084 m!677949))

(assert (=> b!724086 m!677947))

(assert (=> b!724086 m!677947))

(declare-fun m!677951 () Bool)

(assert (=> b!724086 m!677951))

(assert (=> bm!34759 m!677947))

(declare-fun m!677953 () Bool)

(assert (=> bm!34759 m!677953))

(assert (=> b!724088 m!677947))

(assert (=> b!724088 m!677947))

(assert (=> b!724088 m!677949))

(assert (=> b!723950 d!99123))

(declare-fun d!99125 () Bool)

(assert (=> d!99125 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!723939 d!99125))

(declare-fun d!99127 () Bool)

(assert (=> d!99127 (= (validKeyInArray!0 (select (arr!19604 a!3186) j!159)) (and (not (= (select (arr!19604 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19604 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!723948 d!99127))

(declare-fun d!99129 () Bool)

(declare-fun e!405548 () Bool)

(assert (=> d!99129 e!405548))

(declare-fun c!79583 () Bool)

(declare-fun lt!320713 () SeekEntryResult!7201)

(assert (=> d!99129 (= c!79583 (and ((_ is Intermediate!7201) lt!320713) (undefined!8013 lt!320713)))))

(declare-fun e!405545 () SeekEntryResult!7201)

(assert (=> d!99129 (= lt!320713 e!405545)))

(declare-fun c!79582 () Bool)

(assert (=> d!99129 (= c!79582 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!320712 () (_ BitVec 64))

(assert (=> d!99129 (= lt!320712 (select (arr!19604 a!3186) index!1321))))

(assert (=> d!99129 (validMask!0 mask!3328)))

(assert (=> d!99129 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19604 a!3186) j!159) a!3186 mask!3328) lt!320713)))

(declare-fun b!724089 () Bool)

(declare-fun e!405549 () SeekEntryResult!7201)

(assert (=> b!724089 (= e!405549 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!19604 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!724090 () Bool)

(declare-fun e!405547 () Bool)

(assert (=> b!724090 (= e!405548 e!405547)))

(declare-fun res!485669 () Bool)

(assert (=> b!724090 (= res!485669 (and ((_ is Intermediate!7201) lt!320713) (not (undefined!8013 lt!320713)) (bvslt (x!62173 lt!320713) #b01111111111111111111111111111110) (bvsge (x!62173 lt!320713) #b00000000000000000000000000000000) (bvsge (x!62173 lt!320713) x!1131)))))

(assert (=> b!724090 (=> (not res!485669) (not e!405547))))

(declare-fun b!724091 () Bool)

(assert (=> b!724091 (and (bvsge (index!31174 lt!320713) #b00000000000000000000000000000000) (bvslt (index!31174 lt!320713) (size!20025 a!3186)))))

(declare-fun e!405546 () Bool)

(assert (=> b!724091 (= e!405546 (= (select (arr!19604 a!3186) (index!31174 lt!320713)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!724092 () Bool)

(assert (=> b!724092 (= e!405549 (Intermediate!7201 false index!1321 x!1131))))

(declare-fun b!724093 () Bool)

(assert (=> b!724093 (and (bvsge (index!31174 lt!320713) #b00000000000000000000000000000000) (bvslt (index!31174 lt!320713) (size!20025 a!3186)))))

(declare-fun res!485670 () Bool)

(assert (=> b!724093 (= res!485670 (= (select (arr!19604 a!3186) (index!31174 lt!320713)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!724093 (=> res!485670 e!405546)))

(declare-fun b!724094 () Bool)

(assert (=> b!724094 (= e!405548 (bvsge (x!62173 lt!320713) #b01111111111111111111111111111110))))

(declare-fun b!724095 () Bool)

(assert (=> b!724095 (= e!405545 (Intermediate!7201 true index!1321 x!1131))))

(declare-fun b!724096 () Bool)

(assert (=> b!724096 (= e!405545 e!405549)))

(declare-fun c!79584 () Bool)

(assert (=> b!724096 (= c!79584 (or (= lt!320712 (select (arr!19604 a!3186) j!159)) (= (bvadd lt!320712 lt!320712) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!724097 () Bool)

(assert (=> b!724097 (and (bvsge (index!31174 lt!320713) #b00000000000000000000000000000000) (bvslt (index!31174 lt!320713) (size!20025 a!3186)))))

(declare-fun res!485671 () Bool)

(assert (=> b!724097 (= res!485671 (= (select (arr!19604 a!3186) (index!31174 lt!320713)) (select (arr!19604 a!3186) j!159)))))

(assert (=> b!724097 (=> res!485671 e!405546)))

(assert (=> b!724097 (= e!405547 e!405546)))

(assert (= (and d!99129 c!79582) b!724095))

(assert (= (and d!99129 (not c!79582)) b!724096))

(assert (= (and b!724096 c!79584) b!724092))

(assert (= (and b!724096 (not c!79584)) b!724089))

(assert (= (and d!99129 c!79583) b!724094))

(assert (= (and d!99129 (not c!79583)) b!724090))

(assert (= (and b!724090 res!485669) b!724097))

(assert (= (and b!724097 (not res!485671)) b!724093))

(assert (= (and b!724093 (not res!485670)) b!724091))

(declare-fun m!677955 () Bool)

(assert (=> d!99129 m!677955))

(assert (=> d!99129 m!677815))

(declare-fun m!677957 () Bool)

(assert (=> b!724097 m!677957))

(declare-fun m!677959 () Bool)

(assert (=> b!724089 m!677959))

(assert (=> b!724089 m!677959))

(assert (=> b!724089 m!677807))

(declare-fun m!677961 () Bool)

(assert (=> b!724089 m!677961))

(assert (=> b!724093 m!677957))

(assert (=> b!724091 m!677957))

(assert (=> b!723936 d!99129))

(declare-fun b!724151 () Bool)

(declare-fun e!405582 () Bool)

(declare-fun call!34765 () Bool)

(assert (=> b!724151 (= e!405582 call!34765)))

(declare-fun d!99131 () Bool)

(declare-fun res!485691 () Bool)

(declare-fun e!405581 () Bool)

(assert (=> d!99131 (=> res!485691 e!405581)))

(assert (=> d!99131 (= res!485691 (bvsge j!159 (size!20025 a!3186)))))

(assert (=> d!99131 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!405581)))

(declare-fun bm!34762 () Bool)

(assert (=> bm!34762 (= call!34765 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!724152 () Bool)

(declare-fun e!405583 () Bool)

(assert (=> b!724152 (= e!405582 e!405583)))

(declare-fun lt!320731 () (_ BitVec 64))

(assert (=> b!724152 (= lt!320731 (select (arr!19604 a!3186) j!159))))

(declare-fun lt!320730 () Unit!24692)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!40962 (_ BitVec 64) (_ BitVec 32)) Unit!24692)

(assert (=> b!724152 (= lt!320730 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!320731 j!159))))

(assert (=> b!724152 (arrayContainsKey!0 a!3186 lt!320731 #b00000000000000000000000000000000)))

(declare-fun lt!320732 () Unit!24692)

(assert (=> b!724152 (= lt!320732 lt!320730)))

(declare-fun res!485692 () Bool)

(assert (=> b!724152 (= res!485692 (= (seekEntryOrOpen!0 (select (arr!19604 a!3186) j!159) a!3186 mask!3328) (Found!7201 j!159)))))

(assert (=> b!724152 (=> (not res!485692) (not e!405583))))

(declare-fun b!724153 () Bool)

(assert (=> b!724153 (= e!405583 call!34765)))

(declare-fun b!724154 () Bool)

(assert (=> b!724154 (= e!405581 e!405582)))

(declare-fun c!79602 () Bool)

(assert (=> b!724154 (= c!79602 (validKeyInArray!0 (select (arr!19604 a!3186) j!159)))))

(assert (= (and d!99131 (not res!485691)) b!724154))

(assert (= (and b!724154 c!79602) b!724152))

(assert (= (and b!724154 (not c!79602)) b!724151))

(assert (= (and b!724152 res!485692) b!724153))

(assert (= (or b!724153 b!724151) bm!34762))

(declare-fun m!677967 () Bool)

(assert (=> bm!34762 m!677967))

(assert (=> b!724152 m!677807))

(declare-fun m!677971 () Bool)

(assert (=> b!724152 m!677971))

(declare-fun m!677973 () Bool)

(assert (=> b!724152 m!677973))

(assert (=> b!724152 m!677807))

(assert (=> b!724152 m!677825))

(assert (=> b!724154 m!677807))

(assert (=> b!724154 m!677807))

(assert (=> b!724154 m!677811))

(assert (=> b!723947 d!99131))

(declare-fun d!99135 () Bool)

(assert (=> d!99135 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!320743 () Unit!24692)

(declare-fun choose!38 (array!40962 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24692)

(assert (=> d!99135 (= lt!320743 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!99135 (validMask!0 mask!3328)))

(assert (=> d!99135 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!320743)))

(declare-fun bs!20778 () Bool)

(assert (= bs!20778 d!99135))

(assert (=> bs!20778 m!677821))

(declare-fun m!677993 () Bool)

(assert (=> bs!20778 m!677993))

(assert (=> bs!20778 m!677815))

(assert (=> b!723947 d!99135))

(declare-fun d!99143 () Bool)

(declare-fun e!405597 () Bool)

(assert (=> d!99143 e!405597))

(declare-fun c!79610 () Bool)

(declare-fun lt!320745 () SeekEntryResult!7201)

(assert (=> d!99143 (= c!79610 (and ((_ is Intermediate!7201) lt!320745) (undefined!8013 lt!320745)))))

(declare-fun e!405594 () SeekEntryResult!7201)

(assert (=> d!99143 (= lt!320745 e!405594)))

(declare-fun c!79609 () Bool)

(assert (=> d!99143 (= c!79609 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!320744 () (_ BitVec 64))

(assert (=> d!99143 (= lt!320744 (select (arr!19604 lt!320665) (toIndex!0 lt!320666 mask!3328)))))

(assert (=> d!99143 (validMask!0 mask!3328)))

(assert (=> d!99143 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320666 mask!3328) lt!320666 lt!320665 mask!3328) lt!320745)))

(declare-fun b!724173 () Bool)

(declare-fun e!405598 () SeekEntryResult!7201)

(assert (=> b!724173 (= e!405598 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!320666 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!320666 lt!320665 mask!3328))))

(declare-fun b!724174 () Bool)

(declare-fun e!405596 () Bool)

(assert (=> b!724174 (= e!405597 e!405596)))

(declare-fun res!485701 () Bool)

(assert (=> b!724174 (= res!485701 (and ((_ is Intermediate!7201) lt!320745) (not (undefined!8013 lt!320745)) (bvslt (x!62173 lt!320745) #b01111111111111111111111111111110) (bvsge (x!62173 lt!320745) #b00000000000000000000000000000000) (bvsge (x!62173 lt!320745) #b00000000000000000000000000000000)))))

(assert (=> b!724174 (=> (not res!485701) (not e!405596))))

(declare-fun b!724175 () Bool)

(assert (=> b!724175 (and (bvsge (index!31174 lt!320745) #b00000000000000000000000000000000) (bvslt (index!31174 lt!320745) (size!20025 lt!320665)))))

(declare-fun e!405595 () Bool)

(assert (=> b!724175 (= e!405595 (= (select (arr!19604 lt!320665) (index!31174 lt!320745)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!724176 () Bool)

(assert (=> b!724176 (= e!405598 (Intermediate!7201 false (toIndex!0 lt!320666 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!724177 () Bool)

(assert (=> b!724177 (and (bvsge (index!31174 lt!320745) #b00000000000000000000000000000000) (bvslt (index!31174 lt!320745) (size!20025 lt!320665)))))

(declare-fun res!485702 () Bool)

(assert (=> b!724177 (= res!485702 (= (select (arr!19604 lt!320665) (index!31174 lt!320745)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!724177 (=> res!485702 e!405595)))

(declare-fun b!724178 () Bool)

(assert (=> b!724178 (= e!405597 (bvsge (x!62173 lt!320745) #b01111111111111111111111111111110))))

(declare-fun b!724179 () Bool)

(assert (=> b!724179 (= e!405594 (Intermediate!7201 true (toIndex!0 lt!320666 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!724180 () Bool)

(assert (=> b!724180 (= e!405594 e!405598)))

(declare-fun c!79611 () Bool)

(assert (=> b!724180 (= c!79611 (or (= lt!320744 lt!320666) (= (bvadd lt!320744 lt!320744) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!724181 () Bool)

(assert (=> b!724181 (and (bvsge (index!31174 lt!320745) #b00000000000000000000000000000000) (bvslt (index!31174 lt!320745) (size!20025 lt!320665)))))

(declare-fun res!485703 () Bool)

(assert (=> b!724181 (= res!485703 (= (select (arr!19604 lt!320665) (index!31174 lt!320745)) lt!320666))))

(assert (=> b!724181 (=> res!485703 e!405595)))

(assert (=> b!724181 (= e!405596 e!405595)))

(assert (= (and d!99143 c!79609) b!724179))

(assert (= (and d!99143 (not c!79609)) b!724180))

(assert (= (and b!724180 c!79611) b!724176))

(assert (= (and b!724180 (not c!79611)) b!724173))

(assert (= (and d!99143 c!79610) b!724178))

(assert (= (and d!99143 (not c!79610)) b!724174))

(assert (= (and b!724174 res!485701) b!724181))

(assert (= (and b!724181 (not res!485703)) b!724177))

(assert (= (and b!724177 (not res!485702)) b!724175))

(assert (=> d!99143 m!677829))

(declare-fun m!677995 () Bool)

(assert (=> d!99143 m!677995))

(assert (=> d!99143 m!677815))

(declare-fun m!677997 () Bool)

(assert (=> b!724181 m!677997))

(assert (=> b!724173 m!677829))

(declare-fun m!677999 () Bool)

(assert (=> b!724173 m!677999))

(assert (=> b!724173 m!677999))

(declare-fun m!678001 () Bool)

(assert (=> b!724173 m!678001))

(assert (=> b!724177 m!677997))

(assert (=> b!724175 m!677997))

(assert (=> b!723945 d!99143))

(declare-fun d!99147 () Bool)

(declare-fun lt!320751 () (_ BitVec 32))

(declare-fun lt!320750 () (_ BitVec 32))

(assert (=> d!99147 (= lt!320751 (bvmul (bvxor lt!320750 (bvlshr lt!320750 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99147 (= lt!320750 ((_ extract 31 0) (bvand (bvxor lt!320666 (bvlshr lt!320666 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99147 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!485659 (let ((h!14698 ((_ extract 31 0) (bvand (bvxor lt!320666 (bvlshr lt!320666 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!62177 (bvmul (bvxor h!14698 (bvlshr h!14698 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!62177 (bvlshr x!62177 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!485659 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!485659 #b00000000000000000000000000000000))))))

(assert (=> d!99147 (= (toIndex!0 lt!320666 mask!3328) (bvand (bvxor lt!320751 (bvlshr lt!320751 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!723945 d!99147))

(declare-fun d!99149 () Bool)

(declare-fun e!405607 () Bool)

(assert (=> d!99149 e!405607))

(declare-fun c!79616 () Bool)

(declare-fun lt!320753 () SeekEntryResult!7201)

(assert (=> d!99149 (= c!79616 (and ((_ is Intermediate!7201) lt!320753) (undefined!8013 lt!320753)))))

(declare-fun e!405604 () SeekEntryResult!7201)

(assert (=> d!99149 (= lt!320753 e!405604)))

(declare-fun c!79615 () Bool)

(assert (=> d!99149 (= c!79615 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!320752 () (_ BitVec 64))

(assert (=> d!99149 (= lt!320752 (select (arr!19604 lt!320665) index!1321))))

(assert (=> d!99149 (validMask!0 mask!3328)))

(assert (=> d!99149 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320666 lt!320665 mask!3328) lt!320753)))

(declare-fun b!724191 () Bool)

(declare-fun e!405608 () SeekEntryResult!7201)

(assert (=> b!724191 (= e!405608 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!320666 lt!320665 mask!3328))))

(declare-fun b!724192 () Bool)

(declare-fun e!405606 () Bool)

(assert (=> b!724192 (= e!405607 e!405606)))

(declare-fun res!485707 () Bool)

(assert (=> b!724192 (= res!485707 (and ((_ is Intermediate!7201) lt!320753) (not (undefined!8013 lt!320753)) (bvslt (x!62173 lt!320753) #b01111111111111111111111111111110) (bvsge (x!62173 lt!320753) #b00000000000000000000000000000000) (bvsge (x!62173 lt!320753) x!1131)))))

(assert (=> b!724192 (=> (not res!485707) (not e!405606))))

(declare-fun b!724193 () Bool)

(assert (=> b!724193 (and (bvsge (index!31174 lt!320753) #b00000000000000000000000000000000) (bvslt (index!31174 lt!320753) (size!20025 lt!320665)))))

(declare-fun e!405605 () Bool)

(assert (=> b!724193 (= e!405605 (= (select (arr!19604 lt!320665) (index!31174 lt!320753)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!724194 () Bool)

(assert (=> b!724194 (= e!405608 (Intermediate!7201 false index!1321 x!1131))))

(declare-fun b!724195 () Bool)

(assert (=> b!724195 (and (bvsge (index!31174 lt!320753) #b00000000000000000000000000000000) (bvslt (index!31174 lt!320753) (size!20025 lt!320665)))))

(declare-fun res!485708 () Bool)

(assert (=> b!724195 (= res!485708 (= (select (arr!19604 lt!320665) (index!31174 lt!320753)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!724195 (=> res!485708 e!405605)))

(declare-fun b!724196 () Bool)

(assert (=> b!724196 (= e!405607 (bvsge (x!62173 lt!320753) #b01111111111111111111111111111110))))

(declare-fun b!724197 () Bool)

(assert (=> b!724197 (= e!405604 (Intermediate!7201 true index!1321 x!1131))))

(declare-fun b!724198 () Bool)

(assert (=> b!724198 (= e!405604 e!405608)))

(declare-fun c!79617 () Bool)

(assert (=> b!724198 (= c!79617 (or (= lt!320752 lt!320666) (= (bvadd lt!320752 lt!320752) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!724199 () Bool)

(assert (=> b!724199 (and (bvsge (index!31174 lt!320753) #b00000000000000000000000000000000) (bvslt (index!31174 lt!320753) (size!20025 lt!320665)))))

(declare-fun res!485709 () Bool)

(assert (=> b!724199 (= res!485709 (= (select (arr!19604 lt!320665) (index!31174 lt!320753)) lt!320666))))

(assert (=> b!724199 (=> res!485709 e!405605)))

(assert (=> b!724199 (= e!405606 e!405605)))

(assert (= (and d!99149 c!79615) b!724197))

(assert (= (and d!99149 (not c!79615)) b!724198))

(assert (= (and b!724198 c!79617) b!724194))

(assert (= (and b!724198 (not c!79617)) b!724191))

(assert (= (and d!99149 c!79616) b!724196))

(assert (= (and d!99149 (not c!79616)) b!724192))

(assert (= (and b!724192 res!485707) b!724199))

(assert (= (and b!724199 (not res!485709)) b!724195))

(assert (= (and b!724195 (not res!485708)) b!724193))

(declare-fun m!678011 () Bool)

(assert (=> d!99149 m!678011))

(assert (=> d!99149 m!677815))

(declare-fun m!678013 () Bool)

(assert (=> b!724199 m!678013))

(assert (=> b!724191 m!677959))

(assert (=> b!724191 m!677959))

(declare-fun m!678015 () Bool)

(assert (=> b!724191 m!678015))

(assert (=> b!724195 m!678013))

(assert (=> b!724193 m!678013))

(assert (=> b!723945 d!99149))

(declare-fun d!99153 () Bool)

(declare-fun res!485717 () Bool)

(declare-fun e!405618 () Bool)

(assert (=> d!99153 (=> res!485717 e!405618)))

(assert (=> d!99153 (= res!485717 (= (select (arr!19604 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!99153 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!405618)))

(declare-fun b!724213 () Bool)

(declare-fun e!405619 () Bool)

(assert (=> b!724213 (= e!405618 e!405619)))

(declare-fun res!485718 () Bool)

(assert (=> b!724213 (=> (not res!485718) (not e!405619))))

(assert (=> b!724213 (= res!485718 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20025 a!3186)))))

(declare-fun b!724214 () Bool)

(assert (=> b!724214 (= e!405619 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!99153 (not res!485717)) b!724213))

(assert (= (and b!724213 res!485718) b!724214))

(assert (=> d!99153 m!677947))

(declare-fun m!678023 () Bool)

(assert (=> b!724214 m!678023))

(assert (=> b!723946 d!99153))

(declare-fun d!99159 () Bool)

(declare-fun lt!320782 () SeekEntryResult!7201)

(assert (=> d!99159 (and (or ((_ is Undefined!7201) lt!320782) (not ((_ is Found!7201) lt!320782)) (and (bvsge (index!31173 lt!320782) #b00000000000000000000000000000000) (bvslt (index!31173 lt!320782) (size!20025 a!3186)))) (or ((_ is Undefined!7201) lt!320782) ((_ is Found!7201) lt!320782) (not ((_ is MissingZero!7201) lt!320782)) (and (bvsge (index!31172 lt!320782) #b00000000000000000000000000000000) (bvslt (index!31172 lt!320782) (size!20025 a!3186)))) (or ((_ is Undefined!7201) lt!320782) ((_ is Found!7201) lt!320782) ((_ is MissingZero!7201) lt!320782) (not ((_ is MissingVacant!7201) lt!320782)) (and (bvsge (index!31175 lt!320782) #b00000000000000000000000000000000) (bvslt (index!31175 lt!320782) (size!20025 a!3186)))) (or ((_ is Undefined!7201) lt!320782) (ite ((_ is Found!7201) lt!320782) (= (select (arr!19604 a!3186) (index!31173 lt!320782)) (select (arr!19604 a!3186) j!159)) (ite ((_ is MissingZero!7201) lt!320782) (= (select (arr!19604 a!3186) (index!31172 lt!320782)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7201) lt!320782) (= (select (arr!19604 a!3186) (index!31175 lt!320782)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!405642 () SeekEntryResult!7201)

(assert (=> d!99159 (= lt!320782 e!405642)))

(declare-fun c!79639 () Bool)

(declare-fun lt!320780 () SeekEntryResult!7201)

(assert (=> d!99159 (= c!79639 (and ((_ is Intermediate!7201) lt!320780) (undefined!8013 lt!320780)))))

(assert (=> d!99159 (= lt!320780 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19604 a!3186) j!159) mask!3328) (select (arr!19604 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!99159 (validMask!0 mask!3328)))

(assert (=> d!99159 (= (seekEntryOrOpen!0 (select (arr!19604 a!3186) j!159) a!3186 mask!3328) lt!320782)))

(declare-fun b!724253 () Bool)

(assert (=> b!724253 (= e!405642 Undefined!7201)))

(declare-fun b!724254 () Bool)

(declare-fun c!79638 () Bool)

(declare-fun lt!320781 () (_ BitVec 64))

(assert (=> b!724254 (= c!79638 (= lt!320781 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!405643 () SeekEntryResult!7201)

(declare-fun e!405641 () SeekEntryResult!7201)

(assert (=> b!724254 (= e!405643 e!405641)))

(declare-fun b!724255 () Bool)

(assert (=> b!724255 (= e!405641 (seekKeyOrZeroReturnVacant!0 (x!62173 lt!320780) (index!31174 lt!320780) (index!31174 lt!320780) (select (arr!19604 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!724256 () Bool)

(assert (=> b!724256 (= e!405643 (Found!7201 (index!31174 lt!320780)))))

(declare-fun b!724257 () Bool)

(assert (=> b!724257 (= e!405642 e!405643)))

(assert (=> b!724257 (= lt!320781 (select (arr!19604 a!3186) (index!31174 lt!320780)))))

(declare-fun c!79640 () Bool)

(assert (=> b!724257 (= c!79640 (= lt!320781 (select (arr!19604 a!3186) j!159)))))

(declare-fun b!724258 () Bool)

(assert (=> b!724258 (= e!405641 (MissingZero!7201 (index!31174 lt!320780)))))

(assert (= (and d!99159 c!79639) b!724253))

(assert (= (and d!99159 (not c!79639)) b!724257))

(assert (= (and b!724257 c!79640) b!724256))

(assert (= (and b!724257 (not c!79640)) b!724254))

(assert (= (and b!724254 c!79638) b!724258))

(assert (= (and b!724254 (not c!79638)) b!724255))

(assert (=> d!99159 m!677807))

(assert (=> d!99159 m!677841))

(declare-fun m!678033 () Bool)

(assert (=> d!99159 m!678033))

(declare-fun m!678035 () Bool)

(assert (=> d!99159 m!678035))

(declare-fun m!678037 () Bool)

(assert (=> d!99159 m!678037))

(assert (=> d!99159 m!677841))

(assert (=> d!99159 m!677807))

(assert (=> d!99159 m!677843))

(assert (=> d!99159 m!677815))

(assert (=> b!724255 m!677807))

(declare-fun m!678039 () Bool)

(assert (=> b!724255 m!678039))

(declare-fun m!678041 () Bool)

(assert (=> b!724257 m!678041))

(assert (=> b!723935 d!99159))

(declare-fun b!724259 () Bool)

(declare-fun e!405645 () Bool)

(declare-fun call!34768 () Bool)

(assert (=> b!724259 (= e!405645 call!34768)))

(declare-fun d!99167 () Bool)

(declare-fun res!485723 () Bool)

(declare-fun e!405644 () Bool)

(assert (=> d!99167 (=> res!485723 e!405644)))

(assert (=> d!99167 (= res!485723 (bvsge #b00000000000000000000000000000000 (size!20025 a!3186)))))

(assert (=> d!99167 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!405644)))

(declare-fun bm!34765 () Bool)

(assert (=> bm!34765 (= call!34768 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!724260 () Bool)

(declare-fun e!405646 () Bool)

(assert (=> b!724260 (= e!405645 e!405646)))

(declare-fun lt!320784 () (_ BitVec 64))

(assert (=> b!724260 (= lt!320784 (select (arr!19604 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!320783 () Unit!24692)

(assert (=> b!724260 (= lt!320783 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!320784 #b00000000000000000000000000000000))))

(assert (=> b!724260 (arrayContainsKey!0 a!3186 lt!320784 #b00000000000000000000000000000000)))

(declare-fun lt!320785 () Unit!24692)

(assert (=> b!724260 (= lt!320785 lt!320783)))

(declare-fun res!485724 () Bool)

(assert (=> b!724260 (= res!485724 (= (seekEntryOrOpen!0 (select (arr!19604 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7201 #b00000000000000000000000000000000)))))

(assert (=> b!724260 (=> (not res!485724) (not e!405646))))

(declare-fun b!724261 () Bool)

(assert (=> b!724261 (= e!405646 call!34768)))

(declare-fun b!724262 () Bool)

(assert (=> b!724262 (= e!405644 e!405645)))

(declare-fun c!79641 () Bool)

(assert (=> b!724262 (= c!79641 (validKeyInArray!0 (select (arr!19604 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!99167 (not res!485723)) b!724262))

(assert (= (and b!724262 c!79641) b!724260))

(assert (= (and b!724262 (not c!79641)) b!724259))

(assert (= (and b!724260 res!485724) b!724261))

(assert (= (or b!724261 b!724259) bm!34765))

(declare-fun m!678043 () Bool)

(assert (=> bm!34765 m!678043))

(assert (=> b!724260 m!677947))

(declare-fun m!678045 () Bool)

(assert (=> b!724260 m!678045))

(declare-fun m!678047 () Bool)

(assert (=> b!724260 m!678047))

(assert (=> b!724260 m!677947))

(declare-fun m!678049 () Bool)

(assert (=> b!724260 m!678049))

(assert (=> b!724262 m!677947))

(assert (=> b!724262 m!677947))

(assert (=> b!724262 m!677949))

(assert (=> b!723944 d!99167))

(declare-fun d!99169 () Bool)

(declare-fun lt!320809 () SeekEntryResult!7201)

(assert (=> d!99169 (and (or ((_ is Undefined!7201) lt!320809) (not ((_ is Found!7201) lt!320809)) (and (bvsge (index!31173 lt!320809) #b00000000000000000000000000000000) (bvslt (index!31173 lt!320809) (size!20025 a!3186)))) (or ((_ is Undefined!7201) lt!320809) ((_ is Found!7201) lt!320809) (not ((_ is MissingVacant!7201) lt!320809)) (not (= (index!31175 lt!320809) resIntermediateIndex!5)) (and (bvsge (index!31175 lt!320809) #b00000000000000000000000000000000) (bvslt (index!31175 lt!320809) (size!20025 a!3186)))) (or ((_ is Undefined!7201) lt!320809) (ite ((_ is Found!7201) lt!320809) (= (select (arr!19604 a!3186) (index!31173 lt!320809)) (select (arr!19604 a!3186) j!159)) (and ((_ is MissingVacant!7201) lt!320809) (= (index!31175 lt!320809) resIntermediateIndex!5) (= (select (arr!19604 a!3186) (index!31175 lt!320809)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!405691 () SeekEntryResult!7201)

(assert (=> d!99169 (= lt!320809 e!405691)))

(declare-fun c!79665 () Bool)

(assert (=> d!99169 (= c!79665 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!320810 () (_ BitVec 64))

(assert (=> d!99169 (= lt!320810 (select (arr!19604 a!3186) index!1321))))

(assert (=> d!99169 (validMask!0 mask!3328)))

(assert (=> d!99169 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19604 a!3186) j!159) a!3186 mask!3328) lt!320809)))

(declare-fun b!724331 () Bool)

(declare-fun e!405692 () SeekEntryResult!7201)

(assert (=> b!724331 (= e!405692 (MissingVacant!7201 resIntermediateIndex!5))))

(declare-fun b!724332 () Bool)

(assert (=> b!724332 (= e!405692 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!19604 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!724333 () Bool)

(declare-fun c!79667 () Bool)

(assert (=> b!724333 (= c!79667 (= lt!320810 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!405693 () SeekEntryResult!7201)

(assert (=> b!724333 (= e!405693 e!405692)))

(declare-fun b!724334 () Bool)

(assert (=> b!724334 (= e!405691 Undefined!7201)))

(declare-fun b!724335 () Bool)

(assert (=> b!724335 (= e!405693 (Found!7201 index!1321))))

(declare-fun b!724336 () Bool)

(assert (=> b!724336 (= e!405691 e!405693)))

(declare-fun c!79666 () Bool)

(assert (=> b!724336 (= c!79666 (= lt!320810 (select (arr!19604 a!3186) j!159)))))

(assert (= (and d!99169 c!79665) b!724334))

(assert (= (and d!99169 (not c!79665)) b!724336))

(assert (= (and b!724336 c!79666) b!724335))

(assert (= (and b!724336 (not c!79666)) b!724333))

(assert (= (and b!724333 c!79667) b!724331))

(assert (= (and b!724333 (not c!79667)) b!724332))

(declare-fun m!678093 () Bool)

(assert (=> d!99169 m!678093))

(declare-fun m!678095 () Bool)

(assert (=> d!99169 m!678095))

(assert (=> d!99169 m!677955))

(assert (=> d!99169 m!677815))

(assert (=> b!724332 m!677959))

(assert (=> b!724332 m!677959))

(assert (=> b!724332 m!677807))

(declare-fun m!678097 () Bool)

(assert (=> b!724332 m!678097))

(assert (=> b!723941 d!99169))

(declare-fun d!99185 () Bool)

(declare-fun lt!320816 () SeekEntryResult!7201)

(assert (=> d!99185 (and (or ((_ is Undefined!7201) lt!320816) (not ((_ is Found!7201) lt!320816)) (and (bvsge (index!31173 lt!320816) #b00000000000000000000000000000000) (bvslt (index!31173 lt!320816) (size!20025 a!3186)))) (or ((_ is Undefined!7201) lt!320816) ((_ is Found!7201) lt!320816) (not ((_ is MissingZero!7201) lt!320816)) (and (bvsge (index!31172 lt!320816) #b00000000000000000000000000000000) (bvslt (index!31172 lt!320816) (size!20025 a!3186)))) (or ((_ is Undefined!7201) lt!320816) ((_ is Found!7201) lt!320816) ((_ is MissingZero!7201) lt!320816) (not ((_ is MissingVacant!7201) lt!320816)) (and (bvsge (index!31175 lt!320816) #b00000000000000000000000000000000) (bvslt (index!31175 lt!320816) (size!20025 a!3186)))) (or ((_ is Undefined!7201) lt!320816) (ite ((_ is Found!7201) lt!320816) (= (select (arr!19604 a!3186) (index!31173 lt!320816)) k0!2102) (ite ((_ is MissingZero!7201) lt!320816) (= (select (arr!19604 a!3186) (index!31172 lt!320816)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7201) lt!320816) (= (select (arr!19604 a!3186) (index!31175 lt!320816)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!405695 () SeekEntryResult!7201)

(assert (=> d!99185 (= lt!320816 e!405695)))

(declare-fun c!79669 () Bool)

(declare-fun lt!320814 () SeekEntryResult!7201)

(assert (=> d!99185 (= c!79669 (and ((_ is Intermediate!7201) lt!320814) (undefined!8013 lt!320814)))))

(assert (=> d!99185 (= lt!320814 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!99185 (validMask!0 mask!3328)))

(assert (=> d!99185 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!320816)))

(declare-fun b!724337 () Bool)

(assert (=> b!724337 (= e!405695 Undefined!7201)))

(declare-fun b!724338 () Bool)

(declare-fun c!79668 () Bool)

(declare-fun lt!320815 () (_ BitVec 64))

(assert (=> b!724338 (= c!79668 (= lt!320815 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!405696 () SeekEntryResult!7201)

(declare-fun e!405694 () SeekEntryResult!7201)

(assert (=> b!724338 (= e!405696 e!405694)))

(declare-fun b!724339 () Bool)

(assert (=> b!724339 (= e!405694 (seekKeyOrZeroReturnVacant!0 (x!62173 lt!320814) (index!31174 lt!320814) (index!31174 lt!320814) k0!2102 a!3186 mask!3328))))

(declare-fun b!724340 () Bool)

(assert (=> b!724340 (= e!405696 (Found!7201 (index!31174 lt!320814)))))

(declare-fun b!724341 () Bool)

(assert (=> b!724341 (= e!405695 e!405696)))

(assert (=> b!724341 (= lt!320815 (select (arr!19604 a!3186) (index!31174 lt!320814)))))

(declare-fun c!79670 () Bool)

(assert (=> b!724341 (= c!79670 (= lt!320815 k0!2102))))

(declare-fun b!724342 () Bool)

(assert (=> b!724342 (= e!405694 (MissingZero!7201 (index!31174 lt!320814)))))

(assert (= (and d!99185 c!79669) b!724337))

(assert (= (and d!99185 (not c!79669)) b!724341))

(assert (= (and b!724341 c!79670) b!724340))

(assert (= (and b!724341 (not c!79670)) b!724338))

(assert (= (and b!724338 c!79668) b!724342))

(assert (= (and b!724338 (not c!79668)) b!724339))

(declare-fun m!678101 () Bool)

(assert (=> d!99185 m!678101))

(declare-fun m!678103 () Bool)

(assert (=> d!99185 m!678103))

(declare-fun m!678105 () Bool)

(assert (=> d!99185 m!678105))

(declare-fun m!678107 () Bool)

(assert (=> d!99185 m!678107))

(assert (=> d!99185 m!678101))

(declare-fun m!678109 () Bool)

(assert (=> d!99185 m!678109))

(assert (=> d!99185 m!677815))

(declare-fun m!678111 () Bool)

(assert (=> b!724339 m!678111))

(declare-fun m!678113 () Bool)

(assert (=> b!724341 m!678113))

(assert (=> b!723942 d!99185))

(check-sat (not b!724173) (not b!724255) (not d!99129) (not d!99111) (not b!724191) (not d!99185) (not b!724084) (not d!99143) (not b!724260) (not d!99135) (not d!99149) (not bm!34765) (not b!724154) (not d!99159) (not b!724339) (not bm!34759) (not b!724214) (not bm!34762) (not b!724262) (not b!724332) (not b!724088) (not d!99169) (not b!724086) (not b!724065) (not b!724152) (not b!724089))
(check-sat)
