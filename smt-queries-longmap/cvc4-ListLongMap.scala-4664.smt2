; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64760 () Bool)

(assert start!64760)

(declare-fun b!731330 () Bool)

(declare-fun e!409225 () Bool)

(declare-fun e!409217 () Bool)

(assert (=> b!731330 (= e!409225 e!409217)))

(declare-fun res!491536 () Bool)

(assert (=> b!731330 (=> (not res!491536) (not e!409217))))

(declare-datatypes ((SeekEntryResult!7324 0))(
  ( (MissingZero!7324 (index!31664 (_ BitVec 32))) (Found!7324 (index!31665 (_ BitVec 32))) (Intermediate!7324 (undefined!8136 Bool) (index!31666 (_ BitVec 32)) (x!62634 (_ BitVec 32))) (Undefined!7324) (MissingVacant!7324 (index!31667 (_ BitVec 32))) )
))
(declare-fun lt!324104 () SeekEntryResult!7324)

(declare-fun lt!324106 () SeekEntryResult!7324)

(assert (=> b!731330 (= res!491536 (= lt!324104 lt!324106))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!324105 () (_ BitVec 64))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((array!41209 0))(
  ( (array!41210 (arr!19724 (Array (_ BitVec 32) (_ BitVec 64))) (size!20145 (_ BitVec 32))) )
))
(declare-fun lt!324099 () array!41209)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41209 (_ BitVec 32)) SeekEntryResult!7324)

(assert (=> b!731330 (= lt!324106 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!324105 lt!324099 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!731330 (= lt!324104 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!324105 mask!3328) lt!324105 lt!324099 mask!3328))))

(declare-fun a!3186 () array!41209)

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!731330 (= lt!324105 (select (store (arr!19724 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!731330 (= lt!324099 (array!41210 (store (arr!19724 a!3186) i!1173 k!2102) (size!20145 a!3186)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!731331 () Bool)

(declare-fun lt!324101 () SeekEntryResult!7324)

(declare-fun e!409222 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41209 (_ BitVec 32)) SeekEntryResult!7324)

(assert (=> b!731331 (= e!409222 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19724 a!3186) j!159) a!3186 mask!3328) lt!324101))))

(declare-fun b!731332 () Bool)

(declare-fun e!409219 () Bool)

(assert (=> b!731332 (= e!409217 (not e!409219))))

(declare-fun res!491543 () Bool)

(assert (=> b!731332 (=> res!491543 e!409219)))

(assert (=> b!731332 (= res!491543 (or (not (is-Intermediate!7324 lt!324106)) (bvsge x!1131 (x!62634 lt!324106))))))

(declare-fun e!409221 () Bool)

(assert (=> b!731332 e!409221))

(declare-fun res!491546 () Bool)

(assert (=> b!731332 (=> (not res!491546) (not e!409221))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41209 (_ BitVec 32)) Bool)

(assert (=> b!731332 (= res!491546 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24966 0))(
  ( (Unit!24967) )
))
(declare-fun lt!324107 () Unit!24966)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41209 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24966)

