; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51828 () Bool)

(assert start!51828)

(declare-fun b!566822 () Bool)

(declare-fun res!357597 () Bool)

(declare-fun e!326203 () Bool)

(assert (=> b!566822 (=> (not res!357597) (not e!326203))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35579 0))(
  ( (array!35580 (arr!17087 (Array (_ BitVec 32) (_ BitVec 64))) (size!17451 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35579)

(assert (=> b!566822 (= res!357597 (and (= (size!17451 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17451 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17451 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!566823 () Bool)

(declare-fun res!357593 () Bool)

(declare-fun e!326205 () Bool)

(assert (=> b!566823 (=> (not res!357593) (not e!326205))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35579 (_ BitVec 32)) Bool)

(assert (=> b!566823 (= res!357593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!566824 () Bool)

(declare-fun res!357592 () Bool)

(assert (=> b!566824 (=> (not res!357592) (not e!326203))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!566824 (= res!357592 (validKeyInArray!0 k!1914))))

(declare-fun res!357598 () Bool)

(assert (=> start!51828 (=> (not res!357598) (not e!326203))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51828 (= res!357598 (validMask!0 mask!3119))))

(assert (=> start!51828 e!326203))

(assert (=> start!51828 true))

(declare-fun array_inv!12883 (array!35579) Bool)

(assert (=> start!51828 (array_inv!12883 a!3118)))

(declare-fun b!566825 () Bool)

(assert (=> b!566825 (= e!326203 e!326205)))

(declare-fun res!357595 () Bool)

(assert (=> b!566825 (=> (not res!357595) (not e!326205))))

(declare-datatypes ((SeekEntryResult!5536 0))(
  ( (MissingZero!5536 (index!24371 (_ BitVec 32))) (Found!5536 (index!24372 (_ BitVec 32))) (Intermediate!5536 (undefined!6348 Bool) (index!24373 (_ BitVec 32)) (x!53235 (_ BitVec 32))) (Undefined!5536) (MissingVacant!5536 (index!24374 (_ BitVec 32))) )
))
(declare-fun lt!258322 () SeekEntryResult!5536)

(assert (=> b!566825 (= res!357595 (or (= lt!258322 (MissingZero!5536 i!1132)) (= lt!258322 (MissingVacant!5536 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35579 (_ BitVec 32)) SeekEntryResult!5536)

(assert (=> b!566825 (= lt!258322 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!566826 () Bool)

(declare-fun res!357596 () Bool)

(assert (=> b!566826 (=> (not res!357596) (not e!326203))))

(assert (=> b!566826 (= res!357596 (validKeyInArray!0 (select (arr!17087 a!3118) j!142)))))

(declare-fun b!566827 () Bool)

(declare-fun e!326201 () Bool)

(declare-fun lt!258318 () SeekEntryResult!5536)

(assert (=> b!566827 (= e!326201 (not (or (not (is-Intermediate!5536 lt!258318)) (undefined!6348 lt!258318) (and (bvsge (index!24373 lt!258318) #b00000000000000000000000000000000) (bvslt (index!24373 lt!258318) (size!17451 a!3118))))))))

(declare-fun e!326204 () Bool)

(assert (=> b!566827 e!326204))

(declare-fun res!357599 () Bool)

(assert (=> b!566827 (=> (not res!357599) (not e!326204))))

(assert (=> b!566827 (= res!357599 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17774 0))(
  ( (Unit!17775) )
))
(declare-fun lt!258319 () Unit!17774)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35579 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17774)

(assert (=> b!566827 (= lt!258319 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!566828 () Bool)

(assert (=> b!566828 (= e!326205 e!326201)))

(declare-fun res!357591 () Bool)

(assert (=> b!566828 (=> (not res!357591) (not e!326201))))

(declare-fun lt!258320 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35579 (_ BitVec 32)) SeekEntryResult!5536)

(assert (=> b!566828 (= res!357591 (= lt!258318 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258320 (select (store (arr!17087 a!3118) i!1132 k!1914) j!142) (array!35580 (store (arr!17087 a!3118) i!1132 k!1914) (size!17451 a!3118)) mask!3119)))))

(declare-fun lt!258321 () (_ BitVec 32))

(assert (=> b!566828 (= lt!258318 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258321 (select (arr!17087 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!566828 (= lt!258320 (toIndex!0 (select (store (arr!17087 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!566828 (= lt!258321 (toIndex!0 (select (arr!17087 a!3118) j!142) mask!3119))))

(declare-fun b!566829 () Bool)

(assert (=> b!566829 (= e!326204 (= (seekEntryOrOpen!0 (select (arr!17087 a!3118) j!142) a!3118 mask!3119) (Found!5536 j!142)))))

(declare-fun b!566830 () Bool)

(declare-fun res!357590 () Bool)

(assert (=> b!566830 (=> (not res!357590) (not e!326205))))

(declare-datatypes ((List!11167 0))(
  ( (Nil!11164) (Cons!11163 (h!12172 (_ BitVec 64)) (t!17395 List!11167)) )
))
(declare-fun arrayNoDuplicates!0 (array!35579 (_ BitVec 32) List!11167) Bool)

(assert (=> b!566830 (= res!357590 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11164))))

(declare-fun b!566831 () Bool)

(declare-fun res!357594 () Bool)

(assert (=> b!566831 (=> (not res!357594) (not e!326203))))

(declare-fun arrayContainsKey!0 (array!35579 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!566831 (= res!357594 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!51828 res!357598) b!566822))

(assert (= (and b!566822 res!357597) b!566826))

(assert (= (and b!566826 res!357596) b!566824))

(assert (= (and b!566824 res!357592) b!566831))

(assert (= (and b!566831 res!357594) b!566825))

(assert (= (and b!566825 res!357595) b!566823))

(assert (= (and b!566823 res!357593) b!566830))

(assert (= (and b!566830 res!357590) b!566828))

(assert (= (and b!566828 res!357591) b!566827))

(assert (= (and b!566827 res!357599) b!566829))

(declare-fun m!545433 () Bool)

(assert (=> b!566824 m!545433))

(declare-fun m!545435 () Bool)

(assert (=> b!566826 m!545435))

(assert (=> b!566826 m!545435))

(declare-fun m!545437 () Bool)

(assert (=> b!566826 m!545437))

(declare-fun m!545439 () Bool)

(assert (=> b!566823 m!545439))

(declare-fun m!545441 () Bool)

(assert (=> b!566827 m!545441))

(declare-fun m!545443 () Bool)

(assert (=> b!566827 m!545443))

(declare-fun m!545445 () Bool)

(assert (=> b!566830 m!545445))

(assert (=> b!566828 m!545435))

(declare-fun m!545447 () Bool)

(assert (=> b!566828 m!545447))

(assert (=> b!566828 m!545435))

(declare-fun m!545449 () Bool)

(assert (=> b!566828 m!545449))

(declare-fun m!545451 () Bool)

(assert (=> b!566828 m!545451))

(assert (=> b!566828 m!545449))

(assert (=> b!566828 m!545435))

(declare-fun m!545453 () Bool)

(assert (=> b!566828 m!545453))

(declare-fun m!545455 () Bool)

(assert (=> b!566828 m!545455))

(assert (=> b!566828 m!545449))

(declare-fun m!545457 () Bool)

(assert (=> b!566828 m!545457))

(declare-fun m!545459 () Bool)

(assert (=> start!51828 m!545459))

(declare-fun m!545461 () Bool)

(assert (=> start!51828 m!545461))

(assert (=> b!566829 m!545435))

(assert (=> b!566829 m!545435))

(declare-fun m!545463 () Bool)

(assert (=> b!566829 m!545463))

(declare-fun m!545465 () Bool)

(assert (=> b!566825 m!545465))

(declare-fun m!545467 () Bool)

(assert (=> b!566831 m!545467))

(push 1)

(assert (not b!566825))

(assert (not start!51828))

(assert (not b!566830))

(assert (not b!566823))

(assert (not b!566831))

(assert (not b!566828))

(assert (not b!566827))

(assert (not b!566824))

(assert (not b!566826))

(assert (not b!566829))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun bm!32501 () Bool)

(declare-fun call!32504 () Bool)

(declare-fun c!64985 () Bool)

(assert (=> bm!32501 (= call!32504 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!64985 (Cons!11163 (select (arr!17087 a!3118) #b00000000000000000000000000000000) Nil!11164) Nil!11164)))))

(declare-fun d!84195 () Bool)

(declare-fun res!357612 () Bool)

(declare-fun e!326240 () Bool)

(assert (=> d!84195 (=> res!357612 e!326240)))

(assert (=> d!84195 (= res!357612 (bvsge #b00000000000000000000000000000000 (size!17451 a!3118)))))

(assert (=> d!84195 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11164) e!326240)))

(declare-fun b!566884 () Bool)

(declare-fun e!326238 () Bool)

(assert (=> b!566884 (= e!326238 call!32504)))

(declare-fun b!566885 () Bool)

(declare-fun e!326239 () Bool)

(assert (=> b!566885 (= e!326240 e!326239)))

(declare-fun res!357614 () Bool)

(assert (=> b!566885 (=> (not res!357614) (not e!326239))))

(declare-fun e!326241 () Bool)

(assert (=> b!566885 (= res!357614 (not e!326241))))

(declare-fun res!357613 () Bool)

(assert (=> b!566885 (=> (not res!357613) (not e!326241))))

(assert (=> b!566885 (= res!357613 (validKeyInArray!0 (select (arr!17087 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!566886 () Bool)

(assert (=> b!566886 (= e!326238 call!32504)))

(declare-fun b!566887 () Bool)

(declare-fun contains!2869 (List!11167 (_ BitVec 64)) Bool)

(assert (=> b!566887 (= e!326241 (contains!2869 Nil!11164 (select (arr!17087 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!566888 () Bool)

(assert (=> b!566888 (= e!326239 e!326238)))

(assert (=> b!566888 (= c!64985 (validKeyInArray!0 (select (arr!17087 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!84195 (not res!357612)) b!566885))

(assert (= (and b!566885 res!357613) b!566887))

(assert (= (and b!566885 res!357614) b!566888))

(assert (= (and b!566888 c!64985) b!566884))

(assert (= (and b!566888 (not c!64985)) b!566886))

(assert (= (or b!566884 b!566886) bm!32501))

(declare-fun m!545493 () Bool)

(assert (=> bm!32501 m!545493))

(declare-fun m!545495 () Bool)

(assert (=> bm!32501 m!545495))

(assert (=> b!566885 m!545493))

(assert (=> b!566885 m!545493))

(declare-fun m!545497 () Bool)

(assert (=> b!566885 m!545497))

(assert (=> b!566887 m!545493))

(assert (=> b!566887 m!545493))

(declare-fun m!545499 () Bool)

(assert (=> b!566887 m!545499))

(assert (=> b!566888 m!545493))

(assert (=> b!566888 m!545493))

(assert (=> b!566888 m!545497))

(assert (=> b!566830 d!84195))

(declare-fun b!566946 () Bool)

(declare-fun e!326283 () SeekEntryResult!5536)

(assert (=> b!566946 (= e!326283 Undefined!5536)))

(declare-fun b!566947 () Bool)

(declare-fun e!326282 () SeekEntryResult!5536)

(declare-fun lt!258373 () SeekEntryResult!5536)

(assert (=> b!566947 (= e!326282 (Found!5536 (index!24373 lt!258373)))))

(declare-fun b!566948 () Bool)

(declare-fun e!326281 () SeekEntryResult!5536)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35579 (_ BitVec 32)) SeekEntryResult!5536)

(assert (=> b!566948 (= e!326281 (seekKeyOrZeroReturnVacant!0 (x!53235 lt!258373) (index!24373 lt!258373) (index!24373 lt!258373) k!1914 a!3118 mask!3119))))

(declare-fun b!566949 () Bool)

(assert (=> b!566949 (= e!326281 (MissingZero!5536 (index!24373 lt!258373)))))

(declare-fun d!84201 () Bool)

(declare-fun lt!258372 () SeekEntryResult!5536)

(assert (=> d!84201 (and (or (is-Undefined!5536 lt!258372) (not (is-Found!5536 lt!258372)) (and (bvsge (index!24372 lt!258372) #b00000000000000000000000000000000) (bvslt (index!24372 lt!258372) (size!17451 a!3118)))) (or (is-Undefined!5536 lt!258372) (is-Found!5536 lt!258372) (not (is-MissingZero!5536 lt!258372)) (and (bvsge (index!24371 lt!258372) #b00000000000000000000000000000000) (bvslt (index!24371 lt!258372) (size!17451 a!3118)))) (or (is-Undefined!5536 lt!258372) (is-Found!5536 lt!258372) (is-MissingZero!5536 lt!258372) (not (is-MissingVacant!5536 lt!258372)) (and (bvsge (index!24374 lt!258372) #b00000000000000000000000000000000) (bvslt (index!24374 lt!258372) (size!17451 a!3118)))) (or (is-Undefined!5536 lt!258372) (ite (is-Found!5536 lt!258372) (= (select (arr!17087 a!3118) (index!24372 lt!258372)) k!1914) (ite (is-MissingZero!5536 lt!258372) (= (select (arr!17087 a!3118) (index!24371 lt!258372)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5536 lt!258372) (= (select (arr!17087 a!3118) (index!24374 lt!258372)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84201 (= lt!258372 e!326283)))

(declare-fun c!65006 () Bool)

(assert (=> d!84201 (= c!65006 (and (is-Intermediate!5536 lt!258373) (undefined!6348 lt!258373)))))

(assert (=> d!84201 (= lt!258373 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!84201 (validMask!0 mask!3119)))

(assert (=> d!84201 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!258372)))

(declare-fun b!566950 () Bool)

(assert (=> b!566950 (= e!326283 e!326282)))

(declare-fun lt!258371 () (_ BitVec 64))

(assert (=> b!566950 (= lt!258371 (select (arr!17087 a!3118) (index!24373 lt!258373)))))

(declare-fun c!65005 () Bool)

(assert (=> b!566950 (= c!65005 (= lt!258371 k!1914))))

(declare-fun b!566951 () Bool)

(declare-fun c!65004 () Bool)

(assert (=> b!566951 (= c!65004 (= lt!258371 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!566951 (= e!326282 e!326281)))

(assert (= (and d!84201 c!65006) b!566946))

(assert (= (and d!84201 (not c!65006)) b!566950))

(assert (= (and b!566950 c!65005) b!566947))

(assert (= (and b!566950 (not c!65005)) b!566951))

(assert (= (and b!566951 c!65004) b!566949))

(assert (= (and b!566951 (not c!65004)) b!566948))

(declare-fun m!545545 () Bool)

(assert (=> b!566948 m!545545))

(declare-fun m!545547 () Bool)

(assert (=> d!84201 m!545547))

(declare-fun m!545549 () Bool)

(assert (=> d!84201 m!545549))

(declare-fun m!545551 () Bool)

(assert (=> d!84201 m!545551))

(assert (=> d!84201 m!545459))

(declare-fun m!545553 () Bool)

(assert (=> d!84201 m!545553))

(assert (=> d!84201 m!545553))

(declare-fun m!545555 () Bool)

(assert (=> d!84201 m!545555))

(declare-fun m!545557 () Bool)

(assert (=> b!566950 m!545557))

(assert (=> b!566825 d!84201))

(declare-fun d!84221 () Bool)

(declare-fun res!357646 () Bool)

(declare-fun e!326294 () Bool)

(assert (=> d!84221 (=> res!357646 e!326294)))

(assert (=> d!84221 (= res!357646 (= (select (arr!17087 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!84221 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!326294)))

(declare-fun b!566962 () Bool)

(declare-fun e!326295 () Bool)

(assert (=> b!566962 (= e!326294 e!326295)))

(declare-fun res!357647 () Bool)

(assert (=> b!566962 (=> (not res!357647) (not e!326295))))

(assert (=> b!566962 (= res!357647 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17451 a!3118)))))

(declare-fun b!566963 () Bool)

(assert (=> b!566963 (= e!326295 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!84221 (not res!357646)) b!566962))

(assert (= (and b!566962 res!357647) b!566963))

(assert (=> d!84221 m!545493))

(declare-fun m!545561 () Bool)

(assert (=> b!566963 m!545561))

(assert (=> b!566831 d!84221))

(declare-fun d!84227 () Bool)

(assert (=> d!84227 (= (validKeyInArray!0 (select (arr!17087 a!3118) j!142)) (and (not (= (select (arr!17087 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17087 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!566826 d!84227))

(declare-fun d!84229 () Bool)

(assert (=> d!84229 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!51828 d!84229))

(declare-fun d!84231 () Bool)

(assert (=> d!84231 (= (array_inv!12883 a!3118) (bvsge (size!17451 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!51828 d!84231))

(declare-fun call!32513 () Bool)

(declare-fun bm!32510 () Bool)

(assert (=> bm!32510 (= call!32513 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!567035 () Bool)

(declare-fun e!326339 () Bool)

(declare-fun e!326338 () Bool)

(assert (=> b!567035 (= e!326339 e!326338)))

(declare-fun lt!258395 () (_ BitVec 64))

(assert (=> b!567035 (= lt!258395 (select (arr!17087 a!3118) j!142))))

(declare-fun lt!258396 () Unit!17774)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35579 (_ BitVec 64) (_ BitVec 32)) Unit!17774)

(assert (=> b!567035 (= lt!258396 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!258395 j!142))))

(assert (=> b!567035 (arrayContainsKey!0 a!3118 lt!258395 #b00000000000000000000000000000000)))

(declare-fun lt!258394 () Unit!17774)

(assert (=> b!567035 (= lt!258394 lt!258396)))

(declare-fun res!357675 () Bool)

(assert (=> b!567035 (= res!357675 (= (seekEntryOrOpen!0 (select (arr!17087 a!3118) j!142) a!3118 mask!3119) (Found!5536 j!142)))))

(assert (=> b!567035 (=> (not res!357675) (not e!326338))))

(declare-fun b!567036 () Bool)

(assert (=> b!567036 (= e!326339 call!32513)))

(declare-fun b!567037 () Bool)

(declare-fun e!326337 () Bool)

(assert (=> b!567037 (= e!326337 e!326339)))

(declare-fun c!65030 () Bool)

(assert (=> b!567037 (= c!65030 (validKeyInArray!0 (select (arr!17087 a!3118) j!142)))))

(declare-fun d!84233 () Bool)

(declare-fun res!357674 () Bool)

(assert (=> d!84233 (=> res!357674 e!326337)))

(assert (=> d!84233 (= res!357674 (bvsge j!142 (size!17451 a!3118)))))

(assert (=> d!84233 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!326337)))

(declare-fun b!567038 () Bool)

(assert (=> b!567038 (= e!326338 call!32513)))

(assert (= (and d!84233 (not res!357674)) b!567037))

(assert (= (and b!567037 c!65030) b!567035))

(assert (= (and b!567037 (not c!65030)) b!567036))

(assert (= (and b!567035 res!357675) b!567038))

(assert (= (or b!567038 b!567036) bm!32510))

(declare-fun m!545585 () Bool)

(assert (=> bm!32510 m!545585))

(assert (=> b!567035 m!545435))

(declare-fun m!545589 () Bool)

(assert (=> b!567035 m!545589))

(declare-fun m!545591 () Bool)

(assert (=> b!567035 m!545591))

(assert (=> b!567035 m!545435))

(assert (=> b!567035 m!545463))

(assert (=> b!567037 m!545435))

(assert (=> b!567037 m!545435))

(assert (=> b!567037 m!545437))

(assert (=> b!566827 d!84233))

(declare-fun d!84241 () Bool)

(assert (=> d!84241 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!258412 () Unit!17774)

(declare-fun choose!38 (array!35579 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17774)

(assert (=> d!84241 (= lt!258412 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!84241 (validMask!0 mask!3119)))

(assert (=> d!84241 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!258412)))

(declare-fun bs!17603 () Bool)

(assert (= bs!17603 d!84241))

(assert (=> bs!17603 m!545441))

(declare-fun m!545607 () Bool)

(assert (=> bs!17603 m!545607))

(assert (=> bs!17603 m!545459))

(assert (=> b!566827 d!84241))

(declare-fun lt!258435 () SeekEntryResult!5536)

(declare-fun b!567095 () Bool)

(assert (=> b!567095 (and (bvsge (index!24373 lt!258435) #b00000000000000000000000000000000) (bvslt (index!24373 lt!258435) (size!17451 (array!35580 (store (arr!17087 a!3118) i!1132 k!1914) (size!17451 a!3118)))))))

(declare-fun res!357701 () Bool)

(assert (=> b!567095 (= res!357701 (= (select (arr!17087 (array!35580 (store (arr!17087 a!3118) i!1132 k!1914) (size!17451 a!3118))) (index!24373 lt!258435)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!326377 () Bool)

(assert (=> b!567095 (=> res!357701 e!326377)))

(declare-fun b!567096 () Bool)

(declare-fun e!326379 () SeekEntryResult!5536)

(declare-fun e!326378 () SeekEntryResult!5536)

(assert (=> b!567096 (= e!326379 e!326378)))

(declare-fun c!65050 () Bool)

(declare-fun lt!258434 () (_ BitVec 64))

(assert (=> b!567096 (= c!65050 (or (= lt!258434 (select (store (arr!17087 a!3118) i!1132 k!1914) j!142)) (= (bvadd lt!258434 lt!258434) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!567097 () Bool)

(declare-fun e!326380 () Bool)

(assert (=> b!567097 (= e!326380 (bvsge (x!53235 lt!258435) #b01111111111111111111111111111110))))

(declare-fun b!567098 () Bool)

(assert (=> b!567098 (and (bvsge (index!24373 lt!258435) #b00000000000000000000000000000000) (bvslt (index!24373 lt!258435) (size!17451 (array!35580 (store (arr!17087 a!3118) i!1132 k!1914) (size!17451 a!3118)))))))

(assert (=> b!567098 (= e!326377 (= (select (arr!17087 (array!35580 (store (arr!17087 a!3118) i!1132 k!1914) (size!17451 a!3118))) (index!24373 lt!258435)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!567099 () Bool)

(assert (=> b!567099 (= e!326378 (Intermediate!5536 false lt!258320 #b00000000000000000000000000000000))))

(declare-fun b!567100 () Bool)

(declare-fun e!326376 () Bool)

(assert (=> b!567100 (= e!326380 e!326376)))

(declare-fun res!357699 () Bool)

(assert (=> b!567100 (= res!357699 (and (is-Intermediate!5536 lt!258435) (not (undefined!6348 lt!258435)) (bvslt (x!53235 lt!258435) #b01111111111111111111111111111110) (bvsge (x!53235 lt!258435) #b00000000000000000000000000000000) (bvsge (x!53235 lt!258435) #b00000000000000000000000000000000)))))

(assert (=> b!567100 (=> (not res!357699) (not e!326376))))

(declare-fun d!84251 () Bool)

(assert (=> d!84251 e!326380))

(declare-fun c!65049 () Bool)

(assert (=> d!84251 (= c!65049 (and (is-Intermediate!5536 lt!258435) (undefined!6348 lt!258435)))))

(assert (=> d!84251 (= lt!258435 e!326379)))

(declare-fun c!65048 () Bool)

(assert (=> d!84251 (= c!65048 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84251 (= lt!258434 (select (arr!17087 (array!35580 (store (arr!17087 a!3118) i!1132 k!1914) (size!17451 a!3118))) lt!258320))))

(assert (=> d!84251 (validMask!0 mask!3119)))

(assert (=> d!84251 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258320 (select (store (arr!17087 a!3118) i!1132 k!1914) j!142) (array!35580 (store (arr!17087 a!3118) i!1132 k!1914) (size!17451 a!3118)) mask!3119) lt!258435)))

(declare-fun b!567101 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!567101 (= e!326378 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!258320 #b00000000000000000000000000000000 mask!3119) (select (store (arr!17087 a!3118) i!1132 k!1914) j!142) (array!35580 (store (arr!17087 a!3118) i!1132 k!1914) (size!17451 a!3118)) mask!3119))))

(declare-fun b!567102 () Bool)

(assert (=> b!567102 (= e!326379 (Intermediate!5536 true lt!258320 #b00000000000000000000000000000000))))

(declare-fun b!567103 () Bool)

(assert (=> b!567103 (and (bvsge (index!24373 lt!258435) #b00000000000000000000000000000000) (bvslt (index!24373 lt!258435) (size!17451 (array!35580 (store (arr!17087 a!3118) i!1132 k!1914) (size!17451 a!3118)))))))

(declare-fun res!357700 () Bool)

(assert (=> b!567103 (= res!357700 (= (select (arr!17087 (array!35580 (store (arr!17087 a!3118) i!1132 k!1914) (size!17451 a!3118))) (index!24373 lt!258435)) (select (store (arr!17087 a!3118) i!1132 k!1914) j!142)))))

(assert (=> b!567103 (=> res!357700 e!326377)))

(assert (=> b!567103 (= e!326376 e!326377)))

(assert (= (and d!84251 c!65048) b!567102))

(assert (= (and d!84251 (not c!65048)) b!567096))

(assert (= (and b!567096 c!65050) b!567099))

(assert (= (and b!567096 (not c!65050)) b!567101))

(assert (= (and d!84251 c!65049) b!567097))

(assert (= (and d!84251 (not c!65049)) b!567100))

(assert (= (and b!567100 res!357699) b!567103))

(assert (= (and b!567103 (not res!357700)) b!567095))

(assert (= (and b!567095 (not res!357701)) b!567098))

(declare-fun m!545637 () Bool)

(assert (=> d!84251 m!545637))

(assert (=> d!84251 m!545459))

(declare-fun m!545639 () Bool)

(assert (=> b!567095 m!545639))

(assert (=> b!567103 m!545639))

(declare-fun m!545641 () Bool)

(assert (=> b!567101 m!545641))

(assert (=> b!567101 m!545641))

(assert (=> b!567101 m!545449))

(declare-fun m!545643 () Bool)

(assert (=> b!567101 m!545643))

(assert (=> b!567098 m!545639))

(assert (=> b!566828 d!84251))

(declare-fun b!567104 () Bool)

(declare-fun lt!258437 () SeekEntryResult!5536)

(assert (=> b!567104 (and (bvsge (index!24373 lt!258437) #b00000000000000000000000000000000) (bvslt (index!24373 lt!258437) (size!17451 a!3118)))))

(declare-fun res!357704 () Bool)

(assert (=> b!567104 (= res!357704 (= (select (arr!17087 a!3118) (index!24373 lt!258437)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!326382 () Bool)

(assert (=> b!567104 (=> res!357704 e!326382)))

(declare-fun b!567105 () Bool)

(declare-fun e!326384 () SeekEntryResult!5536)

(declare-fun e!326383 () SeekEntryResult!5536)

(assert (=> b!567105 (= e!326384 e!326383)))

(declare-fun lt!258436 () (_ BitVec 64))

(declare-fun c!65053 () Bool)

(assert (=> b!567105 (= c!65053 (or (= lt!258436 (select (arr!17087 a!3118) j!142)) (= (bvadd lt!258436 lt!258436) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!567106 () Bool)

(declare-fun e!326385 () Bool)

(assert (=> b!567106 (= e!326385 (bvsge (x!53235 lt!258437) #b01111111111111111111111111111110))))

(declare-fun b!567107 () Bool)

(assert (=> b!567107 (and (bvsge (index!24373 lt!258437) #b00000000000000000000000000000000) (bvslt (index!24373 lt!258437) (size!17451 a!3118)))))

(assert (=> b!567107 (= e!326382 (= (select (arr!17087 a!3118) (index!24373 lt!258437)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!567108 () Bool)

(assert (=> b!567108 (= e!326383 (Intermediate!5536 false lt!258321 #b00000000000000000000000000000000))))

(declare-fun b!567109 () Bool)

(declare-fun e!326381 () Bool)

(assert (=> b!567109 (= e!326385 e!326381)))

(declare-fun res!357702 () Bool)

(assert (=> b!567109 (= res!357702 (and (is-Intermediate!5536 lt!258437) (not (undefined!6348 lt!258437)) (bvslt (x!53235 lt!258437) #b01111111111111111111111111111110) (bvsge (x!53235 lt!258437) #b00000000000000000000000000000000) (bvsge (x!53235 lt!258437) #b00000000000000000000000000000000)))))

(assert (=> b!567109 (=> (not res!357702) (not e!326381))))

(declare-fun d!84267 () Bool)

(assert (=> d!84267 e!326385))

(declare-fun c!65052 () Bool)

(assert (=> d!84267 (= c!65052 (and (is-Intermediate!5536 lt!258437) (undefined!6348 lt!258437)))))

(assert (=> d!84267 (= lt!258437 e!326384)))

(declare-fun c!65051 () Bool)

(assert (=> d!84267 (= c!65051 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84267 (= lt!258436 (select (arr!17087 a!3118) lt!258321))))

(assert (=> d!84267 (validMask!0 mask!3119)))

(assert (=> d!84267 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258321 (select (arr!17087 a!3118) j!142) a!3118 mask!3119) lt!258437)))

(declare-fun b!567110 () Bool)

(assert (=> b!567110 (= e!326383 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!258321 #b00000000000000000000000000000000 mask!3119) (select (arr!17087 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!567111 () Bool)

(assert (=> b!567111 (= e!326384 (Intermediate!5536 true lt!258321 #b00000000000000000000000000000000))))

(declare-fun b!567112 () Bool)

(assert (=> b!567112 (and (bvsge (index!24373 lt!258437) #b00000000000000000000000000000000) (bvslt (index!24373 lt!258437) (size!17451 a!3118)))))

(declare-fun res!357703 () Bool)

(assert (=> b!567112 (= res!357703 (= (select (arr!17087 a!3118) (index!24373 lt!258437)) (select (arr!17087 a!3118) j!142)))))

(assert (=> b!567112 (=> res!357703 e!326382)))

(assert (=> b!567112 (= e!326381 e!326382)))

(assert (= (and d!84267 c!65051) b!567111))

(assert (= (and d!84267 (not c!65051)) b!567105))

(assert (= (and b!567105 c!65053) b!567108))

(assert (= (and b!567105 (not c!65053)) b!567110))

(assert (= (and d!84267 c!65052) b!567106))

(assert (= (and d!84267 (not c!65052)) b!567109))

(assert (= (and b!567109 res!357702) b!567112))

(assert (= (and b!567112 (not res!357703)) b!567104))

(assert (= (and b!567104 (not res!357704)) b!567107))

(declare-fun m!545645 () Bool)

(assert (=> d!84267 m!545645))

(assert (=> d!84267 m!545459))

(declare-fun m!545647 () Bool)

(assert (=> b!567104 m!545647))

(assert (=> b!567112 m!545647))

(declare-fun m!545649 () Bool)

(assert (=> b!567110 m!545649))

(assert (=> b!567110 m!545649))

(assert (=> b!567110 m!545435))

(declare-fun m!545651 () Bool)

(assert (=> b!567110 m!545651))

(assert (=> b!567107 m!545647))

(assert (=> b!566828 d!84267))

(declare-fun d!84269 () Bool)

(declare-fun lt!258443 () (_ BitVec 32))

(declare-fun lt!258442 () (_ BitVec 32))

(assert (=> d!84269 (= lt!258443 (bvmul (bvxor lt!258442 (bvlshr lt!258442 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84269 (= lt!258442 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17087 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!17087 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84269 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!357705 (let ((h!12175 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17087 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!17087 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53241 (bvmul (bvxor h!12175 (bvlshr h!12175 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53241 (bvlshr x!53241 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!357705 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!357705 #b00000000000000000000000000000000))))))

(assert (=> d!84269 (= (toIndex!0 (select (store (arr!17087 a!3118) i!1132 k!1914) j!142) mask!3119) (bvand (bvxor lt!258443 (bvlshr lt!258443 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!566828 d!84269))

(declare-fun d!84271 () Bool)

(declare-fun lt!258445 () (_ BitVec 32))

(declare-fun lt!258444 () (_ BitVec 32))

(assert (=> d!84271 (= lt!258445 (bvmul (bvxor lt!258444 (bvlshr lt!258444 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84271 (= lt!258444 ((_ extract 31 0) (bvand (bvxor (select (arr!17087 a!3118) j!142) (bvlshr (select (arr!17087 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84271 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!357705 (let ((h!12175 ((_ extract 31 0) (bvand (bvxor (select (arr!17087 a!3118) j!142) (bvlshr (select (arr!17087 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53241 (bvmul (bvxor h!12175 (bvlshr h!12175 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53241 (bvlshr x!53241 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!357705 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!357705 #b00000000000000000000000000000000))))))

(assert (=> d!84271 (= (toIndex!0 (select (arr!17087 a!3118) j!142) mask!3119) (bvand (bvxor lt!258445 (bvlshr lt!258445 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!566828 d!84271))

(declare-fun bm!32516 () Bool)

(declare-fun call!32519 () Bool)

(assert (=> bm!32516 (= call!32519 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!567113 () Bool)

(declare-fun e!326388 () Bool)

(declare-fun e!326387 () Bool)

(assert (=> b!567113 (= e!326388 e!326387)))

(declare-fun lt!258447 () (_ BitVec 64))

(assert (=> b!567113 (= lt!258447 (select (arr!17087 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!258448 () Unit!17774)

(assert (=> b!567113 (= lt!258448 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!258447 #b00000000000000000000000000000000))))

(assert (=> b!567113 (arrayContainsKey!0 a!3118 lt!258447 #b00000000000000000000000000000000)))

(declare-fun lt!258446 () Unit!17774)

(assert (=> b!567113 (= lt!258446 lt!258448)))

(declare-fun res!357707 () Bool)

(assert (=> b!567113 (= res!357707 (= (seekEntryOrOpen!0 (select (arr!17087 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5536 #b00000000000000000000000000000000)))))

(assert (=> b!567113 (=> (not res!357707) (not e!326387))))

(declare-fun b!567114 () Bool)

(assert (=> b!567114 (= e!326388 call!32519)))

(declare-fun b!567115 () Bool)

(declare-fun e!326386 () Bool)

(assert (=> b!567115 (= e!326386 e!326388)))

(declare-fun c!65054 () Bool)

(assert (=> b!567115 (= c!65054 (validKeyInArray!0 (select (arr!17087 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!84273 () Bool)

(declare-fun res!357706 () Bool)

(assert (=> d!84273 (=> res!357706 e!326386)))

(assert (=> d!84273 (= res!357706 (bvsge #b00000000000000000000000000000000 (size!17451 a!3118)))))

(assert (=> d!84273 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!326386)))

(declare-fun b!567116 () Bool)

(assert (=> b!567116 (= e!326387 call!32519)))

(assert (= (and d!84273 (not res!357706)) b!567115))

(assert (= (and b!567115 c!65054) b!567113))

(assert (= (and b!567115 (not c!65054)) b!567114))

(assert (= (and b!567113 res!357707) b!567116))

(assert (= (or b!567116 b!567114) bm!32516))

(declare-fun m!545653 () Bool)

(assert (=> bm!32516 m!545653))

(assert (=> b!567113 m!545493))

(declare-fun m!545655 () Bool)

(assert (=> b!567113 m!545655))

(declare-fun m!545657 () Bool)

(assert (=> b!567113 m!545657))

(assert (=> b!567113 m!545493))

(declare-fun m!545659 () Bool)

(assert (=> b!567113 m!545659))

(assert (=> b!567115 m!545493))

(assert (=> b!567115 m!545493))

(assert (=> b!567115 m!545497))

(assert (=> b!566823 d!84273))

(declare-fun b!567117 () Bool)

(declare-fun e!326391 () SeekEntryResult!5536)

(assert (=> b!567117 (= e!326391 Undefined!5536)))

(declare-fun b!567118 () Bool)

(declare-fun e!326390 () SeekEntryResult!5536)

(declare-fun lt!258451 () SeekEntryResult!5536)

(assert (=> b!567118 (= e!326390 (Found!5536 (index!24373 lt!258451)))))

(declare-fun e!326389 () SeekEntryResult!5536)

(declare-fun b!567119 () Bool)

(assert (=> b!567119 (= e!326389 (seekKeyOrZeroReturnVacant!0 (x!53235 lt!258451) (index!24373 lt!258451) (index!24373 lt!258451) (select (arr!17087 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!567120 () Bool)

(assert (=> b!567120 (= e!326389 (MissingZero!5536 (index!24373 lt!258451)))))

(declare-fun d!84275 () Bool)

(declare-fun lt!258450 () SeekEntryResult!5536)

(assert (=> d!84275 (and (or (is-Undefined!5536 lt!258450) (not (is-Found!5536 lt!258450)) (and (bvsge (index!24372 lt!258450) #b00000000000000000000000000000000) (bvslt (index!24372 lt!258450) (size!17451 a!3118)))) (or (is-Undefined!5536 lt!258450) (is-Found!5536 lt!258450) (not (is-MissingZero!5536 lt!258450)) (and (bvsge (index!24371 lt!258450) #b00000000000000000000000000000000) (bvslt (index!24371 lt!258450) (size!17451 a!3118)))) (or (is-Undefined!5536 lt!258450) (is-Found!5536 lt!258450) (is-MissingZero!5536 lt!258450) (not (is-MissingVacant!5536 lt!258450)) (and (bvsge (index!24374 lt!258450) #b00000000000000000000000000000000) (bvslt (index!24374 lt!258450) (size!17451 a!3118)))) (or (is-Undefined!5536 lt!258450) (ite (is-Found!5536 lt!258450) (= (select (arr!17087 a!3118) (index!24372 lt!258450)) (select (arr!17087 a!3118) j!142)) (ite (is-MissingZero!5536 lt!258450) (= (select (arr!17087 a!3118) (index!24371 lt!258450)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5536 lt!258450) (= (select (arr!17087 a!3118) (index!24374 lt!258450)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84275 (= lt!258450 e!326391)))

(declare-fun c!65057 () Bool)

(assert (=> d!84275 (= c!65057 (and (is-Intermediate!5536 lt!258451) (undefined!6348 lt!258451)))))

(assert (=> d!84275 (= lt!258451 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17087 a!3118) j!142) mask!3119) (select (arr!17087 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!84275 (validMask!0 mask!3119)))

(assert (=> d!84275 (= (seekEntryOrOpen!0 (select (arr!17087 a!3118) j!142) a!3118 mask!3119) lt!258450)))

(declare-fun b!567121 () Bool)

(assert (=> b!567121 (= e!326391 e!326390)))

(declare-fun lt!258449 () (_ BitVec 64))

(assert (=> b!567121 (= lt!258449 (select (arr!17087 a!3118) (index!24373 lt!258451)))))

(declare-fun c!65056 () Bool)

(assert (=> b!567121 (= c!65056 (= lt!258449 (select (arr!17087 a!3118) j!142)))))

(declare-fun b!567122 () Bool)

(declare-fun c!65055 () Bool)

(assert (=> b!567122 (= c!65055 (= lt!258449 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!567122 (= e!326390 e!326389)))

(assert (= (and d!84275 c!65057) b!567117))

(assert (= (and d!84275 (not c!65057)) b!567121))

(assert (= (and b!567121 c!65056) b!567118))

(assert (= (and b!567121 (not c!65056)) b!567122))

(assert (= (and b!567122 c!65055) b!567120))

(assert (= (and b!567122 (not c!65055)) b!567119))

(assert (=> b!567119 m!545435))

(declare-fun m!545661 () Bool)

(assert (=> b!567119 m!545661))

(declare-fun m!545663 () Bool)

(assert (=> d!84275 m!545663))

(declare-fun m!545665 () Bool)

(assert (=> d!84275 m!545665))

(declare-fun m!545667 () Bool)

(assert (=> d!84275 m!545667))

(assert (=> d!84275 m!545459))

(assert (=> d!84275 m!545435))

(assert (=> d!84275 m!545447))

(assert (=> d!84275 m!545447))

(assert (=> d!84275 m!545435))

(declare-fun m!545669 () Bool)

(assert (=> d!84275 m!545669))

(declare-fun m!545671 () Bool)

(assert (=> b!567121 m!545671))

(assert (=> b!566829 d!84275))

(declare-fun d!84277 () Bool)

(assert (=> d!84277 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!566824 d!84277))

(push 1)

