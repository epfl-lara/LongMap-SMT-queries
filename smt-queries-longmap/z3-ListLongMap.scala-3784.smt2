; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51804 () Bool)

(assert start!51804)

(declare-fun b!566564 () Bool)

(declare-fun res!357435 () Bool)

(declare-fun e!326064 () Bool)

(assert (=> b!566564 (=> (not res!357435) (not e!326064))))

(declare-datatypes ((array!35559 0))(
  ( (array!35560 (arr!17077 (Array (_ BitVec 32) (_ BitVec 64))) (size!17441 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35559)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!566564 (= res!357435 (validKeyInArray!0 (select (arr!17077 a!3118) j!142)))))

(declare-fun b!566565 () Bool)

(declare-fun res!357429 () Bool)

(assert (=> b!566565 (=> (not res!357429) (not e!326064))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35559 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!566565 (= res!357429 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!566566 () Bool)

(declare-fun e!326062 () Bool)

(assert (=> b!566566 (= e!326064 e!326062)))

(declare-fun res!357431 () Bool)

(assert (=> b!566566 (=> (not res!357431) (not e!326062))))

(declare-datatypes ((SeekEntryResult!5482 0))(
  ( (MissingZero!5482 (index!24155 (_ BitVec 32))) (Found!5482 (index!24156 (_ BitVec 32))) (Intermediate!5482 (undefined!6294 Bool) (index!24157 (_ BitVec 32)) (x!53170 (_ BitVec 32))) (Undefined!5482) (MissingVacant!5482 (index!24158 (_ BitVec 32))) )
))
(declare-fun lt!258195 () SeekEntryResult!5482)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!566566 (= res!357431 (or (= lt!258195 (MissingZero!5482 i!1132)) (= lt!258195 (MissingVacant!5482 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35559 (_ BitVec 32)) SeekEntryResult!5482)

(assert (=> b!566566 (= lt!258195 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun lt!258198 () array!35559)

(declare-fun lt!258202 () SeekEntryResult!5482)

(declare-fun e!326063 () Bool)

(declare-fun b!566567 () Bool)

(declare-fun lt!258201 () (_ BitVec 64))

(assert (=> b!566567 (= e!326063 (= lt!258202 (seekEntryOrOpen!0 lt!258201 lt!258198 mask!3119)))))

(declare-fun b!566568 () Bool)

(declare-fun res!357428 () Bool)

(assert (=> b!566568 (=> (not res!357428) (not e!326062))))

(declare-datatypes ((List!11064 0))(
  ( (Nil!11061) (Cons!11060 (h!12069 (_ BitVec 64)) (t!17284 List!11064)) )
))
(declare-fun arrayNoDuplicates!0 (array!35559 (_ BitVec 32) List!11064) Bool)

(assert (=> b!566568 (= res!357428 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11061))))

(declare-fun res!357430 () Bool)

(assert (=> start!51804 (=> (not res!357430) (not e!326064))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51804 (= res!357430 (validMask!0 mask!3119))))

(assert (=> start!51804 e!326064))

(assert (=> start!51804 true))

(declare-fun array_inv!12936 (array!35559) Bool)

(assert (=> start!51804 (array_inv!12936 a!3118)))

(declare-fun b!566563 () Bool)

(declare-fun res!357433 () Bool)

(assert (=> b!566563 (=> (not res!357433) (not e!326064))))

(assert (=> b!566563 (= res!357433 (and (= (size!17441 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17441 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17441 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!566569 () Bool)

(declare-fun e!326060 () Bool)

(assert (=> b!566569 (= e!326062 e!326060)))

(declare-fun res!357434 () Bool)

(assert (=> b!566569 (=> (not res!357434) (not e!326060))))

(declare-fun lt!258196 () (_ BitVec 32))

(declare-fun lt!258197 () SeekEntryResult!5482)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35559 (_ BitVec 32)) SeekEntryResult!5482)

(assert (=> b!566569 (= res!357434 (= lt!258197 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258196 lt!258201 lt!258198 mask!3119)))))

(declare-fun lt!258200 () (_ BitVec 32))

(assert (=> b!566569 (= lt!258197 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258200 (select (arr!17077 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!566569 (= lt!258196 (toIndex!0 lt!258201 mask!3119))))

(assert (=> b!566569 (= lt!258201 (select (store (arr!17077 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!566569 (= lt!258200 (toIndex!0 (select (arr!17077 a!3118) j!142) mask!3119))))

(assert (=> b!566569 (= lt!258198 (array!35560 (store (arr!17077 a!3118) i!1132 k0!1914) (size!17441 a!3118)))))

(declare-fun b!566570 () Bool)

(declare-fun res!357436 () Bool)

(assert (=> b!566570 (=> (not res!357436) (not e!326064))))

(assert (=> b!566570 (= res!357436 (validKeyInArray!0 k0!1914))))

(declare-fun b!566571 () Bool)

(assert (=> b!566571 (= e!326060 (not e!326063))))

(declare-fun res!357432 () Bool)

(assert (=> b!566571 (=> res!357432 e!326063)))

(get-info :version)

(assert (=> b!566571 (= res!357432 (or (not ((_ is Intermediate!5482) lt!258197)) (not (undefined!6294 lt!258197))))))

(assert (=> b!566571 (= lt!258202 (Found!5482 j!142))))

(assert (=> b!566571 (= lt!258202 (seekEntryOrOpen!0 (select (arr!17077 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35559 (_ BitVec 32)) Bool)

(assert (=> b!566571 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17737 0))(
  ( (Unit!17738) )
))
(declare-fun lt!258199 () Unit!17737)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35559 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17737)

(assert (=> b!566571 (= lt!258199 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!566572 () Bool)

(declare-fun res!357427 () Bool)

(assert (=> b!566572 (=> (not res!357427) (not e!326062))))

(assert (=> b!566572 (= res!357427 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!51804 res!357430) b!566563))

(assert (= (and b!566563 res!357433) b!566564))

(assert (= (and b!566564 res!357435) b!566570))

(assert (= (and b!566570 res!357436) b!566565))

(assert (= (and b!566565 res!357429) b!566566))

(assert (= (and b!566566 res!357431) b!566572))

(assert (= (and b!566572 res!357427) b!566568))

(assert (= (and b!566568 res!357428) b!566569))

(assert (= (and b!566569 res!357434) b!566571))

(assert (= (and b!566571 (not res!357432)) b!566567))

(declare-fun m!545345 () Bool)

(assert (=> b!566569 m!545345))

(declare-fun m!545347 () Bool)

(assert (=> b!566569 m!545347))

(declare-fun m!545349 () Bool)

(assert (=> b!566569 m!545349))

(assert (=> b!566569 m!545347))

(declare-fun m!545351 () Bool)

(assert (=> b!566569 m!545351))

(assert (=> b!566569 m!545347))

(declare-fun m!545353 () Bool)

(assert (=> b!566569 m!545353))

(declare-fun m!545355 () Bool)

(assert (=> b!566569 m!545355))

(declare-fun m!545357 () Bool)

(assert (=> b!566569 m!545357))

(declare-fun m!545359 () Bool)

(assert (=> b!566572 m!545359))

(declare-fun m!545361 () Bool)

(assert (=> start!51804 m!545361))

(declare-fun m!545363 () Bool)

(assert (=> start!51804 m!545363))

(declare-fun m!545365 () Bool)

(assert (=> b!566566 m!545365))

(assert (=> b!566571 m!545347))

(assert (=> b!566571 m!545347))

(declare-fun m!545367 () Bool)

(assert (=> b!566571 m!545367))

(declare-fun m!545369 () Bool)

(assert (=> b!566571 m!545369))

(declare-fun m!545371 () Bool)

(assert (=> b!566571 m!545371))

(assert (=> b!566564 m!545347))

(assert (=> b!566564 m!545347))

(declare-fun m!545373 () Bool)

(assert (=> b!566564 m!545373))

(declare-fun m!545375 () Bool)

(assert (=> b!566565 m!545375))

(declare-fun m!545377 () Bool)

(assert (=> b!566567 m!545377))

(declare-fun m!545379 () Bool)

(assert (=> b!566568 m!545379))

(declare-fun m!545381 () Bool)

(assert (=> b!566570 m!545381))

(check-sat (not b!566568) (not b!566564) (not b!566570) (not b!566566) (not b!566565) (not start!51804) (not b!566571) (not b!566567) (not b!566572) (not b!566569))
(check-sat)
(get-model)

(declare-fun b!566645 () Bool)

(declare-fun e!326101 () SeekEntryResult!5482)

(declare-fun e!326103 () SeekEntryResult!5482)

(assert (=> b!566645 (= e!326101 e!326103)))

(declare-fun lt!258257 () (_ BitVec 64))

(declare-fun lt!258258 () SeekEntryResult!5482)

(assert (=> b!566645 (= lt!258257 (select (arr!17077 a!3118) (index!24157 lt!258258)))))

(declare-fun c!64925 () Bool)

(assert (=> b!566645 (= c!64925 (= lt!258257 (select (arr!17077 a!3118) j!142)))))

(declare-fun b!566646 () Bool)

(assert (=> b!566646 (= e!326103 (Found!5482 (index!24157 lt!258258)))))

(declare-fun b!566647 () Bool)

(assert (=> b!566647 (= e!326101 Undefined!5482)))

(declare-fun d!84201 () Bool)

(declare-fun lt!258259 () SeekEntryResult!5482)

(assert (=> d!84201 (and (or ((_ is Undefined!5482) lt!258259) (not ((_ is Found!5482) lt!258259)) (and (bvsge (index!24156 lt!258259) #b00000000000000000000000000000000) (bvslt (index!24156 lt!258259) (size!17441 a!3118)))) (or ((_ is Undefined!5482) lt!258259) ((_ is Found!5482) lt!258259) (not ((_ is MissingZero!5482) lt!258259)) (and (bvsge (index!24155 lt!258259) #b00000000000000000000000000000000) (bvslt (index!24155 lt!258259) (size!17441 a!3118)))) (or ((_ is Undefined!5482) lt!258259) ((_ is Found!5482) lt!258259) ((_ is MissingZero!5482) lt!258259) (not ((_ is MissingVacant!5482) lt!258259)) (and (bvsge (index!24158 lt!258259) #b00000000000000000000000000000000) (bvslt (index!24158 lt!258259) (size!17441 a!3118)))) (or ((_ is Undefined!5482) lt!258259) (ite ((_ is Found!5482) lt!258259) (= (select (arr!17077 a!3118) (index!24156 lt!258259)) (select (arr!17077 a!3118) j!142)) (ite ((_ is MissingZero!5482) lt!258259) (= (select (arr!17077 a!3118) (index!24155 lt!258259)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5482) lt!258259) (= (select (arr!17077 a!3118) (index!24158 lt!258259)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84201 (= lt!258259 e!326101)))

(declare-fun c!64923 () Bool)

(assert (=> d!84201 (= c!64923 (and ((_ is Intermediate!5482) lt!258258) (undefined!6294 lt!258258)))))

(assert (=> d!84201 (= lt!258258 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17077 a!3118) j!142) mask!3119) (select (arr!17077 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!84201 (validMask!0 mask!3119)))

(assert (=> d!84201 (= (seekEntryOrOpen!0 (select (arr!17077 a!3118) j!142) a!3118 mask!3119) lt!258259)))

(declare-fun b!566648 () Bool)

(declare-fun e!326102 () SeekEntryResult!5482)

(assert (=> b!566648 (= e!326102 (MissingZero!5482 (index!24157 lt!258258)))))

(declare-fun b!566649 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35559 (_ BitVec 32)) SeekEntryResult!5482)

(assert (=> b!566649 (= e!326102 (seekKeyOrZeroReturnVacant!0 (x!53170 lt!258258) (index!24157 lt!258258) (index!24157 lt!258258) (select (arr!17077 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!566650 () Bool)

(declare-fun c!64924 () Bool)

(assert (=> b!566650 (= c!64924 (= lt!258257 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!566650 (= e!326103 e!326102)))

(assert (= (and d!84201 c!64923) b!566647))

(assert (= (and d!84201 (not c!64923)) b!566645))

(assert (= (and b!566645 c!64925) b!566646))

(assert (= (and b!566645 (not c!64925)) b!566650))

(assert (= (and b!566650 c!64924) b!566648))

(assert (= (and b!566650 (not c!64924)) b!566649))

(declare-fun m!545459 () Bool)

(assert (=> b!566645 m!545459))

(declare-fun m!545461 () Bool)

(assert (=> d!84201 m!545461))

(declare-fun m!545463 () Bool)

(assert (=> d!84201 m!545463))

(assert (=> d!84201 m!545361))

(assert (=> d!84201 m!545349))

(assert (=> d!84201 m!545347))

(declare-fun m!545465 () Bool)

(assert (=> d!84201 m!545465))

(declare-fun m!545467 () Bool)

(assert (=> d!84201 m!545467))

(assert (=> d!84201 m!545347))

(assert (=> d!84201 m!545349))

(assert (=> b!566649 m!545347))

(declare-fun m!545469 () Bool)

(assert (=> b!566649 m!545469))

(assert (=> b!566571 d!84201))

(declare-fun b!566665 () Bool)

(declare-fun e!326118 () Bool)

(declare-fun call!32484 () Bool)

(assert (=> b!566665 (= e!326118 call!32484)))

(declare-fun d!84203 () Bool)

(declare-fun res!357507 () Bool)

(declare-fun e!326117 () Bool)

(assert (=> d!84203 (=> res!357507 e!326117)))

(assert (=> d!84203 (= res!357507 (bvsge j!142 (size!17441 a!3118)))))

(assert (=> d!84203 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!326117)))

(declare-fun b!566666 () Bool)

(declare-fun e!326116 () Bool)

(assert (=> b!566666 (= e!326118 e!326116)))

(declare-fun lt!258267 () (_ BitVec 64))

(assert (=> b!566666 (= lt!258267 (select (arr!17077 a!3118) j!142))))

(declare-fun lt!258266 () Unit!17737)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35559 (_ BitVec 64) (_ BitVec 32)) Unit!17737)

(assert (=> b!566666 (= lt!258266 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!258267 j!142))))

(assert (=> b!566666 (arrayContainsKey!0 a!3118 lt!258267 #b00000000000000000000000000000000)))

(declare-fun lt!258268 () Unit!17737)

(assert (=> b!566666 (= lt!258268 lt!258266)))

(declare-fun res!357508 () Bool)

(assert (=> b!566666 (= res!357508 (= (seekEntryOrOpen!0 (select (arr!17077 a!3118) j!142) a!3118 mask!3119) (Found!5482 j!142)))))

(assert (=> b!566666 (=> (not res!357508) (not e!326116))))

(declare-fun b!566667 () Bool)

(assert (=> b!566667 (= e!326116 call!32484)))

(declare-fun b!566668 () Bool)

(assert (=> b!566668 (= e!326117 e!326118)))

(declare-fun c!64928 () Bool)

(assert (=> b!566668 (= c!64928 (validKeyInArray!0 (select (arr!17077 a!3118) j!142)))))

(declare-fun bm!32481 () Bool)

(assert (=> bm!32481 (= call!32484 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(assert (= (and d!84203 (not res!357507)) b!566668))

(assert (= (and b!566668 c!64928) b!566666))

(assert (= (and b!566668 (not c!64928)) b!566665))

(assert (= (and b!566666 res!357508) b!566667))

(assert (= (or b!566667 b!566665) bm!32481))

(assert (=> b!566666 m!545347))

(declare-fun m!545475 () Bool)

(assert (=> b!566666 m!545475))

(declare-fun m!545477 () Bool)

(assert (=> b!566666 m!545477))

(assert (=> b!566666 m!545347))

(assert (=> b!566666 m!545367))

(assert (=> b!566668 m!545347))

(assert (=> b!566668 m!545347))

(assert (=> b!566668 m!545373))

(declare-fun m!545479 () Bool)

(assert (=> bm!32481 m!545479))

(assert (=> b!566571 d!84203))

(declare-fun d!84213 () Bool)

(assert (=> d!84213 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!258271 () Unit!17737)

(declare-fun choose!38 (array!35559 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17737)

(assert (=> d!84213 (= lt!258271 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!84213 (validMask!0 mask!3119)))

(assert (=> d!84213 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!258271)))

(declare-fun bs!17615 () Bool)

(assert (= bs!17615 d!84213))

(assert (=> bs!17615 m!545369))

(declare-fun m!545481 () Bool)

(assert (=> bs!17615 m!545481))

(assert (=> bs!17615 m!545361))

(assert (=> b!566571 d!84213))

(declare-fun b!566669 () Bool)

(declare-fun e!326119 () SeekEntryResult!5482)

(declare-fun e!326121 () SeekEntryResult!5482)

(assert (=> b!566669 (= e!326119 e!326121)))

(declare-fun lt!258272 () (_ BitVec 64))

(declare-fun lt!258273 () SeekEntryResult!5482)

(assert (=> b!566669 (= lt!258272 (select (arr!17077 a!3118) (index!24157 lt!258273)))))

(declare-fun c!64931 () Bool)

(assert (=> b!566669 (= c!64931 (= lt!258272 k0!1914))))

(declare-fun b!566670 () Bool)

(assert (=> b!566670 (= e!326121 (Found!5482 (index!24157 lt!258273)))))

(declare-fun b!566671 () Bool)

(assert (=> b!566671 (= e!326119 Undefined!5482)))

(declare-fun d!84215 () Bool)

(declare-fun lt!258274 () SeekEntryResult!5482)

(assert (=> d!84215 (and (or ((_ is Undefined!5482) lt!258274) (not ((_ is Found!5482) lt!258274)) (and (bvsge (index!24156 lt!258274) #b00000000000000000000000000000000) (bvslt (index!24156 lt!258274) (size!17441 a!3118)))) (or ((_ is Undefined!5482) lt!258274) ((_ is Found!5482) lt!258274) (not ((_ is MissingZero!5482) lt!258274)) (and (bvsge (index!24155 lt!258274) #b00000000000000000000000000000000) (bvslt (index!24155 lt!258274) (size!17441 a!3118)))) (or ((_ is Undefined!5482) lt!258274) ((_ is Found!5482) lt!258274) ((_ is MissingZero!5482) lt!258274) (not ((_ is MissingVacant!5482) lt!258274)) (and (bvsge (index!24158 lt!258274) #b00000000000000000000000000000000) (bvslt (index!24158 lt!258274) (size!17441 a!3118)))) (or ((_ is Undefined!5482) lt!258274) (ite ((_ is Found!5482) lt!258274) (= (select (arr!17077 a!3118) (index!24156 lt!258274)) k0!1914) (ite ((_ is MissingZero!5482) lt!258274) (= (select (arr!17077 a!3118) (index!24155 lt!258274)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5482) lt!258274) (= (select (arr!17077 a!3118) (index!24158 lt!258274)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84215 (= lt!258274 e!326119)))

(declare-fun c!64929 () Bool)

(assert (=> d!84215 (= c!64929 (and ((_ is Intermediate!5482) lt!258273) (undefined!6294 lt!258273)))))

(assert (=> d!84215 (= lt!258273 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!84215 (validMask!0 mask!3119)))

(assert (=> d!84215 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!258274)))

(declare-fun b!566672 () Bool)

(declare-fun e!326120 () SeekEntryResult!5482)

(assert (=> b!566672 (= e!326120 (MissingZero!5482 (index!24157 lt!258273)))))

(declare-fun b!566673 () Bool)

(assert (=> b!566673 (= e!326120 (seekKeyOrZeroReturnVacant!0 (x!53170 lt!258273) (index!24157 lt!258273) (index!24157 lt!258273) k0!1914 a!3118 mask!3119))))

(declare-fun b!566674 () Bool)

(declare-fun c!64930 () Bool)

(assert (=> b!566674 (= c!64930 (= lt!258272 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!566674 (= e!326121 e!326120)))

(assert (= (and d!84215 c!64929) b!566671))

(assert (= (and d!84215 (not c!64929)) b!566669))

(assert (= (and b!566669 c!64931) b!566670))

(assert (= (and b!566669 (not c!64931)) b!566674))

(assert (= (and b!566674 c!64930) b!566672))

(assert (= (and b!566674 (not c!64930)) b!566673))

(declare-fun m!545483 () Bool)

(assert (=> b!566669 m!545483))

(declare-fun m!545485 () Bool)

(assert (=> d!84215 m!545485))

(declare-fun m!545487 () Bool)

(assert (=> d!84215 m!545487))

(assert (=> d!84215 m!545361))

(declare-fun m!545489 () Bool)

(assert (=> d!84215 m!545489))

(declare-fun m!545491 () Bool)

(assert (=> d!84215 m!545491))

(declare-fun m!545493 () Bool)

(assert (=> d!84215 m!545493))

(assert (=> d!84215 m!545489))

(declare-fun m!545495 () Bool)

(assert (=> b!566673 m!545495))

(assert (=> b!566566 d!84215))

(declare-fun d!84217 () Bool)

(declare-fun res!357513 () Bool)

(declare-fun e!326126 () Bool)

(assert (=> d!84217 (=> res!357513 e!326126)))

(assert (=> d!84217 (= res!357513 (= (select (arr!17077 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!84217 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!326126)))

(declare-fun b!566679 () Bool)

(declare-fun e!326127 () Bool)

(assert (=> b!566679 (= e!326126 e!326127)))

(declare-fun res!357514 () Bool)

(assert (=> b!566679 (=> (not res!357514) (not e!326127))))

(assert (=> b!566679 (= res!357514 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17441 a!3118)))))

(declare-fun b!566680 () Bool)

(assert (=> b!566680 (= e!326127 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!84217 (not res!357513)) b!566679))

(assert (= (and b!566679 res!357514) b!566680))

(declare-fun m!545497 () Bool)

(assert (=> d!84217 m!545497))

(declare-fun m!545499 () Bool)

(assert (=> b!566680 m!545499))

(assert (=> b!566565 d!84217))

(declare-fun b!566681 () Bool)

(declare-fun e!326128 () SeekEntryResult!5482)

(declare-fun e!326130 () SeekEntryResult!5482)

(assert (=> b!566681 (= e!326128 e!326130)))

(declare-fun lt!258275 () (_ BitVec 64))

(declare-fun lt!258276 () SeekEntryResult!5482)

(assert (=> b!566681 (= lt!258275 (select (arr!17077 lt!258198) (index!24157 lt!258276)))))

(declare-fun c!64934 () Bool)

(assert (=> b!566681 (= c!64934 (= lt!258275 lt!258201))))

(declare-fun b!566682 () Bool)

(assert (=> b!566682 (= e!326130 (Found!5482 (index!24157 lt!258276)))))

(declare-fun b!566683 () Bool)

(assert (=> b!566683 (= e!326128 Undefined!5482)))

(declare-fun d!84219 () Bool)

(declare-fun lt!258277 () SeekEntryResult!5482)

(assert (=> d!84219 (and (or ((_ is Undefined!5482) lt!258277) (not ((_ is Found!5482) lt!258277)) (and (bvsge (index!24156 lt!258277) #b00000000000000000000000000000000) (bvslt (index!24156 lt!258277) (size!17441 lt!258198)))) (or ((_ is Undefined!5482) lt!258277) ((_ is Found!5482) lt!258277) (not ((_ is MissingZero!5482) lt!258277)) (and (bvsge (index!24155 lt!258277) #b00000000000000000000000000000000) (bvslt (index!24155 lt!258277) (size!17441 lt!258198)))) (or ((_ is Undefined!5482) lt!258277) ((_ is Found!5482) lt!258277) ((_ is MissingZero!5482) lt!258277) (not ((_ is MissingVacant!5482) lt!258277)) (and (bvsge (index!24158 lt!258277) #b00000000000000000000000000000000) (bvslt (index!24158 lt!258277) (size!17441 lt!258198)))) (or ((_ is Undefined!5482) lt!258277) (ite ((_ is Found!5482) lt!258277) (= (select (arr!17077 lt!258198) (index!24156 lt!258277)) lt!258201) (ite ((_ is MissingZero!5482) lt!258277) (= (select (arr!17077 lt!258198) (index!24155 lt!258277)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5482) lt!258277) (= (select (arr!17077 lt!258198) (index!24158 lt!258277)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84219 (= lt!258277 e!326128)))

(declare-fun c!64932 () Bool)

(assert (=> d!84219 (= c!64932 (and ((_ is Intermediate!5482) lt!258276) (undefined!6294 lt!258276)))))

(assert (=> d!84219 (= lt!258276 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!258201 mask!3119) lt!258201 lt!258198 mask!3119))))

(assert (=> d!84219 (validMask!0 mask!3119)))

(assert (=> d!84219 (= (seekEntryOrOpen!0 lt!258201 lt!258198 mask!3119) lt!258277)))

(declare-fun b!566684 () Bool)

(declare-fun e!326129 () SeekEntryResult!5482)

(assert (=> b!566684 (= e!326129 (MissingZero!5482 (index!24157 lt!258276)))))

(declare-fun b!566685 () Bool)

(assert (=> b!566685 (= e!326129 (seekKeyOrZeroReturnVacant!0 (x!53170 lt!258276) (index!24157 lt!258276) (index!24157 lt!258276) lt!258201 lt!258198 mask!3119))))

(declare-fun b!566686 () Bool)

(declare-fun c!64933 () Bool)

(assert (=> b!566686 (= c!64933 (= lt!258275 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!566686 (= e!326130 e!326129)))

(assert (= (and d!84219 c!64932) b!566683))

(assert (= (and d!84219 (not c!64932)) b!566681))

(assert (= (and b!566681 c!64934) b!566682))

(assert (= (and b!566681 (not c!64934)) b!566686))

(assert (= (and b!566686 c!64933) b!566684))

(assert (= (and b!566686 (not c!64933)) b!566685))

(declare-fun m!545501 () Bool)

(assert (=> b!566681 m!545501))

(declare-fun m!545503 () Bool)

(assert (=> d!84219 m!545503))

(declare-fun m!545505 () Bool)

(assert (=> d!84219 m!545505))

(assert (=> d!84219 m!545361))

(assert (=> d!84219 m!545357))

(declare-fun m!545507 () Bool)

(assert (=> d!84219 m!545507))

(declare-fun m!545509 () Bool)

(assert (=> d!84219 m!545509))

(assert (=> d!84219 m!545357))

(declare-fun m!545511 () Bool)

(assert (=> b!566685 m!545511))

(assert (=> b!566567 d!84219))

(declare-fun b!566687 () Bool)

(declare-fun e!326133 () Bool)

(declare-fun call!32485 () Bool)

(assert (=> b!566687 (= e!326133 call!32485)))

(declare-fun d!84221 () Bool)

(declare-fun res!357515 () Bool)

(declare-fun e!326132 () Bool)

(assert (=> d!84221 (=> res!357515 e!326132)))

(assert (=> d!84221 (= res!357515 (bvsge #b00000000000000000000000000000000 (size!17441 a!3118)))))

(assert (=> d!84221 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!326132)))

(declare-fun b!566688 () Bool)

(declare-fun e!326131 () Bool)

(assert (=> b!566688 (= e!326133 e!326131)))

(declare-fun lt!258279 () (_ BitVec 64))

(assert (=> b!566688 (= lt!258279 (select (arr!17077 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!258278 () Unit!17737)

(assert (=> b!566688 (= lt!258278 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!258279 #b00000000000000000000000000000000))))

(assert (=> b!566688 (arrayContainsKey!0 a!3118 lt!258279 #b00000000000000000000000000000000)))

(declare-fun lt!258280 () Unit!17737)

(assert (=> b!566688 (= lt!258280 lt!258278)))

(declare-fun res!357516 () Bool)

(assert (=> b!566688 (= res!357516 (= (seekEntryOrOpen!0 (select (arr!17077 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5482 #b00000000000000000000000000000000)))))

(assert (=> b!566688 (=> (not res!357516) (not e!326131))))

(declare-fun b!566689 () Bool)

(assert (=> b!566689 (= e!326131 call!32485)))

(declare-fun b!566690 () Bool)

(assert (=> b!566690 (= e!326132 e!326133)))

(declare-fun c!64935 () Bool)

(assert (=> b!566690 (= c!64935 (validKeyInArray!0 (select (arr!17077 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32482 () Bool)

(assert (=> bm!32482 (= call!32485 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(assert (= (and d!84221 (not res!357515)) b!566690))

(assert (= (and b!566690 c!64935) b!566688))

(assert (= (and b!566690 (not c!64935)) b!566687))

(assert (= (and b!566688 res!357516) b!566689))

(assert (= (or b!566689 b!566687) bm!32482))

(assert (=> b!566688 m!545497))

(declare-fun m!545513 () Bool)

(assert (=> b!566688 m!545513))

(declare-fun m!545515 () Bool)

(assert (=> b!566688 m!545515))

(assert (=> b!566688 m!545497))

(declare-fun m!545517 () Bool)

(assert (=> b!566688 m!545517))

(assert (=> b!566690 m!545497))

(assert (=> b!566690 m!545497))

(declare-fun m!545519 () Bool)

(assert (=> b!566690 m!545519))

(declare-fun m!545521 () Bool)

(assert (=> bm!32482 m!545521))

(assert (=> b!566572 d!84221))

(declare-fun bm!32485 () Bool)

(declare-fun call!32488 () Bool)

(declare-fun c!64953 () Bool)

(assert (=> bm!32485 (= call!32488 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!64953 (Cons!11060 (select (arr!17077 a!3118) #b00000000000000000000000000000000) Nil!11061) Nil!11061)))))

(declare-fun b!566731 () Bool)

(declare-fun e!326159 () Bool)

(declare-fun e!326160 () Bool)

(assert (=> b!566731 (= e!326159 e!326160)))

(assert (=> b!566731 (= c!64953 (validKeyInArray!0 (select (arr!17077 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!566732 () Bool)

(declare-fun e!326157 () Bool)

(declare-fun contains!2838 (List!11064 (_ BitVec 64)) Bool)

(assert (=> b!566732 (= e!326157 (contains!2838 Nil!11061 (select (arr!17077 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!84223 () Bool)

(declare-fun res!357524 () Bool)

(declare-fun e!326158 () Bool)

(assert (=> d!84223 (=> res!357524 e!326158)))

(assert (=> d!84223 (= res!357524 (bvsge #b00000000000000000000000000000000 (size!17441 a!3118)))))

(assert (=> d!84223 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11061) e!326158)))

(declare-fun b!566733 () Bool)

(assert (=> b!566733 (= e!326160 call!32488)))

(declare-fun b!566734 () Bool)

(assert (=> b!566734 (= e!326158 e!326159)))

(declare-fun res!357525 () Bool)

(assert (=> b!566734 (=> (not res!357525) (not e!326159))))

(assert (=> b!566734 (= res!357525 (not e!326157))))

(declare-fun res!357523 () Bool)

(assert (=> b!566734 (=> (not res!357523) (not e!326157))))

(assert (=> b!566734 (= res!357523 (validKeyInArray!0 (select (arr!17077 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!566735 () Bool)

(assert (=> b!566735 (= e!326160 call!32488)))

(assert (= (and d!84223 (not res!357524)) b!566734))

(assert (= (and b!566734 res!357523) b!566732))

(assert (= (and b!566734 res!357525) b!566731))

(assert (= (and b!566731 c!64953) b!566733))

(assert (= (and b!566731 (not c!64953)) b!566735))

(assert (= (or b!566733 b!566735) bm!32485))

(assert (=> bm!32485 m!545497))

(declare-fun m!545529 () Bool)

(assert (=> bm!32485 m!545529))

(assert (=> b!566731 m!545497))

(assert (=> b!566731 m!545497))

(assert (=> b!566731 m!545519))

(assert (=> b!566732 m!545497))

(assert (=> b!566732 m!545497))

(declare-fun m!545537 () Bool)

(assert (=> b!566732 m!545537))

(assert (=> b!566734 m!545497))

(assert (=> b!566734 m!545497))

(assert (=> b!566734 m!545519))

(assert (=> b!566568 d!84223))

(declare-fun d!84227 () Bool)

(assert (=> d!84227 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!566570 d!84227))

(declare-fun b!566805 () Bool)

(declare-fun e!326202 () Bool)

(declare-fun lt!258313 () SeekEntryResult!5482)

(assert (=> b!566805 (= e!326202 (bvsge (x!53170 lt!258313) #b01111111111111111111111111111110))))

(declare-fun b!566806 () Bool)

(declare-fun e!326206 () SeekEntryResult!5482)

(declare-fun e!326203 () SeekEntryResult!5482)

(assert (=> b!566806 (= e!326206 e!326203)))

(declare-fun c!64979 () Bool)

(declare-fun lt!258314 () (_ BitVec 64))

(assert (=> b!566806 (= c!64979 (or (= lt!258314 lt!258201) (= (bvadd lt!258314 lt!258314) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!84229 () Bool)

(assert (=> d!84229 e!326202))

(declare-fun c!64978 () Bool)

(assert (=> d!84229 (= c!64978 (and ((_ is Intermediate!5482) lt!258313) (undefined!6294 lt!258313)))))

(assert (=> d!84229 (= lt!258313 e!326206)))

(declare-fun c!64980 () Bool)

(assert (=> d!84229 (= c!64980 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84229 (= lt!258314 (select (arr!17077 lt!258198) lt!258196))))

(assert (=> d!84229 (validMask!0 mask!3119)))

(assert (=> d!84229 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258196 lt!258201 lt!258198 mask!3119) lt!258313)))

(declare-fun b!566807 () Bool)

(assert (=> b!566807 (and (bvsge (index!24157 lt!258313) #b00000000000000000000000000000000) (bvslt (index!24157 lt!258313) (size!17441 lt!258198)))))

(declare-fun res!357549 () Bool)

(assert (=> b!566807 (= res!357549 (= (select (arr!17077 lt!258198) (index!24157 lt!258313)) lt!258201))))

(declare-fun e!326204 () Bool)

(assert (=> b!566807 (=> res!357549 e!326204)))

(declare-fun e!326205 () Bool)

(assert (=> b!566807 (= e!326205 e!326204)))

(declare-fun b!566808 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!566808 (= e!326203 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!258196 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) lt!258201 lt!258198 mask!3119))))

(declare-fun b!566809 () Bool)

(assert (=> b!566809 (and (bvsge (index!24157 lt!258313) #b00000000000000000000000000000000) (bvslt (index!24157 lt!258313) (size!17441 lt!258198)))))

(assert (=> b!566809 (= e!326204 (= (select (arr!17077 lt!258198) (index!24157 lt!258313)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!566810 () Bool)

(assert (=> b!566810 (= e!326202 e!326205)))

(declare-fun res!357548 () Bool)

(assert (=> b!566810 (= res!357548 (and ((_ is Intermediate!5482) lt!258313) (not (undefined!6294 lt!258313)) (bvslt (x!53170 lt!258313) #b01111111111111111111111111111110) (bvsge (x!53170 lt!258313) #b00000000000000000000000000000000) (bvsge (x!53170 lt!258313) #b00000000000000000000000000000000)))))

(assert (=> b!566810 (=> (not res!357548) (not e!326205))))

(declare-fun b!566811 () Bool)

(assert (=> b!566811 (and (bvsge (index!24157 lt!258313) #b00000000000000000000000000000000) (bvslt (index!24157 lt!258313) (size!17441 lt!258198)))))

(declare-fun res!357547 () Bool)

(assert (=> b!566811 (= res!357547 (= (select (arr!17077 lt!258198) (index!24157 lt!258313)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!566811 (=> res!357547 e!326204)))

(declare-fun b!566812 () Bool)

(assert (=> b!566812 (= e!326203 (Intermediate!5482 false lt!258196 #b00000000000000000000000000000000))))

(declare-fun b!566813 () Bool)

(assert (=> b!566813 (= e!326206 (Intermediate!5482 true lt!258196 #b00000000000000000000000000000000))))

(assert (= (and d!84229 c!64980) b!566813))

(assert (= (and d!84229 (not c!64980)) b!566806))

(assert (= (and b!566806 c!64979) b!566812))

(assert (= (and b!566806 (not c!64979)) b!566808))

(assert (= (and d!84229 c!64978) b!566805))

(assert (= (and d!84229 (not c!64978)) b!566810))

(assert (= (and b!566810 res!357548) b!566807))

(assert (= (and b!566807 (not res!357549)) b!566811))

(assert (= (and b!566811 (not res!357547)) b!566809))

(declare-fun m!545585 () Bool)

(assert (=> b!566809 m!545585))

(assert (=> b!566811 m!545585))

(assert (=> b!566807 m!545585))

(declare-fun m!545587 () Bool)

(assert (=> d!84229 m!545587))

(assert (=> d!84229 m!545361))

(declare-fun m!545589 () Bool)

(assert (=> b!566808 m!545589))

(assert (=> b!566808 m!545589))

(declare-fun m!545591 () Bool)

(assert (=> b!566808 m!545591))

(assert (=> b!566569 d!84229))

(declare-fun b!566814 () Bool)

(declare-fun e!326207 () Bool)

(declare-fun lt!258315 () SeekEntryResult!5482)

(assert (=> b!566814 (= e!326207 (bvsge (x!53170 lt!258315) #b01111111111111111111111111111110))))

(declare-fun b!566815 () Bool)

(declare-fun e!326211 () SeekEntryResult!5482)

(declare-fun e!326208 () SeekEntryResult!5482)

(assert (=> b!566815 (= e!326211 e!326208)))

(declare-fun lt!258316 () (_ BitVec 64))

(declare-fun c!64982 () Bool)

(assert (=> b!566815 (= c!64982 (or (= lt!258316 (select (arr!17077 a!3118) j!142)) (= (bvadd lt!258316 lt!258316) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!84247 () Bool)

(assert (=> d!84247 e!326207))

(declare-fun c!64981 () Bool)

(assert (=> d!84247 (= c!64981 (and ((_ is Intermediate!5482) lt!258315) (undefined!6294 lt!258315)))))

(assert (=> d!84247 (= lt!258315 e!326211)))

(declare-fun c!64983 () Bool)

(assert (=> d!84247 (= c!64983 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84247 (= lt!258316 (select (arr!17077 a!3118) lt!258200))))

(assert (=> d!84247 (validMask!0 mask!3119)))

(assert (=> d!84247 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258200 (select (arr!17077 a!3118) j!142) a!3118 mask!3119) lt!258315)))

(declare-fun b!566816 () Bool)

(assert (=> b!566816 (and (bvsge (index!24157 lt!258315) #b00000000000000000000000000000000) (bvslt (index!24157 lt!258315) (size!17441 a!3118)))))

(declare-fun res!357552 () Bool)

(assert (=> b!566816 (= res!357552 (= (select (arr!17077 a!3118) (index!24157 lt!258315)) (select (arr!17077 a!3118) j!142)))))

(declare-fun e!326209 () Bool)

(assert (=> b!566816 (=> res!357552 e!326209)))

(declare-fun e!326210 () Bool)

(assert (=> b!566816 (= e!326210 e!326209)))

(declare-fun b!566817 () Bool)

(assert (=> b!566817 (= e!326208 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!258200 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) (select (arr!17077 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!566818 () Bool)

(assert (=> b!566818 (and (bvsge (index!24157 lt!258315) #b00000000000000000000000000000000) (bvslt (index!24157 lt!258315) (size!17441 a!3118)))))

(assert (=> b!566818 (= e!326209 (= (select (arr!17077 a!3118) (index!24157 lt!258315)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!566819 () Bool)

(assert (=> b!566819 (= e!326207 e!326210)))

(declare-fun res!357551 () Bool)

(assert (=> b!566819 (= res!357551 (and ((_ is Intermediate!5482) lt!258315) (not (undefined!6294 lt!258315)) (bvslt (x!53170 lt!258315) #b01111111111111111111111111111110) (bvsge (x!53170 lt!258315) #b00000000000000000000000000000000) (bvsge (x!53170 lt!258315) #b00000000000000000000000000000000)))))

(assert (=> b!566819 (=> (not res!357551) (not e!326210))))

(declare-fun b!566820 () Bool)

(assert (=> b!566820 (and (bvsge (index!24157 lt!258315) #b00000000000000000000000000000000) (bvslt (index!24157 lt!258315) (size!17441 a!3118)))))

(declare-fun res!357550 () Bool)

(assert (=> b!566820 (= res!357550 (= (select (arr!17077 a!3118) (index!24157 lt!258315)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!566820 (=> res!357550 e!326209)))

(declare-fun b!566821 () Bool)

(assert (=> b!566821 (= e!326208 (Intermediate!5482 false lt!258200 #b00000000000000000000000000000000))))

(declare-fun b!566822 () Bool)

(assert (=> b!566822 (= e!326211 (Intermediate!5482 true lt!258200 #b00000000000000000000000000000000))))

(assert (= (and d!84247 c!64983) b!566822))

(assert (= (and d!84247 (not c!64983)) b!566815))

(assert (= (and b!566815 c!64982) b!566821))

(assert (= (and b!566815 (not c!64982)) b!566817))

(assert (= (and d!84247 c!64981) b!566814))

(assert (= (and d!84247 (not c!64981)) b!566819))

(assert (= (and b!566819 res!357551) b!566816))

(assert (= (and b!566816 (not res!357552)) b!566820))

(assert (= (and b!566820 (not res!357550)) b!566818))

(declare-fun m!545593 () Bool)

(assert (=> b!566818 m!545593))

(assert (=> b!566820 m!545593))

(assert (=> b!566816 m!545593))

(declare-fun m!545595 () Bool)

(assert (=> d!84247 m!545595))

(assert (=> d!84247 m!545361))

(declare-fun m!545597 () Bool)

(assert (=> b!566817 m!545597))

(assert (=> b!566817 m!545597))

(assert (=> b!566817 m!545347))

(declare-fun m!545599 () Bool)

(assert (=> b!566817 m!545599))

(assert (=> b!566569 d!84247))

(declare-fun d!84249 () Bool)

(declare-fun lt!258326 () (_ BitVec 32))

(declare-fun lt!258325 () (_ BitVec 32))

(assert (=> d!84249 (= lt!258326 (bvmul (bvxor lt!258325 (bvlshr lt!258325 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84249 (= lt!258325 ((_ extract 31 0) (bvand (bvxor lt!258201 (bvlshr lt!258201 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84249 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!357553 (let ((h!12072 ((_ extract 31 0) (bvand (bvxor lt!258201 (bvlshr lt!258201 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53175 (bvmul (bvxor h!12072 (bvlshr h!12072 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53175 (bvlshr x!53175 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!357553 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!357553 #b00000000000000000000000000000000))))))

(assert (=> d!84249 (= (toIndex!0 lt!258201 mask!3119) (bvand (bvxor lt!258326 (bvlshr lt!258326 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!566569 d!84249))

(declare-fun d!84255 () Bool)

(declare-fun lt!258328 () (_ BitVec 32))

(declare-fun lt!258327 () (_ BitVec 32))

(assert (=> d!84255 (= lt!258328 (bvmul (bvxor lt!258327 (bvlshr lt!258327 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84255 (= lt!258327 ((_ extract 31 0) (bvand (bvxor (select (arr!17077 a!3118) j!142) (bvlshr (select (arr!17077 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84255 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!357553 (let ((h!12072 ((_ extract 31 0) (bvand (bvxor (select (arr!17077 a!3118) j!142) (bvlshr (select (arr!17077 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53175 (bvmul (bvxor h!12072 (bvlshr h!12072 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53175 (bvlshr x!53175 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!357553 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!357553 #b00000000000000000000000000000000))))))

(assert (=> d!84255 (= (toIndex!0 (select (arr!17077 a!3118) j!142) mask!3119) (bvand (bvxor lt!258328 (bvlshr lt!258328 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!566569 d!84255))

(declare-fun d!84257 () Bool)

(assert (=> d!84257 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!51804 d!84257))

(declare-fun d!84265 () Bool)

(assert (=> d!84265 (= (array_inv!12936 a!3118) (bvsge (size!17441 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!51804 d!84265))

(declare-fun d!84267 () Bool)

(assert (=> d!84267 (= (validKeyInArray!0 (select (arr!17077 a!3118) j!142)) (and (not (= (select (arr!17077 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17077 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!566564 d!84267))

(check-sat (not d!84247) (not b!566649) (not b!566732) (not bm!32485) (not b!566734) (not bm!32481) (not b!566666) (not b!566817) (not bm!32482) (not b!566668) (not b!566685) (not b!566673) (not b!566680) (not d!84215) (not b!566808) (not d!84229) (not d!84219) (not d!84201) (not b!566731) (not d!84213) (not b!566690) (not b!566688))
(check-sat)
