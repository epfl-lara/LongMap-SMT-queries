; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67448 () Bool)

(assert start!67448)

(declare-fun b!780528 () Bool)

(declare-fun e!434138 () Bool)

(declare-fun e!434137 () Bool)

(assert (=> b!780528 (= e!434138 e!434137)))

(declare-fun res!528208 () Bool)

(assert (=> b!780528 (=> (not res!528208) (not e!434137))))

(declare-datatypes ((SeekEntryResult!8005 0))(
  ( (MissingZero!8005 (index!34388 (_ BitVec 32))) (Found!8005 (index!34389 (_ BitVec 32))) (Intermediate!8005 (undefined!8817 Bool) (index!34390 (_ BitVec 32)) (x!65346 (_ BitVec 32))) (Undefined!8005) (MissingVacant!8005 (index!34391 (_ BitVec 32))) )
))
(declare-fun lt!347709 () SeekEntryResult!8005)

(declare-fun lt!347712 () SeekEntryResult!8005)

(assert (=> b!780528 (= res!528208 (= lt!347709 lt!347712))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!347707 () (_ BitVec 64))

(declare-datatypes ((array!42633 0))(
  ( (array!42634 (arr!20408 (Array (_ BitVec 32) (_ BitVec 64))) (size!20829 (_ BitVec 32))) )
))
(declare-fun lt!347705 () array!42633)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42633 (_ BitVec 32)) SeekEntryResult!8005)

(assert (=> b!780528 (= lt!347712 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347707 lt!347705 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!780528 (= lt!347709 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347707 mask!3328) lt!347707 lt!347705 mask!3328))))

