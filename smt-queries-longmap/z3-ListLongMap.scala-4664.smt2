; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64758 () Bool)

(assert start!64758)

(declare-fun b!731270 () Bool)

(declare-fun res!491488 () Bool)

(declare-fun e!409191 () Bool)

(assert (=> b!731270 (=> (not res!491488) (not e!409191))))

(declare-datatypes ((array!41207 0))(
  ( (array!41208 (arr!19723 (Array (_ BitVec 32) (_ BitVec 64))) (size!20144 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41207)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41207 (_ BitVec 32)) Bool)

(assert (=> b!731270 (= res!491488 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!731271 () Bool)

(declare-fun res!491483 () Bool)

(declare-fun e!409190 () Bool)

(assert (=> b!731271 (=> (not res!491483) (not e!409190))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!731271 (= res!491483 (validKeyInArray!0 (select (arr!19723 a!3186) j!159)))))

(declare-fun b!731272 () Bool)

(declare-fun res!491482 () Bool)

(assert (=> b!731272 (=> (not res!491482) (not e!409190))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!731272 (= res!491482 (and (= (size!20144 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20144 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20144 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!731273 () Bool)

(assert (=> b!731273 (= e!409190 e!409191)))

(declare-fun res!491475 () Bool)

(assert (=> b!731273 (=> (not res!491475) (not e!409191))))

(declare-datatypes ((SeekEntryResult!7323 0))(
  ( (MissingZero!7323 (index!31660 (_ BitVec 32))) (Found!7323 (index!31661 (_ BitVec 32))) (Intermediate!7323 (undefined!8135 Bool) (index!31662 (_ BitVec 32)) (x!62633 (_ BitVec 32))) (Undefined!7323) (MissingVacant!7323 (index!31663 (_ BitVec 32))) )
))
(declare-fun lt!324074 () SeekEntryResult!7323)

(assert (=> b!731273 (= res!491475 (or (= lt!324074 (MissingZero!7323 i!1173)) (= lt!324074 (MissingVacant!7323 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41207 (_ BitVec 32)) SeekEntryResult!7323)

(assert (=> b!731273 (= lt!324074 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!731274 () Bool)

(declare-fun e!409195 () Bool)

(assert (=> b!731274 (= e!409191 e!409195)))

(declare-fun res!491476 () Bool)

(assert (=> b!731274 (=> (not res!491476) (not e!409195))))

(declare-fun lt!324072 () SeekEntryResult!7323)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41207 (_ BitVec 32)) SeekEntryResult!7323)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!731274 (= res!491476 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19723 a!3186) j!159) mask!3328) (select (arr!19723 a!3186) j!159) a!3186 mask!3328) lt!324072))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!731274 (= lt!324072 (Intermediate!7323 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!731275 () Bool)

(declare-fun e!409187 () Bool)

(assert (=> b!731275 (= e!409195 e!409187)))

(declare-fun res!491487 () Bool)

(assert (=> b!731275 (=> (not res!491487) (not e!409187))))

(declare-fun lt!324073 () SeekEntryResult!7323)

(declare-fun lt!324078 () SeekEntryResult!7323)

(assert (=> b!731275 (= res!491487 (= lt!324073 lt!324078))))

(declare-fun lt!324079 () array!41207)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!324077 () (_ BitVec 64))

(assert (=> b!731275 (= lt!324078 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!324077 lt!324079 mask!3328))))

(assert (=> b!731275 (= lt!324073 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!324077 mask!3328) lt!324077 lt!324079 mask!3328))))

(assert (=> b!731275 (= lt!324077 (select (store (arr!19723 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!731275 (= lt!324079 (array!41208 (store (arr!19723 a!3186) i!1173 k0!2102) (size!20144 a!3186)))))

(declare-fun b!731276 () Bool)

(declare-fun e!409189 () Bool)

(declare-fun lt!324075 () (_ BitVec 32))

(assert (=> b!731276 (= e!409189 (or (bvslt mask!3328 #b00000000000000000000000000000000) (and (bvsge lt!324075 #b00000000000000000000000000000000) (bvslt lt!324075 (bvadd #b00000000000000000000000000000001 mask!3328)))))))

(declare-fun b!731277 () Bool)

(declare-fun res!491484 () Bool)

(assert (=> b!731277 (=> (not res!491484) (not e!409191))))

(assert (=> b!731277 (= res!491484 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20144 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20144 a!3186))))))

(declare-fun b!731279 () Bool)

(declare-fun res!491490 () Bool)

(assert (=> b!731279 (=> (not res!491490) (not e!409190))))

(assert (=> b!731279 (= res!491490 (validKeyInArray!0 k0!2102))))

(declare-fun b!731280 () Bool)

(declare-fun res!491489 () Bool)

(assert (=> b!731280 (=> (not res!491489) (not e!409195))))

(assert (=> b!731280 (= res!491489 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19723 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!731281 () Bool)

(declare-fun res!491485 () Bool)

(assert (=> b!731281 (=> (not res!491485) (not e!409191))))

(declare-datatypes ((List!13725 0))(
  ( (Nil!13722) (Cons!13721 (h!14781 (_ BitVec 64)) (t!20040 List!13725)) )
))
(declare-fun arrayNoDuplicates!0 (array!41207 (_ BitVec 32) List!13725) Bool)

(assert (=> b!731281 (= res!491485 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13722))))

(declare-fun b!731282 () Bool)

(declare-fun e!409192 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41207 (_ BitVec 32)) SeekEntryResult!7323)

(assert (=> b!731282 (= e!409192 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19723 a!3186) j!159) a!3186 mask!3328) (Found!7323 j!159)))))

(declare-fun lt!324080 () SeekEntryResult!7323)

(declare-fun e!409188 () Bool)

(declare-fun b!731283 () Bool)

(assert (=> b!731283 (= e!409188 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19723 a!3186) j!159) a!3186 mask!3328) lt!324080))))

(declare-fun b!731284 () Bool)

(assert (=> b!731284 (= e!409192 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19723 a!3186) j!159) a!3186 mask!3328) lt!324072))))

(declare-fun b!731285 () Bool)

(declare-fun e!409193 () Bool)

(assert (=> b!731285 (= e!409193 e!409188)))

(declare-fun res!491477 () Bool)

(assert (=> b!731285 (=> (not res!491477) (not e!409188))))

(assert (=> b!731285 (= res!491477 (= (seekEntryOrOpen!0 (select (arr!19723 a!3186) j!159) a!3186 mask!3328) lt!324080))))

(assert (=> b!731285 (= lt!324080 (Found!7323 j!159))))

(declare-fun b!731278 () Bool)

(declare-fun res!491492 () Bool)

(assert (=> b!731278 (=> (not res!491492) (not e!409195))))

(assert (=> b!731278 (= res!491492 e!409192)))

(declare-fun c!80272 () Bool)

