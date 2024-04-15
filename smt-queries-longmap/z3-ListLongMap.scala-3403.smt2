; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47064 () Bool)

(assert start!47064)

(declare-fun b!518530 () Bool)

(declare-fun e!302540 () Bool)

(declare-fun e!302536 () Bool)

(assert (=> b!518530 (= e!302540 (not e!302536))))

(declare-fun res!317464 () Bool)

(assert (=> b!518530 (=> res!317464 e!302536)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33152 0))(
  ( (array!33153 (arr!15938 (Array (_ BitVec 32) (_ BitVec 64))) (size!16303 (_ BitVec 32))) )
))
(declare-fun lt!237300 () array!33152)

(declare-fun lt!237296 () (_ BitVec 32))

(declare-fun lt!237293 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!4402 0))(
  ( (MissingZero!4402 (index!19799 (_ BitVec 32))) (Found!4402 (index!19800 (_ BitVec 32))) (Intermediate!4402 (undefined!5214 Bool) (index!19801 (_ BitVec 32)) (x!48779 (_ BitVec 32))) (Undefined!4402) (MissingVacant!4402 (index!19802 (_ BitVec 32))) )
))
(declare-fun lt!237299 () SeekEntryResult!4402)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33152 (_ BitVec 32)) SeekEntryResult!4402)

(assert (=> b!518530 (= res!317464 (= lt!237299 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237296 lt!237293 lt!237300 mask!3524)))))

(declare-fun a!3235 () array!33152)