(assert (=> b!731332 (= lt!324107 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!731333 () Bool)

(declare-fun res!491532 () Bool)

(assert (=> b!731333 (=> (not res!491532) (not e!409225))))

(assert (=> b!731333 (= res!491532 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19724 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!731334 () Bool)

(declare-fun e!409220 () Bool)

(declare-fun lt!324100 () (_ BitVec 32))

(assert (=> b!731334 (= e!409220 (or (bvslt mask!3328 #b00000000000000000000000000000000) (and (bvsge lt!324100 #b00000000000000000000000000000000) (bvslt lt!324100 (bvadd #b00000000000000000000000000000001 mask!3328)))))))

(declare-fun b!731335 () Bool)

(declare-fun res!491535 () Bool)

(declare-fun e!409224 () Bool)

(assert (=> b!731335 (=> (not res!491535) (not e!409224))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!731335 (= res!491535 (validKeyInArray!0 k!2102))))

(declare-fun b!731336 () Bool)

(declare-fun res!491531 () Bool)

(assert (=> b!731336 (=> (not res!491531) (not e!409224))))

(declare-fun arrayContainsKey!0 (array!41209 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!731336 (= res!491531 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!731337 () Bool)

(declare-fun e!409223 () Bool)

(declare-fun lt!324103 () SeekEntryResult!7324)

(assert (=> b!731337 (= e!409223 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19724 a!3186) j!159) a!3186 mask!3328) lt!324103))))

(declare-fun b!731338 () Bool)

(declare-fun e!409226 () Bool)

(assert (=> b!731338 (= e!409226 e!409225)))

(declare-fun res!491540 () Bool)

(assert (=> b!731338 (=> (not res!491540) (not e!409225))))

(assert (=> b!731338 (= res!491540 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19724 a!3186) j!159) mask!3328) (select (arr!19724 a!3186) j!159) a!3186 mask!3328) lt!324103))))

(assert (=> b!731338 (= lt!324103 (Intermediate!7324 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!731339 () Bool)

(assert (=> b!731339 (= e!409219 e!409220)))

(declare-fun res!491545 () Bool)

(assert (=> b!731339 (=> res!491545 e!409220)))

(assert (=> b!731339 (= res!491545 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!731339 (= lt!324100 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!731340 () Bool)

(declare-fun res!491539 () Bool)

(assert (=> b!731340 (=> (not res!491539) (not e!409224))))

(assert (=> b!731340 (= res!491539 (and (= (size!20145 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20145 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20145 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!731341 () Bool)

(assert (=> b!731341 (= e!409224 e!409226)))

(declare-fun res!491533 () Bool)

(assert (=> b!731341 (=> (not res!491533) (not e!409226))))

(declare-fun lt!324102 () SeekEntryResult!7324)

(assert (=> b!731341 (= res!491533 (or (= lt!324102 (MissingZero!7324 i!1173)) (= lt!324102 (MissingVacant!7324 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41209 (_ BitVec 32)) SeekEntryResult!7324)

(assert (=> b!731341 (= lt!324102 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!731342 () Bool)

(declare-fun res!491538 () Bool)

(assert (=> b!731342 (=> (not res!491538) (not e!409226))))

(declare-datatypes ((List!13726 0))(
  ( (Nil!13723) (Cons!13722 (h!14782 (_ BitVec 64)) (t!20041 List!13726)) )
))
(declare-fun arrayNoDuplicates!0 (array!41209 (_ BitVec 32) List!13726) Bool)

(assert (=> b!731342 (= res!491538 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13723))))

(declare-fun b!731343 () Bool)

(assert (=> b!731343 (= e!409223 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19724 a!3186) j!159) a!3186 mask!3328) (Found!7324 j!159)))))

(declare-fun b!731344 () Bool)

(assert (=> b!731344 (= e!409221 e!409222)))

(declare-fun res!491534 () Bool)

(assert (=> b!731344 (=> (not res!491534) (not e!409222))))

(assert (=> b!731344 (= res!491534 (= (seekEntryOrOpen!0 (select (arr!19724 a!3186) j!159) a!3186 mask!3328) lt!324101))))

(assert (=> b!731344 (= lt!324101 (Found!7324 j!159))))

(declare-fun b!731345 () Bool)

(declare-fun res!491542 () Bool)

(assert (=> b!731345 (=> res!491542 e!409220)))

(assert (=> b!731345 (= res!491542 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19724 a!3186) j!159) a!3186 mask!3328) (Found!7324 j!159))))))

(declare-fun b!731346 () Bool)

(declare-fun res!491529 () Bool)

(assert (=> b!731346 (=> (not res!491529) (not e!409224))))

(assert (=> b!731346 (= res!491529 (validKeyInArray!0 (select (arr!19724 a!3186) j!159)))))

(declare-fun b!731347 () Bool)

(declare-fun res!491541 () Bool)

(assert (=> b!731347 (=> (not res!491541) (not e!409226))))

(assert (=> b!731347 (= res!491541 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20145 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20145 a!3186))))))

(declare-fun res!491530 () Bool)

(assert (=> start!64760 (=> (not res!491530) (not e!409224))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64760 (= res!491530 (validMask!0 mask!3328))))

(assert (=> start!64760 e!409224))

(assert (=> start!64760 true))

(declare-fun array_inv!15520 (array!41209) Bool)

(assert (=> start!64760 (array_inv!15520 a!3186)))

(declare-fun b!731348 () Bool)

(declare-fun res!491537 () Bool)

(assert (=> b!731348 (=> (not res!491537) (not e!409225))))

(assert (=> b!731348 (= res!491537 e!409223)))

(declare-fun c!80275 () Bool)

(assert (=> b!731348 (= c!80275 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!731349 () Bool)

(declare-fun res!491544 () Bool)

(assert (=> b!731349 (=> (not res!491544) (not e!409226))))

(assert (=> b!731349 (= res!491544 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!64760 res!491530) b!731340))

(assert (= (and b!731340 res!491539) b!731346))

(assert (= (and b!731346 res!491529) b!731335))

(assert (= (and b!731335 res!491535) b!731336))

(assert (= (and b!731336 res!491531) b!731341))

(assert (= (and b!731341 res!491533) b!731349))

(assert (= (and b!731349 res!491544) b!731342))

(assert (= (and b!731342 res!491538) b!731347))

(assert (= (and b!731347 res!491541) b!731338))

(assert (= (and b!731338 res!491540) b!731333))

(assert (= (and b!731333 res!491532) b!731348))

(assert (= (and b!731348 c!80275) b!731337))

(assert (= (and b!731348 (not c!80275)) b!731343))

(assert (= (and b!731348 res!491537) b!731330))

(assert (= (and b!731330 res!491536) b!731332))

(assert (= (and b!731332 res!491546) b!731344))

(assert (= (and b!731344 res!491534) b!731331))

(assert (= (and b!731332 (not res!491543)) b!731339))

(assert (= (and b!731339 (not res!491545)) b!731345))

(assert (= (and b!731345 (not res!491542)) b!731334))

(declare-fun m!684715 () Bool)

(assert (=> b!731341 m!684715))

(declare-fun m!684717 () Bool)

(assert (=> b!731337 m!684717))

(assert (=> b!731337 m!684717))

(declare-fun m!684719 () Bool)

(assert (=> b!731337 m!684719))

(assert (=> b!731345 m!684717))

(assert (=> b!731345 m!684717))

(declare-fun m!684721 () Bool)

(assert (=> b!731345 m!684721))

(assert (=> b!731331 m!684717))

(assert (=> b!731331 m!684717))

(declare-fun m!684723 () Bool)

(assert (=> b!731331 m!684723))

(declare-fun m!684725 () Bool)

(assert (=> b!731335 m!684725))

(assert (=> b!731344 m!684717))

(assert (=> b!731344 m!684717))

(declare-fun m!684727 () Bool)

(assert (=> b!731344 m!684727))

(declare-fun m!684729 () Bool)

(assert (=> b!731336 m!684729))

(assert (=> b!731346 m!684717))

(assert (=> b!731346 m!684717))

(declare-fun m!684731 () Bool)

(assert (=> b!731346 m!684731))

(declare-fun m!684733 () Bool)

(assert (=> b!731339 m!684733))

(assert (=> b!731343 m!684717))

(assert (=> b!731343 m!684717))

(assert (=> b!731343 m!684721))

(declare-fun m!684735 () Bool)

(assert (=> b!731333 m!684735))

(declare-fun m!684737 () Bool)

(assert (=> b!731342 m!684737))

(declare-fun m!684739 () Bool)

(assert (=> b!731330 m!684739))

(declare-fun m!684741 () Bool)

(assert (=> b!731330 m!684741))

(declare-fun m!684743 () Bool)

(assert (=> b!731330 m!684743))

(declare-fun m!684745 () Bool)

(assert (=> b!731330 m!684745))

(declare-fun m!684747 () Bool)

(assert (=> b!731330 m!684747))

(assert (=> b!731330 m!684745))

(declare-fun m!684749 () Bool)

(assert (=> start!64760 m!684749))

(declare-fun m!684751 () Bool)

(assert (=> start!64760 m!684751))

(assert (=> b!731338 m!684717))

(assert (=> b!731338 m!684717))

(declare-fun m!684753 () Bool)

(assert (=> b!731338 m!684753))

(assert (=> b!731338 m!684753))

(assert (=> b!731338 m!684717))

(declare-fun m!684755 () Bool)

(assert (=> b!731338 m!684755))

(declare-fun m!684757 () Bool)

(assert (=> b!731332 m!684757))

(declare-fun m!684759 () Bool)

(assert (=> b!731332 m!684759))

(declare-fun m!684761 () Bool)

(assert (=> b!731349 m!684761))

(push 1)

(assert (not b!731335))

(assert (not b!731336))

(assert (not b!731349))

(assert (not b!731343))

(assert (not b!731344))

(assert (not b!731330))

(assert (not b!731345))

(assert (not start!64760))

(assert (not b!731337))

(assert (not b!731341))

(assert (not b!731332))

(assert (not b!731339))

(assert (not b!731346))

(assert (not b!731342))

(assert (not b!731331))

(assert (not b!731338))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!99621 () Bool)

(declare-fun lt!324128 () (_ BitVec 32))

(assert (=> d!99621 (and (bvsge lt!324128 #b00000000000000000000000000000000) (bvslt lt!324128 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!99621 (= lt!324128 (choose!52 index!1321 x!1131 mask!3328))))

(assert (=> d!99621 (validMask!0 mask!3328)))

(assert (=> d!99621 (= (nextIndex!0 index!1321 x!1131 mask!3328) lt!324128)))

(declare-fun bs!20935 () Bool)

(assert (= bs!20935 d!99621))

(declare-fun m!684779 () Bool)

(assert (=> bs!20935 m!684779))

(assert (=> bs!20935 m!684749))

(assert (=> b!731339 d!99621))

(declare-fun b!731434 () Bool)

(declare-fun e!409272 () SeekEntryResult!7324)

(declare-fun lt!324150 () SeekEntryResult!7324)

(assert (=> b!731434 (= e!409272 (MissingZero!7324 (index!31666 lt!324150)))))

(declare-fun b!731435 () Bool)

(declare-fun c!80310 () Bool)

(declare-fun lt!324151 () (_ BitVec 64))

(assert (=> b!731435 (= c!80310 (= lt!324151 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!409273 () SeekEntryResult!7324)

(assert (=> b!731435 (= e!409273 e!409272)))

(declare-fun b!731436 () Bool)

(assert (=> b!731436 (= e!409273 (Found!7324 (index!31666 lt!324150)))))

(declare-fun b!731437 () Bool)

(assert (=> b!731437 (= e!409272 (seekKeyOrZeroReturnVacant!0 (x!62634 lt!324150) (index!31666 lt!324150) (index!31666 lt!324150) k!2102 a!3186 mask!3328))))

(declare-fun b!731438 () Bool)

(declare-fun e!409274 () SeekEntryResult!7324)

(assert (=> b!731438 (= e!409274 e!409273)))

(assert (=> b!731438 (= lt!324151 (select (arr!19724 a!3186) (index!31666 lt!324150)))))

(declare-fun c!80309 () Bool)

(assert (=> b!731438 (= c!80309 (= lt!324151 k!2102))))

(declare-fun d!99623 () Bool)

(declare-fun lt!324152 () SeekEntryResult!7324)

(assert (=> d!99623 (and (or (is-Undefined!7324 lt!324152) (not (is-Found!7324 lt!324152)) (and (bvsge (index!31665 lt!324152) #b00000000000000000000000000000000) (bvslt (index!31665 lt!324152) (size!20145 a!3186)))) (or (is-Undefined!7324 lt!324152) (is-Found!7324 lt!324152) (not (is-MissingZero!7324 lt!324152)) (and (bvsge (index!31664 lt!324152) #b00000000000000000000000000000000) (bvslt (index!31664 lt!324152) (size!20145 a!3186)))) (or (is-Undefined!7324 lt!324152) (is-Found!7324 lt!324152) (is-MissingZero!7324 lt!324152) (not (is-MissingVacant!7324 lt!324152)) (and (bvsge (index!31667 lt!324152) #b00000000000000000000000000000000) (bvslt (index!31667 lt!324152) (size!20145 a!3186)))) (or (is-Undefined!7324 lt!324152) (ite (is-Found!7324 lt!324152) (= (select (arr!19724 a!3186) (index!31665 lt!324152)) k!2102) (ite (is-MissingZero!7324 lt!324152) (= (select (arr!19724 a!3186) (index!31664 lt!324152)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7324 lt!324152) (= (select (arr!19724 a!3186) (index!31667 lt!324152)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!99623 (= lt!324152 e!409274)))

(declare-fun c!80311 () Bool)

(assert (=> d!99623 (= c!80311 (and (is-Intermediate!7324 lt!324150) (undefined!8136 lt!324150)))))

(assert (=> d!99623 (= lt!324150 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!99623 (validMask!0 mask!3328)))

(assert (=> d!99623 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!324152)))

(declare-fun b!731439 () Bool)

(assert (=> b!731439 (= e!409274 Undefined!7324)))

(assert (= (and d!99623 c!80311) b!731439))

(assert (= (and d!99623 (not c!80311)) b!731438))

(assert (= (and b!731438 c!80309) b!731436))

(assert (= (and b!731438 (not c!80309)) b!731435))

(assert (= (and b!731435 c!80310) b!731434))

(assert (= (and b!731435 (not c!80310)) b!731437))

(declare-fun m!684791 () Bool)

(assert (=> b!731437 m!684791))

(declare-fun m!684793 () Bool)

(assert (=> b!731438 m!684793))

(declare-fun m!684795 () Bool)

(assert (=> d!99623 m!684795))

(declare-fun m!684797 () Bool)

(assert (=> d!99623 m!684797))

(assert (=> d!99623 m!684797))

(declare-fun m!684799 () Bool)

(assert (=> d!99623 m!684799))

(declare-fun m!684801 () Bool)

(assert (=> d!99623 m!684801))

(assert (=> d!99623 m!684749))

(declare-fun m!684803 () Bool)

(assert (=> d!99623 m!684803))

(assert (=> b!731341 d!99623))

(declare-fun d!99635 () Bool)

(declare-fun e!409324 () Bool)

(assert (=> d!99635 e!409324))

(declare-fun c!80339 () Bool)

(declare-fun lt!324191 () SeekEntryResult!7324)

(assert (=> d!99635 (= c!80339 (and (is-Intermediate!7324 lt!324191) (undefined!8136 lt!324191)))))

(declare-fun e!409320 () SeekEntryResult!7324)

(assert (=> d!99635 (= lt!324191 e!409320)))

(declare-fun c!80340 () Bool)

(assert (=> d!99635 (= c!80340 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!324192 () (_ BitVec 64))

(assert (=> d!99635 (= lt!324192 (select (arr!19724 lt!324099) index!1321))))

(assert (=> d!99635 (validMask!0 mask!3328)))

(assert (=> d!99635 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!324105 lt!324099 mask!3328) lt!324191)))

(declare-fun e!409322 () SeekEntryResult!7324)

(declare-fun b!731515 () Bool)

(assert (=> b!731515 (= e!409322 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!324105 lt!324099 mask!3328))))

(declare-fun b!731516 () Bool)

(assert (=> b!731516 (and (bvsge (index!31666 lt!324191) #b00000000000000000000000000000000) (bvslt (index!31666 lt!324191) (size!20145 lt!324099)))))

(declare-fun res!491589 () Bool)

(assert (=> b!731516 (= res!491589 (= (select (arr!19724 lt!324099) (index!31666 lt!324191)) lt!324105))))

(declare-fun e!409323 () Bool)

(assert (=> b!731516 (=> res!491589 e!409323)))

(declare-fun e!409321 () Bool)

(assert (=> b!731516 (= e!409321 e!409323)))

(declare-fun b!731517 () Bool)

(assert (=> b!731517 (= e!409322 (Intermediate!7324 false index!1321 x!1131))))

(declare-fun b!731518 () Bool)

(assert (=> b!731518 (= e!409320 (Intermediate!7324 true index!1321 x!1131))))

(declare-fun b!731519 () Bool)

(assert (=> b!731519 (and (bvsge (index!31666 lt!324191) #b00000000000000000000000000000000) (bvslt (index!31666 lt!324191) (size!20145 lt!324099)))))

(assert (=> b!731519 (= e!409323 (= (select (arr!19724 lt!324099) (index!31666 lt!324191)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!731520 () Bool)

(assert (=> b!731520 (= e!409324 (bvsge (x!62634 lt!324191) #b01111111111111111111111111111110))))

(declare-fun b!731521 () Bool)

(assert (=> b!731521 (= e!409324 e!409321)))

(declare-fun res!491590 () Bool)

(assert (=> b!731521 (= res!491590 (and (is-Intermediate!7324 lt!324191) (not (undefined!8136 lt!324191)) (bvslt (x!62634 lt!324191) #b01111111111111111111111111111110) (bvsge (x!62634 lt!324191) #b00000000000000000000000000000000) (bvsge (x!62634 lt!324191) x!1131)))))

(assert (=> b!731521 (=> (not res!491590) (not e!409321))))

(declare-fun b!731522 () Bool)

(assert (=> b!731522 (= e!409320 e!409322)))

(declare-fun c!80341 () Bool)

(assert (=> b!731522 (= c!80341 (or (= lt!324192 lt!324105) (= (bvadd lt!324192 lt!324192) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!731523 () Bool)

(assert (=> b!731523 (and (bvsge (index!31666 lt!324191) #b00000000000000000000000000000000) (bvslt (index!31666 lt!324191) (size!20145 lt!324099)))))

(declare-fun res!491588 () Bool)

(assert (=> b!731523 (= res!491588 (= (select (arr!19724 lt!324099) (index!31666 lt!324191)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!731523 (=> res!491588 e!409323)))

(assert (= (and d!99635 c!80340) b!731518))

(assert (= (and d!99635 (not c!80340)) b!731522))

(assert (= (and b!731522 c!80341) b!731517))

(assert (= (and b!731522 (not c!80341)) b!731515))

(assert (= (and d!99635 c!80339) b!731520))

(assert (= (and d!99635 (not c!80339)) b!731521))

(assert (= (and b!731521 res!491590) b!731516))

(assert (= (and b!731516 (not res!491589)) b!731523))

(assert (= (and b!731523 (not res!491588)) b!731519))

(declare-fun m!684851 () Bool)

(assert (=> d!99635 m!684851))

(assert (=> d!99635 m!684749))

(declare-fun m!684853 () Bool)

(assert (=> b!731523 m!684853))

(assert (=> b!731519 m!684853))

(assert (=> b!731515 m!684733))

(assert (=> b!731515 m!684733))

(declare-fun m!684855 () Bool)

(assert (=> b!731515 m!684855))

(assert (=> b!731516 m!684853))

(assert (=> b!731330 d!99635))

(declare-fun d!99651 () Bool)

(declare-fun e!409329 () Bool)

(assert (=> d!99651 e!409329))

(declare-fun c!80342 () Bool)

(declare-fun lt!324193 () SeekEntryResult!7324)

(assert (=> d!99651 (= c!80342 (and (is-Intermediate!7324 lt!324193) (undefined!8136 lt!324193)))))

(declare-fun e!409325 () SeekEntryResult!7324)

(assert (=> d!99651 (= lt!324193 e!409325)))

(declare-fun c!80343 () Bool)

(assert (=> d!99651 (= c!80343 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!324194 () (_ BitVec 64))

(assert (=> d!99651 (= lt!324194 (select (arr!19724 lt!324099) (toIndex!0 lt!324105 mask!3328)))))

(assert (=> d!99651 (validMask!0 mask!3328)))

(assert (=> d!99651 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!324105 mask!3328) lt!324105 lt!324099 mask!3328) lt!324193)))

(declare-fun b!731524 () Bool)

(declare-fun e!409327 () SeekEntryResult!7324)

(assert (=> b!731524 (= e!409327 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!324105 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!324105 lt!324099 mask!3328))))

(declare-fun b!731525 () Bool)

(assert (=> b!731525 (and (bvsge (index!31666 lt!324193) #b00000000000000000000000000000000) (bvslt (index!31666 lt!324193) (size!20145 lt!324099)))))

(declare-fun res!491592 () Bool)

(assert (=> b!731525 (= res!491592 (= (select (arr!19724 lt!324099) (index!31666 lt!324193)) lt!324105))))

(declare-fun e!409328 () Bool)

(assert (=> b!731525 (=> res!491592 e!409328)))

(declare-fun e!409326 () Bool)

(assert (=> b!731525 (= e!409326 e!409328)))

(declare-fun b!731526 () Bool)

(assert (=> b!731526 (= e!409327 (Intermediate!7324 false (toIndex!0 lt!324105 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!731527 () Bool)

(assert (=> b!731527 (= e!409325 (Intermediate!7324 true (toIndex!0 lt!324105 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!731528 () Bool)

(assert (=> b!731528 (and (bvsge (index!31666 lt!324193) #b00000000000000000000000000000000) (bvslt (index!31666 lt!324193) (size!20145 lt!324099)))))

(assert (=> b!731528 (= e!409328 (= (select (arr!19724 lt!324099) (index!31666 lt!324193)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!731529 () Bool)

(assert (=> b!731529 (= e!409329 (bvsge (x!62634 lt!324193) #b01111111111111111111111111111110))))

(declare-fun b!731530 () Bool)

(assert (=> b!731530 (= e!409329 e!409326)))

(declare-fun res!491593 () Bool)

(assert (=> b!731530 (= res!491593 (and (is-Intermediate!7324 lt!324193) (not (undefined!8136 lt!324193)) (bvslt (x!62634 lt!324193) #b01111111111111111111111111111110) (bvsge (x!62634 lt!324193) #b00000000000000000000000000000000) (bvsge (x!62634 lt!324193) #b00000000000000000000000000000000)))))

(assert (=> b!731530 (=> (not res!491593) (not e!409326))))

(declare-fun b!731531 () Bool)

(assert (=> b!731531 (= e!409325 e!409327)))

(declare-fun c!80344 () Bool)

(assert (=> b!731531 (= c!80344 (or (= lt!324194 lt!324105) (= (bvadd lt!324194 lt!324194) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!731532 () Bool)

(assert (=> b!731532 (and (bvsge (index!31666 lt!324193) #b00000000000000000000000000000000) (bvslt (index!31666 lt!324193) (size!20145 lt!324099)))))

(declare-fun res!491591 () Bool)

(assert (=> b!731532 (= res!491591 (= (select (arr!19724 lt!324099) (index!31666 lt!324193)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!731532 (=> res!491591 e!409328)))

(assert (= (and d!99651 c!80343) b!731527))

(assert (= (and d!99651 (not c!80343)) b!731531))

(assert (= (and b!731531 c!80344) b!731526))

(assert (= (and b!731531 (not c!80344)) b!731524))

(assert (= (and d!99651 c!80342) b!731529))

(assert (= (and d!99651 (not c!80342)) b!731530))

(assert (= (and b!731530 res!491593) b!731525))

(assert (= (and b!731525 (not res!491592)) b!731532))

(assert (= (and b!731532 (not res!491591)) b!731528))

(assert (=> d!99651 m!684745))

(declare-fun m!684857 () Bool)

(assert (=> d!99651 m!684857))

(assert (=> d!99651 m!684749))

(declare-fun m!684859 () Bool)

(assert (=> b!731532 m!684859))

(assert (=> b!731528 m!684859))

(assert (=> b!731524 m!684745))

(declare-fun m!684861 () Bool)

(assert (=> b!731524 m!684861))

(assert (=> b!731524 m!684861))

(declare-fun m!684863 () Bool)

(assert (=> b!731524 m!684863))

(assert (=> b!731525 m!684859))

(assert (=> b!731330 d!99651))

(declare-fun d!99653 () Bool)

(declare-fun lt!324204 () (_ BitVec 32))

(declare-fun lt!324203 () (_ BitVec 32))

(assert (=> d!99653 (= lt!324204 (bvmul (bvxor lt!324203 (bvlshr lt!324203 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99653 (= lt!324203 ((_ extract 31 0) (bvand (bvxor lt!324105 (bvlshr lt!324105 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99653 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!491600 (let ((h!14785 ((_ extract 31 0) (bvand (bvxor lt!324105 (bvlshr lt!324105 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!62643 (bvmul (bvxor h!14785 (bvlshr h!14785 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!62643 (bvlshr x!62643 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!491600 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!491600 #b00000000000000000000000000000000))))))

(assert (=> d!99653 (= (toIndex!0 lt!324105 mask!3328) (bvand (bvxor lt!324204 (bvlshr lt!324204 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!731330 d!99653))

(declare-fun d!99657 () Bool)

(declare-fun res!491619 () Bool)

(declare-fun e!409372 () Bool)

(assert (=> d!99657 (=> res!491619 e!409372)))

(assert (=> d!99657 (= res!491619 (= (select (arr!19724 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!99657 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!409372)))

(declare-fun b!731595 () Bool)

(declare-fun e!409373 () Bool)

(assert (=> b!731595 (= e!409372 e!409373)))

(declare-fun res!491620 () Bool)

(assert (=> b!731595 (=> (not res!491620) (not e!409373))))

(assert (=> b!731595 (= res!491620 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20145 a!3186)))))

(declare-fun b!731596 () Bool)

(assert (=> b!731596 (= e!409373 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!99657 (not res!491619)) b!731595))

(assert (= (and b!731595 res!491620) b!731596))

(declare-fun m!684897 () Bool)

(assert (=> d!99657 m!684897))

(declare-fun m!684901 () Bool)

(assert (=> b!731596 m!684901))

(assert (=> b!731336 d!99657))

(declare-fun d!99669 () Bool)

(declare-fun e!409383 () Bool)

(assert (=> d!99669 e!409383))

(declare-fun c!80367 () Bool)

(declare-fun lt!324216 () SeekEntryResult!7324)

(assert (=> d!99669 (= c!80367 (and (is-Intermediate!7324 lt!324216) (undefined!8136 lt!324216)))))

(declare-fun e!409379 () SeekEntryResult!7324)

(assert (=> d!99669 (= lt!324216 e!409379)))

(declare-fun c!80368 () Bool)

(assert (=> d!99669 (= c!80368 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!324217 () (_ BitVec 64))

(assert (=> d!99669 (= lt!324217 (select (arr!19724 a!3186) index!1321))))

(assert (=> d!99669 (validMask!0 mask!3328)))

(assert (=> d!99669 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19724 a!3186) j!159) a!3186 mask!3328) lt!324216)))

(declare-fun e!409381 () SeekEntryResult!7324)

(declare-fun b!731606 () Bool)

(assert (=> b!731606 (= e!409381 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!19724 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!731607 () Bool)

(assert (=> b!731607 (and (bvsge (index!31666 lt!324216) #b00000000000000000000000000000000) (bvslt (index!31666 lt!324216) (size!20145 a!3186)))))

(declare-fun res!491625 () Bool)

(assert (=> b!731607 (= res!491625 (= (select (arr!19724 a!3186) (index!31666 lt!324216)) (select (arr!19724 a!3186) j!159)))))

(declare-fun e!409382 () Bool)

(assert (=> b!731607 (=> res!491625 e!409382)))

(declare-fun e!409380 () Bool)

(assert (=> b!731607 (= e!409380 e!409382)))

(declare-fun b!731608 () Bool)

(assert (=> b!731608 (= e!409381 (Intermediate!7324 false index!1321 x!1131))))

(declare-fun b!731609 () Bool)

(assert (=> b!731609 (= e!409379 (Intermediate!7324 true index!1321 x!1131))))

(declare-fun b!731610 () Bool)

(assert (=> b!731610 (and (bvsge (index!31666 lt!324216) #b00000000000000000000000000000000) (bvslt (index!31666 lt!324216) (size!20145 a!3186)))))

(assert (=> b!731610 (= e!409382 (= (select (arr!19724 a!3186) (index!31666 lt!324216)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!731611 () Bool)

(assert (=> b!731611 (= e!409383 (bvsge (x!62634 lt!324216) #b01111111111111111111111111111110))))

(declare-fun b!731612 () Bool)

(assert (=> b!731612 (= e!409383 e!409380)))

(declare-fun res!491626 () Bool)

(assert (=> b!731612 (= res!491626 (and (is-Intermediate!7324 lt!324216) (not (undefined!8136 lt!324216)) (bvslt (x!62634 lt!324216) #b01111111111111111111111111111110) (bvsge (x!62634 lt!324216) #b00000000000000000000000000000000) (bvsge (x!62634 lt!324216) x!1131)))))

(assert (=> b!731612 (=> (not res!491626) (not e!409380))))

(declare-fun b!731613 () Bool)

(assert (=> b!731613 (= e!409379 e!409381)))

(declare-fun c!80369 () Bool)

(assert (=> b!731613 (= c!80369 (or (= lt!324217 (select (arr!19724 a!3186) j!159)) (= (bvadd lt!324217 lt!324217) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!731614 () Bool)

(assert (=> b!731614 (and (bvsge (index!31666 lt!324216) #b00000000000000000000000000000000) (bvslt (index!31666 lt!324216) (size!20145 a!3186)))))

(declare-fun res!491624 () Bool)

(assert (=> b!731614 (= res!491624 (= (select (arr!19724 a!3186) (index!31666 lt!324216)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!731614 (=> res!491624 e!409382)))

(assert (= (and d!99669 c!80368) b!731609))

(assert (= (and d!99669 (not c!80368)) b!731613))

(assert (= (and b!731613 c!80369) b!731608))

(assert (= (and b!731613 (not c!80369)) b!731606))

(assert (= (and d!99669 c!80367) b!731611))

(assert (= (and d!99669 (not c!80367)) b!731612))

(assert (= (and b!731612 res!491626) b!731607))

(assert (= (and b!731607 (not res!491625)) b!731614))

(assert (= (and b!731614 (not res!491624)) b!731610))

(declare-fun m!684917 () Bool)

(assert (=> d!99669 m!684917))

(assert (=> d!99669 m!684749))

(declare-fun m!684919 () Bool)

(assert (=> b!731614 m!684919))

(assert (=> b!731610 m!684919))

(assert (=> b!731606 m!684733))

(assert (=> b!731606 m!684733))

(assert (=> b!731606 m!684717))

(declare-fun m!684921 () Bool)

(assert (=> b!731606 m!684921))

(assert (=> b!731607 m!684919))

(assert (=> b!731337 d!99669))

(declare-fun b!731634 () Bool)

(declare-fun e!409398 () Bool)

(declare-fun e!409397 () Bool)

(assert (=> b!731634 (= e!409398 e!409397)))

(declare-fun lt!324240 () (_ BitVec 64))

(assert (=> b!731634 (= lt!324240 (select (arr!19724 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!324238 () Unit!24966)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!41209 (_ BitVec 64) (_ BitVec 32)) Unit!24966)

(assert (=> b!731634 (= lt!324238 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!324240 #b00000000000000000000000000000000))))

(assert (=> b!731634 (arrayContainsKey!0 a!3186 lt!324240 #b00000000000000000000000000000000)))

(declare-fun lt!324239 () Unit!24966)

(assert (=> b!731634 (= lt!324239 lt!324238)))

(declare-fun res!491634 () Bool)

(assert (=> b!731634 (= res!491634 (= (seekEntryOrOpen!0 (select (arr!19724 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7324 #b00000000000000000000000000000000)))))

(assert (=> b!731634 (=> (not res!491634) (not e!409397))))

(declare-fun b!731635 () Bool)

(declare-fun call!34841 () Bool)

(assert (=> b!731635 (= e!409397 call!34841)))

(declare-fun b!731636 () Bool)

(assert (=> b!731636 (= e!409398 call!34841)))

(declare-fun bm!34838 () Bool)

(assert (=> bm!34838 (= call!34841 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!731633 () Bool)

(declare-fun e!409396 () Bool)

(assert (=> b!731633 (= e!409396 e!409398)))

(declare-fun c!80376 () Bool)

(assert (=> b!731633 (= c!80376 (validKeyInArray!0 (select (arr!19724 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!99677 () Bool)

(declare-fun res!491633 () Bool)

(assert (=> d!99677 (=> res!491633 e!409396)))

(assert (=> d!99677 (= res!491633 (bvsge #b00000000000000000000000000000000 (size!20145 a!3186)))))

(assert (=> d!99677 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!409396)))

(assert (= (and d!99677 (not res!491633)) b!731633))

(assert (= (and b!731633 c!80376) b!731634))

(assert (= (and b!731633 (not c!80376)) b!731636))

(assert (= (and b!731634 res!491634) b!731635))

(assert (= (or b!731635 b!731636) bm!34838))

(assert (=> b!731634 m!684897))

(declare-fun m!684943 () Bool)

(assert (=> b!731634 m!684943))

(declare-fun m!684945 () Bool)

(assert (=> b!731634 m!684945))

(assert (=> b!731634 m!684897))

(declare-fun m!684947 () Bool)

(assert (=> b!731634 m!684947))

(declare-fun m!684949 () Bool)

(assert (=> bm!34838 m!684949))

(assert (=> b!731633 m!684897))

(assert (=> b!731633 m!684897))

(declare-fun m!684951 () Bool)

(assert (=> b!731633 m!684951))

(assert (=> b!731349 d!99677))

(declare-fun d!99689 () Bool)

(declare-fun e!409403 () Bool)

(assert (=> d!99689 e!409403))

(declare-fun c!80377 () Bool)

(declare-fun lt!324241 () SeekEntryResult!7324)

(assert (=> d!99689 (= c!80377 (and (is-Intermediate!7324 lt!324241) (undefined!8136 lt!324241)))))

(declare-fun e!409399 () SeekEntryResult!7324)

(assert (=> d!99689 (= lt!324241 e!409399)))

(declare-fun c!80378 () Bool)

(assert (=> d!99689 (= c!80378 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!324242 () (_ BitVec 64))

(assert (=> d!99689 (= lt!324242 (select (arr!19724 a!3186) (toIndex!0 (select (arr!19724 a!3186) j!159) mask!3328)))))

(assert (=> d!99689 (validMask!0 mask!3328)))

(assert (=> d!99689 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19724 a!3186) j!159) mask!3328) (select (arr!19724 a!3186) j!159) a!3186 mask!3328) lt!324241)))

(declare-fun b!731637 () Bool)

(declare-fun e!409401 () SeekEntryResult!7324)

(assert (=> b!731637 (= e!409401 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!19724 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!19724 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!731638 () Bool)

(assert (=> b!731638 (and (bvsge (index!31666 lt!324241) #b00000000000000000000000000000000) (bvslt (index!31666 lt!324241) (size!20145 a!3186)))))

(declare-fun res!491636 () Bool)

(assert (=> b!731638 (= res!491636 (= (select (arr!19724 a!3186) (index!31666 lt!324241)) (select (arr!19724 a!3186) j!159)))))

(declare-fun e!409402 () Bool)

(assert (=> b!731638 (=> res!491636 e!409402)))

(declare-fun e!409400 () Bool)

(assert (=> b!731638 (= e!409400 e!409402)))

(declare-fun b!731639 () Bool)

(assert (=> b!731639 (= e!409401 (Intermediate!7324 false (toIndex!0 (select (arr!19724 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!731640 () Bool)

(assert (=> b!731640 (= e!409399 (Intermediate!7324 true (toIndex!0 (select (arr!19724 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!731641 () Bool)

(assert (=> b!731641 (and (bvsge (index!31666 lt!324241) #b00000000000000000000000000000000) (bvslt (index!31666 lt!324241) (size!20145 a!3186)))))

(assert (=> b!731641 (= e!409402 (= (select (arr!19724 a!3186) (index!31666 lt!324241)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!731642 () Bool)

(assert (=> b!731642 (= e!409403 (bvsge (x!62634 lt!324241) #b01111111111111111111111111111110))))

(declare-fun b!731643 () Bool)

(assert (=> b!731643 (= e!409403 e!409400)))

(declare-fun res!491637 () Bool)

(assert (=> b!731643 (= res!491637 (and (is-Intermediate!7324 lt!324241) (not (undefined!8136 lt!324241)) (bvslt (x!62634 lt!324241) #b01111111111111111111111111111110) (bvsge (x!62634 lt!324241) #b00000000000000000000000000000000) (bvsge (x!62634 lt!324241) #b00000000000000000000000000000000)))))

(assert (=> b!731643 (=> (not res!491637) (not e!409400))))

(declare-fun b!731644 () Bool)

(assert (=> b!731644 (= e!409399 e!409401)))

(declare-fun c!80379 () Bool)

(assert (=> b!731644 (= c!80379 (or (= lt!324242 (select (arr!19724 a!3186) j!159)) (= (bvadd lt!324242 lt!324242) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!731645 () Bool)

(assert (=> b!731645 (and (bvsge (index!31666 lt!324241) #b00000000000000000000000000000000) (bvslt (index!31666 lt!324241) (size!20145 a!3186)))))

(declare-fun res!491635 () Bool)

(assert (=> b!731645 (= res!491635 (= (select (arr!19724 a!3186) (index!31666 lt!324241)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!731645 (=> res!491635 e!409402)))

(assert (= (and d!99689 c!80378) b!731640))

(assert (= (and d!99689 (not c!80378)) b!731644))

(assert (= (and b!731644 c!80379) b!731639))

(assert (= (and b!731644 (not c!80379)) b!731637))

(assert (= (and d!99689 c!80377) b!731642))

(assert (= (and d!99689 (not c!80377)) b!731643))

(assert (= (and b!731643 res!491637) b!731638))

(assert (= (and b!731638 (not res!491636)) b!731645))

(assert (= (and b!731645 (not res!491635)) b!731641))

(assert (=> d!99689 m!684753))

(declare-fun m!684953 () Bool)

(assert (=> d!99689 m!684953))

(assert (=> d!99689 m!684749))

(declare-fun m!684955 () Bool)

(assert (=> b!731645 m!684955))

(assert (=> b!731641 m!684955))

(assert (=> b!731637 m!684753))

(declare-fun m!684957 () Bool)

(assert (=> b!731637 m!684957))

(assert (=> b!731637 m!684957))

(assert (=> b!731637 m!684717))

(declare-fun m!684959 () Bool)

(assert (=> b!731637 m!684959))

(assert (=> b!731638 m!684955))

(assert (=> b!731338 d!99689))

(declare-fun d!99691 () Bool)

(declare-fun lt!324244 () (_ BitVec 32))

(declare-fun lt!324243 () (_ BitVec 32))

(assert (=> d!99691 (= lt!324244 (bvmul (bvxor lt!324243 (bvlshr lt!324243 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99691 (= lt!324243 ((_ extract 31 0) (bvand (bvxor (select (arr!19724 a!3186) j!159) (bvlshr (select (arr!19724 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99691 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!491600 (let ((h!14785 ((_ extract 31 0) (bvand (bvxor (select (arr!19724 a!3186) j!159) (bvlshr (select (arr!19724 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!62643 (bvmul (bvxor h!14785 (bvlshr h!14785 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!62643 (bvlshr x!62643 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!491600 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!491600 #b00000000000000000000000000000000))))))

(assert (=> d!99691 (= (toIndex!0 (select (arr!19724 a!3186) j!159) mask!3328) (bvand (bvxor lt!324244 (bvlshr lt!324244 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!731338 d!99691))

(declare-fun d!99693 () Bool)

(assert (=> d!99693 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!64760 d!99693))

(declare-fun d!99695 () Bool)

(assert (=> d!99695 (= (array_inv!15520 a!3186) (bvsge (size!20145 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!64760 d!99695))

(declare-fun b!731646 () Bool)

(declare-fun e!409404 () SeekEntryResult!7324)

(declare-fun lt!324245 () SeekEntryResult!7324)

(assert (=> b!731646 (= e!409404 (MissingZero!7324 (index!31666 lt!324245)))))

(declare-fun b!731647 () Bool)

(declare-fun c!80381 () Bool)

(declare-fun lt!324246 () (_ BitVec 64))

(assert (=> b!731647 (= c!80381 (= lt!324246 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!409405 () SeekEntryResult!7324)

(assert (=> b!731647 (= e!409405 e!409404)))

(declare-fun b!731648 () Bool)

(assert (=> b!731648 (= e!409405 (Found!7324 (index!31666 lt!324245)))))

(declare-fun b!731649 () Bool)

(assert (=> b!731649 (= e!409404 (seekKeyOrZeroReturnVacant!0 (x!62634 lt!324245) (index!31666 lt!324245) (index!31666 lt!324245) (select (arr!19724 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!731650 () Bool)

(declare-fun e!409406 () SeekEntryResult!7324)

(assert (=> b!731650 (= e!409406 e!409405)))

(assert (=> b!731650 (= lt!324246 (select (arr!19724 a!3186) (index!31666 lt!324245)))))

(declare-fun c!80380 () Bool)

(assert (=> b!731650 (= c!80380 (= lt!324246 (select (arr!19724 a!3186) j!159)))))

(declare-fun d!99697 () Bool)

(declare-fun lt!324247 () SeekEntryResult!7324)

(assert (=> d!99697 (and (or (is-Undefined!7324 lt!324247) (not (is-Found!7324 lt!324247)) (and (bvsge (index!31665 lt!324247) #b00000000000000000000000000000000) (bvslt (index!31665 lt!324247) (size!20145 a!3186)))) (or (is-Undefined!7324 lt!324247) (is-Found!7324 lt!324247) (not (is-MissingZero!7324 lt!324247)) (and (bvsge (index!31664 lt!324247) #b00000000000000000000000000000000) (bvslt (index!31664 lt!324247) (size!20145 a!3186)))) (or (is-Undefined!7324 lt!324247) (is-Found!7324 lt!324247) (is-MissingZero!7324 lt!324247) (not (is-MissingVacant!7324 lt!324247)) (and (bvsge (index!31667 lt!324247) #b00000000000000000000000000000000) (bvslt (index!31667 lt!324247) (size!20145 a!3186)))) (or (is-Undefined!7324 lt!324247) (ite (is-Found!7324 lt!324247) (= (select (arr!19724 a!3186) (index!31665 lt!324247)) (select (arr!19724 a!3186) j!159)) (ite (is-MissingZero!7324 lt!324247) (= (select (arr!19724 a!3186) (index!31664 lt!324247)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7324 lt!324247) (= (select (arr!19724 a!3186) (index!31667 lt!324247)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!99697 (= lt!324247 e!409406)))

(declare-fun c!80382 () Bool)

(assert (=> d!99697 (= c!80382 (and (is-Intermediate!7324 lt!324245) (undefined!8136 lt!324245)))))

(assert (=> d!99697 (= lt!324245 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19724 a!3186) j!159) mask!3328) (select (arr!19724 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!99697 (validMask!0 mask!3328)))

(assert (=> d!99697 (= (seekEntryOrOpen!0 (select (arr!19724 a!3186) j!159) a!3186 mask!3328) lt!324247)))

(declare-fun b!731651 () Bool)

(assert (=> b!731651 (= e!409406 Undefined!7324)))

(assert (= (and d!99697 c!80382) b!731651))

(assert (= (and d!99697 (not c!80382)) b!731650))

(assert (= (and b!731650 c!80380) b!731648))

(assert (= (and b!731650 (not c!80380)) b!731647))

(assert (= (and b!731647 c!80381) b!731646))

(assert (= (and b!731647 (not c!80381)) b!731649))

(assert (=> b!731649 m!684717))

(declare-fun m!684961 () Bool)

(assert (=> b!731649 m!684961))

(declare-fun m!684963 () Bool)

(assert (=> b!731650 m!684963))

(declare-fun m!684965 () Bool)

(assert (=> d!99697 m!684965))

(assert (=> d!99697 m!684717))

(assert (=> d!99697 m!684753))

(assert (=> d!99697 m!684753))

(assert (=> d!99697 m!684717))

(assert (=> d!99697 m!684755))

(declare-fun m!684967 () Bool)

(assert (=> d!99697 m!684967))

(assert (=> d!99697 m!684749))

(declare-fun m!684969 () Bool)

(assert (=> d!99697 m!684969))

(assert (=> b!731344 d!99697))

(declare-fun b!731697 () Bool)

(declare-fun c!80402 () Bool)

(declare-fun lt!324261 () (_ BitVec 64))

(assert (=> b!731697 (= c!80402 (= lt!324261 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!409435 () SeekEntryResult!7324)

(declare-fun e!409436 () SeekEntryResult!7324)

(assert (=> b!731697 (= e!409435 e!409436)))

(declare-fun b!731698 () Bool)

(declare-fun e!409434 () SeekEntryResult!7324)

(assert (=> b!731698 (= e!409434 e!409435)))

(declare-fun c!80403 () Bool)

(assert (=> b!731698 (= c!80403 (= lt!324261 (select (arr!19724 a!3186) j!159)))))

(declare-fun b!731699 () Bool)

(assert (=> b!731699 (= e!409435 (Found!7324 index!1321))))

(declare-fun b!731700 () Bool)

(assert (=> b!731700 (= e!409436 (MissingVacant!7324 resIntermediateIndex!5))))

(declare-fun d!99699 () Bool)

(declare-fun lt!324262 () SeekEntryResult!7324)

(assert (=> d!99699 (and (or (is-Undefined!7324 lt!324262) (not (is-Found!7324 lt!324262)) (and (bvsge (index!31665 lt!324262) #b00000000000000000000000000000000) (bvslt (index!31665 lt!324262) (size!20145 a!3186)))) (or (is-Undefined!7324 lt!324262) (is-Found!7324 lt!324262) (not (is-MissingVacant!7324 lt!324262)) (not (= (index!31667 lt!324262) resIntermediateIndex!5)) (and (bvsge (index!31667 lt!324262) #b00000000000000000000000000000000) (bvslt (index!31667 lt!324262) (size!20145 a!3186)))) (or (is-Undefined!7324 lt!324262) (ite (is-Found!7324 lt!324262) (= (select (arr!19724 a!3186) (index!31665 lt!324262)) (select (arr!19724 a!3186) j!159)) (and (is-MissingVacant!7324 lt!324262) (= (index!31667 lt!324262) resIntermediateIndex!5) (= (select (arr!19724 a!3186) (index!31667 lt!324262)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!99699 (= lt!324262 e!409434)))

(declare-fun c!80401 () Bool)

(assert (=> d!99699 (= c!80401 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!99699 (= lt!324261 (select (arr!19724 a!3186) index!1321))))

(assert (=> d!99699 (validMask!0 mask!3328)))

(assert (=> d!99699 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19724 a!3186) j!159) a!3186 mask!3328) lt!324262)))

(declare-fun b!731701 () Bool)

(assert (=> b!731701 (= e!409436 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!19724 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!731702 () Bool)

(assert (=> b!731702 (= e!409434 Undefined!7324)))

(assert (= (and d!99699 c!80401) b!731702))

(assert (= (and d!99699 (not c!80401)) b!731698))

(assert (= (and b!731698 c!80403) b!731699))

(assert (= (and b!731698 (not c!80403)) b!731697))

(assert (= (and b!731697 c!80402) b!731700))

(assert (= (and b!731697 (not c!80402)) b!731701))

(declare-fun m!684985 () Bool)

(assert (=> d!99699 m!684985))

(declare-fun m!684987 () Bool)

(assert (=> d!99699 m!684987))

(assert (=> d!99699 m!684917))

(assert (=> d!99699 m!684749))

(assert (=> b!731701 m!684733))

(assert (=> b!731701 m!684733))

(assert (=> b!731701 m!684717))

(declare-fun m!684989 () Bool)

(assert (=> b!731701 m!684989))

(assert (=> b!731345 d!99699))

(declare-fun d!99705 () Bool)

(assert (=> d!99705 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!731335 d!99705))

(declare-fun d!99707 () Bool)

(assert (=> d!99707 (= (validKeyInArray!0 (select (arr!19724 a!3186) j!159)) (and (not (= (select (arr!19724 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19724 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!731346 d!99707))

(declare-fun b!731709 () Bool)

(declare-fun c!80405 () Bool)

(declare-fun lt!324263 () (_ BitVec 64))

(assert (=> b!731709 (= c!80405 (= lt!324263 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!409444 () SeekEntryResult!7324)

(declare-fun e!409445 () SeekEntryResult!7324)

(assert (=> b!731709 (= e!409444 e!409445)))

(declare-fun b!731710 () Bool)

(declare-fun e!409443 () SeekEntryResult!7324)

(assert (=> b!731710 (= e!409443 e!409444)))

(declare-fun c!80406 () Bool)

(assert (=> b!731710 (= c!80406 (= lt!324263 (select (arr!19724 a!3186) j!159)))))

(declare-fun b!731711 () Bool)

