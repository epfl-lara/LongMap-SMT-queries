; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47286 () Bool)

(assert start!47286)

(declare-fun b!520014 () Bool)

(declare-datatypes ((array!33185 0))(
  ( (array!33186 (arr!15950 (Array (_ BitVec 32) (_ BitVec 64))) (size!16315 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33185)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!303420 () Bool)

(declare-datatypes ((SeekEntryResult!4414 0))(
  ( (MissingZero!4414 (index!19856 (_ BitVec 32))) (Found!4414 (index!19857 (_ BitVec 32))) (Intermediate!4414 (undefined!5226 Bool) (index!19858 (_ BitVec 32)) (x!48850 (_ BitVec 32))) (Undefined!4414) (MissingVacant!4414 (index!19859 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33185 (_ BitVec 32)) SeekEntryResult!4414)

(assert (=> b!520014 (= e!303420 (= (seekEntryOrOpen!0 (select (arr!15950 a!3235) j!176) a!3235 mask!3524) (Found!4414 j!176)))))

(declare-fun b!520015 () Bool)

(declare-fun res!318273 () Bool)

(declare-fun e!303418 () Bool)

(assert (=> b!520015 (=> (not res!318273) (not e!303418))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!520015 (= res!318273 (and (= (size!16315 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16315 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16315 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!520016 () Bool)

(declare-fun e!303419 () Bool)

(assert (=> b!520016 (= e!303418 e!303419)))

(declare-fun res!318277 () Bool)

(assert (=> b!520016 (=> (not res!318277) (not e!303419))))

(declare-fun lt!238057 () SeekEntryResult!4414)

(assert (=> b!520016 (= res!318277 (or (= lt!238057 (MissingZero!4414 i!1204)) (= lt!238057 (MissingVacant!4414 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!520016 (= lt!238057 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!520017 () Bool)

(declare-fun e!303422 () Bool)

(assert (=> b!520017 (= e!303422 false)))

(declare-fun b!520018 () Bool)

(declare-fun res!318278 () Bool)

(assert (=> b!520018 (=> (not res!318278) (not e!303418))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!520018 (= res!318278 (validKeyInArray!0 (select (arr!15950 a!3235) j!176)))))

(declare-fun b!520019 () Bool)

(declare-fun e!303423 () Bool)

(declare-fun lt!238052 () SeekEntryResult!4414)

(assert (=> b!520019 (= e!303423 (and (bvsge (index!19858 lt!238052) #b00000000000000000000000000000000) (bvslt (index!19858 lt!238052) (size!16315 a!3235))))))

(assert (=> b!520019 (and (or (= (select (arr!15950 a!3235) (index!19858 lt!238052)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15950 a!3235) (index!19858 lt!238052)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15950 a!3235) (index!19858 lt!238052)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!16102 0))(
  ( (Unit!16103) )
))
(declare-fun lt!238054 () Unit!16102)

(declare-fun e!303417 () Unit!16102)

(assert (=> b!520019 (= lt!238054 e!303417)))

(declare-fun c!61170 () Bool)

(assert (=> b!520019 (= c!61170 (= (select (arr!15950 a!3235) (index!19858 lt!238052)) (select (arr!15950 a!3235) j!176)))))

(assert (=> b!520019 (and (bvslt (x!48850 lt!238052) #b01111111111111111111111111111110) (or (= (select (arr!15950 a!3235) (index!19858 lt!238052)) (select (arr!15950 a!3235) j!176)) (= (select (arr!15950 a!3235) (index!19858 lt!238052)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15950 a!3235) (index!19858 lt!238052)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!520021 () Bool)

(declare-fun Unit!16104 () Unit!16102)

(assert (=> b!520021 (= e!303417 Unit!16104)))

(declare-fun lt!238053 () (_ BitVec 32))

(declare-fun lt!238051 () Unit!16102)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33185 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16102)

(assert (=> b!520021 (= lt!238051 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!238053 #b00000000000000000000000000000000 (index!19858 lt!238052) (x!48850 lt!238052) mask!3524))))

(declare-fun res!318283 () Bool)

(declare-fun lt!238050 () (_ BitVec 64))

(declare-fun lt!238055 () array!33185)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33185 (_ BitVec 32)) SeekEntryResult!4414)

(assert (=> b!520021 (= res!318283 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238053 lt!238050 lt!238055 mask!3524) (Intermediate!4414 false (index!19858 lt!238052) (x!48850 lt!238052))))))

(assert (=> b!520021 (=> (not res!318283) (not e!303422))))

(assert (=> b!520021 e!303422))

(declare-fun b!520022 () Bool)

(declare-fun res!318280 () Bool)

(assert (=> b!520022 (=> (not res!318280) (not e!303418))))

(assert (=> b!520022 (= res!318280 (validKeyInArray!0 k0!2280))))

(declare-fun b!520023 () Bool)

(declare-fun Unit!16105 () Unit!16102)

(assert (=> b!520023 (= e!303417 Unit!16105)))

(declare-fun b!520024 () Bool)

(declare-fun res!318275 () Bool)

(assert (=> b!520024 (=> res!318275 e!303423)))

(get-info :version)

(assert (=> b!520024 (= res!318275 (or (undefined!5226 lt!238052) (not ((_ is Intermediate!4414) lt!238052))))))

(declare-fun b!520025 () Bool)

(declare-fun res!318279 () Bool)

(assert (=> b!520025 (=> (not res!318279) (not e!303418))))

(declare-fun arrayContainsKey!0 (array!33185 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!520025 (= res!318279 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!520020 () Bool)

(declare-fun res!318282 () Bool)

(assert (=> b!520020 (=> (not res!318282) (not e!303419))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33185 (_ BitVec 32)) Bool)

(assert (=> b!520020 (= res!318282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!318274 () Bool)

(assert (=> start!47286 (=> (not res!318274) (not e!303418))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47286 (= res!318274 (validMask!0 mask!3524))))

(assert (=> start!47286 e!303418))

(assert (=> start!47286 true))

(declare-fun array_inv!11833 (array!33185) Bool)

(assert (=> start!47286 (array_inv!11833 a!3235)))

(declare-fun b!520026 () Bool)

(assert (=> b!520026 (= e!303419 (not e!303423))))

(declare-fun res!318281 () Bool)

(assert (=> b!520026 (=> res!318281 e!303423)))

(declare-fun lt!238049 () (_ BitVec 32))

(assert (=> b!520026 (= res!318281 (= lt!238052 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238049 lt!238050 lt!238055 mask!3524)))))

(assert (=> b!520026 (= lt!238052 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238053 (select (arr!15950 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!520026 (= lt!238049 (toIndex!0 lt!238050 mask!3524))))

(assert (=> b!520026 (= lt!238050 (select (store (arr!15950 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!520026 (= lt!238053 (toIndex!0 (select (arr!15950 a!3235) j!176) mask!3524))))

(assert (=> b!520026 (= lt!238055 (array!33186 (store (arr!15950 a!3235) i!1204 k0!2280) (size!16315 a!3235)))))

(assert (=> b!520026 e!303420))

(declare-fun res!318276 () Bool)

(assert (=> b!520026 (=> (not res!318276) (not e!303420))))

(assert (=> b!520026 (= res!318276 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!238056 () Unit!16102)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33185 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16102)

(assert (=> b!520026 (= lt!238056 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!520027 () Bool)

(declare-fun res!318284 () Bool)

(assert (=> b!520027 (=> (not res!318284) (not e!303419))))

(declare-datatypes ((List!10147 0))(
  ( (Nil!10144) (Cons!10143 (h!11062 (_ BitVec 64)) (t!16366 List!10147)) )
))
(declare-fun arrayNoDuplicates!0 (array!33185 (_ BitVec 32) List!10147) Bool)

(assert (=> b!520027 (= res!318284 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10144))))

(assert (= (and start!47286 res!318274) b!520015))

(assert (= (and b!520015 res!318273) b!520018))

(assert (= (and b!520018 res!318278) b!520022))

(assert (= (and b!520022 res!318280) b!520025))

(assert (= (and b!520025 res!318279) b!520016))

(assert (= (and b!520016 res!318277) b!520020))

(assert (= (and b!520020 res!318282) b!520027))

(assert (= (and b!520027 res!318284) b!520026))

(assert (= (and b!520026 res!318276) b!520014))

(assert (= (and b!520026 (not res!318281)) b!520024))

(assert (= (and b!520024 (not res!318275)) b!520019))

(assert (= (and b!520019 c!61170) b!520021))

(assert (= (and b!520019 (not c!61170)) b!520023))

(assert (= (and b!520021 res!318283) b!520017))

(declare-fun m!500539 () Bool)

(assert (=> b!520026 m!500539))

(declare-fun m!500541 () Bool)

(assert (=> b!520026 m!500541))

(declare-fun m!500543 () Bool)

(assert (=> b!520026 m!500543))

(declare-fun m!500545 () Bool)

(assert (=> b!520026 m!500545))

(declare-fun m!500547 () Bool)

(assert (=> b!520026 m!500547))

(assert (=> b!520026 m!500541))

(declare-fun m!500549 () Bool)

(assert (=> b!520026 m!500549))

(assert (=> b!520026 m!500541))

(declare-fun m!500551 () Bool)

(assert (=> b!520026 m!500551))

(declare-fun m!500553 () Bool)

(assert (=> b!520026 m!500553))

(declare-fun m!500555 () Bool)

(assert (=> b!520026 m!500555))

(assert (=> b!520018 m!500541))

(assert (=> b!520018 m!500541))

(declare-fun m!500557 () Bool)

(assert (=> b!520018 m!500557))

(declare-fun m!500559 () Bool)

(assert (=> b!520020 m!500559))

(declare-fun m!500561 () Bool)

(assert (=> b!520016 m!500561))

(declare-fun m!500563 () Bool)

(assert (=> b!520025 m!500563))

(declare-fun m!500565 () Bool)

(assert (=> b!520019 m!500565))

(assert (=> b!520019 m!500541))

(declare-fun m!500567 () Bool)

(assert (=> b!520022 m!500567))

(assert (=> b!520014 m!500541))

(assert (=> b!520014 m!500541))

(declare-fun m!500569 () Bool)

(assert (=> b!520014 m!500569))

(declare-fun m!500571 () Bool)

(assert (=> start!47286 m!500571))

(declare-fun m!500573 () Bool)

(assert (=> start!47286 m!500573))

(declare-fun m!500575 () Bool)

(assert (=> b!520021 m!500575))

(declare-fun m!500577 () Bool)

(assert (=> b!520021 m!500577))

(declare-fun m!500579 () Bool)

(assert (=> b!520027 m!500579))

(check-sat (not b!520018) (not b!520025) (not b!520014) (not b!520020) (not b!520026) (not start!47286) (not b!520021) (not b!520022) (not b!520027) (not b!520016))
(check-sat)
(get-model)

(declare-fun b!520130 () Bool)

(declare-fun e!303480 () Bool)

(declare-fun lt!238117 () SeekEntryResult!4414)

(assert (=> b!520130 (= e!303480 (bvsge (x!48850 lt!238117) #b01111111111111111111111111111110))))

(declare-fun b!520131 () Bool)

(assert (=> b!520131 (and (bvsge (index!19858 lt!238117) #b00000000000000000000000000000000) (bvslt (index!19858 lt!238117) (size!16315 a!3235)))))

(declare-fun res!318365 () Bool)

(assert (=> b!520131 (= res!318365 (= (select (arr!15950 a!3235) (index!19858 lt!238117)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!303478 () Bool)

(assert (=> b!520131 (=> res!318365 e!303478)))

(declare-fun b!520132 () Bool)

(declare-fun e!303476 () SeekEntryResult!4414)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!520132 (= e!303476 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!238053 #b00000000000000000000000000000000 mask!3524) (select (arr!15950 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!520133 () Bool)

(declare-fun e!303477 () SeekEntryResult!4414)

(assert (=> b!520133 (= e!303477 (Intermediate!4414 true lt!238053 #b00000000000000000000000000000000))))

(declare-fun b!520134 () Bool)

(declare-fun e!303479 () Bool)

(assert (=> b!520134 (= e!303480 e!303479)))

(declare-fun res!318364 () Bool)

(assert (=> b!520134 (= res!318364 (and ((_ is Intermediate!4414) lt!238117) (not (undefined!5226 lt!238117)) (bvslt (x!48850 lt!238117) #b01111111111111111111111111111110) (bvsge (x!48850 lt!238117) #b00000000000000000000000000000000) (bvsge (x!48850 lt!238117) #b00000000000000000000000000000000)))))

(assert (=> b!520134 (=> (not res!318364) (not e!303479))))

(declare-fun b!520135 () Bool)

(assert (=> b!520135 (= e!303477 e!303476)))

(declare-fun lt!238116 () (_ BitVec 64))

(declare-fun c!61183 () Bool)

(assert (=> b!520135 (= c!61183 (or (= lt!238116 (select (arr!15950 a!3235) j!176)) (= (bvadd lt!238116 lt!238116) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!80075 () Bool)

(assert (=> d!80075 e!303480))

(declare-fun c!61185 () Bool)

(assert (=> d!80075 (= c!61185 (and ((_ is Intermediate!4414) lt!238117) (undefined!5226 lt!238117)))))

(assert (=> d!80075 (= lt!238117 e!303477)))

(declare-fun c!61184 () Bool)

(assert (=> d!80075 (= c!61184 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80075 (= lt!238116 (select (arr!15950 a!3235) lt!238053))))

(assert (=> d!80075 (validMask!0 mask!3524)))

(assert (=> d!80075 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238053 (select (arr!15950 a!3235) j!176) a!3235 mask!3524) lt!238117)))

(declare-fun b!520136 () Bool)

(assert (=> b!520136 (and (bvsge (index!19858 lt!238117) #b00000000000000000000000000000000) (bvslt (index!19858 lt!238117) (size!16315 a!3235)))))

(declare-fun res!318363 () Bool)

(assert (=> b!520136 (= res!318363 (= (select (arr!15950 a!3235) (index!19858 lt!238117)) (select (arr!15950 a!3235) j!176)))))

(assert (=> b!520136 (=> res!318363 e!303478)))

(assert (=> b!520136 (= e!303479 e!303478)))

(declare-fun b!520137 () Bool)

(assert (=> b!520137 (= e!303476 (Intermediate!4414 false lt!238053 #b00000000000000000000000000000000))))

(declare-fun b!520138 () Bool)

(assert (=> b!520138 (and (bvsge (index!19858 lt!238117) #b00000000000000000000000000000000) (bvslt (index!19858 lt!238117) (size!16315 a!3235)))))

(assert (=> b!520138 (= e!303478 (= (select (arr!15950 a!3235) (index!19858 lt!238117)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!80075 c!61184) b!520133))

(assert (= (and d!80075 (not c!61184)) b!520135))

(assert (= (and b!520135 c!61183) b!520137))

(assert (= (and b!520135 (not c!61183)) b!520132))

(assert (= (and d!80075 c!61185) b!520130))

(assert (= (and d!80075 (not c!61185)) b!520134))

(assert (= (and b!520134 res!318364) b!520136))

(assert (= (and b!520136 (not res!318363)) b!520131))

(assert (= (and b!520131 (not res!318365)) b!520138))

(declare-fun m!500665 () Bool)

(assert (=> d!80075 m!500665))

(assert (=> d!80075 m!500571))

(declare-fun m!500667 () Bool)

(assert (=> b!520136 m!500667))

(assert (=> b!520138 m!500667))

(assert (=> b!520131 m!500667))

(declare-fun m!500669 () Bool)

(assert (=> b!520132 m!500669))

(assert (=> b!520132 m!500669))

(assert (=> b!520132 m!500541))

(declare-fun m!500671 () Bool)

(assert (=> b!520132 m!500671))

(assert (=> b!520026 d!80075))

(declare-fun d!80077 () Bool)

(declare-fun lt!238123 () (_ BitVec 32))

(declare-fun lt!238122 () (_ BitVec 32))

(assert (=> d!80077 (= lt!238123 (bvmul (bvxor lt!238122 (bvlshr lt!238122 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80077 (= lt!238122 ((_ extract 31 0) (bvand (bvxor (select (arr!15950 a!3235) j!176) (bvlshr (select (arr!15950 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80077 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!318366 (let ((h!11065 ((_ extract 31 0) (bvand (bvxor (select (arr!15950 a!3235) j!176) (bvlshr (select (arr!15950 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48854 (bvmul (bvxor h!11065 (bvlshr h!11065 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48854 (bvlshr x!48854 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!318366 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!318366 #b00000000000000000000000000000000))))))

(assert (=> d!80077 (= (toIndex!0 (select (arr!15950 a!3235) j!176) mask!3524) (bvand (bvxor lt!238123 (bvlshr lt!238123 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!520026 d!80077))

(declare-fun b!520155 () Bool)

(declare-fun e!303493 () Bool)

(declare-fun call!31767 () Bool)

(assert (=> b!520155 (= e!303493 call!31767)))

(declare-fun b!520156 () Bool)

(declare-fun e!303494 () Bool)

(assert (=> b!520156 (= e!303494 e!303493)))

(declare-fun lt!238138 () (_ BitVec 64))

(assert (=> b!520156 (= lt!238138 (select (arr!15950 a!3235) j!176))))

(declare-fun lt!238136 () Unit!16102)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33185 (_ BitVec 64) (_ BitVec 32)) Unit!16102)

(assert (=> b!520156 (= lt!238136 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!238138 j!176))))

(assert (=> b!520156 (arrayContainsKey!0 a!3235 lt!238138 #b00000000000000000000000000000000)))

(declare-fun lt!238137 () Unit!16102)

(assert (=> b!520156 (= lt!238137 lt!238136)))

(declare-fun res!318375 () Bool)

(assert (=> b!520156 (= res!318375 (= (seekEntryOrOpen!0 (select (arr!15950 a!3235) j!176) a!3235 mask!3524) (Found!4414 j!176)))))

(assert (=> b!520156 (=> (not res!318375) (not e!303493))))

(declare-fun bm!31762 () Bool)

(assert (=> bm!31762 (= call!31767 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!520157 () Bool)

(declare-fun e!303495 () Bool)

(assert (=> b!520157 (= e!303495 e!303494)))

(declare-fun c!61190 () Bool)

(assert (=> b!520157 (= c!61190 (validKeyInArray!0 (select (arr!15950 a!3235) j!176)))))

(declare-fun d!80079 () Bool)

(declare-fun res!318376 () Bool)

(assert (=> d!80079 (=> res!318376 e!303495)))

(assert (=> d!80079 (= res!318376 (bvsge j!176 (size!16315 a!3235)))))

(assert (=> d!80079 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!303495)))

(declare-fun b!520158 () Bool)

(assert (=> b!520158 (= e!303494 call!31767)))

(assert (= (and d!80079 (not res!318376)) b!520157))

(assert (= (and b!520157 c!61190) b!520156))

(assert (= (and b!520157 (not c!61190)) b!520158))

(assert (= (and b!520156 res!318375) b!520155))

(assert (= (or b!520155 b!520158) bm!31762))

(assert (=> b!520156 m!500541))

(declare-fun m!500673 () Bool)

(assert (=> b!520156 m!500673))

(declare-fun m!500675 () Bool)

(assert (=> b!520156 m!500675))

(assert (=> b!520156 m!500541))

(assert (=> b!520156 m!500569))

(declare-fun m!500677 () Bool)

(assert (=> bm!31762 m!500677))

(assert (=> b!520157 m!500541))

(assert (=> b!520157 m!500541))

(assert (=> b!520157 m!500557))

(assert (=> b!520026 d!80079))

(declare-fun d!80085 () Bool)

(assert (=> d!80085 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!238144 () Unit!16102)

(declare-fun choose!38 (array!33185 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16102)

(assert (=> d!80085 (= lt!238144 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!80085 (validMask!0 mask!3524)))

(assert (=> d!80085 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!238144)))

(declare-fun bs!16357 () Bool)

(assert (= bs!16357 d!80085))

(assert (=> bs!16357 m!500551))

(declare-fun m!500695 () Bool)

(assert (=> bs!16357 m!500695))

(assert (=> bs!16357 m!500571))

(assert (=> b!520026 d!80085))

(declare-fun b!520173 () Bool)

(declare-fun e!303513 () Bool)

(declare-fun lt!238146 () SeekEntryResult!4414)

(assert (=> b!520173 (= e!303513 (bvsge (x!48850 lt!238146) #b01111111111111111111111111111110))))

(declare-fun b!520174 () Bool)

(assert (=> b!520174 (and (bvsge (index!19858 lt!238146) #b00000000000000000000000000000000) (bvslt (index!19858 lt!238146) (size!16315 lt!238055)))))

(declare-fun res!318391 () Bool)

(assert (=> b!520174 (= res!318391 (= (select (arr!15950 lt!238055) (index!19858 lt!238146)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!303511 () Bool)

(assert (=> b!520174 (=> res!318391 e!303511)))

(declare-fun b!520175 () Bool)

(declare-fun e!303509 () SeekEntryResult!4414)

(assert (=> b!520175 (= e!303509 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!238049 #b00000000000000000000000000000000 mask!3524) lt!238050 lt!238055 mask!3524))))

(declare-fun b!520176 () Bool)

(declare-fun e!303510 () SeekEntryResult!4414)

(assert (=> b!520176 (= e!303510 (Intermediate!4414 true lt!238049 #b00000000000000000000000000000000))))

(declare-fun b!520177 () Bool)

(declare-fun e!303512 () Bool)

(assert (=> b!520177 (= e!303513 e!303512)))

(declare-fun res!318390 () Bool)

(assert (=> b!520177 (= res!318390 (and ((_ is Intermediate!4414) lt!238146) (not (undefined!5226 lt!238146)) (bvslt (x!48850 lt!238146) #b01111111111111111111111111111110) (bvsge (x!48850 lt!238146) #b00000000000000000000000000000000) (bvsge (x!48850 lt!238146) #b00000000000000000000000000000000)))))

(assert (=> b!520177 (=> (not res!318390) (not e!303512))))

(declare-fun b!520178 () Bool)

(assert (=> b!520178 (= e!303510 e!303509)))

(declare-fun c!61192 () Bool)

(declare-fun lt!238145 () (_ BitVec 64))

(assert (=> b!520178 (= c!61192 (or (= lt!238145 lt!238050) (= (bvadd lt!238145 lt!238145) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!80091 () Bool)

(assert (=> d!80091 e!303513))

(declare-fun c!61194 () Bool)

(assert (=> d!80091 (= c!61194 (and ((_ is Intermediate!4414) lt!238146) (undefined!5226 lt!238146)))))

(assert (=> d!80091 (= lt!238146 e!303510)))

(declare-fun c!61193 () Bool)

(assert (=> d!80091 (= c!61193 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80091 (= lt!238145 (select (arr!15950 lt!238055) lt!238049))))

(assert (=> d!80091 (validMask!0 mask!3524)))

(assert (=> d!80091 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238049 lt!238050 lt!238055 mask!3524) lt!238146)))

(declare-fun b!520179 () Bool)

(assert (=> b!520179 (and (bvsge (index!19858 lt!238146) #b00000000000000000000000000000000) (bvslt (index!19858 lt!238146) (size!16315 lt!238055)))))

(declare-fun res!318389 () Bool)

(assert (=> b!520179 (= res!318389 (= (select (arr!15950 lt!238055) (index!19858 lt!238146)) lt!238050))))

(assert (=> b!520179 (=> res!318389 e!303511)))

(assert (=> b!520179 (= e!303512 e!303511)))

(declare-fun b!520180 () Bool)

(assert (=> b!520180 (= e!303509 (Intermediate!4414 false lt!238049 #b00000000000000000000000000000000))))

(declare-fun b!520181 () Bool)

(assert (=> b!520181 (and (bvsge (index!19858 lt!238146) #b00000000000000000000000000000000) (bvslt (index!19858 lt!238146) (size!16315 lt!238055)))))

(assert (=> b!520181 (= e!303511 (= (select (arr!15950 lt!238055) (index!19858 lt!238146)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!80091 c!61193) b!520176))

(assert (= (and d!80091 (not c!61193)) b!520178))

(assert (= (and b!520178 c!61192) b!520180))

(assert (= (and b!520178 (not c!61192)) b!520175))

(assert (= (and d!80091 c!61194) b!520173))

(assert (= (and d!80091 (not c!61194)) b!520177))

(assert (= (and b!520177 res!318390) b!520179))

(assert (= (and b!520179 (not res!318389)) b!520174))

(assert (= (and b!520174 (not res!318391)) b!520181))

(declare-fun m!500699 () Bool)

(assert (=> d!80091 m!500699))

(assert (=> d!80091 m!500571))

(declare-fun m!500701 () Bool)

(assert (=> b!520179 m!500701))

(assert (=> b!520181 m!500701))

(assert (=> b!520174 m!500701))

(declare-fun m!500703 () Bool)

(assert (=> b!520175 m!500703))

(assert (=> b!520175 m!500703))

(declare-fun m!500705 () Bool)

(assert (=> b!520175 m!500705))

(assert (=> b!520026 d!80091))

(declare-fun d!80095 () Bool)

(declare-fun lt!238148 () (_ BitVec 32))

(declare-fun lt!238147 () (_ BitVec 32))

(assert (=> d!80095 (= lt!238148 (bvmul (bvxor lt!238147 (bvlshr lt!238147 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80095 (= lt!238147 ((_ extract 31 0) (bvand (bvxor lt!238050 (bvlshr lt!238050 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80095 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!318366 (let ((h!11065 ((_ extract 31 0) (bvand (bvxor lt!238050 (bvlshr lt!238050 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48854 (bvmul (bvxor h!11065 (bvlshr h!11065 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48854 (bvlshr x!48854 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!318366 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!318366 #b00000000000000000000000000000000))))))

(assert (=> d!80095 (= (toIndex!0 lt!238050 mask!3524) (bvand (bvxor lt!238148 (bvlshr lt!238148 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!520026 d!80095))

(declare-fun d!80097 () Bool)

(assert (=> d!80097 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!47286 d!80097))

(declare-fun d!80101 () Bool)

(assert (=> d!80101 (= (array_inv!11833 a!3235) (bvsge (size!16315 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!47286 d!80101))

(declare-fun d!80103 () Bool)

(declare-fun e!303542 () Bool)

(assert (=> d!80103 e!303542))

(declare-fun res!318402 () Bool)

(assert (=> d!80103 (=> (not res!318402) (not e!303542))))

(assert (=> d!80103 (= res!318402 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16315 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16315 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16315 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16315 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16315 a!3235))))))

(declare-fun lt!238175 () Unit!16102)

(declare-fun choose!47 (array!33185 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16102)

(assert (=> d!80103 (= lt!238175 (choose!47 a!3235 i!1204 k0!2280 j!176 lt!238053 #b00000000000000000000000000000000 (index!19858 lt!238052) (x!48850 lt!238052) mask!3524))))

(assert (=> d!80103 (validMask!0 mask!3524)))

(assert (=> d!80103 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!238053 #b00000000000000000000000000000000 (index!19858 lt!238052) (x!48850 lt!238052) mask!3524) lt!238175)))

(declare-fun b!520228 () Bool)

(assert (=> b!520228 (= e!303542 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238053 (select (store (arr!15950 a!3235) i!1204 k0!2280) j!176) (array!33186 (store (arr!15950 a!3235) i!1204 k0!2280) (size!16315 a!3235)) mask!3524) (Intermediate!4414 false (index!19858 lt!238052) (x!48850 lt!238052))))))

(assert (= (and d!80103 res!318402) b!520228))

(declare-fun m!500731 () Bool)

(assert (=> d!80103 m!500731))

(assert (=> d!80103 m!500571))

(assert (=> b!520228 m!500539))

(assert (=> b!520228 m!500547))

(assert (=> b!520228 m!500547))

(declare-fun m!500733 () Bool)

(assert (=> b!520228 m!500733))

(assert (=> b!520021 d!80103))

(declare-fun b!520229 () Bool)

(declare-fun e!303547 () Bool)

(declare-fun lt!238177 () SeekEntryResult!4414)

(assert (=> b!520229 (= e!303547 (bvsge (x!48850 lt!238177) #b01111111111111111111111111111110))))

(declare-fun b!520230 () Bool)

(assert (=> b!520230 (and (bvsge (index!19858 lt!238177) #b00000000000000000000000000000000) (bvslt (index!19858 lt!238177) (size!16315 lt!238055)))))

(declare-fun res!318405 () Bool)

(assert (=> b!520230 (= res!318405 (= (select (arr!15950 lt!238055) (index!19858 lt!238177)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!303545 () Bool)

(assert (=> b!520230 (=> res!318405 e!303545)))

(declare-fun b!520231 () Bool)

(declare-fun e!303543 () SeekEntryResult!4414)

(assert (=> b!520231 (= e!303543 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!238053 #b00000000000000000000000000000000 mask!3524) lt!238050 lt!238055 mask!3524))))

(declare-fun b!520232 () Bool)

(declare-fun e!303544 () SeekEntryResult!4414)

(assert (=> b!520232 (= e!303544 (Intermediate!4414 true lt!238053 #b00000000000000000000000000000000))))

(declare-fun b!520233 () Bool)

(declare-fun e!303546 () Bool)

(assert (=> b!520233 (= e!303547 e!303546)))

(declare-fun res!318404 () Bool)

(assert (=> b!520233 (= res!318404 (and ((_ is Intermediate!4414) lt!238177) (not (undefined!5226 lt!238177)) (bvslt (x!48850 lt!238177) #b01111111111111111111111111111110) (bvsge (x!48850 lt!238177) #b00000000000000000000000000000000) (bvsge (x!48850 lt!238177) #b00000000000000000000000000000000)))))

(assert (=> b!520233 (=> (not res!318404) (not e!303546))))

(declare-fun b!520234 () Bool)

(assert (=> b!520234 (= e!303544 e!303543)))

(declare-fun c!61213 () Bool)

(declare-fun lt!238176 () (_ BitVec 64))

(assert (=> b!520234 (= c!61213 (or (= lt!238176 lt!238050) (= (bvadd lt!238176 lt!238176) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!80107 () Bool)

(assert (=> d!80107 e!303547))

(declare-fun c!61215 () Bool)

(assert (=> d!80107 (= c!61215 (and ((_ is Intermediate!4414) lt!238177) (undefined!5226 lt!238177)))))

(assert (=> d!80107 (= lt!238177 e!303544)))

(declare-fun c!61214 () Bool)

(assert (=> d!80107 (= c!61214 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80107 (= lt!238176 (select (arr!15950 lt!238055) lt!238053))))

(assert (=> d!80107 (validMask!0 mask!3524)))

(assert (=> d!80107 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238053 lt!238050 lt!238055 mask!3524) lt!238177)))

(declare-fun b!520235 () Bool)

(assert (=> b!520235 (and (bvsge (index!19858 lt!238177) #b00000000000000000000000000000000) (bvslt (index!19858 lt!238177) (size!16315 lt!238055)))))

(declare-fun res!318403 () Bool)

(assert (=> b!520235 (= res!318403 (= (select (arr!15950 lt!238055) (index!19858 lt!238177)) lt!238050))))

(assert (=> b!520235 (=> res!318403 e!303545)))

(assert (=> b!520235 (= e!303546 e!303545)))

(declare-fun b!520236 () Bool)

(assert (=> b!520236 (= e!303543 (Intermediate!4414 false lt!238053 #b00000000000000000000000000000000))))

(declare-fun b!520237 () Bool)

(assert (=> b!520237 (and (bvsge (index!19858 lt!238177) #b00000000000000000000000000000000) (bvslt (index!19858 lt!238177) (size!16315 lt!238055)))))

(assert (=> b!520237 (= e!303545 (= (select (arr!15950 lt!238055) (index!19858 lt!238177)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!80107 c!61214) b!520232))

(assert (= (and d!80107 (not c!61214)) b!520234))

(assert (= (and b!520234 c!61213) b!520236))

(assert (= (and b!520234 (not c!61213)) b!520231))

(assert (= (and d!80107 c!61215) b!520229))

(assert (= (and d!80107 (not c!61215)) b!520233))

(assert (= (and b!520233 res!318404) b!520235))

(assert (= (and b!520235 (not res!318403)) b!520230))

(assert (= (and b!520230 (not res!318405)) b!520237))

(declare-fun m!500735 () Bool)

(assert (=> d!80107 m!500735))

(assert (=> d!80107 m!500571))

(declare-fun m!500737 () Bool)

(assert (=> b!520235 m!500737))

(assert (=> b!520237 m!500737))

(assert (=> b!520230 m!500737))

(assert (=> b!520231 m!500669))

(assert (=> b!520231 m!500669))

(declare-fun m!500739 () Bool)

(assert (=> b!520231 m!500739))

(assert (=> b!520021 d!80107))

(declare-fun b!520262 () Bool)

(declare-fun c!61225 () Bool)

(declare-fun lt!238193 () (_ BitVec 64))

(assert (=> b!520262 (= c!61225 (= lt!238193 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!303564 () SeekEntryResult!4414)

(declare-fun e!303563 () SeekEntryResult!4414)

(assert (=> b!520262 (= e!303564 e!303563)))

(declare-fun b!520263 () Bool)

(declare-fun e!303565 () SeekEntryResult!4414)

(assert (=> b!520263 (= e!303565 Undefined!4414)))

(declare-fun d!80109 () Bool)

(declare-fun lt!238195 () SeekEntryResult!4414)

(assert (=> d!80109 (and (or ((_ is Undefined!4414) lt!238195) (not ((_ is Found!4414) lt!238195)) (and (bvsge (index!19857 lt!238195) #b00000000000000000000000000000000) (bvslt (index!19857 lt!238195) (size!16315 a!3235)))) (or ((_ is Undefined!4414) lt!238195) ((_ is Found!4414) lt!238195) (not ((_ is MissingZero!4414) lt!238195)) (and (bvsge (index!19856 lt!238195) #b00000000000000000000000000000000) (bvslt (index!19856 lt!238195) (size!16315 a!3235)))) (or ((_ is Undefined!4414) lt!238195) ((_ is Found!4414) lt!238195) ((_ is MissingZero!4414) lt!238195) (not ((_ is MissingVacant!4414) lt!238195)) (and (bvsge (index!19859 lt!238195) #b00000000000000000000000000000000) (bvslt (index!19859 lt!238195) (size!16315 a!3235)))) (or ((_ is Undefined!4414) lt!238195) (ite ((_ is Found!4414) lt!238195) (= (select (arr!15950 a!3235) (index!19857 lt!238195)) k0!2280) (ite ((_ is MissingZero!4414) lt!238195) (= (select (arr!15950 a!3235) (index!19856 lt!238195)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4414) lt!238195) (= (select (arr!15950 a!3235) (index!19859 lt!238195)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80109 (= lt!238195 e!303565)))

(declare-fun c!61226 () Bool)

(declare-fun lt!238194 () SeekEntryResult!4414)

(assert (=> d!80109 (= c!61226 (and ((_ is Intermediate!4414) lt!238194) (undefined!5226 lt!238194)))))

(assert (=> d!80109 (= lt!238194 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!80109 (validMask!0 mask!3524)))

(assert (=> d!80109 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!238195)))

(declare-fun b!520264 () Bool)

(assert (=> b!520264 (= e!303563 (MissingZero!4414 (index!19858 lt!238194)))))

(declare-fun b!520265 () Bool)

(assert (=> b!520265 (= e!303565 e!303564)))

(assert (=> b!520265 (= lt!238193 (select (arr!15950 a!3235) (index!19858 lt!238194)))))

(declare-fun c!61227 () Bool)

(assert (=> b!520265 (= c!61227 (= lt!238193 k0!2280))))

(declare-fun b!520266 () Bool)

(assert (=> b!520266 (= e!303564 (Found!4414 (index!19858 lt!238194)))))

(declare-fun b!520267 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33185 (_ BitVec 32)) SeekEntryResult!4414)

(assert (=> b!520267 (= e!303563 (seekKeyOrZeroReturnVacant!0 (x!48850 lt!238194) (index!19858 lt!238194) (index!19858 lt!238194) k0!2280 a!3235 mask!3524))))

(assert (= (and d!80109 c!61226) b!520263))

(assert (= (and d!80109 (not c!61226)) b!520265))

(assert (= (and b!520265 c!61227) b!520266))

(assert (= (and b!520265 (not c!61227)) b!520262))

(assert (= (and b!520262 c!61225) b!520264))

(assert (= (and b!520262 (not c!61225)) b!520267))

(assert (=> d!80109 m!500571))

(declare-fun m!500763 () Bool)

(assert (=> d!80109 m!500763))

(declare-fun m!500765 () Bool)

(assert (=> d!80109 m!500765))

(assert (=> d!80109 m!500763))

(declare-fun m!500767 () Bool)

(assert (=> d!80109 m!500767))

(declare-fun m!500769 () Bool)

(assert (=> d!80109 m!500769))

(declare-fun m!500771 () Bool)

(assert (=> d!80109 m!500771))

(declare-fun m!500773 () Bool)

(assert (=> b!520265 m!500773))

(declare-fun m!500775 () Bool)

(assert (=> b!520267 m!500775))

(assert (=> b!520016 d!80109))

(declare-fun b!520268 () Bool)

(declare-fun c!61228 () Bool)

(declare-fun lt!238196 () (_ BitVec 64))

(assert (=> b!520268 (= c!61228 (= lt!238196 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!303567 () SeekEntryResult!4414)

(declare-fun e!303566 () SeekEntryResult!4414)

(assert (=> b!520268 (= e!303567 e!303566)))

(declare-fun b!520269 () Bool)

(declare-fun e!303568 () SeekEntryResult!4414)

(assert (=> b!520269 (= e!303568 Undefined!4414)))

(declare-fun d!80117 () Bool)

(declare-fun lt!238198 () SeekEntryResult!4414)

(assert (=> d!80117 (and (or ((_ is Undefined!4414) lt!238198) (not ((_ is Found!4414) lt!238198)) (and (bvsge (index!19857 lt!238198) #b00000000000000000000000000000000) (bvslt (index!19857 lt!238198) (size!16315 a!3235)))) (or ((_ is Undefined!4414) lt!238198) ((_ is Found!4414) lt!238198) (not ((_ is MissingZero!4414) lt!238198)) (and (bvsge (index!19856 lt!238198) #b00000000000000000000000000000000) (bvslt (index!19856 lt!238198) (size!16315 a!3235)))) (or ((_ is Undefined!4414) lt!238198) ((_ is Found!4414) lt!238198) ((_ is MissingZero!4414) lt!238198) (not ((_ is MissingVacant!4414) lt!238198)) (and (bvsge (index!19859 lt!238198) #b00000000000000000000000000000000) (bvslt (index!19859 lt!238198) (size!16315 a!3235)))) (or ((_ is Undefined!4414) lt!238198) (ite ((_ is Found!4414) lt!238198) (= (select (arr!15950 a!3235) (index!19857 lt!238198)) (select (arr!15950 a!3235) j!176)) (ite ((_ is MissingZero!4414) lt!238198) (= (select (arr!15950 a!3235) (index!19856 lt!238198)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4414) lt!238198) (= (select (arr!15950 a!3235) (index!19859 lt!238198)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80117 (= lt!238198 e!303568)))

(declare-fun c!61229 () Bool)

(declare-fun lt!238197 () SeekEntryResult!4414)

(assert (=> d!80117 (= c!61229 (and ((_ is Intermediate!4414) lt!238197) (undefined!5226 lt!238197)))))

(assert (=> d!80117 (= lt!238197 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15950 a!3235) j!176) mask!3524) (select (arr!15950 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!80117 (validMask!0 mask!3524)))

(assert (=> d!80117 (= (seekEntryOrOpen!0 (select (arr!15950 a!3235) j!176) a!3235 mask!3524) lt!238198)))

(declare-fun b!520270 () Bool)

(assert (=> b!520270 (= e!303566 (MissingZero!4414 (index!19858 lt!238197)))))

(declare-fun b!520271 () Bool)

(assert (=> b!520271 (= e!303568 e!303567)))

(assert (=> b!520271 (= lt!238196 (select (arr!15950 a!3235) (index!19858 lt!238197)))))

(declare-fun c!61230 () Bool)

(assert (=> b!520271 (= c!61230 (= lt!238196 (select (arr!15950 a!3235) j!176)))))

(declare-fun b!520272 () Bool)

(assert (=> b!520272 (= e!303567 (Found!4414 (index!19858 lt!238197)))))

(declare-fun b!520273 () Bool)

(assert (=> b!520273 (= e!303566 (seekKeyOrZeroReturnVacant!0 (x!48850 lt!238197) (index!19858 lt!238197) (index!19858 lt!238197) (select (arr!15950 a!3235) j!176) a!3235 mask!3524))))

(assert (= (and d!80117 c!61229) b!520269))

(assert (= (and d!80117 (not c!61229)) b!520271))

(assert (= (and b!520271 c!61230) b!520272))

(assert (= (and b!520271 (not c!61230)) b!520268))

(assert (= (and b!520268 c!61228) b!520270))

(assert (= (and b!520268 (not c!61228)) b!520273))

(assert (=> d!80117 m!500571))

(assert (=> d!80117 m!500549))

(assert (=> d!80117 m!500541))

(declare-fun m!500777 () Bool)

(assert (=> d!80117 m!500777))

(assert (=> d!80117 m!500541))

(assert (=> d!80117 m!500549))

(declare-fun m!500779 () Bool)

(assert (=> d!80117 m!500779))

(declare-fun m!500781 () Bool)

(assert (=> d!80117 m!500781))

(declare-fun m!500783 () Bool)

(assert (=> d!80117 m!500783))

(declare-fun m!500785 () Bool)

(assert (=> b!520271 m!500785))

(assert (=> b!520273 m!500541))

(declare-fun m!500787 () Bool)

(assert (=> b!520273 m!500787))

(assert (=> b!520014 d!80117))

(declare-fun d!80119 () Bool)

(declare-fun res!318422 () Bool)

(declare-fun e!303583 () Bool)

(assert (=> d!80119 (=> res!318422 e!303583)))

(assert (=> d!80119 (= res!318422 (= (select (arr!15950 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!80119 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!303583)))

(declare-fun b!520296 () Bool)

(declare-fun e!303584 () Bool)

(assert (=> b!520296 (= e!303583 e!303584)))

(declare-fun res!318423 () Bool)

(assert (=> b!520296 (=> (not res!318423) (not e!303584))))

(assert (=> b!520296 (= res!318423 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16315 a!3235)))))

(declare-fun b!520297 () Bool)

(assert (=> b!520297 (= e!303584 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!80119 (not res!318422)) b!520296))

(assert (= (and b!520296 res!318423) b!520297))

(declare-fun m!500789 () Bool)

(assert (=> d!80119 m!500789))

(declare-fun m!500791 () Bool)

(assert (=> b!520297 m!500791))

(assert (=> b!520025 d!80119))

(declare-fun b!520298 () Bool)

(declare-fun e!303585 () Bool)

(declare-fun call!31772 () Bool)

(assert (=> b!520298 (= e!303585 call!31772)))

(declare-fun b!520299 () Bool)

(declare-fun e!303586 () Bool)

(assert (=> b!520299 (= e!303586 e!303585)))

(declare-fun lt!238205 () (_ BitVec 64))

(assert (=> b!520299 (= lt!238205 (select (arr!15950 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!238203 () Unit!16102)

(assert (=> b!520299 (= lt!238203 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!238205 #b00000000000000000000000000000000))))

(assert (=> b!520299 (arrayContainsKey!0 a!3235 lt!238205 #b00000000000000000000000000000000)))

(declare-fun lt!238204 () Unit!16102)

(assert (=> b!520299 (= lt!238204 lt!238203)))

(declare-fun res!318424 () Bool)

(assert (=> b!520299 (= res!318424 (= (seekEntryOrOpen!0 (select (arr!15950 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4414 #b00000000000000000000000000000000)))))

(assert (=> b!520299 (=> (not res!318424) (not e!303585))))

(declare-fun bm!31769 () Bool)

(assert (=> bm!31769 (= call!31772 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!520300 () Bool)

(declare-fun e!303587 () Bool)

(assert (=> b!520300 (= e!303587 e!303586)))

(declare-fun c!61237 () Bool)

(assert (=> b!520300 (= c!61237 (validKeyInArray!0 (select (arr!15950 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!80121 () Bool)

(declare-fun res!318425 () Bool)

(assert (=> d!80121 (=> res!318425 e!303587)))

(assert (=> d!80121 (= res!318425 (bvsge #b00000000000000000000000000000000 (size!16315 a!3235)))))

(assert (=> d!80121 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!303587)))

(declare-fun b!520301 () Bool)

(assert (=> b!520301 (= e!303586 call!31772)))

(assert (= (and d!80121 (not res!318425)) b!520300))

(assert (= (and b!520300 c!61237) b!520299))

(assert (= (and b!520300 (not c!61237)) b!520301))

(assert (= (and b!520299 res!318424) b!520298))

(assert (= (or b!520298 b!520301) bm!31769))

(assert (=> b!520299 m!500789))

(declare-fun m!500793 () Bool)

(assert (=> b!520299 m!500793))

(declare-fun m!500795 () Bool)

(assert (=> b!520299 m!500795))

(assert (=> b!520299 m!500789))

(declare-fun m!500797 () Bool)

(assert (=> b!520299 m!500797))

(declare-fun m!500799 () Bool)

(assert (=> bm!31769 m!500799))

(assert (=> b!520300 m!500789))

(assert (=> b!520300 m!500789))

(declare-fun m!500801 () Bool)

(assert (=> b!520300 m!500801))

(assert (=> b!520020 d!80121))

(declare-fun d!80123 () Bool)

(assert (=> d!80123 (= (validKeyInArray!0 (select (arr!15950 a!3235) j!176)) (and (not (= (select (arr!15950 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15950 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!520018 d!80123))

(declare-fun b!520348 () Bool)

(declare-fun e!303616 () Bool)

(declare-fun e!303617 () Bool)

(assert (=> b!520348 (= e!303616 e!303617)))

(declare-fun res!318446 () Bool)

(assert (=> b!520348 (=> (not res!318446) (not e!303617))))

(declare-fun e!303619 () Bool)

(assert (=> b!520348 (= res!318446 (not e!303619))))

(declare-fun res!318447 () Bool)

(assert (=> b!520348 (=> (not res!318447) (not e!303619))))

(assert (=> b!520348 (= res!318447 (validKeyInArray!0 (select (arr!15950 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!80125 () Bool)

(declare-fun res!318445 () Bool)

(assert (=> d!80125 (=> res!318445 e!303616)))

(assert (=> d!80125 (= res!318445 (bvsge #b00000000000000000000000000000000 (size!16315 a!3235)))))

(assert (=> d!80125 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10144) e!303616)))

(declare-fun b!520349 () Bool)

(declare-fun e!303618 () Bool)

(declare-fun call!31775 () Bool)

(assert (=> b!520349 (= e!303618 call!31775)))

(declare-fun bm!31772 () Bool)

(declare-fun c!61252 () Bool)

(assert (=> bm!31772 (= call!31775 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!61252 (Cons!10143 (select (arr!15950 a!3235) #b00000000000000000000000000000000) Nil!10144) Nil!10144)))))

(declare-fun b!520350 () Bool)

(assert (=> b!520350 (= e!303618 call!31775)))

(declare-fun b!520351 () Bool)

(assert (=> b!520351 (= e!303617 e!303618)))

(assert (=> b!520351 (= c!61252 (validKeyInArray!0 (select (arr!15950 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!520352 () Bool)

(declare-fun contains!2744 (List!10147 (_ BitVec 64)) Bool)

(assert (=> b!520352 (= e!303619 (contains!2744 Nil!10144 (select (arr!15950 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!80125 (not res!318445)) b!520348))

(assert (= (and b!520348 res!318447) b!520352))

(assert (= (and b!520348 res!318446) b!520351))

(assert (= (and b!520351 c!61252) b!520350))

(assert (= (and b!520351 (not c!61252)) b!520349))

(assert (= (or b!520350 b!520349) bm!31772))

(assert (=> b!520348 m!500789))

(assert (=> b!520348 m!500789))

(assert (=> b!520348 m!500801))

(assert (=> bm!31772 m!500789))

(declare-fun m!500819 () Bool)

(assert (=> bm!31772 m!500819))

(assert (=> b!520351 m!500789))

(assert (=> b!520351 m!500789))

(assert (=> b!520351 m!500801))

(assert (=> b!520352 m!500789))

(assert (=> b!520352 m!500789))

(declare-fun m!500821 () Bool)

(assert (=> b!520352 m!500821))

(assert (=> b!520027 d!80125))

(declare-fun d!80133 () Bool)

(assert (=> d!80133 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!520022 d!80133))

(check-sat (not b!520175) (not b!520351) (not b!520231) (not b!520297) (not d!80117) (not bm!31772) (not d!80091) (not d!80103) (not b!520157) (not d!80109) (not b!520352) (not b!520228) (not b!520299) (not b!520156) (not b!520267) (not d!80075) (not b!520348) (not d!80107) (not b!520132) (not b!520300) (not bm!31762) (not d!80085) (not b!520273) (not bm!31769))
(check-sat)