(declare-fun lt!237295 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!518530 (= lt!237299 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237295 (select (arr!15938 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!518530 (= lt!237296 (toIndex!0 lt!237293 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!518530 (= lt!237293 (select (store (arr!15938 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!518530 (= lt!237295 (toIndex!0 (select (arr!15938 a!3235) j!176) mask!3524))))

(assert (=> b!518530 (= lt!237300 (array!33153 (store (arr!15938 a!3235) i!1204 k0!2280) (size!16303 a!3235)))))

(declare-fun e!302539 () Bool)

(assert (=> b!518530 e!302539))

(declare-fun res!317465 () Bool)

(assert (=> b!518530 (=> (not res!317465) (not e!302539))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33152 (_ BitVec 32)) Bool)

(assert (=> b!518530 (= res!317465 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16054 0))(
  ( (Unit!16055) )
))
(declare-fun lt!237298 () Unit!16054)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33152 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16054)

(assert (=> b!518530 (= lt!237298 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!518531 () Bool)

(declare-fun e!302535 () Unit!16054)

(declare-fun Unit!16056 () Unit!16054)

(assert (=> b!518531 (= e!302535 Unit!16056)))

(declare-fun b!518532 () Bool)

(assert (=> b!518532 (= e!302536 (or (= (select (arr!15938 a!3235) (index!19801 lt!237299)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (bvsge (index!19801 lt!237299) #b00000000000000000000000000000000) (bvslt (index!19801 lt!237299) (size!16303 a!3235)))))))

(declare-fun lt!237294 () Unit!16054)

(assert (=> b!518532 (= lt!237294 e!302535)))

(declare-fun c!60828 () Bool)

(assert (=> b!518532 (= c!60828 (= (select (arr!15938 a!3235) (index!19801 lt!237299)) (select (arr!15938 a!3235) j!176)))))

(assert (=> b!518532 (and (bvslt (x!48779 lt!237299) #b01111111111111111111111111111110) (or (= (select (arr!15938 a!3235) (index!19801 lt!237299)) (select (arr!15938 a!3235) j!176)) (= (select (arr!15938 a!3235) (index!19801 lt!237299)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15938 a!3235) (index!19801 lt!237299)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!518533 () Bool)

(declare-fun res!317468 () Bool)

(declare-fun e!302538 () Bool)

(assert (=> b!518533 (=> (not res!317468) (not e!302538))))

(declare-fun arrayContainsKey!0 (array!33152 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!518533 (= res!317468 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!518534 () Bool)

(declare-fun e!302541 () Bool)

(assert (=> b!518534 (= e!302541 false)))

(declare-fun b!518535 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33152 (_ BitVec 32)) SeekEntryResult!4402)

(assert (=> b!518535 (= e!302539 (= (seekEntryOrOpen!0 (select (arr!15938 a!3235) j!176) a!3235 mask!3524) (Found!4402 j!176)))))

(declare-fun b!518536 () Bool)

(declare-fun res!317473 () Bool)

(assert (=> b!518536 (=> (not res!317473) (not e!302538))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!518536 (= res!317473 (validKeyInArray!0 (select (arr!15938 a!3235) j!176)))))

(declare-fun res!317467 () Bool)

(assert (=> start!47064 (=> (not res!317467) (not e!302538))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47064 (= res!317467 (validMask!0 mask!3524))))

(assert (=> start!47064 e!302538))

(assert (=> start!47064 true))

(declare-fun array_inv!11821 (array!33152) Bool)

(assert (=> start!47064 (array_inv!11821 a!3235)))

(declare-fun b!518529 () Bool)

(declare-fun res!317469 () Bool)

(assert (=> b!518529 (=> (not res!317469) (not e!302538))))

(assert (=> b!518529 (= res!317469 (validKeyInArray!0 k0!2280))))

(declare-fun b!518537 () Bool)

(declare-fun Unit!16057 () Unit!16054)

(assert (=> b!518537 (= e!302535 Unit!16057)))

(declare-fun lt!237297 () Unit!16054)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33152 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16054)

(assert (=> b!518537 (= lt!237297 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!237295 #b00000000000000000000000000000000 (index!19801 lt!237299) (x!48779 lt!237299) mask!3524))))

(declare-fun res!317470 () Bool)

(assert (=> b!518537 (= res!317470 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237295 lt!237293 lt!237300 mask!3524) (Intermediate!4402 false (index!19801 lt!237299) (x!48779 lt!237299))))))

(assert (=> b!518537 (=> (not res!317470) (not e!302541))))

(assert (=> b!518537 e!302541))

(declare-fun b!518538 () Bool)

(declare-fun res!317472 () Bool)

(assert (=> b!518538 (=> (not res!317472) (not e!302540))))

(declare-datatypes ((List!10135 0))(
  ( (Nil!10132) (Cons!10131 (h!11041 (_ BitVec 64)) (t!16354 List!10135)) )
))
(declare-fun arrayNoDuplicates!0 (array!33152 (_ BitVec 32) List!10135) Bool)

(assert (=> b!518538 (= res!317472 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10132))))

(declare-fun b!518539 () Bool)

(assert (=> b!518539 (= e!302538 e!302540)))

(declare-fun res!317466 () Bool)

(assert (=> b!518539 (=> (not res!317466) (not e!302540))))

(declare-fun lt!237301 () SeekEntryResult!4402)

(assert (=> b!518539 (= res!317466 (or (= lt!237301 (MissingZero!4402 i!1204)) (= lt!237301 (MissingVacant!4402 i!1204))))))

(assert (=> b!518539 (= lt!237301 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!518540 () Bool)

(declare-fun res!317463 () Bool)

(assert (=> b!518540 (=> res!317463 e!302536)))

(get-info :version)

(assert (=> b!518540 (= res!317463 (or (undefined!5214 lt!237299) (not ((_ is Intermediate!4402) lt!237299))))))

(declare-fun b!518541 () Bool)

(declare-fun res!317471 () Bool)

(assert (=> b!518541 (=> (not res!317471) (not e!302540))))

(assert (=> b!518541 (= res!317471 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!518542 () Bool)

(declare-fun res!317474 () Bool)

(assert (=> b!518542 (=> (not res!317474) (not e!302538))))

(assert (=> b!518542 (= res!317474 (and (= (size!16303 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16303 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16303 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!47064 res!317467) b!518542))

(assert (= (and b!518542 res!317474) b!518536))

(assert (= (and b!518536 res!317473) b!518529))

(assert (= (and b!518529 res!317469) b!518533))

(assert (= (and b!518533 res!317468) b!518539))

(assert (= (and b!518539 res!317466) b!518541))

(assert (= (and b!518541 res!317471) b!518538))

(assert (= (and b!518538 res!317472) b!518530))

(assert (= (and b!518530 res!317465) b!518535))

(assert (= (and b!518530 (not res!317464)) b!518540))

(assert (= (and b!518540 (not res!317463)) b!518532))

(assert (= (and b!518532 c!60828) b!518537))

(assert (= (and b!518532 (not c!60828)) b!518531))

(assert (= (and b!518537 res!317470) b!518534))

(declare-fun m!499333 () Bool)

(assert (=> b!518533 m!499333))

(declare-fun m!499335 () Bool)

(assert (=> b!518537 m!499335))

(declare-fun m!499337 () Bool)

(assert (=> b!518537 m!499337))

(declare-fun m!499339 () Bool)

(assert (=> b!518529 m!499339))

(declare-fun m!499341 () Bool)

(assert (=> b!518530 m!499341))

(declare-fun m!499343 () Bool)

(assert (=> b!518530 m!499343))

(declare-fun m!499345 () Bool)

(assert (=> b!518530 m!499345))

(declare-fun m!499347 () Bool)

(assert (=> b!518530 m!499347))

(declare-fun m!499349 () Bool)

(assert (=> b!518530 m!499349))

(declare-fun m!499351 () Bool)

(assert (=> b!518530 m!499351))

(assert (=> b!518530 m!499347))

(declare-fun m!499353 () Bool)

(assert (=> b!518530 m!499353))

(declare-fun m!499355 () Bool)

(assert (=> b!518530 m!499355))

(assert (=> b!518530 m!499347))

(declare-fun m!499357 () Bool)

(assert (=> b!518530 m!499357))

(assert (=> b!518536 m!499347))

(assert (=> b!518536 m!499347))

(declare-fun m!499359 () Bool)

(assert (=> b!518536 m!499359))

(assert (=> b!518535 m!499347))

(assert (=> b!518535 m!499347))

(declare-fun m!499361 () Bool)

(assert (=> b!518535 m!499361))

(declare-fun m!499363 () Bool)

(assert (=> start!47064 m!499363))

(declare-fun m!499365 () Bool)

(assert (=> start!47064 m!499365))

(declare-fun m!499367 () Bool)

(assert (=> b!518539 m!499367))

(declare-fun m!499369 () Bool)

(assert (=> b!518538 m!499369))

(declare-fun m!499371 () Bool)

(assert (=> b!518541 m!499371))

(declare-fun m!499373 () Bool)

(assert (=> b!518532 m!499373))

(assert (=> b!518532 m!499347))

(check-sat (not b!518530) (not b!518537) (not b!518538) (not start!47064) (not b!518535) (not b!518536) (not b!518541) (not b!518533) (not b!518529) (not b!518539))
(check-sat)
(get-model)

(declare-fun d!79761 () Bool)

(declare-fun e!302586 () Bool)

(assert (=> d!79761 e!302586))

(declare-fun res!317549 () Bool)

(assert (=> d!79761 (=> (not res!317549) (not e!302586))))

(assert (=> d!79761 (= res!317549 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16303 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16303 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16303 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16303 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16303 a!3235))))))

(declare-fun lt!237358 () Unit!16054)

(declare-fun choose!47 (array!33152 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16054)

(assert (=> d!79761 (= lt!237358 (choose!47 a!3235 i!1204 k0!2280 j!176 lt!237295 #b00000000000000000000000000000000 (index!19801 lt!237299) (x!48779 lt!237299) mask!3524))))

(assert (=> d!79761 (validMask!0 mask!3524)))

(assert (=> d!79761 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!237295 #b00000000000000000000000000000000 (index!19801 lt!237299) (x!48779 lt!237299) mask!3524) lt!237358)))

(declare-fun b!518629 () Bool)

(assert (=> b!518629 (= e!302586 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237295 (select (store (arr!15938 a!3235) i!1204 k0!2280) j!176) (array!33153 (store (arr!15938 a!3235) i!1204 k0!2280) (size!16303 a!3235)) mask!3524) (Intermediate!4402 false (index!19801 lt!237299) (x!48779 lt!237299))))))

(assert (= (and d!79761 res!317549) b!518629))

(declare-fun m!499459 () Bool)

(assert (=> d!79761 m!499459))

(assert (=> d!79761 m!499363))

(assert (=> b!518629 m!499341))

(assert (=> b!518629 m!499345))

(assert (=> b!518629 m!499345))

(declare-fun m!499461 () Bool)

(assert (=> b!518629 m!499461))

(assert (=> b!518537 d!79761))

(declare-fun b!518676 () Bool)

(declare-fun lt!237382 () SeekEntryResult!4402)

(assert (=> b!518676 (and (bvsge (index!19801 lt!237382) #b00000000000000000000000000000000) (bvslt (index!19801 lt!237382) (size!16303 lt!237300)))))

(declare-fun res!317572 () Bool)

(assert (=> b!518676 (= res!317572 (= (select (arr!15938 lt!237300) (index!19801 lt!237382)) lt!237293))))

(declare-fun e!302621 () Bool)

(assert (=> b!518676 (=> res!317572 e!302621)))

(declare-fun e!302622 () Bool)

(assert (=> b!518676 (= e!302622 e!302621)))

(declare-fun b!518677 () Bool)

(declare-fun e!302619 () Bool)

(assert (=> b!518677 (= e!302619 e!302622)))

(declare-fun res!317573 () Bool)

(assert (=> b!518677 (= res!317573 (and ((_ is Intermediate!4402) lt!237382) (not (undefined!5214 lt!237382)) (bvslt (x!48779 lt!237382) #b01111111111111111111111111111110) (bvsge (x!48779 lt!237382) #b00000000000000000000000000000000) (bvsge (x!48779 lt!237382) #b00000000000000000000000000000000)))))

(assert (=> b!518677 (=> (not res!317573) (not e!302622))))

(declare-fun b!518678 () Bool)

(declare-fun e!302623 () SeekEntryResult!4402)

(assert (=> b!518678 (= e!302623 (Intermediate!4402 true lt!237295 #b00000000000000000000000000000000))))

(declare-fun b!518679 () Bool)

(assert (=> b!518679 (= e!302619 (bvsge (x!48779 lt!237382) #b01111111111111111111111111111110))))

(declare-fun b!518680 () Bool)

(declare-fun e!302620 () SeekEntryResult!4402)

(assert (=> b!518680 (= e!302620 (Intermediate!4402 false lt!237295 #b00000000000000000000000000000000))))

(declare-fun b!518681 () Bool)

(assert (=> b!518681 (and (bvsge (index!19801 lt!237382) #b00000000000000000000000000000000) (bvslt (index!19801 lt!237382) (size!16303 lt!237300)))))

(assert (=> b!518681 (= e!302621 (= (select (arr!15938 lt!237300) (index!19801 lt!237382)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!518682 () Bool)

(assert (=> b!518682 (= e!302623 e!302620)))

(declare-fun c!60847 () Bool)

(declare-fun lt!237381 () (_ BitVec 64))

(assert (=> b!518682 (= c!60847 (or (= lt!237381 lt!237293) (= (bvadd lt!237381 lt!237381) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!79763 () Bool)

(assert (=> d!79763 e!302619))

(declare-fun c!60848 () Bool)

(assert (=> d!79763 (= c!60848 (and ((_ is Intermediate!4402) lt!237382) (undefined!5214 lt!237382)))))

(assert (=> d!79763 (= lt!237382 e!302623)))

(declare-fun c!60849 () Bool)

(assert (=> d!79763 (= c!60849 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79763 (= lt!237381 (select (arr!15938 lt!237300) lt!237295))))

(assert (=> d!79763 (validMask!0 mask!3524)))

(assert (=> d!79763 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237295 lt!237293 lt!237300 mask!3524) lt!237382)))

(declare-fun b!518683 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!518683 (= e!302620 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!237295 #b00000000000000000000000000000000 mask!3524) lt!237293 lt!237300 mask!3524))))

(declare-fun b!518684 () Bool)

(assert (=> b!518684 (and (bvsge (index!19801 lt!237382) #b00000000000000000000000000000000) (bvslt (index!19801 lt!237382) (size!16303 lt!237300)))))

(declare-fun res!317574 () Bool)

(assert (=> b!518684 (= res!317574 (= (select (arr!15938 lt!237300) (index!19801 lt!237382)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!518684 (=> res!317574 e!302621)))

(assert (= (and d!79763 c!60849) b!518678))

(assert (= (and d!79763 (not c!60849)) b!518682))

(assert (= (and b!518682 c!60847) b!518680))

(assert (= (and b!518682 (not c!60847)) b!518683))

(assert (= (and d!79763 c!60848) b!518679))

(assert (= (and d!79763 (not c!60848)) b!518677))

(assert (= (and b!518677 res!317573) b!518676))

(assert (= (and b!518676 (not res!317572)) b!518684))

(assert (= (and b!518684 (not res!317574)) b!518681))

(declare-fun m!499489 () Bool)

(assert (=> b!518683 m!499489))

(assert (=> b!518683 m!499489))

(declare-fun m!499491 () Bool)

(assert (=> b!518683 m!499491))

(declare-fun m!499493 () Bool)

(assert (=> d!79763 m!499493))

(assert (=> d!79763 m!499363))

(declare-fun m!499495 () Bool)

(assert (=> b!518676 m!499495))

(assert (=> b!518681 m!499495))

(assert (=> b!518684 m!499495))

(assert (=> b!518537 d!79763))

(declare-fun d!79777 () Bool)

(assert (=> d!79777 (= (validKeyInArray!0 (select (arr!15938 a!3235) j!176)) (and (not (= (select (arr!15938 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15938 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!518536 d!79777))

(declare-fun d!79779 () Bool)

(declare-fun res!317581 () Bool)

(declare-fun e!302630 () Bool)

(assert (=> d!79779 (=> res!317581 e!302630)))

(assert (=> d!79779 (= res!317581 (= (select (arr!15938 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!79779 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!302630)))

(declare-fun b!518691 () Bool)

(declare-fun e!302631 () Bool)

(assert (=> b!518691 (= e!302630 e!302631)))

(declare-fun res!317582 () Bool)

(assert (=> b!518691 (=> (not res!317582) (not e!302631))))

(assert (=> b!518691 (= res!317582 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16303 a!3235)))))

(declare-fun b!518692 () Bool)

(assert (=> b!518692 (= e!302631 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79779 (not res!317581)) b!518691))

(assert (= (and b!518691 res!317582) b!518692))

(declare-fun m!499497 () Bool)

(assert (=> d!79779 m!499497))

(declare-fun m!499499 () Bool)

(assert (=> b!518692 m!499499))

(assert (=> b!518533 d!79779))

(declare-fun b!518721 () Bool)

(declare-fun e!302650 () Bool)

(declare-fun e!302652 () Bool)

(assert (=> b!518721 (= e!302650 e!302652)))

(declare-fun c!60858 () Bool)

(assert (=> b!518721 (= c!60858 (validKeyInArray!0 (select (arr!15938 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31705 () Bool)

(declare-fun call!31708 () Bool)

(assert (=> bm!31705 (= call!31708 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60858 (Cons!10131 (select (arr!15938 a!3235) #b00000000000000000000000000000000) Nil!10132) Nil!10132)))))

(declare-fun d!79781 () Bool)

(declare-fun res!317597 () Bool)

(declare-fun e!302653 () Bool)

(assert (=> d!79781 (=> res!317597 e!302653)))

(assert (=> d!79781 (= res!317597 (bvsge #b00000000000000000000000000000000 (size!16303 a!3235)))))

(assert (=> d!79781 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10132) e!302653)))

(declare-fun b!518722 () Bool)

(declare-fun e!302651 () Bool)

(declare-fun contains!2737 (List!10135 (_ BitVec 64)) Bool)

(assert (=> b!518722 (= e!302651 (contains!2737 Nil!10132 (select (arr!15938 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!518723 () Bool)

(assert (=> b!518723 (= e!302652 call!31708)))

(declare-fun b!518724 () Bool)

(assert (=> b!518724 (= e!302653 e!302650)))

(declare-fun res!317596 () Bool)

(assert (=> b!518724 (=> (not res!317596) (not e!302650))))

(assert (=> b!518724 (= res!317596 (not e!302651))))

(declare-fun res!317595 () Bool)

(assert (=> b!518724 (=> (not res!317595) (not e!302651))))

(assert (=> b!518724 (= res!317595 (validKeyInArray!0 (select (arr!15938 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!518725 () Bool)

(assert (=> b!518725 (= e!302652 call!31708)))

(assert (= (and d!79781 (not res!317597)) b!518724))

(assert (= (and b!518724 res!317595) b!518722))

(assert (= (and b!518724 res!317596) b!518721))

(assert (= (and b!518721 c!60858) b!518725))

(assert (= (and b!518721 (not c!60858)) b!518723))

(assert (= (or b!518725 b!518723) bm!31705))

(assert (=> b!518721 m!499497))

(assert (=> b!518721 m!499497))

(declare-fun m!499501 () Bool)

(assert (=> b!518721 m!499501))

(assert (=> bm!31705 m!499497))

(declare-fun m!499503 () Bool)

(assert (=> bm!31705 m!499503))

(assert (=> b!518722 m!499497))

(assert (=> b!518722 m!499497))

(declare-fun m!499505 () Bool)

(assert (=> b!518722 m!499505))

(assert (=> b!518724 m!499497))

(assert (=> b!518724 m!499497))

(assert (=> b!518724 m!499501))

(assert (=> b!518538 d!79781))

(declare-fun d!79783 () Bool)

(assert (=> d!79783 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!518529 d!79783))

(declare-fun b!518806 () Bool)

(declare-fun e!302699 () SeekEntryResult!4402)

(declare-fun lt!237445 () SeekEntryResult!4402)

(assert (=> b!518806 (= e!302699 (Found!4402 (index!19801 lt!237445)))))

(declare-fun d!79785 () Bool)

(declare-fun lt!237444 () SeekEntryResult!4402)

(assert (=> d!79785 (and (or ((_ is Undefined!4402) lt!237444) (not ((_ is Found!4402) lt!237444)) (and (bvsge (index!19800 lt!237444) #b00000000000000000000000000000000) (bvslt (index!19800 lt!237444) (size!16303 a!3235)))) (or ((_ is Undefined!4402) lt!237444) ((_ is Found!4402) lt!237444) (not ((_ is MissingZero!4402) lt!237444)) (and (bvsge (index!19799 lt!237444) #b00000000000000000000000000000000) (bvslt (index!19799 lt!237444) (size!16303 a!3235)))) (or ((_ is Undefined!4402) lt!237444) ((_ is Found!4402) lt!237444) ((_ is MissingZero!4402) lt!237444) (not ((_ is MissingVacant!4402) lt!237444)) (and (bvsge (index!19802 lt!237444) #b00000000000000000000000000000000) (bvslt (index!19802 lt!237444) (size!16303 a!3235)))) (or ((_ is Undefined!4402) lt!237444) (ite ((_ is Found!4402) lt!237444) (= (select (arr!15938 a!3235) (index!19800 lt!237444)) k0!2280) (ite ((_ is MissingZero!4402) lt!237444) (= (select (arr!15938 a!3235) (index!19799 lt!237444)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4402) lt!237444) (= (select (arr!15938 a!3235) (index!19802 lt!237444)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!302697 () SeekEntryResult!4402)

(assert (=> d!79785 (= lt!237444 e!302697)))

(declare-fun c!60895 () Bool)

(assert (=> d!79785 (= c!60895 (and ((_ is Intermediate!4402) lt!237445) (undefined!5214 lt!237445)))))

(assert (=> d!79785 (= lt!237445 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!79785 (validMask!0 mask!3524)))

(assert (=> d!79785 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!237444)))

(declare-fun e!302698 () SeekEntryResult!4402)

(declare-fun b!518807 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33152 (_ BitVec 32)) SeekEntryResult!4402)

(assert (=> b!518807 (= e!302698 (seekKeyOrZeroReturnVacant!0 (x!48779 lt!237445) (index!19801 lt!237445) (index!19801 lt!237445) k0!2280 a!3235 mask!3524))))

(declare-fun b!518808 () Bool)

(assert (=> b!518808 (= e!302698 (MissingZero!4402 (index!19801 lt!237445)))))

(declare-fun b!518809 () Bool)

(assert (=> b!518809 (= e!302697 Undefined!4402)))

(declare-fun b!518810 () Bool)

(assert (=> b!518810 (= e!302697 e!302699)))

(declare-fun lt!237443 () (_ BitVec 64))

(assert (=> b!518810 (= lt!237443 (select (arr!15938 a!3235) (index!19801 lt!237445)))))

(declare-fun c!60894 () Bool)

(assert (=> b!518810 (= c!60894 (= lt!237443 k0!2280))))

(declare-fun b!518811 () Bool)

(declare-fun c!60896 () Bool)

(assert (=> b!518811 (= c!60896 (= lt!237443 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!518811 (= e!302699 e!302698)))

(assert (= (and d!79785 c!60895) b!518809))

(assert (= (and d!79785 (not c!60895)) b!518810))

(assert (= (and b!518810 c!60894) b!518806))

(assert (= (and b!518810 (not c!60894)) b!518811))

(assert (= (and b!518811 c!60896) b!518808))

(assert (= (and b!518811 (not c!60896)) b!518807))

(declare-fun m!499575 () Bool)

(assert (=> d!79785 m!499575))

(declare-fun m!499577 () Bool)

(assert (=> d!79785 m!499577))

(assert (=> d!79785 m!499363))

(declare-fun m!499579 () Bool)

(assert (=> d!79785 m!499579))

(declare-fun m!499581 () Bool)

(assert (=> d!79785 m!499581))

(declare-fun m!499583 () Bool)

(assert (=> d!79785 m!499583))

(assert (=> d!79785 m!499575))

(declare-fun m!499585 () Bool)

(assert (=> b!518807 m!499585))

(declare-fun m!499587 () Bool)

(assert (=> b!518810 m!499587))

(assert (=> b!518539 d!79785))

(declare-fun b!518832 () Bool)

(declare-fun e!302715 () Bool)

(declare-fun e!302716 () Bool)

(assert (=> b!518832 (= e!302715 e!302716)))

(declare-fun lt!237462 () (_ BitVec 64))

(assert (=> b!518832 (= lt!237462 (select (arr!15938 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!237460 () Unit!16054)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33152 (_ BitVec 64) (_ BitVec 32)) Unit!16054)

(assert (=> b!518832 (= lt!237460 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!237462 #b00000000000000000000000000000000))))

(assert (=> b!518832 (arrayContainsKey!0 a!3235 lt!237462 #b00000000000000000000000000000000)))

(declare-fun lt!237461 () Unit!16054)

(assert (=> b!518832 (= lt!237461 lt!237460)))

(declare-fun res!317620 () Bool)

(assert (=> b!518832 (= res!317620 (= (seekEntryOrOpen!0 (select (arr!15938 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4402 #b00000000000000000000000000000000)))))

(assert (=> b!518832 (=> (not res!317620) (not e!302716))))

(declare-fun d!79813 () Bool)

(declare-fun res!317621 () Bool)

(declare-fun e!302714 () Bool)

(assert (=> d!79813 (=> res!317621 e!302714)))

(assert (=> d!79813 (= res!317621 (bvsge #b00000000000000000000000000000000 (size!16303 a!3235)))))

(assert (=> d!79813 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!302714)))

(declare-fun b!518833 () Bool)

(declare-fun call!31713 () Bool)

(assert (=> b!518833 (= e!302715 call!31713)))

(declare-fun bm!31710 () Bool)

(assert (=> bm!31710 (= call!31713 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!518834 () Bool)

(assert (=> b!518834 (= e!302714 e!302715)))

(declare-fun c!60902 () Bool)

(assert (=> b!518834 (= c!60902 (validKeyInArray!0 (select (arr!15938 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!518835 () Bool)

(assert (=> b!518835 (= e!302716 call!31713)))

(assert (= (and d!79813 (not res!317621)) b!518834))

(assert (= (and b!518834 c!60902) b!518832))

(assert (= (and b!518834 (not c!60902)) b!518833))

(assert (= (and b!518832 res!317620) b!518835))

(assert (= (or b!518835 b!518833) bm!31710))

(assert (=> b!518832 m!499497))

(declare-fun m!499601 () Bool)

(assert (=> b!518832 m!499601))

(declare-fun m!499603 () Bool)

(assert (=> b!518832 m!499603))

(assert (=> b!518832 m!499497))

(declare-fun m!499605 () Bool)

(assert (=> b!518832 m!499605))

(declare-fun m!499607 () Bool)

(assert (=> bm!31710 m!499607))

(assert (=> b!518834 m!499497))

(assert (=> b!518834 m!499497))

(assert (=> b!518834 m!499501))

(assert (=> b!518541 d!79813))

(declare-fun d!79821 () Bool)

(assert (=> d!79821 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!47064 d!79821))

(declare-fun d!79831 () Bool)

(assert (=> d!79831 (= (array_inv!11821 a!3235) (bvsge (size!16303 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!47064 d!79831))

(declare-fun b!518881 () Bool)

(declare-fun e!302749 () Bool)

(declare-fun e!302750 () Bool)

(assert (=> b!518881 (= e!302749 e!302750)))

(declare-fun lt!237472 () (_ BitVec 64))

(assert (=> b!518881 (= lt!237472 (select (arr!15938 a!3235) j!176))))

(declare-fun lt!237470 () Unit!16054)

(assert (=> b!518881 (= lt!237470 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!237472 j!176))))

(assert (=> b!518881 (arrayContainsKey!0 a!3235 lt!237472 #b00000000000000000000000000000000)))

(declare-fun lt!237471 () Unit!16054)

(assert (=> b!518881 (= lt!237471 lt!237470)))

(declare-fun res!317643 () Bool)

(assert (=> b!518881 (= res!317643 (= (seekEntryOrOpen!0 (select (arr!15938 a!3235) j!176) a!3235 mask!3524) (Found!4402 j!176)))))

(assert (=> b!518881 (=> (not res!317643) (not e!302750))))

(declare-fun d!79835 () Bool)

(declare-fun res!317644 () Bool)

(declare-fun e!302748 () Bool)

(assert (=> d!79835 (=> res!317644 e!302748)))

(assert (=> d!79835 (= res!317644 (bvsge j!176 (size!16303 a!3235)))))

(assert (=> d!79835 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!302748)))

(declare-fun b!518882 () Bool)

(declare-fun call!31717 () Bool)

(assert (=> b!518882 (= e!302749 call!31717)))

(declare-fun bm!31714 () Bool)

(assert (=> bm!31714 (= call!31717 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!518883 () Bool)

(assert (=> b!518883 (= e!302748 e!302749)))

(declare-fun c!60915 () Bool)

(assert (=> b!518883 (= c!60915 (validKeyInArray!0 (select (arr!15938 a!3235) j!176)))))

(declare-fun b!518884 () Bool)

(assert (=> b!518884 (= e!302750 call!31717)))

(assert (= (and d!79835 (not res!317644)) b!518883))

(assert (= (and b!518883 c!60915) b!518881))

(assert (= (and b!518883 (not c!60915)) b!518882))

(assert (= (and b!518881 res!317643) b!518884))

(assert (= (or b!518884 b!518882) bm!31714))

(assert (=> b!518881 m!499347))

(declare-fun m!499629 () Bool)

(assert (=> b!518881 m!499629))

(declare-fun m!499631 () Bool)

(assert (=> b!518881 m!499631))

(assert (=> b!518881 m!499347))

(assert (=> b!518881 m!499361))

(declare-fun m!499633 () Bool)

(assert (=> bm!31714 m!499633))

(assert (=> b!518883 m!499347))

(assert (=> b!518883 m!499347))

(assert (=> b!518883 m!499359))

(assert (=> b!518530 d!79835))

(declare-fun d!79837 () Bool)

(declare-fun lt!237482 () (_ BitVec 32))

(declare-fun lt!237481 () (_ BitVec 32))

(assert (=> d!79837 (= lt!237482 (bvmul (bvxor lt!237481 (bvlshr lt!237481 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79837 (= lt!237481 ((_ extract 31 0) (bvand (bvxor lt!237293 (bvlshr lt!237293 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79837 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!317645 (let ((h!11046 ((_ extract 31 0) (bvand (bvxor lt!237293 (bvlshr lt!237293 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48789 (bvmul (bvxor h!11046 (bvlshr h!11046 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48789 (bvlshr x!48789 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!317645 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!317645 #b00000000000000000000000000000000))))))

(assert (=> d!79837 (= (toIndex!0 lt!237293 mask!3524) (bvand (bvxor lt!237482 (bvlshr lt!237482 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!518530 d!79837))

(declare-fun d!79843 () Bool)

(assert (=> d!79843 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!237485 () Unit!16054)

(declare-fun choose!38 (array!33152 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16054)

(assert (=> d!79843 (= lt!237485 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79843 (validMask!0 mask!3524)))

(assert (=> d!79843 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!237485)))

(declare-fun bs!16338 () Bool)

(assert (= bs!16338 d!79843))

(assert (=> bs!16338 m!499353))

(declare-fun m!499651 () Bool)

(assert (=> bs!16338 m!499651))

(assert (=> bs!16338 m!499363))

(assert (=> b!518530 d!79843))

(declare-fun b!518903 () Bool)

(declare-fun lt!237487 () SeekEntryResult!4402)

(assert (=> b!518903 (and (bvsge (index!19801 lt!237487) #b00000000000000000000000000000000) (bvslt (index!19801 lt!237487) (size!16303 lt!237300)))))

(declare-fun res!317652 () Bool)

(assert (=> b!518903 (= res!317652 (= (select (arr!15938 lt!237300) (index!19801 lt!237487)) lt!237293))))

(declare-fun e!302763 () Bool)

(assert (=> b!518903 (=> res!317652 e!302763)))

(declare-fun e!302764 () Bool)

(assert (=> b!518903 (= e!302764 e!302763)))

(declare-fun b!518904 () Bool)

(declare-fun e!302761 () Bool)

(assert (=> b!518904 (= e!302761 e!302764)))

(declare-fun res!317653 () Bool)

(assert (=> b!518904 (= res!317653 (and ((_ is Intermediate!4402) lt!237487) (not (undefined!5214 lt!237487)) (bvslt (x!48779 lt!237487) #b01111111111111111111111111111110) (bvsge (x!48779 lt!237487) #b00000000000000000000000000000000) (bvsge (x!48779 lt!237487) #b00000000000000000000000000000000)))))

(assert (=> b!518904 (=> (not res!317653) (not e!302764))))

(declare-fun b!518905 () Bool)

(declare-fun e!302765 () SeekEntryResult!4402)

(assert (=> b!518905 (= e!302765 (Intermediate!4402 true lt!237296 #b00000000000000000000000000000000))))

(declare-fun b!518906 () Bool)

(assert (=> b!518906 (= e!302761 (bvsge (x!48779 lt!237487) #b01111111111111111111111111111110))))

(declare-fun b!518907 () Bool)

(declare-fun e!302762 () SeekEntryResult!4402)

(assert (=> b!518907 (= e!302762 (Intermediate!4402 false lt!237296 #b00000000000000000000000000000000))))

(declare-fun b!518908 () Bool)

(assert (=> b!518908 (and (bvsge (index!19801 lt!237487) #b00000000000000000000000000000000) (bvslt (index!19801 lt!237487) (size!16303 lt!237300)))))

(assert (=> b!518908 (= e!302763 (= (select (arr!15938 lt!237300) (index!19801 lt!237487)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!518909 () Bool)

(assert (=> b!518909 (= e!302765 e!302762)))

(declare-fun c!60922 () Bool)

(declare-fun lt!237486 () (_ BitVec 64))

(assert (=> b!518909 (= c!60922 (or (= lt!237486 lt!237293) (= (bvadd lt!237486 lt!237486) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!79845 () Bool)

(assert (=> d!79845 e!302761))

(declare-fun c!60923 () Bool)

(assert (=> d!79845 (= c!60923 (and ((_ is Intermediate!4402) lt!237487) (undefined!5214 lt!237487)))))

(assert (=> d!79845 (= lt!237487 e!302765)))

(declare-fun c!60924 () Bool)

(assert (=> d!79845 (= c!60924 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79845 (= lt!237486 (select (arr!15938 lt!237300) lt!237296))))

(assert (=> d!79845 (validMask!0 mask!3524)))

(assert (=> d!79845 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237296 lt!237293 lt!237300 mask!3524) lt!237487)))

(declare-fun b!518910 () Bool)

(assert (=> b!518910 (= e!302762 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!237296 #b00000000000000000000000000000000 mask!3524) lt!237293 lt!237300 mask!3524))))

(declare-fun b!518911 () Bool)

(assert (=> b!518911 (and (bvsge (index!19801 lt!237487) #b00000000000000000000000000000000) (bvslt (index!19801 lt!237487) (size!16303 lt!237300)))))

(declare-fun res!317654 () Bool)

(assert (=> b!518911 (= res!317654 (= (select (arr!15938 lt!237300) (index!19801 lt!237487)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!518911 (=> res!317654 e!302763)))

(assert (= (and d!79845 c!60924) b!518905))

(assert (= (and d!79845 (not c!60924)) b!518909))

(assert (= (and b!518909 c!60922) b!518907))

(assert (= (and b!518909 (not c!60922)) b!518910))

(assert (= (and d!79845 c!60923) b!518906))

(assert (= (and d!79845 (not c!60923)) b!518904))

(assert (= (and b!518904 res!317653) b!518903))

(assert (= (and b!518903 (not res!317652)) b!518911))

(assert (= (and b!518911 (not res!317654)) b!518908))

(declare-fun m!499653 () Bool)

(assert (=> b!518910 m!499653))

(assert (=> b!518910 m!499653))

(declare-fun m!499655 () Bool)

(assert (=> b!518910 m!499655))

(declare-fun m!499657 () Bool)

(assert (=> d!79845 m!499657))

(assert (=> d!79845 m!499363))

(declare-fun m!499659 () Bool)

(assert (=> b!518903 m!499659))

(assert (=> b!518908 m!499659))

(assert (=> b!518911 m!499659))

(assert (=> b!518530 d!79845))

(declare-fun d!79847 () Bool)

(declare-fun lt!237489 () (_ BitVec 32))

(declare-fun lt!237488 () (_ BitVec 32))

(assert (=> d!79847 (= lt!237489 (bvmul (bvxor lt!237488 (bvlshr lt!237488 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79847 (= lt!237488 ((_ extract 31 0) (bvand (bvxor (select (arr!15938 a!3235) j!176) (bvlshr (select (arr!15938 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79847 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!317645 (let ((h!11046 ((_ extract 31 0) (bvand (bvxor (select (arr!15938 a!3235) j!176) (bvlshr (select (arr!15938 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48789 (bvmul (bvxor h!11046 (bvlshr h!11046 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48789 (bvlshr x!48789 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!317645 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!317645 #b00000000000000000000000000000000))))))

(assert (=> d!79847 (= (toIndex!0 (select (arr!15938 a!3235) j!176) mask!3524) (bvand (bvxor lt!237489 (bvlshr lt!237489 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!518530 d!79847))

(declare-fun b!518912 () Bool)

(declare-fun lt!237491 () SeekEntryResult!4402)

(assert (=> b!518912 (and (bvsge (index!19801 lt!237491) #b00000000000000000000000000000000) (bvslt (index!19801 lt!237491) (size!16303 a!3235)))))

(declare-fun res!317655 () Bool)

(assert (=> b!518912 (= res!317655 (= (select (arr!15938 a!3235) (index!19801 lt!237491)) (select (arr!15938 a!3235) j!176)))))

(declare-fun e!302768 () Bool)

(assert (=> b!518912 (=> res!317655 e!302768)))

(declare-fun e!302769 () Bool)

(assert (=> b!518912 (= e!302769 e!302768)))

(declare-fun b!518913 () Bool)

(declare-fun e!302766 () Bool)

(assert (=> b!518913 (= e!302766 e!302769)))

(declare-fun res!317656 () Bool)

(assert (=> b!518913 (= res!317656 (and ((_ is Intermediate!4402) lt!237491) (not (undefined!5214 lt!237491)) (bvslt (x!48779 lt!237491) #b01111111111111111111111111111110) (bvsge (x!48779 lt!237491) #b00000000000000000000000000000000) (bvsge (x!48779 lt!237491) #b00000000000000000000000000000000)))))

(assert (=> b!518913 (=> (not res!317656) (not e!302769))))

(declare-fun b!518914 () Bool)

(declare-fun e!302770 () SeekEntryResult!4402)

(assert (=> b!518914 (= e!302770 (Intermediate!4402 true lt!237295 #b00000000000000000000000000000000))))

(declare-fun b!518915 () Bool)

(assert (=> b!518915 (= e!302766 (bvsge (x!48779 lt!237491) #b01111111111111111111111111111110))))

(declare-fun b!518916 () Bool)

(declare-fun e!302767 () SeekEntryResult!4402)

(assert (=> b!518916 (= e!302767 (Intermediate!4402 false lt!237295 #b00000000000000000000000000000000))))

(declare-fun b!518917 () Bool)

(assert (=> b!518917 (and (bvsge (index!19801 lt!237491) #b00000000000000000000000000000000) (bvslt (index!19801 lt!237491) (size!16303 a!3235)))))

(assert (=> b!518917 (= e!302768 (= (select (arr!15938 a!3235) (index!19801 lt!237491)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!518918 () Bool)

(assert (=> b!518918 (= e!302770 e!302767)))

(declare-fun c!60925 () Bool)

(declare-fun lt!237490 () (_ BitVec 64))

(assert (=> b!518918 (= c!60925 (or (= lt!237490 (select (arr!15938 a!3235) j!176)) (= (bvadd lt!237490 lt!237490) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!79849 () Bool)

(assert (=> d!79849 e!302766))

(declare-fun c!60926 () Bool)

(assert (=> d!79849 (= c!60926 (and ((_ is Intermediate!4402) lt!237491) (undefined!5214 lt!237491)))))

(assert (=> d!79849 (= lt!237491 e!302770)))

(declare-fun c!60927 () Bool)

(assert (=> d!79849 (= c!60927 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79849 (= lt!237490 (select (arr!15938 a!3235) lt!237295))))

(assert (=> d!79849 (validMask!0 mask!3524)))

(assert (=> d!79849 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237295 (select (arr!15938 a!3235) j!176) a!3235 mask!3524) lt!237491)))

(declare-fun b!518919 () Bool)

(assert (=> b!518919 (= e!302767 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!237295 #b00000000000000000000000000000000 mask!3524) (select (arr!15938 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!518920 () Bool)

(assert (=> b!518920 (and (bvsge (index!19801 lt!237491) #b00000000000000000000000000000000) (bvslt (index!19801 lt!237491) (size!16303 a!3235)))))

(declare-fun res!317657 () Bool)

(assert (=> b!518920 (= res!317657 (= (select (arr!15938 a!3235) (index!19801 lt!237491)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!518920 (=> res!317657 e!302768)))

(assert (= (and d!79849 c!60927) b!518914))

(assert (= (and d!79849 (not c!60927)) b!518918))

(assert (= (and b!518918 c!60925) b!518916))

(assert (= (and b!518918 (not c!60925)) b!518919))

(assert (= (and d!79849 c!60926) b!518915))

(assert (= (and d!79849 (not c!60926)) b!518913))

(assert (= (and b!518913 res!317656) b!518912))

(assert (= (and b!518912 (not res!317655)) b!518920))

(assert (= (and b!518920 (not res!317657)) b!518917))

(assert (=> b!518919 m!499489))

(assert (=> b!518919 m!499489))

(assert (=> b!518919 m!499347))

(declare-fun m!499661 () Bool)

(assert (=> b!518919 m!499661))

(declare-fun m!499663 () Bool)

(assert (=> d!79849 m!499663))

(assert (=> d!79849 m!499363))

(declare-fun m!499665 () Bool)

(assert (=> b!518912 m!499665))

(assert (=> b!518917 m!499665))

(assert (=> b!518920 m!499665))

(assert (=> b!518530 d!79849))

(declare-fun b!518921 () Bool)

(declare-fun e!302773 () SeekEntryResult!4402)

(declare-fun lt!237494 () SeekEntryResult!4402)

(assert (=> b!518921 (= e!302773 (Found!4402 (index!19801 lt!237494)))))

(declare-fun d!79851 () Bool)

(declare-fun lt!237493 () SeekEntryResult!4402)

(assert (=> d!79851 (and (or ((_ is Undefined!4402) lt!237493) (not ((_ is Found!4402) lt!237493)) (and (bvsge (index!19800 lt!237493) #b00000000000000000000000000000000) (bvslt (index!19800 lt!237493) (size!16303 a!3235)))) (or ((_ is Undefined!4402) lt!237493) ((_ is Found!4402) lt!237493) (not ((_ is MissingZero!4402) lt!237493)) (and (bvsge (index!19799 lt!237493) #b00000000000000000000000000000000) (bvslt (index!19799 lt!237493) (size!16303 a!3235)))) (or ((_ is Undefined!4402) lt!237493) ((_ is Found!4402) lt!237493) ((_ is MissingZero!4402) lt!237493) (not ((_ is MissingVacant!4402) lt!237493)) (and (bvsge (index!19802 lt!237493) #b00000000000000000000000000000000) (bvslt (index!19802 lt!237493) (size!16303 a!3235)))) (or ((_ is Undefined!4402) lt!237493) (ite ((_ is Found!4402) lt!237493) (= (select (arr!15938 a!3235) (index!19800 lt!237493)) (select (arr!15938 a!3235) j!176)) (ite ((_ is MissingZero!4402) lt!237493) (= (select (arr!15938 a!3235) (index!19799 lt!237493)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4402) lt!237493) (= (select (arr!15938 a!3235) (index!19802 lt!237493)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!302771 () SeekEntryResult!4402)

(assert (=> d!79851 (= lt!237493 e!302771)))

(declare-fun c!60929 () Bool)

(assert (=> d!79851 (= c!60929 (and ((_ is Intermediate!4402) lt!237494) (undefined!5214 lt!237494)))))

(assert (=> d!79851 (= lt!237494 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15938 a!3235) j!176) mask!3524) (select (arr!15938 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79851 (validMask!0 mask!3524)))

(assert (=> d!79851 (= (seekEntryOrOpen!0 (select (arr!15938 a!3235) j!176) a!3235 mask!3524) lt!237493)))

(declare-fun e!302772 () SeekEntryResult!4402)

(declare-fun b!518922 () Bool)

(assert (=> b!518922 (= e!302772 (seekKeyOrZeroReturnVacant!0 (x!48779 lt!237494) (index!19801 lt!237494) (index!19801 lt!237494) (select (arr!15938 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!518923 () Bool)

(assert (=> b!518923 (= e!302772 (MissingZero!4402 (index!19801 lt!237494)))))

(declare-fun b!518924 () Bool)

(assert (=> b!518924 (= e!302771 Undefined!4402)))

(declare-fun b!518925 () Bool)

(assert (=> b!518925 (= e!302771 e!302773)))

(declare-fun lt!237492 () (_ BitVec 64))

(assert (=> b!518925 (= lt!237492 (select (arr!15938 a!3235) (index!19801 lt!237494)))))

(declare-fun c!60928 () Bool)

(assert (=> b!518925 (= c!60928 (= lt!237492 (select (arr!15938 a!3235) j!176)))))

(declare-fun b!518926 () Bool)

(declare-fun c!60930 () Bool)

(assert (=> b!518926 (= c!60930 (= lt!237492 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!518926 (= e!302773 e!302772)))

(assert (= (and d!79851 c!60929) b!518924))

(assert (= (and d!79851 (not c!60929)) b!518925))

(assert (= (and b!518925 c!60928) b!518921))

(assert (= (and b!518925 (not c!60928)) b!518926))

(assert (= (and b!518926 c!60930) b!518923))

(assert (= (and b!518926 (not c!60930)) b!518922))

(assert (=> d!79851 m!499349))

(assert (=> d!79851 m!499347))

(declare-fun m!499667 () Bool)

(assert (=> d!79851 m!499667))

(assert (=> d!79851 m!499363))

(declare-fun m!499669 () Bool)

(assert (=> d!79851 m!499669))

(declare-fun m!499671 () Bool)

(assert (=> d!79851 m!499671))

(declare-fun m!499673 () Bool)

(assert (=> d!79851 m!499673))

(assert (=> d!79851 m!499347))

(assert (=> d!79851 m!499349))

(assert (=> b!518922 m!499347))

(declare-fun m!499675 () Bool)

(assert (=> b!518922 m!499675))

(declare-fun m!499677 () Bool)

(assert (=> b!518925 m!499677))

(assert (=> b!518535 d!79851))

(check-sat (not b!518883) (not d!79845) (not bm!31710) (not b!518832) (not d!79843) (not b!518910) (not d!79849) (not d!79763) (not d!79761) (not b!518881) (not b!518721) (not b!518919) (not b!518629) (not b!518722) (not b!518683) (not b!518692) (not b!518922) (not bm!31705) (not b!518724) (not bm!31714) (not b!518834) (not b!518807) (not d!79785) (not d!79851))
(check-sat)