(assert (=> b!731278 (= c!80272 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!491486 () Bool)

(assert (=> start!64758 (=> (not res!491486) (not e!409190))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64758 (= res!491486 (validMask!0 mask!3328))))

(assert (=> start!64758 e!409190))

(assert (=> start!64758 true))

(declare-fun array_inv!15519 (array!41207) Bool)

(assert (=> start!64758 (array_inv!15519 a!3186)))

(declare-fun b!731286 () Bool)

(declare-fun e!409196 () Bool)

(assert (=> b!731286 (= e!409196 e!409189)))

(declare-fun res!491481 () Bool)

(assert (=> b!731286 (=> res!491481 e!409189)))

(assert (=> b!731286 (= res!491481 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!731286 (= lt!324075 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!731287 () Bool)

(assert (=> b!731287 (= e!409187 (not e!409196))))

(declare-fun res!491480 () Bool)

(assert (=> b!731287 (=> res!491480 e!409196)))

(get-info :version)

(assert (=> b!731287 (= res!491480 (or (not ((_ is Intermediate!7323) lt!324078)) (bvsge x!1131 (x!62633 lt!324078))))))

(assert (=> b!731287 e!409193))

(declare-fun res!491491 () Bool)

(assert (=> b!731287 (=> (not res!491491) (not e!409193))))

(assert (=> b!731287 (= res!491491 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24964 0))(
  ( (Unit!24965) )
))
(declare-fun lt!324076 () Unit!24964)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41207 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24964)

(assert (=> b!731287 (= lt!324076 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!731288 () Bool)

(declare-fun res!491479 () Bool)

(assert (=> b!731288 (=> (not res!491479) (not e!409190))))

(declare-fun arrayContainsKey!0 (array!41207 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!731288 (= res!491479 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!731289 () Bool)

(declare-fun res!491478 () Bool)

(assert (=> b!731289 (=> res!491478 e!409189)))

(assert (=> b!731289 (= res!491478 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19723 a!3186) j!159) a!3186 mask!3328) (Found!7323 j!159))))))

(assert (= (and start!64758 res!491486) b!731272))

(assert (= (and b!731272 res!491482) b!731271))

(assert (= (and b!731271 res!491483) b!731279))

(assert (= (and b!731279 res!491490) b!731288))

(assert (= (and b!731288 res!491479) b!731273))

(assert (= (and b!731273 res!491475) b!731270))

(assert (= (and b!731270 res!491488) b!731281))

(assert (= (and b!731281 res!491485) b!731277))

(assert (= (and b!731277 res!491484) b!731274))

(assert (= (and b!731274 res!491476) b!731280))

(assert (= (and b!731280 res!491489) b!731278))

(assert (= (and b!731278 c!80272) b!731284))

(assert (= (and b!731278 (not c!80272)) b!731282))

(assert (= (and b!731278 res!491492) b!731275))

(assert (= (and b!731275 res!491487) b!731287))

(assert (= (and b!731287 res!491491) b!731285))

(assert (= (and b!731285 res!491477) b!731283))

(assert (= (and b!731287 (not res!491480)) b!731286))

(assert (= (and b!731286 (not res!491481)) b!731289))

(assert (= (and b!731289 (not res!491478)) b!731276))

(declare-fun m!684667 () Bool)

(assert (=> b!731280 m!684667))

(declare-fun m!684669 () Bool)

(assert (=> b!731282 m!684669))

(assert (=> b!731282 m!684669))

(declare-fun m!684671 () Bool)

(assert (=> b!731282 m!684671))

(declare-fun m!684673 () Bool)

(assert (=> b!731279 m!684673))

(declare-fun m!684675 () Bool)

(assert (=> b!731275 m!684675))

(declare-fun m!684677 () Bool)

(assert (=> b!731275 m!684677))

(declare-fun m!684679 () Bool)

(assert (=> b!731275 m!684679))

(declare-fun m!684681 () Bool)

(assert (=> b!731275 m!684681))

(assert (=> b!731275 m!684675))

(declare-fun m!684683 () Bool)

(assert (=> b!731275 m!684683))

(declare-fun m!684685 () Bool)

(assert (=> b!731287 m!684685))

(declare-fun m!684687 () Bool)

(assert (=> b!731287 m!684687))

(declare-fun m!684689 () Bool)

(assert (=> b!731281 m!684689))

(declare-fun m!684691 () Bool)

(assert (=> b!731288 m!684691))

(assert (=> b!731283 m!684669))

(assert (=> b!731283 m!684669))

(declare-fun m!684693 () Bool)

(assert (=> b!731283 m!684693))

(assert (=> b!731285 m!684669))

(assert (=> b!731285 m!684669))

(declare-fun m!684695 () Bool)

(assert (=> b!731285 m!684695))

(declare-fun m!684697 () Bool)

(assert (=> start!64758 m!684697))

(declare-fun m!684699 () Bool)

(assert (=> start!64758 m!684699))

(declare-fun m!684701 () Bool)

(assert (=> b!731286 m!684701))

(declare-fun m!684703 () Bool)

(assert (=> b!731273 m!684703))

(declare-fun m!684705 () Bool)

(assert (=> b!731270 m!684705))

(assert (=> b!731289 m!684669))

(assert (=> b!731289 m!684669))

(assert (=> b!731289 m!684671))

(assert (=> b!731271 m!684669))

(assert (=> b!731271 m!684669))

(declare-fun m!684707 () Bool)

(assert (=> b!731271 m!684707))

(assert (=> b!731274 m!684669))

(assert (=> b!731274 m!684669))

(declare-fun m!684709 () Bool)

(assert (=> b!731274 m!684709))

(assert (=> b!731274 m!684709))

(assert (=> b!731274 m!684669))

(declare-fun m!684711 () Bool)

(assert (=> b!731274 m!684711))

(assert (=> b!731284 m!684669))

(assert (=> b!731284 m!684669))

(declare-fun m!684713 () Bool)

(assert (=> b!731284 m!684713))

(check-sat (not b!731275) (not b!731286) (not b!731285) (not b!731270) (not b!731279) (not b!731287) (not b!731283) (not b!731281) (not start!64758) (not b!731273) (not b!731284) (not b!731274) (not b!731288) (not b!731271) (not b!731289) (not b!731282))
(check-sat)
(get-model)

(declare-fun b!731362 () Bool)

(declare-fun c!80284 () Bool)

(declare-fun lt!324112 () (_ BitVec 64))

(assert (=> b!731362 (= c!80284 (= lt!324112 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!409235 () SeekEntryResult!7323)

(declare-fun e!409233 () SeekEntryResult!7323)

(assert (=> b!731362 (= e!409235 e!409233)))

(declare-fun b!731363 () Bool)

(assert (=> b!731363 (= e!409235 (Found!7323 resIntermediateIndex!5))))

(declare-fun b!731364 () Bool)

(assert (=> b!731364 (= e!409233 (MissingVacant!7323 resIntermediateIndex!5))))

(declare-fun b!731365 () Bool)

(assert (=> b!731365 (= e!409233 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!19723 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!731366 () Bool)

(declare-fun e!409234 () SeekEntryResult!7323)

(assert (=> b!731366 (= e!409234 e!409235)))

(declare-fun c!80282 () Bool)

(assert (=> b!731366 (= c!80282 (= lt!324112 (select (arr!19723 a!3186) j!159)))))

(declare-fun b!731367 () Bool)

(assert (=> b!731367 (= e!409234 Undefined!7323)))

(declare-fun d!99611 () Bool)

(declare-fun lt!324113 () SeekEntryResult!7323)

(assert (=> d!99611 (and (or ((_ is Undefined!7323) lt!324113) (not ((_ is Found!7323) lt!324113)) (and (bvsge (index!31661 lt!324113) #b00000000000000000000000000000000) (bvslt (index!31661 lt!324113) (size!20144 a!3186)))) (or ((_ is Undefined!7323) lt!324113) ((_ is Found!7323) lt!324113) (not ((_ is MissingVacant!7323) lt!324113)) (not (= (index!31663 lt!324113) resIntermediateIndex!5)) (and (bvsge (index!31663 lt!324113) #b00000000000000000000000000000000) (bvslt (index!31663 lt!324113) (size!20144 a!3186)))) (or ((_ is Undefined!7323) lt!324113) (ite ((_ is Found!7323) lt!324113) (= (select (arr!19723 a!3186) (index!31661 lt!324113)) (select (arr!19723 a!3186) j!159)) (and ((_ is MissingVacant!7323) lt!324113) (= (index!31663 lt!324113) resIntermediateIndex!5) (= (select (arr!19723 a!3186) (index!31663 lt!324113)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!99611 (= lt!324113 e!409234)))

(declare-fun c!80283 () Bool)

(assert (=> d!99611 (= c!80283 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!99611 (= lt!324112 (select (arr!19723 a!3186) resIntermediateIndex!5))))

(assert (=> d!99611 (validMask!0 mask!3328)))

(assert (=> d!99611 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19723 a!3186) j!159) a!3186 mask!3328) lt!324113)))

(assert (= (and d!99611 c!80283) b!731367))

(assert (= (and d!99611 (not c!80283)) b!731366))

(assert (= (and b!731366 c!80282) b!731363))

(assert (= (and b!731366 (not c!80282)) b!731362))

(assert (= (and b!731362 c!80284) b!731364))

(assert (= (and b!731362 (not c!80284)) b!731365))

(declare-fun m!684763 () Bool)

(assert (=> b!731365 m!684763))

(assert (=> b!731365 m!684763))

(assert (=> b!731365 m!684669))

(declare-fun m!684765 () Bool)

(assert (=> b!731365 m!684765))

(declare-fun m!684767 () Bool)

(assert (=> d!99611 m!684767))

(declare-fun m!684769 () Bool)

(assert (=> d!99611 m!684769))

(assert (=> d!99611 m!684667))

(assert (=> d!99611 m!684697))

(assert (=> b!731283 d!99611))

(declare-fun b!731386 () Bool)

(declare-fun lt!324119 () SeekEntryResult!7323)

(assert (=> b!731386 (and (bvsge (index!31662 lt!324119) #b00000000000000000000000000000000) (bvslt (index!31662 lt!324119) (size!20144 a!3186)))))

(declare-fun res!491555 () Bool)

(assert (=> b!731386 (= res!491555 (= (select (arr!19723 a!3186) (index!31662 lt!324119)) (select (arr!19723 a!3186) j!159)))))

(declare-fun e!409246 () Bool)

(assert (=> b!731386 (=> res!491555 e!409246)))

(declare-fun e!409248 () Bool)

(assert (=> b!731386 (= e!409248 e!409246)))

(declare-fun b!731387 () Bool)

(assert (=> b!731387 (and (bvsge (index!31662 lt!324119) #b00000000000000000000000000000000) (bvslt (index!31662 lt!324119) (size!20144 a!3186)))))

(assert (=> b!731387 (= e!409246 (= (select (arr!19723 a!3186) (index!31662 lt!324119)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!731389 () Bool)

(assert (=> b!731389 (and (bvsge (index!31662 lt!324119) #b00000000000000000000000000000000) (bvslt (index!31662 lt!324119) (size!20144 a!3186)))))

(declare-fun res!491553 () Bool)

(assert (=> b!731389 (= res!491553 (= (select (arr!19723 a!3186) (index!31662 lt!324119)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!731389 (=> res!491553 e!409246)))

(declare-fun b!731390 () Bool)

(declare-fun e!409247 () SeekEntryResult!7323)

(assert (=> b!731390 (= e!409247 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!19723 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!19723 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!731391 () Bool)

(declare-fun e!409250 () Bool)

(assert (=> b!731391 (= e!409250 (bvsge (x!62633 lt!324119) #b01111111111111111111111111111110))))

(declare-fun b!731392 () Bool)

(assert (=> b!731392 (= e!409247 (Intermediate!7323 false (toIndex!0 (select (arr!19723 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun d!99613 () Bool)

(assert (=> d!99613 e!409250))

(declare-fun c!80293 () Bool)

(assert (=> d!99613 (= c!80293 (and ((_ is Intermediate!7323) lt!324119) (undefined!8135 lt!324119)))))

(declare-fun e!409249 () SeekEntryResult!7323)

(assert (=> d!99613 (= lt!324119 e!409249)))

(declare-fun c!80292 () Bool)

(assert (=> d!99613 (= c!80292 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!324118 () (_ BitVec 64))

(assert (=> d!99613 (= lt!324118 (select (arr!19723 a!3186) (toIndex!0 (select (arr!19723 a!3186) j!159) mask!3328)))))

(assert (=> d!99613 (validMask!0 mask!3328)))

(assert (=> d!99613 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19723 a!3186) j!159) mask!3328) (select (arr!19723 a!3186) j!159) a!3186 mask!3328) lt!324119)))

(declare-fun b!731388 () Bool)

(assert (=> b!731388 (= e!409249 e!409247)))

(declare-fun c!80291 () Bool)

(assert (=> b!731388 (= c!80291 (or (= lt!324118 (select (arr!19723 a!3186) j!159)) (= (bvadd lt!324118 lt!324118) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!731393 () Bool)

(assert (=> b!731393 (= e!409250 e!409248)))

(declare-fun res!491554 () Bool)

(assert (=> b!731393 (= res!491554 (and ((_ is Intermediate!7323) lt!324119) (not (undefined!8135 lt!324119)) (bvslt (x!62633 lt!324119) #b01111111111111111111111111111110) (bvsge (x!62633 lt!324119) #b00000000000000000000000000000000) (bvsge (x!62633 lt!324119) #b00000000000000000000000000000000)))))

(assert (=> b!731393 (=> (not res!491554) (not e!409248))))

(declare-fun b!731394 () Bool)

(assert (=> b!731394 (= e!409249 (Intermediate!7323 true (toIndex!0 (select (arr!19723 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!99613 c!80292) b!731394))

(assert (= (and d!99613 (not c!80292)) b!731388))

(assert (= (and b!731388 c!80291) b!731392))

(assert (= (and b!731388 (not c!80291)) b!731390))

(assert (= (and d!99613 c!80293) b!731391))

(assert (= (and d!99613 (not c!80293)) b!731393))

(assert (= (and b!731393 res!491554) b!731386))

(assert (= (and b!731386 (not res!491555)) b!731389))

(assert (= (and b!731389 (not res!491553)) b!731387))

(assert (=> b!731390 m!684709))

(declare-fun m!684771 () Bool)

(assert (=> b!731390 m!684771))

(assert (=> b!731390 m!684771))

(assert (=> b!731390 m!684669))

(declare-fun m!684773 () Bool)

(assert (=> b!731390 m!684773))

(declare-fun m!684775 () Bool)

(assert (=> b!731387 m!684775))

(assert (=> d!99613 m!684709))

(declare-fun m!684777 () Bool)

(assert (=> d!99613 m!684777))

(assert (=> d!99613 m!684697))

(assert (=> b!731386 m!684775))

(assert (=> b!731389 m!684775))

(assert (=> b!731274 d!99613))

(declare-fun d!99615 () Bool)

(declare-fun lt!324125 () (_ BitVec 32))

(declare-fun lt!324124 () (_ BitVec 32))

(assert (=> d!99615 (= lt!324125 (bvmul (bvxor lt!324124 (bvlshr lt!324124 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99615 (= lt!324124 ((_ extract 31 0) (bvand (bvxor (select (arr!19723 a!3186) j!159) (bvlshr (select (arr!19723 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99615 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!491556 (let ((h!14783 ((_ extract 31 0) (bvand (bvxor (select (arr!19723 a!3186) j!159) (bvlshr (select (arr!19723 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!62637 (bvmul (bvxor h!14783 (bvlshr h!14783 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!62637 (bvlshr x!62637 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!491556 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!491556 #b00000000000000000000000000000000))))))

(assert (=> d!99615 (= (toIndex!0 (select (arr!19723 a!3186) j!159) mask!3328) (bvand (bvxor lt!324125 (bvlshr lt!324125 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!731274 d!99615))

(declare-fun d!99619 () Bool)

(assert (=> d!99619 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!64758 d!99619))

(declare-fun d!99625 () Bool)

(assert (=> d!99625 (= (array_inv!15519 a!3186) (bvsge (size!20144 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!64758 d!99625))

(declare-fun b!731460 () Bool)

(declare-fun e!409288 () SeekEntryResult!7323)

(assert (=> b!731460 (= e!409288 Undefined!7323)))

(declare-fun b!731461 () Bool)

(declare-fun c!80321 () Bool)

(declare-fun lt!324165 () (_ BitVec 64))

(assert (=> b!731461 (= c!80321 (= lt!324165 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!409287 () SeekEntryResult!7323)

(declare-fun e!409289 () SeekEntryResult!7323)

(assert (=> b!731461 (= e!409287 e!409289)))

(declare-fun b!731462 () Bool)

(declare-fun lt!324167 () SeekEntryResult!7323)

(assert (=> b!731462 (= e!409289 (MissingZero!7323 (index!31662 lt!324167)))))

(declare-fun b!731463 () Bool)

(assert (=> b!731463 (= e!409289 (seekKeyOrZeroReturnVacant!0 (x!62633 lt!324167) (index!31662 lt!324167) (index!31662 lt!324167) k0!2102 a!3186 mask!3328))))

(declare-fun d!99627 () Bool)

(declare-fun lt!324166 () SeekEntryResult!7323)

(assert (=> d!99627 (and (or ((_ is Undefined!7323) lt!324166) (not ((_ is Found!7323) lt!324166)) (and (bvsge (index!31661 lt!324166) #b00000000000000000000000000000000) (bvslt (index!31661 lt!324166) (size!20144 a!3186)))) (or ((_ is Undefined!7323) lt!324166) ((_ is Found!7323) lt!324166) (not ((_ is MissingZero!7323) lt!324166)) (and (bvsge (index!31660 lt!324166) #b00000000000000000000000000000000) (bvslt (index!31660 lt!324166) (size!20144 a!3186)))) (or ((_ is Undefined!7323) lt!324166) ((_ is Found!7323) lt!324166) ((_ is MissingZero!7323) lt!324166) (not ((_ is MissingVacant!7323) lt!324166)) (and (bvsge (index!31663 lt!324166) #b00000000000000000000000000000000) (bvslt (index!31663 lt!324166) (size!20144 a!3186)))) (or ((_ is Undefined!7323) lt!324166) (ite ((_ is Found!7323) lt!324166) (= (select (arr!19723 a!3186) (index!31661 lt!324166)) k0!2102) (ite ((_ is MissingZero!7323) lt!324166) (= (select (arr!19723 a!3186) (index!31660 lt!324166)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7323) lt!324166) (= (select (arr!19723 a!3186) (index!31663 lt!324166)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!99627 (= lt!324166 e!409288)))

(declare-fun c!80322 () Bool)

(assert (=> d!99627 (= c!80322 (and ((_ is Intermediate!7323) lt!324167) (undefined!8135 lt!324167)))))

(assert (=> d!99627 (= lt!324167 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!99627 (validMask!0 mask!3328)))

(assert (=> d!99627 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!324166)))

(declare-fun b!731464 () Bool)

(assert (=> b!731464 (= e!409288 e!409287)))

(assert (=> b!731464 (= lt!324165 (select (arr!19723 a!3186) (index!31662 lt!324167)))))

(declare-fun c!80320 () Bool)

(assert (=> b!731464 (= c!80320 (= lt!324165 k0!2102))))

(declare-fun b!731465 () Bool)

(assert (=> b!731465 (= e!409287 (Found!7323 (index!31662 lt!324167)))))

(assert (= (and d!99627 c!80322) b!731460))

(assert (= (and d!99627 (not c!80322)) b!731464))

(assert (= (and b!731464 c!80320) b!731465))

(assert (= (and b!731464 (not c!80320)) b!731461))

(assert (= (and b!731461 c!80321) b!731462))

(assert (= (and b!731461 (not c!80321)) b!731463))

(declare-fun m!684805 () Bool)

(assert (=> b!731463 m!684805))

(declare-fun m!684807 () Bool)

(assert (=> d!99627 m!684807))

(declare-fun m!684809 () Bool)

(assert (=> d!99627 m!684809))

(declare-fun m!684811 () Bool)

(assert (=> d!99627 m!684811))

(declare-fun m!684813 () Bool)

(assert (=> d!99627 m!684813))

(declare-fun m!684815 () Bool)

(assert (=> d!99627 m!684815))

(assert (=> d!99627 m!684697))

(assert (=> d!99627 m!684811))

(declare-fun m!684817 () Bool)

(assert (=> b!731464 m!684817))

(assert (=> b!731273 d!99627))

(declare-fun b!731466 () Bool)

(declare-fun lt!324169 () SeekEntryResult!7323)

(assert (=> b!731466 (and (bvsge (index!31662 lt!324169) #b00000000000000000000000000000000) (bvslt (index!31662 lt!324169) (size!20144 a!3186)))))

(declare-fun res!491573 () Bool)

(assert (=> b!731466 (= res!491573 (= (select (arr!19723 a!3186) (index!31662 lt!324169)) (select (arr!19723 a!3186) j!159)))))

(declare-fun e!409290 () Bool)

(assert (=> b!731466 (=> res!491573 e!409290)))

(declare-fun e!409292 () Bool)

(assert (=> b!731466 (= e!409292 e!409290)))

(declare-fun b!731467 () Bool)

(assert (=> b!731467 (and (bvsge (index!31662 lt!324169) #b00000000000000000000000000000000) (bvslt (index!31662 lt!324169) (size!20144 a!3186)))))

(assert (=> b!731467 (= e!409290 (= (select (arr!19723 a!3186) (index!31662 lt!324169)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!731469 () Bool)

(assert (=> b!731469 (and (bvsge (index!31662 lt!324169) #b00000000000000000000000000000000) (bvslt (index!31662 lt!324169) (size!20144 a!3186)))))

(declare-fun res!491571 () Bool)

(assert (=> b!731469 (= res!491571 (= (select (arr!19723 a!3186) (index!31662 lt!324169)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!731469 (=> res!491571 e!409290)))

(declare-fun b!731470 () Bool)

(declare-fun e!409291 () SeekEntryResult!7323)

(assert (=> b!731470 (= e!409291 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!19723 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!731471 () Bool)

(declare-fun e!409294 () Bool)

(assert (=> b!731471 (= e!409294 (bvsge (x!62633 lt!324169) #b01111111111111111111111111111110))))

(declare-fun b!731472 () Bool)

(assert (=> b!731472 (= e!409291 (Intermediate!7323 false index!1321 x!1131))))

(declare-fun d!99637 () Bool)

(assert (=> d!99637 e!409294))

(declare-fun c!80325 () Bool)

(assert (=> d!99637 (= c!80325 (and ((_ is Intermediate!7323) lt!324169) (undefined!8135 lt!324169)))))

(declare-fun e!409293 () SeekEntryResult!7323)

(assert (=> d!99637 (= lt!324169 e!409293)))

(declare-fun c!80324 () Bool)

(assert (=> d!99637 (= c!80324 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!324168 () (_ BitVec 64))

(assert (=> d!99637 (= lt!324168 (select (arr!19723 a!3186) index!1321))))

(assert (=> d!99637 (validMask!0 mask!3328)))

(assert (=> d!99637 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19723 a!3186) j!159) a!3186 mask!3328) lt!324169)))

(declare-fun b!731468 () Bool)

(assert (=> b!731468 (= e!409293 e!409291)))

(declare-fun c!80323 () Bool)

(assert (=> b!731468 (= c!80323 (or (= lt!324168 (select (arr!19723 a!3186) j!159)) (= (bvadd lt!324168 lt!324168) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!731473 () Bool)

(assert (=> b!731473 (= e!409294 e!409292)))

(declare-fun res!491572 () Bool)

(assert (=> b!731473 (= res!491572 (and ((_ is Intermediate!7323) lt!324169) (not (undefined!8135 lt!324169)) (bvslt (x!62633 lt!324169) #b01111111111111111111111111111110) (bvsge (x!62633 lt!324169) #b00000000000000000000000000000000) (bvsge (x!62633 lt!324169) x!1131)))))

(assert (=> b!731473 (=> (not res!491572) (not e!409292))))

(declare-fun b!731474 () Bool)

(assert (=> b!731474 (= e!409293 (Intermediate!7323 true index!1321 x!1131))))

(assert (= (and d!99637 c!80324) b!731474))

(assert (= (and d!99637 (not c!80324)) b!731468))

(assert (= (and b!731468 c!80323) b!731472))

(assert (= (and b!731468 (not c!80323)) b!731470))

(assert (= (and d!99637 c!80325) b!731471))

(assert (= (and d!99637 (not c!80325)) b!731473))

(assert (= (and b!731473 res!491572) b!731466))

(assert (= (and b!731466 (not res!491573)) b!731469))

(assert (= (and b!731469 (not res!491571)) b!731467))

(assert (=> b!731470 m!684701))

(assert (=> b!731470 m!684701))

(assert (=> b!731470 m!684669))

(declare-fun m!684819 () Bool)

(assert (=> b!731470 m!684819))

(declare-fun m!684821 () Bool)

(assert (=> b!731467 m!684821))

(declare-fun m!684823 () Bool)

(assert (=> d!99637 m!684823))

(assert (=> d!99637 m!684697))

(assert (=> b!731466 m!684821))

(assert (=> b!731469 m!684821))

(assert (=> b!731284 d!99637))

(declare-fun b!731499 () Bool)

(declare-fun e!409312 () Bool)

(declare-fun e!409310 () Bool)

(assert (=> b!731499 (= e!409312 e!409310)))

(declare-fun lt!324188 () (_ BitVec 64))

(assert (=> b!731499 (= lt!324188 (select (arr!19723 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!324186 () Unit!24964)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!41207 (_ BitVec 64) (_ BitVec 32)) Unit!24964)

(assert (=> b!731499 (= lt!324186 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!324188 #b00000000000000000000000000000000))))

(assert (=> b!731499 (arrayContainsKey!0 a!3186 lt!324188 #b00000000000000000000000000000000)))

(declare-fun lt!324187 () Unit!24964)

(assert (=> b!731499 (= lt!324187 lt!324186)))

(declare-fun res!491580 () Bool)

(assert (=> b!731499 (= res!491580 (= (seekEntryOrOpen!0 (select (arr!19723 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7323 #b00000000000000000000000000000000)))))

(assert (=> b!731499 (=> (not res!491580) (not e!409310))))

(declare-fun d!99639 () Bool)

(declare-fun res!491581 () Bool)

(declare-fun e!409311 () Bool)

(assert (=> d!99639 (=> res!491581 e!409311)))

(assert (=> d!99639 (= res!491581 (bvsge #b00000000000000000000000000000000 (size!20144 a!3186)))))

(assert (=> d!99639 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!409311)))

(declare-fun bm!34830 () Bool)

(declare-fun call!34833 () Bool)

(assert (=> bm!34830 (= call!34833 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!731500 () Bool)

(assert (=> b!731500 (= e!409311 e!409312)))

(declare-fun c!80335 () Bool)

(assert (=> b!731500 (= c!80335 (validKeyInArray!0 (select (arr!19723 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!731501 () Bool)

(assert (=> b!731501 (= e!409312 call!34833)))

(declare-fun b!731502 () Bool)

(assert (=> b!731502 (= e!409310 call!34833)))

(assert (= (and d!99639 (not res!491581)) b!731500))

(assert (= (and b!731500 c!80335) b!731499))

(assert (= (and b!731500 (not c!80335)) b!731501))

(assert (= (and b!731499 res!491580) b!731502))

(assert (= (or b!731502 b!731501) bm!34830))

(declare-fun m!684833 () Bool)

(assert (=> b!731499 m!684833))

(declare-fun m!684835 () Bool)

(assert (=> b!731499 m!684835))

(declare-fun m!684837 () Bool)

(assert (=> b!731499 m!684837))

(assert (=> b!731499 m!684833))

(declare-fun m!684839 () Bool)

(assert (=> b!731499 m!684839))

(declare-fun m!684841 () Bool)

(assert (=> bm!34830 m!684841))

(assert (=> b!731500 m!684833))

(assert (=> b!731500 m!684833))

(declare-fun m!684843 () Bool)

(assert (=> b!731500 m!684843))

(assert (=> b!731270 d!99639))

(declare-fun d!99645 () Bool)

(assert (=> d!99645 (= (validKeyInArray!0 (select (arr!19723 a!3186) j!159)) (and (not (= (select (arr!19723 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19723 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!731271 d!99645))

(declare-fun b!731509 () Bool)

(declare-fun c!80338 () Bool)

(declare-fun lt!324189 () (_ BitVec 64))

(assert (=> b!731509 (= c!80338 (= lt!324189 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!409319 () SeekEntryResult!7323)

(declare-fun e!409317 () SeekEntryResult!7323)

(assert (=> b!731509 (= e!409319 e!409317)))

(declare-fun b!731510 () Bool)

(assert (=> b!731510 (= e!409319 (Found!7323 index!1321))))

(declare-fun b!731511 () Bool)

(assert (=> b!731511 (= e!409317 (MissingVacant!7323 resIntermediateIndex!5))))

(declare-fun b!731512 () Bool)

(assert (=> b!731512 (= e!409317 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!19723 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!731513 () Bool)

(declare-fun e!409318 () SeekEntryResult!7323)

(assert (=> b!731513 (= e!409318 e!409319)))

(declare-fun c!80336 () Bool)

(assert (=> b!731513 (= c!80336 (= lt!324189 (select (arr!19723 a!3186) j!159)))))

(declare-fun b!731514 () Bool)

(assert (=> b!731514 (= e!409318 Undefined!7323)))

(declare-fun d!99647 () Bool)

(declare-fun lt!324190 () SeekEntryResult!7323)

(assert (=> d!99647 (and (or ((_ is Undefined!7323) lt!324190) (not ((_ is Found!7323) lt!324190)) (and (bvsge (index!31661 lt!324190) #b00000000000000000000000000000000) (bvslt (index!31661 lt!324190) (size!20144 a!3186)))) (or ((_ is Undefined!7323) lt!324190) ((_ is Found!7323) lt!324190) (not ((_ is MissingVacant!7323) lt!324190)) (not (= (index!31663 lt!324190) resIntermediateIndex!5)) (and (bvsge (index!31663 lt!324190) #b00000000000000000000000000000000) (bvslt (index!31663 lt!324190) (size!20144 a!3186)))) (or ((_ is Undefined!7323) lt!324190) (ite ((_ is Found!7323) lt!324190) (= (select (arr!19723 a!3186) (index!31661 lt!324190)) (select (arr!19723 a!3186) j!159)) (and ((_ is MissingVacant!7323) lt!324190) (= (index!31663 lt!324190) resIntermediateIndex!5) (= (select (arr!19723 a!3186) (index!31663 lt!324190)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!99647 (= lt!324190 e!409318)))

(declare-fun c!80337 () Bool)

(assert (=> d!99647 (= c!80337 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!99647 (= lt!324189 (select (arr!19723 a!3186) index!1321))))

(assert (=> d!99647 (validMask!0 mask!3328)))

(assert (=> d!99647 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19723 a!3186) j!159) a!3186 mask!3328) lt!324190)))

(assert (= (and d!99647 c!80337) b!731514))

(assert (= (and d!99647 (not c!80337)) b!731513))

(assert (= (and b!731513 c!80336) b!731510))

(assert (= (and b!731513 (not c!80336)) b!731509))

(assert (= (and b!731509 c!80338) b!731511))

(assert (= (and b!731509 (not c!80338)) b!731512))

(assert (=> b!731512 m!684701))

(assert (=> b!731512 m!684701))

(assert (=> b!731512 m!684669))

(declare-fun m!684845 () Bool)

(assert (=> b!731512 m!684845))

(declare-fun m!684847 () Bool)

(assert (=> d!99647 m!684847))

(declare-fun m!684849 () Bool)

(assert (=> d!99647 m!684849))

(assert (=> d!99647 m!684823))

(assert (=> d!99647 m!684697))

(assert (=> b!731282 d!99647))

(declare-fun d!99649 () Bool)

(declare-fun res!491603 () Bool)

(declare-fun e!409345 () Bool)

(assert (=> d!99649 (=> res!491603 e!409345)))

(assert (=> d!99649 (= res!491603 (bvsge #b00000000000000000000000000000000 (size!20144 a!3186)))))

(assert (=> d!99649 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13722) e!409345)))

(declare-fun b!731555 () Bool)

(declare-fun e!409347 () Bool)

(declare-fun call!34836 () Bool)

(assert (=> b!731555 (= e!409347 call!34836)))

(declare-fun bm!34833 () Bool)

(declare-fun c!80353 () Bool)

(assert (=> bm!34833 (= call!34836 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!80353 (Cons!13721 (select (arr!19723 a!3186) #b00000000000000000000000000000000) Nil!13722) Nil!13722)))))

(declare-fun b!731556 () Bool)

(declare-fun e!409344 () Bool)

(assert (=> b!731556 (= e!409344 e!409347)))

(assert (=> b!731556 (= c!80353 (validKeyInArray!0 (select (arr!19723 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!731557 () Bool)

(assert (=> b!731557 (= e!409347 call!34836)))

(declare-fun b!731558 () Bool)

(declare-fun e!409346 () Bool)

(declare-fun contains!4052 (List!13725 (_ BitVec 64)) Bool)

(assert (=> b!731558 (= e!409346 (contains!4052 Nil!13722 (select (arr!19723 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!731559 () Bool)

(assert (=> b!731559 (= e!409345 e!409344)))

(declare-fun res!491602 () Bool)

(assert (=> b!731559 (=> (not res!491602) (not e!409344))))

(assert (=> b!731559 (= res!491602 (not e!409346))))

(declare-fun res!491601 () Bool)

(assert (=> b!731559 (=> (not res!491601) (not e!409346))))

(assert (=> b!731559 (= res!491601 (validKeyInArray!0 (select (arr!19723 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!99649 (not res!491603)) b!731559))

(assert (= (and b!731559 res!491601) b!731558))

(assert (= (and b!731559 res!491602) b!731556))

(assert (= (and b!731556 c!80353) b!731557))

(assert (= (and b!731556 (not c!80353)) b!731555))

(assert (= (or b!731557 b!731555) bm!34833))

(assert (=> bm!34833 m!684833))

(declare-fun m!684865 () Bool)

(assert (=> bm!34833 m!684865))

(assert (=> b!731556 m!684833))

(assert (=> b!731556 m!684833))

(assert (=> b!731556 m!684843))

(assert (=> b!731558 m!684833))

(assert (=> b!731558 m!684833))

(declare-fun m!684867 () Bool)

(assert (=> b!731558 m!684867))

(assert (=> b!731559 m!684833))

(assert (=> b!731559 m!684833))

(assert (=> b!731559 m!684843))

(assert (=> b!731281 d!99649))

(declare-fun d!99655 () Bool)

(declare-fun res!491608 () Bool)

(declare-fun e!409355 () Bool)

(assert (=> d!99655 (=> res!491608 e!409355)))

(assert (=> d!99655 (= res!491608 (= (select (arr!19723 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!99655 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!409355)))

(declare-fun b!731570 () Bool)

(declare-fun e!409356 () Bool)

(assert (=> b!731570 (= e!409355 e!409356)))

(declare-fun res!491609 () Bool)

(assert (=> b!731570 (=> (not res!491609) (not e!409356))))

(assert (=> b!731570 (= res!491609 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20144 a!3186)))))

(declare-fun b!731571 () Bool)

(assert (=> b!731571 (= e!409356 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!99655 (not res!491608)) b!731570))

(assert (= (and b!731570 res!491609) b!731571))

(assert (=> d!99655 m!684833))

(declare-fun m!684877 () Bool)

(assert (=> b!731571 m!684877))

(assert (=> b!731288 d!99655))

(declare-fun d!99661 () Bool)

(assert (=> d!99661 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!731279 d!99661))

(assert (=> b!731289 d!99647))

(declare-fun b!731580 () Bool)

(declare-fun lt!324211 () SeekEntryResult!7323)

(assert (=> b!731580 (and (bvsge (index!31662 lt!324211) #b00000000000000000000000000000000) (bvslt (index!31662 lt!324211) (size!20144 lt!324079)))))

(declare-fun res!491618 () Bool)

(assert (=> b!731580 (= res!491618 (= (select (arr!19723 lt!324079) (index!31662 lt!324211)) lt!324077))))

(declare-fun e!409364 () Bool)

(assert (=> b!731580 (=> res!491618 e!409364)))

(declare-fun e!409366 () Bool)

(assert (=> b!731580 (= e!409366 e!409364)))

(declare-fun b!731581 () Bool)

(assert (=> b!731581 (and (bvsge (index!31662 lt!324211) #b00000000000000000000000000000000) (bvslt (index!31662 lt!324211) (size!20144 lt!324079)))))

(assert (=> b!731581 (= e!409364 (= (select (arr!19723 lt!324079) (index!31662 lt!324211)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!731583 () Bool)

(assert (=> b!731583 (and (bvsge (index!31662 lt!324211) #b00000000000000000000000000000000) (bvslt (index!31662 lt!324211) (size!20144 lt!324079)))))

(declare-fun res!491616 () Bool)

(assert (=> b!731583 (= res!491616 (= (select (arr!19723 lt!324079) (index!31662 lt!324211)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!731583 (=> res!491616 e!409364)))

(declare-fun b!731584 () Bool)

(declare-fun e!409365 () SeekEntryResult!7323)

(assert (=> b!731584 (= e!409365 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!324077 lt!324079 mask!3328))))

(declare-fun b!731585 () Bool)

(declare-fun e!409368 () Bool)

(assert (=> b!731585 (= e!409368 (bvsge (x!62633 lt!324211) #b01111111111111111111111111111110))))

(declare-fun b!731586 () Bool)

(assert (=> b!731586 (= e!409365 (Intermediate!7323 false index!1321 x!1131))))

(declare-fun d!99663 () Bool)

(assert (=> d!99663 e!409368))

(declare-fun c!80360 () Bool)

(assert (=> d!99663 (= c!80360 (and ((_ is Intermediate!7323) lt!324211) (undefined!8135 lt!324211)))))

(declare-fun e!409367 () SeekEntryResult!7323)

(assert (=> d!99663 (= lt!324211 e!409367)))

(declare-fun c!80359 () Bool)

(assert (=> d!99663 (= c!80359 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!324210 () (_ BitVec 64))

(assert (=> d!99663 (= lt!324210 (select (arr!19723 lt!324079) index!1321))))

(assert (=> d!99663 (validMask!0 mask!3328)))

(assert (=> d!99663 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!324077 lt!324079 mask!3328) lt!324211)))

(declare-fun b!731582 () Bool)

(assert (=> b!731582 (= e!409367 e!409365)))

(declare-fun c!80358 () Bool)

(assert (=> b!731582 (= c!80358 (or (= lt!324210 lt!324077) (= (bvadd lt!324210 lt!324210) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!731587 () Bool)

(assert (=> b!731587 (= e!409368 e!409366)))

(declare-fun res!491617 () Bool)

(assert (=> b!731587 (= res!491617 (and ((_ is Intermediate!7323) lt!324211) (not (undefined!8135 lt!324211)) (bvslt (x!62633 lt!324211) #b01111111111111111111111111111110) (bvsge (x!62633 lt!324211) #b00000000000000000000000000000000) (bvsge (x!62633 lt!324211) x!1131)))))

(assert (=> b!731587 (=> (not res!491617) (not e!409366))))

(declare-fun b!731588 () Bool)

(assert (=> b!731588 (= e!409367 (Intermediate!7323 true index!1321 x!1131))))

(assert (= (and d!99663 c!80359) b!731588))

(assert (= (and d!99663 (not c!80359)) b!731582))

(assert (= (and b!731582 c!80358) b!731586))

(assert (= (and b!731582 (not c!80358)) b!731584))

(assert (= (and d!99663 c!80360) b!731585))

(assert (= (and d!99663 (not c!80360)) b!731587))

(assert (= (and b!731587 res!491617) b!731580))

(assert (= (and b!731580 (not res!491618)) b!731583))

(assert (= (and b!731583 (not res!491616)) b!731581))

(assert (=> b!731584 m!684701))

(assert (=> b!731584 m!684701))

(declare-fun m!684891 () Bool)

(assert (=> b!731584 m!684891))

(declare-fun m!684893 () Bool)

(assert (=> b!731581 m!684893))

(declare-fun m!684895 () Bool)

(assert (=> d!99663 m!684895))

(assert (=> d!99663 m!684697))

(assert (=> b!731580 m!684893))

(assert (=> b!731583 m!684893))

(assert (=> b!731275 d!99663))

(declare-fun b!731597 () Bool)

(declare-fun lt!324215 () SeekEntryResult!7323)

(assert (=> b!731597 (and (bvsge (index!31662 lt!324215) #b00000000000000000000000000000000) (bvslt (index!31662 lt!324215) (size!20144 lt!324079)))))

(declare-fun res!491623 () Bool)

(assert (=> b!731597 (= res!491623 (= (select (arr!19723 lt!324079) (index!31662 lt!324215)) lt!324077))))

(declare-fun e!409374 () Bool)

(assert (=> b!731597 (=> res!491623 e!409374)))

(declare-fun e!409376 () Bool)

(assert (=> b!731597 (= e!409376 e!409374)))

(declare-fun b!731598 () Bool)

(assert (=> b!731598 (and (bvsge (index!31662 lt!324215) #b00000000000000000000000000000000) (bvslt (index!31662 lt!324215) (size!20144 lt!324079)))))

(assert (=> b!731598 (= e!409374 (= (select (arr!19723 lt!324079) (index!31662 lt!324215)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!731600 () Bool)

(assert (=> b!731600 (and (bvsge (index!31662 lt!324215) #b00000000000000000000000000000000) (bvslt (index!31662 lt!324215) (size!20144 lt!324079)))))

(declare-fun res!491621 () Bool)

(assert (=> b!731600 (= res!491621 (= (select (arr!19723 lt!324079) (index!31662 lt!324215)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!731600 (=> res!491621 e!409374)))

(declare-fun e!409375 () SeekEntryResult!7323)

(declare-fun b!731601 () Bool)

(assert (=> b!731601 (= e!409375 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!324077 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!324077 lt!324079 mask!3328))))

(declare-fun b!731602 () Bool)

(declare-fun e!409378 () Bool)

(assert (=> b!731602 (= e!409378 (bvsge (x!62633 lt!324215) #b01111111111111111111111111111110))))

(declare-fun b!731603 () Bool)

(assert (=> b!731603 (= e!409375 (Intermediate!7323 false (toIndex!0 lt!324077 mask!3328) #b00000000000000000000000000000000))))

(declare-fun d!99667 () Bool)

(assert (=> d!99667 e!409378))

(declare-fun c!80366 () Bool)

(assert (=> d!99667 (= c!80366 (and ((_ is Intermediate!7323) lt!324215) (undefined!8135 lt!324215)))))

(declare-fun e!409377 () SeekEntryResult!7323)

(assert (=> d!99667 (= lt!324215 e!409377)))

(declare-fun c!80365 () Bool)

(assert (=> d!99667 (= c!80365 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!324214 () (_ BitVec 64))

(assert (=> d!99667 (= lt!324214 (select (arr!19723 lt!324079) (toIndex!0 lt!324077 mask!3328)))))

(assert (=> d!99667 (validMask!0 mask!3328)))

(assert (=> d!99667 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!324077 mask!3328) lt!324077 lt!324079 mask!3328) lt!324215)))

(declare-fun b!731599 () Bool)

(assert (=> b!731599 (= e!409377 e!409375)))

(declare-fun c!80364 () Bool)

(assert (=> b!731599 (= c!80364 (or (= lt!324214 lt!324077) (= (bvadd lt!324214 lt!324214) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!731604 () Bool)

(assert (=> b!731604 (= e!409378 e!409376)))

(declare-fun res!491622 () Bool)

(assert (=> b!731604 (= res!491622 (and ((_ is Intermediate!7323) lt!324215) (not (undefined!8135 lt!324215)) (bvslt (x!62633 lt!324215) #b01111111111111111111111111111110) (bvsge (x!62633 lt!324215) #b00000000000000000000000000000000) (bvsge (x!62633 lt!324215) #b00000000000000000000000000000000)))))

(assert (=> b!731604 (=> (not res!491622) (not e!409376))))

(declare-fun b!731605 () Bool)

(assert (=> b!731605 (= e!409377 (Intermediate!7323 true (toIndex!0 lt!324077 mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!99667 c!80365) b!731605))

(assert (= (and d!99667 (not c!80365)) b!731599))

(assert (= (and b!731599 c!80364) b!731603))

(assert (= (and b!731599 (not c!80364)) b!731601))

(assert (= (and d!99667 c!80366) b!731602))

(assert (= (and d!99667 (not c!80366)) b!731604))

(assert (= (and b!731604 res!491622) b!731597))

(assert (= (and b!731597 (not res!491623)) b!731600))

(assert (= (and b!731600 (not res!491621)) b!731598))

(assert (=> b!731601 m!684675))

(declare-fun m!684909 () Bool)

(assert (=> b!731601 m!684909))

(assert (=> b!731601 m!684909))

(declare-fun m!684911 () Bool)

(assert (=> b!731601 m!684911))

(declare-fun m!684913 () Bool)

(assert (=> b!731598 m!684913))

(assert (=> d!99667 m!684675))

(declare-fun m!684915 () Bool)

(assert (=> d!99667 m!684915))

(assert (=> d!99667 m!684697))

(assert (=> b!731597 m!684913))

(assert (=> b!731600 m!684913))

(assert (=> b!731275 d!99667))

(declare-fun d!99673 () Bool)

(declare-fun lt!324219 () (_ BitVec 32))

(declare-fun lt!324218 () (_ BitVec 32))

(assert (=> d!99673 (= lt!324219 (bvmul (bvxor lt!324218 (bvlshr lt!324218 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99673 (= lt!324218 ((_ extract 31 0) (bvand (bvxor lt!324077 (bvlshr lt!324077 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99673 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!491556 (let ((h!14783 ((_ extract 31 0) (bvand (bvxor lt!324077 (bvlshr lt!324077 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!62637 (bvmul (bvxor h!14783 (bvlshr h!14783 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!62637 (bvlshr x!62637 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!491556 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!491556 #b00000000000000000000000000000000))))))

(assert (=> d!99673 (= (toIndex!0 lt!324077 mask!3328) (bvand (bvxor lt!324219 (bvlshr lt!324219 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!731275 d!99673))

(declare-fun d!99676 () Bool)

(declare-fun lt!324222 () (_ BitVec 32))

(assert (=> d!99676 (and (bvsge lt!324222 #b00000000000000000000000000000000) (bvslt lt!324222 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!99676 (= lt!324222 (choose!52 index!1321 x!1131 mask!3328))))

(assert (=> d!99676 (validMask!0 mask!3328)))

(assert (=> d!99676 (= (nextIndex!0 index!1321 x!1131 mask!3328) lt!324222)))

(declare-fun bs!20938 () Bool)

(assert (= bs!20938 d!99676))

(declare-fun m!684923 () Bool)

(assert (=> bs!20938 m!684923))

(assert (=> bs!20938 m!684697))

(assert (=> b!731286 d!99676))

(declare-fun b!731615 () Bool)

(declare-fun e!409385 () SeekEntryResult!7323)

(assert (=> b!731615 (= e!409385 Undefined!7323)))

(declare-fun b!731616 () Bool)

(declare-fun c!80371 () Bool)

(declare-fun lt!324223 () (_ BitVec 64))

(assert (=> b!731616 (= c!80371 (= lt!324223 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!409384 () SeekEntryResult!7323)

(declare-fun e!409386 () SeekEntryResult!7323)

(assert (=> b!731616 (= e!409384 e!409386)))

(declare-fun b!731617 () Bool)

(declare-fun lt!324225 () SeekEntryResult!7323)

(assert (=> b!731617 (= e!409386 (MissingZero!7323 (index!31662 lt!324225)))))

(declare-fun b!731618 () Bool)

(assert (=> b!731618 (= e!409386 (seekKeyOrZeroReturnVacant!0 (x!62633 lt!324225) (index!31662 lt!324225) (index!31662 lt!324225) (select (arr!19723 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!99679 () Bool)

(declare-fun lt!324224 () SeekEntryResult!7323)

(assert (=> d!99679 (and (or ((_ is Undefined!7323) lt!324224) (not ((_ is Found!7323) lt!324224)) (and (bvsge (index!31661 lt!324224) #b00000000000000000000000000000000) (bvslt (index!31661 lt!324224) (size!20144 a!3186)))) (or ((_ is Undefined!7323) lt!324224) ((_ is Found!7323) lt!324224) (not ((_ is MissingZero!7323) lt!324224)) (and (bvsge (index!31660 lt!324224) #b00000000000000000000000000000000) (bvslt (index!31660 lt!324224) (size!20144 a!3186)))) (or ((_ is Undefined!7323) lt!324224) ((_ is Found!7323) lt!324224) ((_ is MissingZero!7323) lt!324224) (not ((_ is MissingVacant!7323) lt!324224)) (and (bvsge (index!31663 lt!324224) #b00000000000000000000000000000000) (bvslt (index!31663 lt!324224) (size!20144 a!3186)))) (or ((_ is Undefined!7323) lt!324224) (ite ((_ is Found!7323) lt!324224) (= (select (arr!19723 a!3186) (index!31661 lt!324224)) (select (arr!19723 a!3186) j!159)) (ite ((_ is MissingZero!7323) lt!324224) (= (select (arr!19723 a!3186) (index!31660 lt!324224)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7323) lt!324224) (= (select (arr!19723 a!3186) (index!31663 lt!324224)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!99679 (= lt!324224 e!409385)))

(declare-fun c!80372 () Bool)

(assert (=> d!99679 (= c!80372 (and ((_ is Intermediate!7323) lt!324225) (undefined!8135 lt!324225)))))

(assert (=> d!99679 (= lt!324225 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19723 a!3186) j!159) mask!3328) (select (arr!19723 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!99679 (validMask!0 mask!3328)))

(assert (=> d!99679 (= (seekEntryOrOpen!0 (select (arr!19723 a!3186) j!159) a!3186 mask!3328) lt!324224)))

(declare-fun b!731619 () Bool)

(assert (=> b!731619 (= e!409385 e!409384)))

(assert (=> b!731619 (= lt!324223 (select (arr!19723 a!3186) (index!31662 lt!324225)))))

(declare-fun c!80370 () Bool)

(assert (=> b!731619 (= c!80370 (= lt!324223 (select (arr!19723 a!3186) j!159)))))

(declare-fun b!731620 () Bool)

(assert (=> b!731620 (= e!409384 (Found!7323 (index!31662 lt!324225)))))

(assert (= (and d!99679 c!80372) b!731615))

(assert (= (and d!99679 (not c!80372)) b!731619))

(assert (= (and b!731619 c!80370) b!731620))

(assert (= (and b!731619 (not c!80370)) b!731616))

(assert (= (and b!731616 c!80371) b!731617))

(assert (= (and b!731616 (not c!80371)) b!731618))

(assert (=> b!731618 m!684669))

(declare-fun m!684925 () Bool)

(assert (=> b!731618 m!684925))

(declare-fun m!684927 () Bool)

(assert (=> d!99679 m!684927))

(declare-fun m!684929 () Bool)

(assert (=> d!99679 m!684929))

(assert (=> d!99679 m!684709))

(assert (=> d!99679 m!684669))

(assert (=> d!99679 m!684711))

(declare-fun m!684931 () Bool)

(assert (=> d!99679 m!684931))

(assert (=> d!99679 m!684697))

(assert (=> d!99679 m!684669))

(assert (=> d!99679 m!684709))

(declare-fun m!684933 () Bool)

(assert (=> b!731619 m!684933))

(assert (=> b!731285 d!99679))

(declare-fun b!731621 () Bool)

(declare-fun e!409389 () Bool)

(declare-fun e!409387 () Bool)

(assert (=> b!731621 (= e!409389 e!409387)))

(declare-fun lt!324228 () (_ BitVec 64))

(assert (=> b!731621 (= lt!324228 (select (arr!19723 a!3186) j!159))))

(declare-fun lt!324226 () Unit!24964)

(assert (=> b!731621 (= lt!324226 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!324228 j!159))))

(assert (=> b!731621 (arrayContainsKey!0 a!3186 lt!324228 #b00000000000000000000000000000000)))

(declare-fun lt!324227 () Unit!24964)

(assert (=> b!731621 (= lt!324227 lt!324226)))

(declare-fun res!491627 () Bool)

(assert (=> b!731621 (= res!491627 (= (seekEntryOrOpen!0 (select (arr!19723 a!3186) j!159) a!3186 mask!3328) (Found!7323 j!159)))))

(assert (=> b!731621 (=> (not res!491627) (not e!409387))))

(declare-fun d!99681 () Bool)

(declare-fun res!491628 () Bool)

(declare-fun e!409388 () Bool)

(assert (=> d!99681 (=> res!491628 e!409388)))

(assert (=> d!99681 (= res!491628 (bvsge j!159 (size!20144 a!3186)))))

(assert (=> d!99681 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!409388)))

(declare-fun bm!34835 () Bool)

(declare-fun call!34838 () Bool)

(assert (=> bm!34835 (= call!34838 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!731622 () Bool)

(assert (=> b!731622 (= e!409388 e!409389)))

(declare-fun c!80373 () Bool)

(assert (=> b!731622 (= c!80373 (validKeyInArray!0 (select (arr!19723 a!3186) j!159)))))

(declare-fun b!731623 () Bool)

(assert (=> b!731623 (= e!409389 call!34838)))

(declare-fun b!731624 () Bool)

(assert (=> b!731624 (= e!409387 call!34838)))

(assert (= (and d!99681 (not res!491628)) b!731622))

(assert (= (and b!731622 c!80373) b!731621))

(assert (= (and b!731622 (not c!80373)) b!731623))

(assert (= (and b!731621 res!491627) b!731624))

(assert (= (or b!731624 b!731623) bm!34835))

(assert (=> b!731621 m!684669))

(declare-fun m!684935 () Bool)

(assert (=> b!731621 m!684935))

(declare-fun m!684937 () Bool)

(assert (=> b!731621 m!684937))

(assert (=> b!731621 m!684669))

(assert (=> b!731621 m!684695))

(declare-fun m!684939 () Bool)

(assert (=> bm!34835 m!684939))

(assert (=> b!731622 m!684669))

(assert (=> b!731622 m!684669))

(assert (=> b!731622 m!684707))

(assert (=> b!731287 d!99681))

(declare-fun d!99683 () Bool)

(assert (=> d!99683 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!324237 () Unit!24964)

(declare-fun choose!38 (array!41207 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24964)

(assert (=> d!99683 (= lt!324237 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!99683 (validMask!0 mask!3328)))

(assert (=> d!99683 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!324237)))

(declare-fun bs!20939 () Bool)

(assert (= bs!20939 d!99683))

(assert (=> bs!20939 m!684685))

(declare-fun m!684941 () Bool)

(assert (=> bs!20939 m!684941))

(assert (=> bs!20939 m!684697))

(assert (=> b!731287 d!99683))

(check-sat (not b!731618) (not b!731601) (not b!731390) (not d!99627) (not d!99676) (not b!731571) (not b!731365) (not d!99683) (not d!99679) (not b!731463) (not b!731584) (not b!731512) (not bm!34835) (not d!99647) (not b!731556) (not d!99667) (not b!731622) (not b!731621) (not b!731500) (not bm!34833) (not d!99613) (not d!99637) (not d!99611) (not bm!34830) (not d!99663) (not b!731558) (not b!731470) (not b!731559) (not b!731499))
(check-sat)