(declare-fun a!3186 () array!42633)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!780528 (= lt!347707 (select (store (arr!20408 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!780528 (= lt!347705 (array!42634 (store (arr!20408 a!3186) i!1173 k0!2102) (size!20829 a!3186)))))

(declare-fun b!780529 () Bool)

(declare-fun res!528206 () Bool)

(declare-fun e!434134 () Bool)

(assert (=> b!780529 (=> (not res!528206) (not e!434134))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!780529 (= res!528206 (validKeyInArray!0 k0!2102))))

(declare-fun b!780530 () Bool)

(declare-datatypes ((Unit!26888 0))(
  ( (Unit!26889) )
))
(declare-fun e!434136 () Unit!26888)

(declare-fun Unit!26890 () Unit!26888)

(assert (=> b!780530 (= e!434136 Unit!26890)))

(declare-fun b!780531 () Bool)

(declare-fun e!434139 () Bool)

(assert (=> b!780531 (= e!434137 (not e!434139))))

(declare-fun res!528202 () Bool)

(assert (=> b!780531 (=> res!528202 e!434139)))

(get-info :version)

(assert (=> b!780531 (= res!528202 (or (not ((_ is Intermediate!8005) lt!347712)) (bvslt x!1131 (x!65346 lt!347712)) (not (= x!1131 (x!65346 lt!347712))) (not (= index!1321 (index!34390 lt!347712)))))))

(declare-fun e!434133 () Bool)

(assert (=> b!780531 e!434133))

(declare-fun res!528205 () Bool)

(assert (=> b!780531 (=> (not res!528205) (not e!434133))))

(declare-fun lt!347710 () SeekEntryResult!8005)

(declare-fun lt!347714 () SeekEntryResult!8005)

(assert (=> b!780531 (= res!528205 (= lt!347710 lt!347714))))

(assert (=> b!780531 (= lt!347714 (Found!8005 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42633 (_ BitVec 32)) SeekEntryResult!8005)

(assert (=> b!780531 (= lt!347710 (seekEntryOrOpen!0 (select (arr!20408 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42633 (_ BitVec 32)) Bool)

(assert (=> b!780531 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!347706 () Unit!26888)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42633 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26888)

(assert (=> b!780531 (= lt!347706 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!780532 () Bool)

(assert (=> b!780532 (= e!434139 (= (select (store (arr!20408 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!347711 () Unit!26888)

(assert (=> b!780532 (= lt!347711 e!434136)))

(declare-fun c!86570 () Bool)

(assert (=> b!780532 (= c!86570 (= (select (store (arr!20408 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!434140 () Bool)

(declare-fun b!780533 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42633 (_ BitVec 32)) SeekEntryResult!8005)

(assert (=> b!780533 (= e!434140 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20408 a!3186) j!159) a!3186 mask!3328) (Found!8005 j!159)))))

(declare-fun b!780534 () Bool)

(declare-fun res!528209 () Bool)

(assert (=> b!780534 (=> (not res!528209) (not e!434134))))

(assert (=> b!780534 (= res!528209 (and (= (size!20829 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20829 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20829 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!780535 () Bool)

(declare-fun res!528204 () Bool)

(declare-fun e!434132 () Bool)

(assert (=> b!780535 (=> (not res!528204) (not e!434132))))

(assert (=> b!780535 (= res!528204 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!780536 () Bool)

(declare-fun res!528203 () Bool)

(assert (=> b!780536 (=> (not res!528203) (not e!434138))))

(assert (=> b!780536 (= res!528203 e!434140)))

(declare-fun c!86571 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!780536 (= c!86571 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!780537 () Bool)

(declare-fun res!528211 () Bool)

(assert (=> b!780537 (=> res!528211 e!434139)))

(assert (=> b!780537 (= res!528211 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20408 a!3186) j!159) a!3186 mask!3328) lt!347714)))))

(declare-fun b!780538 () Bool)

(declare-fun res!528200 () Bool)

(assert (=> b!780538 (=> (not res!528200) (not e!434132))))

(assert (=> b!780538 (= res!528200 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20829 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20829 a!3186))))))

(declare-fun b!780539 () Bool)

(declare-fun res!528210 () Bool)

(assert (=> b!780539 (=> (not res!528210) (not e!434134))))

(declare-fun arrayContainsKey!0 (array!42633 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!780539 (= res!528210 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!780540 () Bool)

(declare-fun Unit!26891 () Unit!26888)

(assert (=> b!780540 (= e!434136 Unit!26891)))

(assert (=> b!780540 false))

(declare-fun res!528199 () Bool)

(assert (=> start!67448 (=> (not res!528199) (not e!434134))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67448 (= res!528199 (validMask!0 mask!3328))))

(assert (=> start!67448 e!434134))

(assert (=> start!67448 true))

(declare-fun array_inv!16291 (array!42633) Bool)

(assert (=> start!67448 (array_inv!16291 a!3186)))

(declare-fun b!780541 () Bool)

(assert (=> b!780541 (= e!434134 e!434132)))

(declare-fun res!528212 () Bool)

(assert (=> b!780541 (=> (not res!528212) (not e!434132))))

(declare-fun lt!347708 () SeekEntryResult!8005)

(assert (=> b!780541 (= res!528212 (or (= lt!347708 (MissingZero!8005 i!1173)) (= lt!347708 (MissingVacant!8005 i!1173))))))

(assert (=> b!780541 (= lt!347708 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!780542 () Bool)

(declare-fun res!528213 () Bool)

(assert (=> b!780542 (=> (not res!528213) (not e!434132))))

(declare-datatypes ((List!14449 0))(
  ( (Nil!14446) (Cons!14445 (h!15562 (_ BitVec 64)) (t!20755 List!14449)) )
))
(declare-fun arrayNoDuplicates!0 (array!42633 (_ BitVec 32) List!14449) Bool)

(assert (=> b!780542 (= res!528213 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14446))))

(declare-fun b!780543 () Bool)

(declare-fun res!528198 () Bool)

(assert (=> b!780543 (=> (not res!528198) (not e!434138))))

(assert (=> b!780543 (= res!528198 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20408 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!780544 () Bool)

(declare-fun res!528207 () Bool)

(assert (=> b!780544 (=> (not res!528207) (not e!434134))))

(assert (=> b!780544 (= res!528207 (validKeyInArray!0 (select (arr!20408 a!3186) j!159)))))

(declare-fun b!780545 () Bool)

(declare-fun res!528201 () Bool)

(assert (=> b!780545 (=> res!528201 e!434139)))

(assert (=> b!780545 (= res!528201 (= (select (store (arr!20408 a!3186) i!1173 k0!2102) index!1321) lt!347707))))

(declare-fun b!780546 () Bool)

(assert (=> b!780546 (= e!434133 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20408 a!3186) j!159) a!3186 mask!3328) lt!347714))))

(declare-fun b!780547 () Bool)

(assert (=> b!780547 (= e!434132 e!434138)))

(declare-fun res!528197 () Bool)

(assert (=> b!780547 (=> (not res!528197) (not e!434138))))

(declare-fun lt!347713 () SeekEntryResult!8005)

(assert (=> b!780547 (= res!528197 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20408 a!3186) j!159) mask!3328) (select (arr!20408 a!3186) j!159) a!3186 mask!3328) lt!347713))))

(assert (=> b!780547 (= lt!347713 (Intermediate!8005 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!780548 () Bool)

(assert (=> b!780548 (= e!434140 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20408 a!3186) j!159) a!3186 mask!3328) lt!347713))))

(assert (= (and start!67448 res!528199) b!780534))

(assert (= (and b!780534 res!528209) b!780544))

(assert (= (and b!780544 res!528207) b!780529))

(assert (= (and b!780529 res!528206) b!780539))

(assert (= (and b!780539 res!528210) b!780541))

(assert (= (and b!780541 res!528212) b!780535))

(assert (= (and b!780535 res!528204) b!780542))

(assert (= (and b!780542 res!528213) b!780538))

(assert (= (and b!780538 res!528200) b!780547))

(assert (= (and b!780547 res!528197) b!780543))

(assert (= (and b!780543 res!528198) b!780536))

(assert (= (and b!780536 c!86571) b!780548))

(assert (= (and b!780536 (not c!86571)) b!780533))

(assert (= (and b!780536 res!528203) b!780528))

(assert (= (and b!780528 res!528208) b!780531))

(assert (= (and b!780531 res!528205) b!780546))

(assert (= (and b!780531 (not res!528202)) b!780537))

(assert (= (and b!780537 (not res!528211)) b!780545))

(assert (= (and b!780545 (not res!528201)) b!780532))

(assert (= (and b!780532 c!86570) b!780540))

(assert (= (and b!780532 (not c!86570)) b!780530))

(declare-fun m!723243 () Bool)

(assert (=> b!780543 m!723243))

(declare-fun m!723245 () Bool)

(assert (=> b!780529 m!723245))

(declare-fun m!723247 () Bool)

(assert (=> b!780531 m!723247))

(assert (=> b!780531 m!723247))

(declare-fun m!723249 () Bool)

(assert (=> b!780531 m!723249))

(declare-fun m!723251 () Bool)

(assert (=> b!780531 m!723251))

(declare-fun m!723253 () Bool)

(assert (=> b!780531 m!723253))

(assert (=> b!780546 m!723247))

(assert (=> b!780546 m!723247))

(declare-fun m!723255 () Bool)

(assert (=> b!780546 m!723255))

(assert (=> b!780537 m!723247))

(assert (=> b!780537 m!723247))

(declare-fun m!723257 () Bool)

(assert (=> b!780537 m!723257))

(declare-fun m!723259 () Bool)

(assert (=> b!780532 m!723259))

(declare-fun m!723261 () Bool)

(assert (=> b!780532 m!723261))

(assert (=> b!780544 m!723247))

(assert (=> b!780544 m!723247))

(declare-fun m!723263 () Bool)

(assert (=> b!780544 m!723263))

(declare-fun m!723265 () Bool)

(assert (=> start!67448 m!723265))

(declare-fun m!723267 () Bool)

(assert (=> start!67448 m!723267))

(declare-fun m!723269 () Bool)

(assert (=> b!780539 m!723269))

(assert (=> b!780547 m!723247))

(assert (=> b!780547 m!723247))

(declare-fun m!723271 () Bool)

(assert (=> b!780547 m!723271))

(assert (=> b!780547 m!723271))

(assert (=> b!780547 m!723247))

(declare-fun m!723273 () Bool)

(assert (=> b!780547 m!723273))

(declare-fun m!723275 () Bool)

(assert (=> b!780541 m!723275))

(declare-fun m!723277 () Bool)

(assert (=> b!780528 m!723277))

(declare-fun m!723279 () Bool)

(assert (=> b!780528 m!723279))

(assert (=> b!780528 m!723277))

(assert (=> b!780528 m!723259))

(declare-fun m!723281 () Bool)

(assert (=> b!780528 m!723281))

(declare-fun m!723283 () Bool)

(assert (=> b!780528 m!723283))

(assert (=> b!780548 m!723247))

(assert (=> b!780548 m!723247))

(declare-fun m!723285 () Bool)

(assert (=> b!780548 m!723285))

(assert (=> b!780545 m!723259))

(assert (=> b!780545 m!723261))

(declare-fun m!723287 () Bool)

(assert (=> b!780542 m!723287))

(declare-fun m!723289 () Bool)

(assert (=> b!780535 m!723289))

(assert (=> b!780533 m!723247))

(assert (=> b!780533 m!723247))

(assert (=> b!780533 m!723257))

(check-sat (not b!780541) (not start!67448) (not b!780529) (not b!780542) (not b!780528) (not b!780533) (not b!780548) (not b!780544) (not b!780546) (not b!780535) (not b!780539) (not b!780547) (not b!780537) (not b!780531))
(check-sat)
(get-model)

(declare-fun b!780687 () Bool)

(declare-fun e!434201 () SeekEntryResult!8005)

(assert (=> b!780687 (= e!434201 Undefined!8005)))

(declare-fun b!780688 () Bool)

(declare-fun e!434202 () SeekEntryResult!8005)

(declare-fun lt!347783 () SeekEntryResult!8005)

(assert (=> b!780688 (= e!434202 (MissingZero!8005 (index!34390 lt!347783)))))

(declare-fun b!780689 () Bool)

(assert (=> b!780689 (= e!434202 (seekKeyOrZeroReturnVacant!0 (x!65346 lt!347783) (index!34390 lt!347783) (index!34390 lt!347783) k0!2102 a!3186 mask!3328))))

(declare-fun d!102327 () Bool)

(declare-fun lt!347781 () SeekEntryResult!8005)

(assert (=> d!102327 (and (or ((_ is Undefined!8005) lt!347781) (not ((_ is Found!8005) lt!347781)) (and (bvsge (index!34389 lt!347781) #b00000000000000000000000000000000) (bvslt (index!34389 lt!347781) (size!20829 a!3186)))) (or ((_ is Undefined!8005) lt!347781) ((_ is Found!8005) lt!347781) (not ((_ is MissingZero!8005) lt!347781)) (and (bvsge (index!34388 lt!347781) #b00000000000000000000000000000000) (bvslt (index!34388 lt!347781) (size!20829 a!3186)))) (or ((_ is Undefined!8005) lt!347781) ((_ is Found!8005) lt!347781) ((_ is MissingZero!8005) lt!347781) (not ((_ is MissingVacant!8005) lt!347781)) (and (bvsge (index!34391 lt!347781) #b00000000000000000000000000000000) (bvslt (index!34391 lt!347781) (size!20829 a!3186)))) (or ((_ is Undefined!8005) lt!347781) (ite ((_ is Found!8005) lt!347781) (= (select (arr!20408 a!3186) (index!34389 lt!347781)) k0!2102) (ite ((_ is MissingZero!8005) lt!347781) (= (select (arr!20408 a!3186) (index!34388 lt!347781)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8005) lt!347781) (= (select (arr!20408 a!3186) (index!34391 lt!347781)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102327 (= lt!347781 e!434201)))

(declare-fun c!86591 () Bool)

(assert (=> d!102327 (= c!86591 (and ((_ is Intermediate!8005) lt!347783) (undefined!8817 lt!347783)))))

(assert (=> d!102327 (= lt!347783 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!102327 (validMask!0 mask!3328)))

(assert (=> d!102327 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!347781)))

(declare-fun b!780690 () Bool)

(declare-fun c!86592 () Bool)

(declare-fun lt!347782 () (_ BitVec 64))

(assert (=> b!780690 (= c!86592 (= lt!347782 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!434203 () SeekEntryResult!8005)

(assert (=> b!780690 (= e!434203 e!434202)))

(declare-fun b!780691 () Bool)

(assert (=> b!780691 (= e!434201 e!434203)))

(assert (=> b!780691 (= lt!347782 (select (arr!20408 a!3186) (index!34390 lt!347783)))))

(declare-fun c!86590 () Bool)

(assert (=> b!780691 (= c!86590 (= lt!347782 k0!2102))))

(declare-fun b!780692 () Bool)

(assert (=> b!780692 (= e!434203 (Found!8005 (index!34390 lt!347783)))))

(assert (= (and d!102327 c!86591) b!780687))

(assert (= (and d!102327 (not c!86591)) b!780691))

(assert (= (and b!780691 c!86590) b!780692))

(assert (= (and b!780691 (not c!86590)) b!780690))

(assert (= (and b!780690 c!86592) b!780688))

(assert (= (and b!780690 (not c!86592)) b!780689))

(declare-fun m!723387 () Bool)

(assert (=> b!780689 m!723387))

(declare-fun m!723389 () Bool)

(assert (=> d!102327 m!723389))

(assert (=> d!102327 m!723265))

(declare-fun m!723391 () Bool)

(assert (=> d!102327 m!723391))

(declare-fun m!723393 () Bool)

(assert (=> d!102327 m!723393))

(assert (=> d!102327 m!723391))

(declare-fun m!723395 () Bool)

(assert (=> d!102327 m!723395))

(declare-fun m!723397 () Bool)

(assert (=> d!102327 m!723397))

(declare-fun m!723399 () Bool)

(assert (=> b!780691 m!723399))

(assert (=> b!780541 d!102327))

(declare-fun b!780703 () Bool)

(declare-fun e!434212 () Bool)

(declare-fun call!35212 () Bool)

(assert (=> b!780703 (= e!434212 call!35212)))

(declare-fun d!102329 () Bool)

(declare-fun res!528323 () Bool)

(declare-fun e!434215 () Bool)

(assert (=> d!102329 (=> res!528323 e!434215)))

(assert (=> d!102329 (= res!528323 (bvsge #b00000000000000000000000000000000 (size!20829 a!3186)))))

(assert (=> d!102329 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14446) e!434215)))

(declare-fun b!780704 () Bool)

(assert (=> b!780704 (= e!434212 call!35212)))

(declare-fun b!780705 () Bool)

(declare-fun e!434214 () Bool)

(assert (=> b!780705 (= e!434215 e!434214)))

(declare-fun res!528324 () Bool)

(assert (=> b!780705 (=> (not res!528324) (not e!434214))))

(declare-fun e!434213 () Bool)

(assert (=> b!780705 (= res!528324 (not e!434213))))

(declare-fun res!528322 () Bool)

(assert (=> b!780705 (=> (not res!528322) (not e!434213))))

(assert (=> b!780705 (= res!528322 (validKeyInArray!0 (select (arr!20408 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!780706 () Bool)

(assert (=> b!780706 (= e!434214 e!434212)))

(declare-fun c!86595 () Bool)

(assert (=> b!780706 (= c!86595 (validKeyInArray!0 (select (arr!20408 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!35209 () Bool)

(assert (=> bm!35209 (= call!35212 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!86595 (Cons!14445 (select (arr!20408 a!3186) #b00000000000000000000000000000000) Nil!14446) Nil!14446)))))

(declare-fun b!780707 () Bool)

(declare-fun contains!4085 (List!14449 (_ BitVec 64)) Bool)

(assert (=> b!780707 (= e!434213 (contains!4085 Nil!14446 (select (arr!20408 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!102329 (not res!528323)) b!780705))

(assert (= (and b!780705 res!528322) b!780707))

(assert (= (and b!780705 res!528324) b!780706))

(assert (= (and b!780706 c!86595) b!780704))

(assert (= (and b!780706 (not c!86595)) b!780703))

(assert (= (or b!780704 b!780703) bm!35209))

(declare-fun m!723401 () Bool)

(assert (=> b!780705 m!723401))

(assert (=> b!780705 m!723401))

(declare-fun m!723403 () Bool)

(assert (=> b!780705 m!723403))

(assert (=> b!780706 m!723401))

(assert (=> b!780706 m!723401))

(assert (=> b!780706 m!723403))

(assert (=> bm!35209 m!723401))

(declare-fun m!723405 () Bool)

(assert (=> bm!35209 m!723405))

(assert (=> b!780707 m!723401))

(assert (=> b!780707 m!723401))

(declare-fun m!723407 () Bool)

(assert (=> b!780707 m!723407))

(assert (=> b!780542 d!102329))

(declare-fun b!780708 () Bool)

(declare-fun e!434216 () SeekEntryResult!8005)

(assert (=> b!780708 (= e!434216 Undefined!8005)))

(declare-fun b!780709 () Bool)

(declare-fun e!434217 () SeekEntryResult!8005)

(declare-fun lt!347786 () SeekEntryResult!8005)

(assert (=> b!780709 (= e!434217 (MissingZero!8005 (index!34390 lt!347786)))))

(declare-fun b!780710 () Bool)

(assert (=> b!780710 (= e!434217 (seekKeyOrZeroReturnVacant!0 (x!65346 lt!347786) (index!34390 lt!347786) (index!34390 lt!347786) (select (arr!20408 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!102331 () Bool)

(declare-fun lt!347784 () SeekEntryResult!8005)

(assert (=> d!102331 (and (or ((_ is Undefined!8005) lt!347784) (not ((_ is Found!8005) lt!347784)) (and (bvsge (index!34389 lt!347784) #b00000000000000000000000000000000) (bvslt (index!34389 lt!347784) (size!20829 a!3186)))) (or ((_ is Undefined!8005) lt!347784) ((_ is Found!8005) lt!347784) (not ((_ is MissingZero!8005) lt!347784)) (and (bvsge (index!34388 lt!347784) #b00000000000000000000000000000000) (bvslt (index!34388 lt!347784) (size!20829 a!3186)))) (or ((_ is Undefined!8005) lt!347784) ((_ is Found!8005) lt!347784) ((_ is MissingZero!8005) lt!347784) (not ((_ is MissingVacant!8005) lt!347784)) (and (bvsge (index!34391 lt!347784) #b00000000000000000000000000000000) (bvslt (index!34391 lt!347784) (size!20829 a!3186)))) (or ((_ is Undefined!8005) lt!347784) (ite ((_ is Found!8005) lt!347784) (= (select (arr!20408 a!3186) (index!34389 lt!347784)) (select (arr!20408 a!3186) j!159)) (ite ((_ is MissingZero!8005) lt!347784) (= (select (arr!20408 a!3186) (index!34388 lt!347784)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8005) lt!347784) (= (select (arr!20408 a!3186) (index!34391 lt!347784)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102331 (= lt!347784 e!434216)))

(declare-fun c!86597 () Bool)

(assert (=> d!102331 (= c!86597 (and ((_ is Intermediate!8005) lt!347786) (undefined!8817 lt!347786)))))

(assert (=> d!102331 (= lt!347786 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20408 a!3186) j!159) mask!3328) (select (arr!20408 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!102331 (validMask!0 mask!3328)))

(assert (=> d!102331 (= (seekEntryOrOpen!0 (select (arr!20408 a!3186) j!159) a!3186 mask!3328) lt!347784)))

(declare-fun b!780711 () Bool)

(declare-fun c!86598 () Bool)

(declare-fun lt!347785 () (_ BitVec 64))

(assert (=> b!780711 (= c!86598 (= lt!347785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!434218 () SeekEntryResult!8005)

(assert (=> b!780711 (= e!434218 e!434217)))

(declare-fun b!780712 () Bool)

(assert (=> b!780712 (= e!434216 e!434218)))

(assert (=> b!780712 (= lt!347785 (select (arr!20408 a!3186) (index!34390 lt!347786)))))

(declare-fun c!86596 () Bool)

(assert (=> b!780712 (= c!86596 (= lt!347785 (select (arr!20408 a!3186) j!159)))))

(declare-fun b!780713 () Bool)

(assert (=> b!780713 (= e!434218 (Found!8005 (index!34390 lt!347786)))))

(assert (= (and d!102331 c!86597) b!780708))

(assert (= (and d!102331 (not c!86597)) b!780712))

(assert (= (and b!780712 c!86596) b!780713))

(assert (= (and b!780712 (not c!86596)) b!780711))

(assert (= (and b!780711 c!86598) b!780709))

(assert (= (and b!780711 (not c!86598)) b!780710))

(assert (=> b!780710 m!723247))

(declare-fun m!723409 () Bool)

(assert (=> b!780710 m!723409))

(declare-fun m!723411 () Bool)

(assert (=> d!102331 m!723411))

(assert (=> d!102331 m!723265))

(assert (=> d!102331 m!723247))

(assert (=> d!102331 m!723271))

(declare-fun m!723413 () Bool)

(assert (=> d!102331 m!723413))

(assert (=> d!102331 m!723271))

(assert (=> d!102331 m!723247))

(assert (=> d!102331 m!723273))

(declare-fun m!723415 () Bool)

(assert (=> d!102331 m!723415))

(declare-fun m!723417 () Bool)

(assert (=> b!780712 m!723417))

(assert (=> b!780531 d!102331))

(declare-fun call!35215 () Bool)

(declare-fun bm!35212 () Bool)

(assert (=> bm!35212 (= call!35215 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!780726 () Bool)

(declare-fun e!434232 () Bool)

(assert (=> b!780726 (= e!434232 call!35215)))

(declare-fun d!102333 () Bool)

(declare-fun res!528336 () Bool)

(declare-fun e!434233 () Bool)

(assert (=> d!102333 (=> res!528336 e!434233)))

(assert (=> d!102333 (= res!528336 (bvsge j!159 (size!20829 a!3186)))))

(assert (=> d!102333 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!434233)))

(declare-fun b!780727 () Bool)

(declare-fun e!434231 () Bool)

(assert (=> b!780727 (= e!434231 call!35215)))

(declare-fun b!780728 () Bool)

(assert (=> b!780728 (= e!434233 e!434231)))

(declare-fun c!86601 () Bool)

(assert (=> b!780728 (= c!86601 (validKeyInArray!0 (select (arr!20408 a!3186) j!159)))))

(declare-fun b!780729 () Bool)

(assert (=> b!780729 (= e!434231 e!434232)))

(declare-fun lt!347794 () (_ BitVec 64))

(assert (=> b!780729 (= lt!347794 (select (arr!20408 a!3186) j!159))))

(declare-fun lt!347795 () Unit!26888)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42633 (_ BitVec 64) (_ BitVec 32)) Unit!26888)

(assert (=> b!780729 (= lt!347795 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!347794 j!159))))

(assert (=> b!780729 (arrayContainsKey!0 a!3186 lt!347794 #b00000000000000000000000000000000)))

(declare-fun lt!347793 () Unit!26888)

(assert (=> b!780729 (= lt!347793 lt!347795)))

(declare-fun res!528335 () Bool)

(assert (=> b!780729 (= res!528335 (= (seekEntryOrOpen!0 (select (arr!20408 a!3186) j!159) a!3186 mask!3328) (Found!8005 j!159)))))

(assert (=> b!780729 (=> (not res!528335) (not e!434232))))

(assert (= (and d!102333 (not res!528336)) b!780728))

(assert (= (and b!780728 c!86601) b!780729))

(assert (= (and b!780728 (not c!86601)) b!780727))

(assert (= (and b!780729 res!528335) b!780726))

(assert (= (or b!780726 b!780727) bm!35212))

(declare-fun m!723419 () Bool)

(assert (=> bm!35212 m!723419))

(assert (=> b!780728 m!723247))

(assert (=> b!780728 m!723247))

(assert (=> b!780728 m!723263))

(assert (=> b!780729 m!723247))

(declare-fun m!723421 () Bool)

(assert (=> b!780729 m!723421))

(declare-fun m!723423 () Bool)

(assert (=> b!780729 m!723423))

(assert (=> b!780729 m!723247))

(assert (=> b!780729 m!723249))

(assert (=> b!780531 d!102333))

(declare-fun d!102337 () Bool)

(assert (=> d!102337 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!347798 () Unit!26888)

(declare-fun choose!38 (array!42633 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26888)

(assert (=> d!102337 (= lt!347798 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!102337 (validMask!0 mask!3328)))

(assert (=> d!102337 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!347798)))

(declare-fun bs!21699 () Bool)

(assert (= bs!21699 d!102337))

(assert (=> bs!21699 m!723251))

(declare-fun m!723433 () Bool)

(assert (=> bs!21699 m!723433))

(assert (=> bs!21699 m!723265))

(assert (=> b!780531 d!102337))

(declare-fun d!102343 () Bool)

(assert (=> d!102343 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!67448 d!102343))

(declare-fun d!102347 () Bool)

(assert (=> d!102347 (= (array_inv!16291 a!3186) (bvsge (size!20829 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!67448 d!102347))

(declare-fun b!780789 () Bool)

(declare-fun e!434275 () SeekEntryResult!8005)

(assert (=> b!780789 (= e!434275 (Intermediate!8005 false index!1321 x!1131))))

(declare-fun b!780790 () Bool)

(declare-fun lt!347810 () SeekEntryResult!8005)

(assert (=> b!780790 (and (bvsge (index!34390 lt!347810) #b00000000000000000000000000000000) (bvslt (index!34390 lt!347810) (size!20829 a!3186)))))

(declare-fun res!528360 () Bool)

(assert (=> b!780790 (= res!528360 (= (select (arr!20408 a!3186) (index!34390 lt!347810)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!434274 () Bool)

(assert (=> b!780790 (=> res!528360 e!434274)))

(declare-fun b!780791 () Bool)

(declare-fun e!434271 () SeekEntryResult!8005)

(assert (=> b!780791 (= e!434271 (Intermediate!8005 true index!1321 x!1131))))

(declare-fun d!102349 () Bool)

(declare-fun e!434273 () Bool)

(assert (=> d!102349 e!434273))

(declare-fun c!86620 () Bool)

(assert (=> d!102349 (= c!86620 (and ((_ is Intermediate!8005) lt!347810) (undefined!8817 lt!347810)))))

(assert (=> d!102349 (= lt!347810 e!434271)))

(declare-fun c!86621 () Bool)

(assert (=> d!102349 (= c!86621 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!347809 () (_ BitVec 64))

(assert (=> d!102349 (= lt!347809 (select (arr!20408 a!3186) index!1321))))

(assert (=> d!102349 (validMask!0 mask!3328)))

(assert (=> d!102349 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20408 a!3186) j!159) a!3186 mask!3328) lt!347810)))

(declare-fun b!780792 () Bool)

(declare-fun e!434272 () Bool)

(assert (=> b!780792 (= e!434273 e!434272)))

(declare-fun res!528359 () Bool)

(assert (=> b!780792 (= res!528359 (and ((_ is Intermediate!8005) lt!347810) (not (undefined!8817 lt!347810)) (bvslt (x!65346 lt!347810) #b01111111111111111111111111111110) (bvsge (x!65346 lt!347810) #b00000000000000000000000000000000) (bvsge (x!65346 lt!347810) x!1131)))))

(assert (=> b!780792 (=> (not res!528359) (not e!434272))))

(declare-fun b!780793 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!780793 (= e!434275 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20408 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!780794 () Bool)

(assert (=> b!780794 (and (bvsge (index!34390 lt!347810) #b00000000000000000000000000000000) (bvslt (index!34390 lt!347810) (size!20829 a!3186)))))

(assert (=> b!780794 (= e!434274 (= (select (arr!20408 a!3186) (index!34390 lt!347810)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!780795 () Bool)

(assert (=> b!780795 (= e!434271 e!434275)))

(declare-fun c!86622 () Bool)

(assert (=> b!780795 (= c!86622 (or (= lt!347809 (select (arr!20408 a!3186) j!159)) (= (bvadd lt!347809 lt!347809) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!780796 () Bool)

(assert (=> b!780796 (and (bvsge (index!34390 lt!347810) #b00000000000000000000000000000000) (bvslt (index!34390 lt!347810) (size!20829 a!3186)))))

(declare-fun res!528358 () Bool)

(assert (=> b!780796 (= res!528358 (= (select (arr!20408 a!3186) (index!34390 lt!347810)) (select (arr!20408 a!3186) j!159)))))

(assert (=> b!780796 (=> res!528358 e!434274)))

(assert (=> b!780796 (= e!434272 e!434274)))

(declare-fun b!780797 () Bool)

(assert (=> b!780797 (= e!434273 (bvsge (x!65346 lt!347810) #b01111111111111111111111111111110))))

(assert (= (and d!102349 c!86621) b!780791))

(assert (= (and d!102349 (not c!86621)) b!780795))

(assert (= (and b!780795 c!86622) b!780789))

(assert (= (and b!780795 (not c!86622)) b!780793))

(assert (= (and d!102349 c!86620) b!780797))

(assert (= (and d!102349 (not c!86620)) b!780792))

(assert (= (and b!780792 res!528359) b!780796))

(assert (= (and b!780796 (not res!528358)) b!780790))

(assert (= (and b!780790 (not res!528360)) b!780794))

(declare-fun m!723449 () Bool)

(assert (=> b!780793 m!723449))

(assert (=> b!780793 m!723449))

(assert (=> b!780793 m!723247))

(declare-fun m!723451 () Bool)

(assert (=> b!780793 m!723451))

(declare-fun m!723453 () Bool)

(assert (=> b!780794 m!723453))

(declare-fun m!723455 () Bool)

(assert (=> d!102349 m!723455))

(assert (=> d!102349 m!723265))

(assert (=> b!780796 m!723453))

(assert (=> b!780790 m!723453))

(assert (=> b!780548 d!102349))

(declare-fun d!102357 () Bool)

(assert (=> d!102357 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!780529 d!102357))

(declare-fun d!102359 () Bool)

(declare-fun res!528365 () Bool)

(declare-fun e!434292 () Bool)

(assert (=> d!102359 (=> res!528365 e!434292)))

(assert (=> d!102359 (= res!528365 (= (select (arr!20408 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!102359 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!434292)))

(declare-fun b!780826 () Bool)

(declare-fun e!434293 () Bool)

(assert (=> b!780826 (= e!434292 e!434293)))

(declare-fun res!528366 () Bool)

(assert (=> b!780826 (=> (not res!528366) (not e!434293))))

(assert (=> b!780826 (= res!528366 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20829 a!3186)))))

(declare-fun b!780827 () Bool)

(assert (=> b!780827 (= e!434293 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!102359 (not res!528365)) b!780826))

(assert (= (and b!780826 res!528366) b!780827))

(assert (=> d!102359 m!723401))

(declare-fun m!723457 () Bool)

(assert (=> b!780827 m!723457))

(assert (=> b!780539 d!102359))

(declare-fun b!780834 () Bool)

(declare-fun e!434302 () SeekEntryResult!8005)

(assert (=> b!780834 (= e!434302 (Intermediate!8005 false index!1321 x!1131))))

(declare-fun b!780835 () Bool)

(declare-fun lt!347820 () SeekEntryResult!8005)

(assert (=> b!780835 (and (bvsge (index!34390 lt!347820) #b00000000000000000000000000000000) (bvslt (index!34390 lt!347820) (size!20829 lt!347705)))))

(declare-fun res!528375 () Bool)

(assert (=> b!780835 (= res!528375 (= (select (arr!20408 lt!347705) (index!34390 lt!347820)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!434301 () Bool)

(assert (=> b!780835 (=> res!528375 e!434301)))

(declare-fun b!780836 () Bool)

(declare-fun e!434298 () SeekEntryResult!8005)

(assert (=> b!780836 (= e!434298 (Intermediate!8005 true index!1321 x!1131))))

(declare-fun d!102361 () Bool)

(declare-fun e!434300 () Bool)

(assert (=> d!102361 e!434300))

(declare-fun c!86635 () Bool)

(assert (=> d!102361 (= c!86635 (and ((_ is Intermediate!8005) lt!347820) (undefined!8817 lt!347820)))))

(assert (=> d!102361 (= lt!347820 e!434298)))

(declare-fun c!86636 () Bool)

(assert (=> d!102361 (= c!86636 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!347819 () (_ BitVec 64))

(assert (=> d!102361 (= lt!347819 (select (arr!20408 lt!347705) index!1321))))

(assert (=> d!102361 (validMask!0 mask!3328)))

(assert (=> d!102361 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347707 lt!347705 mask!3328) lt!347820)))

(declare-fun b!780837 () Bool)

(declare-fun e!434299 () Bool)

(assert (=> b!780837 (= e!434300 e!434299)))

(declare-fun res!528374 () Bool)

(assert (=> b!780837 (= res!528374 (and ((_ is Intermediate!8005) lt!347820) (not (undefined!8817 lt!347820)) (bvslt (x!65346 lt!347820) #b01111111111111111111111111111110) (bvsge (x!65346 lt!347820) #b00000000000000000000000000000000) (bvsge (x!65346 lt!347820) x!1131)))))

(assert (=> b!780837 (=> (not res!528374) (not e!434299))))

(declare-fun b!780838 () Bool)

(assert (=> b!780838 (= e!434302 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!347707 lt!347705 mask!3328))))

(declare-fun b!780839 () Bool)

(assert (=> b!780839 (and (bvsge (index!34390 lt!347820) #b00000000000000000000000000000000) (bvslt (index!34390 lt!347820) (size!20829 lt!347705)))))

(assert (=> b!780839 (= e!434301 (= (select (arr!20408 lt!347705) (index!34390 lt!347820)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!780840 () Bool)

(assert (=> b!780840 (= e!434298 e!434302)))

(declare-fun c!86637 () Bool)

(assert (=> b!780840 (= c!86637 (or (= lt!347819 lt!347707) (= (bvadd lt!347819 lt!347819) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!780841 () Bool)

(assert (=> b!780841 (and (bvsge (index!34390 lt!347820) #b00000000000000000000000000000000) (bvslt (index!34390 lt!347820) (size!20829 lt!347705)))))

(declare-fun res!528373 () Bool)

(assert (=> b!780841 (= res!528373 (= (select (arr!20408 lt!347705) (index!34390 lt!347820)) lt!347707))))

(assert (=> b!780841 (=> res!528373 e!434301)))

(assert (=> b!780841 (= e!434299 e!434301)))

(declare-fun b!780842 () Bool)

(assert (=> b!780842 (= e!434300 (bvsge (x!65346 lt!347820) #b01111111111111111111111111111110))))

(assert (= (and d!102361 c!86636) b!780836))

(assert (= (and d!102361 (not c!86636)) b!780840))

(assert (= (and b!780840 c!86637) b!780834))

(assert (= (and b!780840 (not c!86637)) b!780838))

(assert (= (and d!102361 c!86635) b!780842))

(assert (= (and d!102361 (not c!86635)) b!780837))

(assert (= (and b!780837 res!528374) b!780841))

(assert (= (and b!780841 (not res!528373)) b!780835))

(assert (= (and b!780835 (not res!528375)) b!780839))

(assert (=> b!780838 m!723449))

(assert (=> b!780838 m!723449))

(declare-fun m!723459 () Bool)

(assert (=> b!780838 m!723459))

(declare-fun m!723461 () Bool)

(assert (=> b!780839 m!723461))

(declare-fun m!723463 () Bool)

(assert (=> d!102361 m!723463))

(assert (=> d!102361 m!723265))

(assert (=> b!780841 m!723461))

(assert (=> b!780835 m!723461))

(assert (=> b!780528 d!102361))

(declare-fun b!780843 () Bool)

(declare-fun e!434307 () SeekEntryResult!8005)

(assert (=> b!780843 (= e!434307 (Intermediate!8005 false (toIndex!0 lt!347707 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!780844 () Bool)

(declare-fun lt!347822 () SeekEntryResult!8005)

(assert (=> b!780844 (and (bvsge (index!34390 lt!347822) #b00000000000000000000000000000000) (bvslt (index!34390 lt!347822) (size!20829 lt!347705)))))

(declare-fun res!528378 () Bool)

(assert (=> b!780844 (= res!528378 (= (select (arr!20408 lt!347705) (index!34390 lt!347822)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!434306 () Bool)

(assert (=> b!780844 (=> res!528378 e!434306)))

(declare-fun b!780845 () Bool)

(declare-fun e!434303 () SeekEntryResult!8005)

(assert (=> b!780845 (= e!434303 (Intermediate!8005 true (toIndex!0 lt!347707 mask!3328) #b00000000000000000000000000000000))))

(declare-fun d!102363 () Bool)

(declare-fun e!434305 () Bool)

(assert (=> d!102363 e!434305))

(declare-fun c!86638 () Bool)

(assert (=> d!102363 (= c!86638 (and ((_ is Intermediate!8005) lt!347822) (undefined!8817 lt!347822)))))

(assert (=> d!102363 (= lt!347822 e!434303)))

(declare-fun c!86639 () Bool)

(assert (=> d!102363 (= c!86639 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!347821 () (_ BitVec 64))

(assert (=> d!102363 (= lt!347821 (select (arr!20408 lt!347705) (toIndex!0 lt!347707 mask!3328)))))

(assert (=> d!102363 (validMask!0 mask!3328)))

(assert (=> d!102363 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347707 mask!3328) lt!347707 lt!347705 mask!3328) lt!347822)))

(declare-fun b!780846 () Bool)

(declare-fun e!434304 () Bool)

(assert (=> b!780846 (= e!434305 e!434304)))

(declare-fun res!528377 () Bool)

(assert (=> b!780846 (= res!528377 (and ((_ is Intermediate!8005) lt!347822) (not (undefined!8817 lt!347822)) (bvslt (x!65346 lt!347822) #b01111111111111111111111111111110) (bvsge (x!65346 lt!347822) #b00000000000000000000000000000000) (bvsge (x!65346 lt!347822) #b00000000000000000000000000000000)))))

(assert (=> b!780846 (=> (not res!528377) (not e!434304))))

(declare-fun b!780847 () Bool)

(assert (=> b!780847 (= e!434307 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!347707 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!347707 lt!347705 mask!3328))))

(declare-fun b!780848 () Bool)

(assert (=> b!780848 (and (bvsge (index!34390 lt!347822) #b00000000000000000000000000000000) (bvslt (index!34390 lt!347822) (size!20829 lt!347705)))))

(assert (=> b!780848 (= e!434306 (= (select (arr!20408 lt!347705) (index!34390 lt!347822)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!780849 () Bool)

(assert (=> b!780849 (= e!434303 e!434307)))

(declare-fun c!86640 () Bool)

(assert (=> b!780849 (= c!86640 (or (= lt!347821 lt!347707) (= (bvadd lt!347821 lt!347821) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!780850 () Bool)

(assert (=> b!780850 (and (bvsge (index!34390 lt!347822) #b00000000000000000000000000000000) (bvslt (index!34390 lt!347822) (size!20829 lt!347705)))))

(declare-fun res!528376 () Bool)

(assert (=> b!780850 (= res!528376 (= (select (arr!20408 lt!347705) (index!34390 lt!347822)) lt!347707))))

(assert (=> b!780850 (=> res!528376 e!434306)))

(assert (=> b!780850 (= e!434304 e!434306)))

(declare-fun b!780851 () Bool)

(assert (=> b!780851 (= e!434305 (bvsge (x!65346 lt!347822) #b01111111111111111111111111111110))))

(assert (= (and d!102363 c!86639) b!780845))

(assert (= (and d!102363 (not c!86639)) b!780849))

(assert (= (and b!780849 c!86640) b!780843))

(assert (= (and b!780849 (not c!86640)) b!780847))

(assert (= (and d!102363 c!86638) b!780851))

(assert (= (and d!102363 (not c!86638)) b!780846))

(assert (= (and b!780846 res!528377) b!780850))

(assert (= (and b!780850 (not res!528376)) b!780844))

(assert (= (and b!780844 (not res!528378)) b!780848))

(assert (=> b!780847 m!723277))

(declare-fun m!723465 () Bool)

(assert (=> b!780847 m!723465))

(assert (=> b!780847 m!723465))

(declare-fun m!723467 () Bool)

(assert (=> b!780847 m!723467))

(declare-fun m!723469 () Bool)

(assert (=> b!780848 m!723469))

(assert (=> d!102363 m!723277))

(declare-fun m!723471 () Bool)

(assert (=> d!102363 m!723471))

(assert (=> d!102363 m!723265))

(assert (=> b!780850 m!723469))

(assert (=> b!780844 m!723469))

(assert (=> b!780528 d!102363))

(declare-fun d!102365 () Bool)

(declare-fun lt!347834 () (_ BitVec 32))

(declare-fun lt!347833 () (_ BitVec 32))

(assert (=> d!102365 (= lt!347834 (bvmul (bvxor lt!347833 (bvlshr lt!347833 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102365 (= lt!347833 ((_ extract 31 0) (bvand (bvxor lt!347707 (bvlshr lt!347707 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102365 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!528379 (let ((h!15565 ((_ extract 31 0) (bvand (bvxor lt!347707 (bvlshr lt!347707 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65353 (bvmul (bvxor h!15565 (bvlshr h!15565 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65353 (bvlshr x!65353 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!528379 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!528379 #b00000000000000000000000000000000))))))

(assert (=> d!102365 (= (toIndex!0 lt!347707 mask!3328) (bvand (bvxor lt!347834 (bvlshr lt!347834 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!780528 d!102365))

(declare-fun b!780885 () Bool)

(declare-fun e!434327 () SeekEntryResult!8005)

(assert (=> b!780885 (= e!434327 Undefined!8005)))

(declare-fun b!780886 () Bool)

(declare-fun e!434326 () SeekEntryResult!8005)

(assert (=> b!780886 (= e!434326 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20408 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!780887 () Bool)

(declare-fun c!86656 () Bool)

(declare-fun lt!347846 () (_ BitVec 64))

(assert (=> b!780887 (= c!86656 (= lt!347846 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!434325 () SeekEntryResult!8005)

(assert (=> b!780887 (= e!434325 e!434326)))

(declare-fun lt!347845 () SeekEntryResult!8005)

(declare-fun d!102373 () Bool)

(assert (=> d!102373 (and (or ((_ is Undefined!8005) lt!347845) (not ((_ is Found!8005) lt!347845)) (and (bvsge (index!34389 lt!347845) #b00000000000000000000000000000000) (bvslt (index!34389 lt!347845) (size!20829 a!3186)))) (or ((_ is Undefined!8005) lt!347845) ((_ is Found!8005) lt!347845) (not ((_ is MissingVacant!8005) lt!347845)) (not (= (index!34391 lt!347845) resIntermediateIndex!5)) (and (bvsge (index!34391 lt!347845) #b00000000000000000000000000000000) (bvslt (index!34391 lt!347845) (size!20829 a!3186)))) (or ((_ is Undefined!8005) lt!347845) (ite ((_ is Found!8005) lt!347845) (= (select (arr!20408 a!3186) (index!34389 lt!347845)) (select (arr!20408 a!3186) j!159)) (and ((_ is MissingVacant!8005) lt!347845) (= (index!34391 lt!347845) resIntermediateIndex!5) (= (select (arr!20408 a!3186) (index!34391 lt!347845)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102373 (= lt!347845 e!434327)))

(declare-fun c!86657 () Bool)

(assert (=> d!102373 (= c!86657 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!102373 (= lt!347846 (select (arr!20408 a!3186) resIntermediateIndex!5))))

(assert (=> d!102373 (validMask!0 mask!3328)))

(assert (=> d!102373 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20408 a!3186) j!159) a!3186 mask!3328) lt!347845)))

(declare-fun b!780888 () Bool)

(assert (=> b!780888 (= e!434325 (Found!8005 resIntermediateIndex!5))))

(declare-fun b!780889 () Bool)

(assert (=> b!780889 (= e!434327 e!434325)))

(declare-fun c!86658 () Bool)

(assert (=> b!780889 (= c!86658 (= lt!347846 (select (arr!20408 a!3186) j!159)))))

(declare-fun b!780890 () Bool)

(assert (=> b!780890 (= e!434326 (MissingVacant!8005 resIntermediateIndex!5))))

(assert (= (and d!102373 c!86657) b!780885))

(assert (= (and d!102373 (not c!86657)) b!780889))

(assert (= (and b!780889 c!86658) b!780888))

(assert (= (and b!780889 (not c!86658)) b!780887))

(assert (= (and b!780887 c!86656) b!780890))

(assert (= (and b!780887 (not c!86656)) b!780886))

(declare-fun m!723499 () Bool)

(assert (=> b!780886 m!723499))

(assert (=> b!780886 m!723499))

(assert (=> b!780886 m!723247))

(declare-fun m!723501 () Bool)

(assert (=> b!780886 m!723501))

(declare-fun m!723503 () Bool)

(assert (=> d!102373 m!723503))

(declare-fun m!723505 () Bool)

(assert (=> d!102373 m!723505))

(assert (=> d!102373 m!723243))

(assert (=> d!102373 m!723265))

(assert (=> b!780546 d!102373))

(declare-fun bm!35216 () Bool)

(declare-fun call!35219 () Bool)

(assert (=> bm!35216 (= call!35219 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!780891 () Bool)

(declare-fun e!434329 () Bool)

(assert (=> b!780891 (= e!434329 call!35219)))

(declare-fun d!102377 () Bool)

(declare-fun res!528385 () Bool)

(declare-fun e!434330 () Bool)

(assert (=> d!102377 (=> res!528385 e!434330)))

(assert (=> d!102377 (= res!528385 (bvsge #b00000000000000000000000000000000 (size!20829 a!3186)))))

(assert (=> d!102377 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!434330)))

(declare-fun b!780892 () Bool)

(declare-fun e!434328 () Bool)

(assert (=> b!780892 (= e!434328 call!35219)))

(declare-fun b!780893 () Bool)

(assert (=> b!780893 (= e!434330 e!434328)))

(declare-fun c!86659 () Bool)

(assert (=> b!780893 (= c!86659 (validKeyInArray!0 (select (arr!20408 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!780894 () Bool)

(assert (=> b!780894 (= e!434328 e!434329)))

(declare-fun lt!347848 () (_ BitVec 64))

(assert (=> b!780894 (= lt!347848 (select (arr!20408 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!347849 () Unit!26888)

(assert (=> b!780894 (= lt!347849 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!347848 #b00000000000000000000000000000000))))

(assert (=> b!780894 (arrayContainsKey!0 a!3186 lt!347848 #b00000000000000000000000000000000)))

(declare-fun lt!347847 () Unit!26888)

(assert (=> b!780894 (= lt!347847 lt!347849)))

(declare-fun res!528384 () Bool)

(assert (=> b!780894 (= res!528384 (= (seekEntryOrOpen!0 (select (arr!20408 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!8005 #b00000000000000000000000000000000)))))

(assert (=> b!780894 (=> (not res!528384) (not e!434329))))

(assert (= (and d!102377 (not res!528385)) b!780893))

(assert (= (and b!780893 c!86659) b!780894))

(assert (= (and b!780893 (not c!86659)) b!780892))

(assert (= (and b!780894 res!528384) b!780891))

(assert (= (or b!780891 b!780892) bm!35216))

(declare-fun m!723507 () Bool)

(assert (=> bm!35216 m!723507))

(assert (=> b!780893 m!723401))

(assert (=> b!780893 m!723401))

(assert (=> b!780893 m!723403))

(assert (=> b!780894 m!723401))

(declare-fun m!723509 () Bool)

(assert (=> b!780894 m!723509))

(declare-fun m!723511 () Bool)

(assert (=> b!780894 m!723511))

(assert (=> b!780894 m!723401))

(declare-fun m!723513 () Bool)

(assert (=> b!780894 m!723513))

(assert (=> b!780535 d!102377))

(declare-fun b!780907 () Bool)

(declare-fun e!434339 () SeekEntryResult!8005)

(assert (=> b!780907 (= e!434339 Undefined!8005)))

(declare-fun b!780908 () Bool)

(declare-fun e!434338 () SeekEntryResult!8005)

(assert (=> b!780908 (= e!434338 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20408 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!780909 () Bool)

(declare-fun c!86666 () Bool)

(declare-fun lt!347857 () (_ BitVec 64))

(assert (=> b!780909 (= c!86666 (= lt!347857 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!434337 () SeekEntryResult!8005)

(assert (=> b!780909 (= e!434337 e!434338)))

(declare-fun d!102379 () Bool)

(declare-fun lt!347856 () SeekEntryResult!8005)

(assert (=> d!102379 (and (or ((_ is Undefined!8005) lt!347856) (not ((_ is Found!8005) lt!347856)) (and (bvsge (index!34389 lt!347856) #b00000000000000000000000000000000) (bvslt (index!34389 lt!347856) (size!20829 a!3186)))) (or ((_ is Undefined!8005) lt!347856) ((_ is Found!8005) lt!347856) (not ((_ is MissingVacant!8005) lt!347856)) (not (= (index!34391 lt!347856) resIntermediateIndex!5)) (and (bvsge (index!34391 lt!347856) #b00000000000000000000000000000000) (bvslt (index!34391 lt!347856) (size!20829 a!3186)))) (or ((_ is Undefined!8005) lt!347856) (ite ((_ is Found!8005) lt!347856) (= (select (arr!20408 a!3186) (index!34389 lt!347856)) (select (arr!20408 a!3186) j!159)) (and ((_ is MissingVacant!8005) lt!347856) (= (index!34391 lt!347856) resIntermediateIndex!5) (= (select (arr!20408 a!3186) (index!34391 lt!347856)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102379 (= lt!347856 e!434339)))

(declare-fun c!86667 () Bool)

(assert (=> d!102379 (= c!86667 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102379 (= lt!347857 (select (arr!20408 a!3186) index!1321))))

(assert (=> d!102379 (validMask!0 mask!3328)))

(assert (=> d!102379 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20408 a!3186) j!159) a!3186 mask!3328) lt!347856)))

(declare-fun b!780910 () Bool)

(assert (=> b!780910 (= e!434337 (Found!8005 index!1321))))

(declare-fun b!780911 () Bool)

(assert (=> b!780911 (= e!434339 e!434337)))

(declare-fun c!86668 () Bool)

(assert (=> b!780911 (= c!86668 (= lt!347857 (select (arr!20408 a!3186) j!159)))))

(declare-fun b!780912 () Bool)

(assert (=> b!780912 (= e!434338 (MissingVacant!8005 resIntermediateIndex!5))))

(assert (= (and d!102379 c!86667) b!780907))

(assert (= (and d!102379 (not c!86667)) b!780911))

(assert (= (and b!780911 c!86668) b!780910))

(assert (= (and b!780911 (not c!86668)) b!780909))

(assert (= (and b!780909 c!86666) b!780912))

(assert (= (and b!780909 (not c!86666)) b!780908))

(assert (=> b!780908 m!723449))

(assert (=> b!780908 m!723449))

(assert (=> b!780908 m!723247))

(declare-fun m!723515 () Bool)

(assert (=> b!780908 m!723515))

(declare-fun m!723517 () Bool)

(assert (=> d!102379 m!723517))

(declare-fun m!723519 () Bool)

(assert (=> d!102379 m!723519))

(assert (=> d!102379 m!723455))

(assert (=> d!102379 m!723265))

(assert (=> b!780537 d!102379))

(declare-fun b!780915 () Bool)

(declare-fun e!434344 () SeekEntryResult!8005)

(assert (=> b!780915 (= e!434344 (Intermediate!8005 false (toIndex!0 (select (arr!20408 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!780916 () Bool)

(declare-fun lt!347863 () SeekEntryResult!8005)

(assert (=> b!780916 (and (bvsge (index!34390 lt!347863) #b00000000000000000000000000000000) (bvslt (index!34390 lt!347863) (size!20829 a!3186)))))

(declare-fun res!528388 () Bool)

(assert (=> b!780916 (= res!528388 (= (select (arr!20408 a!3186) (index!34390 lt!347863)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!434343 () Bool)

(assert (=> b!780916 (=> res!528388 e!434343)))

(declare-fun e!434340 () SeekEntryResult!8005)

(declare-fun b!780917 () Bool)

(assert (=> b!780917 (= e!434340 (Intermediate!8005 true (toIndex!0 (select (arr!20408 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun d!102381 () Bool)

(declare-fun e!434342 () Bool)

(assert (=> d!102381 e!434342))

(declare-fun c!86669 () Bool)

(assert (=> d!102381 (= c!86669 (and ((_ is Intermediate!8005) lt!347863) (undefined!8817 lt!347863)))))

(assert (=> d!102381 (= lt!347863 e!434340)))

(declare-fun c!86670 () Bool)

(assert (=> d!102381 (= c!86670 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!347862 () (_ BitVec 64))

(assert (=> d!102381 (= lt!347862 (select (arr!20408 a!3186) (toIndex!0 (select (arr!20408 a!3186) j!159) mask!3328)))))

(assert (=> d!102381 (validMask!0 mask!3328)))

(assert (=> d!102381 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20408 a!3186) j!159) mask!3328) (select (arr!20408 a!3186) j!159) a!3186 mask!3328) lt!347863)))

(declare-fun b!780918 () Bool)

(declare-fun e!434341 () Bool)

(assert (=> b!780918 (= e!434342 e!434341)))

(declare-fun res!528387 () Bool)

(assert (=> b!780918 (= res!528387 (and ((_ is Intermediate!8005) lt!347863) (not (undefined!8817 lt!347863)) (bvslt (x!65346 lt!347863) #b01111111111111111111111111111110) (bvsge (x!65346 lt!347863) #b00000000000000000000000000000000) (bvsge (x!65346 lt!347863) #b00000000000000000000000000000000)))))

(assert (=> b!780918 (=> (not res!528387) (not e!434341))))

(declare-fun b!780919 () Bool)

(assert (=> b!780919 (= e!434344 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20408 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20408 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!780920 () Bool)

(assert (=> b!780920 (and (bvsge (index!34390 lt!347863) #b00000000000000000000000000000000) (bvslt (index!34390 lt!347863) (size!20829 a!3186)))))

(assert (=> b!780920 (= e!434343 (= (select (arr!20408 a!3186) (index!34390 lt!347863)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!780921 () Bool)

(assert (=> b!780921 (= e!434340 e!434344)))

(declare-fun c!86671 () Bool)

(assert (=> b!780921 (= c!86671 (or (= lt!347862 (select (arr!20408 a!3186) j!159)) (= (bvadd lt!347862 lt!347862) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!780922 () Bool)

(assert (=> b!780922 (and (bvsge (index!34390 lt!347863) #b00000000000000000000000000000000) (bvslt (index!34390 lt!347863) (size!20829 a!3186)))))

(declare-fun res!528386 () Bool)

(assert (=> b!780922 (= res!528386 (= (select (arr!20408 a!3186) (index!34390 lt!347863)) (select (arr!20408 a!3186) j!159)))))

(assert (=> b!780922 (=> res!528386 e!434343)))

(assert (=> b!780922 (= e!434341 e!434343)))

(declare-fun b!780923 () Bool)

(assert (=> b!780923 (= e!434342 (bvsge (x!65346 lt!347863) #b01111111111111111111111111111110))))

(assert (= (and d!102381 c!86670) b!780917))

(assert (= (and d!102381 (not c!86670)) b!780921))

(assert (= (and b!780921 c!86671) b!780915))

(assert (= (and b!780921 (not c!86671)) b!780919))

(assert (= (and d!102381 c!86669) b!780923))

(assert (= (and d!102381 (not c!86669)) b!780918))

(assert (= (and b!780918 res!528387) b!780922))

(assert (= (and b!780922 (not res!528386)) b!780916))

(assert (= (and b!780916 (not res!528388)) b!780920))

(assert (=> b!780919 m!723271))

(declare-fun m!723521 () Bool)

(assert (=> b!780919 m!723521))

(assert (=> b!780919 m!723521))

(assert (=> b!780919 m!723247))

(declare-fun m!723523 () Bool)

(assert (=> b!780919 m!723523))

(declare-fun m!723525 () Bool)

(assert (=> b!780920 m!723525))

(assert (=> d!102381 m!723271))

(declare-fun m!723527 () Bool)

(assert (=> d!102381 m!723527))

(assert (=> d!102381 m!723265))

(assert (=> b!780922 m!723525))

(assert (=> b!780916 m!723525))

(assert (=> b!780547 d!102381))

(declare-fun d!102383 () Bool)

(declare-fun lt!347867 () (_ BitVec 32))

(declare-fun lt!347866 () (_ BitVec 32))

(assert (=> d!102383 (= lt!347867 (bvmul (bvxor lt!347866 (bvlshr lt!347866 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102383 (= lt!347866 ((_ extract 31 0) (bvand (bvxor (select (arr!20408 a!3186) j!159) (bvlshr (select (arr!20408 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102383 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!528379 (let ((h!15565 ((_ extract 31 0) (bvand (bvxor (select (arr!20408 a!3186) j!159) (bvlshr (select (arr!20408 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65353 (bvmul (bvxor h!15565 (bvlshr h!15565 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65353 (bvlshr x!65353 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!528379 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!528379 #b00000000000000000000000000000000))))))

(assert (=> d!102383 (= (toIndex!0 (select (arr!20408 a!3186) j!159) mask!3328) (bvand (bvxor lt!347867 (bvlshr lt!347867 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!780547 d!102383))

(assert (=> b!780533 d!102379))

(declare-fun d!102385 () Bool)

(assert (=> d!102385 (= (validKeyInArray!0 (select (arr!20408 a!3186) j!159)) (and (not (= (select (arr!20408 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20408 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!780544 d!102385))

(check-sat (not b!780838) (not b!780705) (not d!102363) (not d!102331) (not bm!35212) (not b!780919) (not b!780847) (not d!102349) (not b!780710) (not d!102379) (not b!780707) (not b!780689) (not b!780894) (not d!102373) (not bm!35216) (not b!780886) (not d!102381) (not b!780729) (not b!780893) (not d!102361) (not b!780728) (not b!780706) (not d!102327) (not b!780908) (not bm!35209) (not d!102337) (not b!780793) (not b!780827))
(check-sat)
