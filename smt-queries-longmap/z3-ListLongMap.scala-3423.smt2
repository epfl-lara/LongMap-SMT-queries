; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47450 () Bool)

(assert start!47450)

(declare-fun b!522567 () Bool)

(declare-fun e!304772 () Bool)

(declare-fun e!304771 () Bool)

(assert (=> b!522567 (= e!304772 e!304771)))

(declare-fun res!320259 () Bool)

(assert (=> b!522567 (=> (not res!320259) (not e!304771))))

(declare-datatypes ((SeekEntryResult!4417 0))(
  ( (MissingZero!4417 (index!19871 (_ BitVec 32))) (Found!4417 (index!19872 (_ BitVec 32))) (Intermediate!4417 (undefined!5229 Bool) (index!19873 (_ BitVec 32)) (x!48992 (_ BitVec 32))) (Undefined!4417) (MissingVacant!4417 (index!19874 (_ BitVec 32))) )
))
(declare-fun lt!239735 () SeekEntryResult!4417)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!522567 (= res!320259 (or (= lt!239735 (MissingZero!4417 i!1204)) (= lt!239735 (MissingVacant!4417 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33277 0))(
  ( (array!33278 (arr!15994 (Array (_ BitVec 32) (_ BitVec 64))) (size!16358 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33277)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33277 (_ BitVec 32)) SeekEntryResult!4417)

(assert (=> b!522567 (= lt!239735 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!522568 () Bool)

(declare-fun e!304770 () Bool)

(assert (=> b!522568 (= e!304771 (not e!304770))))

(declare-fun res!320250 () Bool)

(assert (=> b!522568 (=> res!320250 e!304770)))

(declare-fun lt!239739 () SeekEntryResult!4417)

(declare-fun lt!239742 () array!33277)

(declare-fun lt!239743 () (_ BitVec 32))

(declare-fun lt!239738 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33277 (_ BitVec 32)) SeekEntryResult!4417)

(assert (=> b!522568 (= res!320250 (= lt!239739 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239743 lt!239738 lt!239742 mask!3524)))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!239740 () (_ BitVec 32))

(assert (=> b!522568 (= lt!239739 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239740 (select (arr!15994 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!522568 (= lt!239743 (toIndex!0 lt!239738 mask!3524))))

(assert (=> b!522568 (= lt!239738 (select (store (arr!15994 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!522568 (= lt!239740 (toIndex!0 (select (arr!15994 a!3235) j!176) mask!3524))))

(assert (=> b!522568 (= lt!239742 (array!33278 (store (arr!15994 a!3235) i!1204 k0!2280) (size!16358 a!3235)))))

(declare-fun e!304775 () Bool)

(assert (=> b!522568 e!304775))

(declare-fun res!320254 () Bool)

(assert (=> b!522568 (=> (not res!320254) (not e!304775))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33277 (_ BitVec 32)) Bool)

(assert (=> b!522568 (= res!320254 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16279 0))(
  ( (Unit!16280) )
))
(declare-fun lt!239736 () Unit!16279)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33277 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16279)

(assert (=> b!522568 (= lt!239736 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!522569 () Bool)

(declare-fun res!320253 () Bool)

(assert (=> b!522569 (=> res!320253 e!304770)))

(get-info :version)

(assert (=> b!522569 (= res!320253 (or (undefined!5229 lt!239739) (not ((_ is Intermediate!4417) lt!239739))))))

(declare-fun b!522570 () Bool)

(declare-fun e!304776 () Unit!16279)

(declare-fun Unit!16281 () Unit!16279)

(assert (=> b!522570 (= e!304776 Unit!16281)))

(declare-fun lt!239741 () Unit!16279)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33277 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16279)

(assert (=> b!522570 (= lt!239741 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!239740 #b00000000000000000000000000000000 (index!19873 lt!239739) (x!48992 lt!239739) mask!3524))))

(declare-fun res!320257 () Bool)

(assert (=> b!522570 (= res!320257 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239740 lt!239738 lt!239742 mask!3524) (Intermediate!4417 false (index!19873 lt!239739) (x!48992 lt!239739))))))

(declare-fun e!304773 () Bool)

(assert (=> b!522570 (=> (not res!320257) (not e!304773))))

(assert (=> b!522570 e!304773))

(declare-fun b!522571 () Bool)

(declare-fun res!320249 () Bool)

(assert (=> b!522571 (=> (not res!320249) (not e!304772))))

(assert (=> b!522571 (= res!320249 (and (= (size!16358 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16358 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16358 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!320255 () Bool)

(assert (=> start!47450 (=> (not res!320255) (not e!304772))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47450 (= res!320255 (validMask!0 mask!3524))))

(assert (=> start!47450 e!304772))

(assert (=> start!47450 true))

(declare-fun array_inv!11853 (array!33277) Bool)

(assert (=> start!47450 (array_inv!11853 a!3235)))

(declare-fun b!522572 () Bool)

(assert (=> b!522572 (= e!304770 (bvsle #b00000000000000000000000000000000 (x!48992 lt!239739)))))

(assert (=> b!522572 (and (or (= (select (arr!15994 a!3235) (index!19873 lt!239739)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15994 a!3235) (index!19873 lt!239739)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15994 a!3235) (index!19873 lt!239739)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15994 a!3235) (index!19873 lt!239739)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!239737 () Unit!16279)

(assert (=> b!522572 (= lt!239737 e!304776)))

(declare-fun c!61460 () Bool)

(assert (=> b!522572 (= c!61460 (= (select (arr!15994 a!3235) (index!19873 lt!239739)) (select (arr!15994 a!3235) j!176)))))

(assert (=> b!522572 (and (bvslt (x!48992 lt!239739) #b01111111111111111111111111111110) (or (= (select (arr!15994 a!3235) (index!19873 lt!239739)) (select (arr!15994 a!3235) j!176)) (= (select (arr!15994 a!3235) (index!19873 lt!239739)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15994 a!3235) (index!19873 lt!239739)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!522573 () Bool)

(declare-fun res!320258 () Bool)

(assert (=> b!522573 (=> (not res!320258) (not e!304772))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!522573 (= res!320258 (validKeyInArray!0 (select (arr!15994 a!3235) j!176)))))

(declare-fun b!522574 () Bool)

(declare-fun res!320251 () Bool)

(assert (=> b!522574 (=> (not res!320251) (not e!304771))))

(declare-datatypes ((List!10059 0))(
  ( (Nil!10056) (Cons!10055 (h!10977 (_ BitVec 64)) (t!16279 List!10059)) )
))
(declare-fun arrayNoDuplicates!0 (array!33277 (_ BitVec 32) List!10059) Bool)

(assert (=> b!522574 (= res!320251 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10056))))

(declare-fun b!522575 () Bool)

(declare-fun res!320256 () Bool)

(assert (=> b!522575 (=> (not res!320256) (not e!304772))))

(assert (=> b!522575 (= res!320256 (validKeyInArray!0 k0!2280))))

(declare-fun b!522576 () Bool)

(assert (=> b!522576 (= e!304773 false)))

(declare-fun b!522577 () Bool)

(assert (=> b!522577 (= e!304775 (= (seekEntryOrOpen!0 (select (arr!15994 a!3235) j!176) a!3235 mask!3524) (Found!4417 j!176)))))

(declare-fun b!522578 () Bool)

(declare-fun res!320252 () Bool)

(assert (=> b!522578 (=> (not res!320252) (not e!304772))))

(declare-fun arrayContainsKey!0 (array!33277 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!522578 (= res!320252 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!522579 () Bool)

(declare-fun res!320260 () Bool)

(assert (=> b!522579 (=> (not res!320260) (not e!304771))))

(assert (=> b!522579 (= res!320260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!522580 () Bool)

(declare-fun Unit!16282 () Unit!16279)

(assert (=> b!522580 (= e!304776 Unit!16282)))

(assert (= (and start!47450 res!320255) b!522571))

(assert (= (and b!522571 res!320249) b!522573))

(assert (= (and b!522573 res!320258) b!522575))

(assert (= (and b!522575 res!320256) b!522578))

(assert (= (and b!522578 res!320252) b!522567))

(assert (= (and b!522567 res!320259) b!522579))

(assert (= (and b!522579 res!320260) b!522574))

(assert (= (and b!522574 res!320251) b!522568))

(assert (= (and b!522568 res!320254) b!522577))

(assert (= (and b!522568 (not res!320250)) b!522569))

(assert (= (and b!522569 (not res!320253)) b!522572))

(assert (= (and b!522572 c!61460) b!522570))

(assert (= (and b!522572 (not c!61460)) b!522580))

(assert (= (and b!522570 res!320257) b!522576))

(declare-fun m!503725 () Bool)

(assert (=> b!522578 m!503725))

(declare-fun m!503727 () Bool)

(assert (=> b!522570 m!503727))

(declare-fun m!503729 () Bool)

(assert (=> b!522570 m!503729))

(declare-fun m!503731 () Bool)

(assert (=> b!522577 m!503731))

(assert (=> b!522577 m!503731))

(declare-fun m!503733 () Bool)

(assert (=> b!522577 m!503733))

(declare-fun m!503735 () Bool)

(assert (=> b!522579 m!503735))

(declare-fun m!503737 () Bool)

(assert (=> b!522567 m!503737))

(declare-fun m!503739 () Bool)

(assert (=> b!522574 m!503739))

(declare-fun m!503741 () Bool)

(assert (=> b!522572 m!503741))

(assert (=> b!522572 m!503731))

(declare-fun m!503743 () Bool)

(assert (=> b!522575 m!503743))

(declare-fun m!503745 () Bool)

(assert (=> b!522568 m!503745))

(declare-fun m!503747 () Bool)

(assert (=> b!522568 m!503747))

(declare-fun m!503749 () Bool)

(assert (=> b!522568 m!503749))

(declare-fun m!503751 () Bool)

(assert (=> b!522568 m!503751))

(assert (=> b!522568 m!503731))

(declare-fun m!503753 () Bool)

(assert (=> b!522568 m!503753))

(declare-fun m!503755 () Bool)

(assert (=> b!522568 m!503755))

(assert (=> b!522568 m!503731))

(declare-fun m!503757 () Bool)

(assert (=> b!522568 m!503757))

(assert (=> b!522568 m!503731))

(declare-fun m!503759 () Bool)

(assert (=> b!522568 m!503759))

(declare-fun m!503761 () Bool)

(assert (=> start!47450 m!503761))

(declare-fun m!503763 () Bool)

(assert (=> start!47450 m!503763))

(assert (=> b!522573 m!503731))

(assert (=> b!522573 m!503731))

(declare-fun m!503765 () Bool)

(assert (=> b!522573 m!503765))

(check-sat (not b!522577) (not b!522578) (not start!47450) (not b!522567) (not b!522574) (not b!522579) (not b!522575) (not b!522568) (not b!522570) (not b!522573))
(check-sat)
(get-model)

(declare-fun b!522673 () Bool)

(declare-fun e!304825 () Bool)

(declare-fun e!304826 () Bool)

(assert (=> b!522673 (= e!304825 e!304826)))

(declare-fun lt!239804 () (_ BitVec 64))

(assert (=> b!522673 (= lt!239804 (select (arr!15994 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!239806 () Unit!16279)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33277 (_ BitVec 64) (_ BitVec 32)) Unit!16279)

(assert (=> b!522673 (= lt!239806 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!239804 #b00000000000000000000000000000000))))

(assert (=> b!522673 (arrayContainsKey!0 a!3235 lt!239804 #b00000000000000000000000000000000)))

(declare-fun lt!239805 () Unit!16279)

(assert (=> b!522673 (= lt!239805 lt!239806)))

(declare-fun res!320338 () Bool)

(assert (=> b!522673 (= res!320338 (= (seekEntryOrOpen!0 (select (arr!15994 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4417 #b00000000000000000000000000000000)))))

(assert (=> b!522673 (=> (not res!320338) (not e!304826))))

(declare-fun bm!31794 () Bool)

(declare-fun call!31797 () Bool)

(assert (=> bm!31794 (= call!31797 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!522674 () Bool)

(assert (=> b!522674 (= e!304825 call!31797)))

(declare-fun d!80447 () Bool)

(declare-fun res!320337 () Bool)

(declare-fun e!304827 () Bool)

(assert (=> d!80447 (=> res!320337 e!304827)))

(assert (=> d!80447 (= res!320337 (bvsge #b00000000000000000000000000000000 (size!16358 a!3235)))))

(assert (=> d!80447 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!304827)))

(declare-fun b!522675 () Bool)

(assert (=> b!522675 (= e!304826 call!31797)))

(declare-fun b!522676 () Bool)

(assert (=> b!522676 (= e!304827 e!304825)))

(declare-fun c!61469 () Bool)

(assert (=> b!522676 (= c!61469 (validKeyInArray!0 (select (arr!15994 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!80447 (not res!320337)) b!522676))

(assert (= (and b!522676 c!61469) b!522673))

(assert (= (and b!522676 (not c!61469)) b!522674))

(assert (= (and b!522673 res!320338) b!522675))

(assert (= (or b!522675 b!522674) bm!31794))

(declare-fun m!503851 () Bool)

(assert (=> b!522673 m!503851))

(declare-fun m!503853 () Bool)

(assert (=> b!522673 m!503853))

(declare-fun m!503855 () Bool)

(assert (=> b!522673 m!503855))

(assert (=> b!522673 m!503851))

(declare-fun m!503857 () Bool)

(assert (=> b!522673 m!503857))

(declare-fun m!503859 () Bool)

(assert (=> bm!31794 m!503859))

(assert (=> b!522676 m!503851))

(assert (=> b!522676 m!503851))

(declare-fun m!503861 () Bool)

(assert (=> b!522676 m!503861))

(assert (=> b!522579 d!80447))

(declare-fun d!80449 () Bool)

(declare-fun lt!239812 () (_ BitVec 32))

(declare-fun lt!239811 () (_ BitVec 32))

(assert (=> d!80449 (= lt!239812 (bvmul (bvxor lt!239811 (bvlshr lt!239811 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80449 (= lt!239811 ((_ extract 31 0) (bvand (bvxor (select (arr!15994 a!3235) j!176) (bvlshr (select (arr!15994 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80449 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!320339 (let ((h!10980 ((_ extract 31 0) (bvand (bvxor (select (arr!15994 a!3235) j!176) (bvlshr (select (arr!15994 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48995 (bvmul (bvxor h!10980 (bvlshr h!10980 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48995 (bvlshr x!48995 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!320339 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!320339 #b00000000000000000000000000000000))))))

(assert (=> d!80449 (= (toIndex!0 (select (arr!15994 a!3235) j!176) mask!3524) (bvand (bvxor lt!239812 (bvlshr lt!239812 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!522568 d!80449))

(declare-fun d!80451 () Bool)

(declare-fun lt!239814 () (_ BitVec 32))

(declare-fun lt!239813 () (_ BitVec 32))

(assert (=> d!80451 (= lt!239814 (bvmul (bvxor lt!239813 (bvlshr lt!239813 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80451 (= lt!239813 ((_ extract 31 0) (bvand (bvxor lt!239738 (bvlshr lt!239738 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80451 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!320339 (let ((h!10980 ((_ extract 31 0) (bvand (bvxor lt!239738 (bvlshr lt!239738 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48995 (bvmul (bvxor h!10980 (bvlshr h!10980 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48995 (bvlshr x!48995 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!320339 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!320339 #b00000000000000000000000000000000))))))

(assert (=> d!80451 (= (toIndex!0 lt!239738 mask!3524) (bvand (bvxor lt!239814 (bvlshr lt!239814 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!522568 d!80451))

(declare-fun b!522713 () Bool)

(declare-fun lt!239826 () SeekEntryResult!4417)

(assert (=> b!522713 (and (bvsge (index!19873 lt!239826) #b00000000000000000000000000000000) (bvslt (index!19873 lt!239826) (size!16358 lt!239742)))))

(declare-fun res!320353 () Bool)

(assert (=> b!522713 (= res!320353 (= (select (arr!15994 lt!239742) (index!19873 lt!239826)) lt!239738))))

(declare-fun e!304850 () Bool)

(assert (=> b!522713 (=> res!320353 e!304850)))

(declare-fun e!304853 () Bool)

(assert (=> b!522713 (= e!304853 e!304850)))

(declare-fun b!522714 () Bool)

(declare-fun e!304854 () SeekEntryResult!4417)

(assert (=> b!522714 (= e!304854 (Intermediate!4417 false lt!239743 #b00000000000000000000000000000000))))

(declare-fun d!80453 () Bool)

(declare-fun e!304852 () Bool)

(assert (=> d!80453 e!304852))

(declare-fun c!61482 () Bool)

(assert (=> d!80453 (= c!61482 (and ((_ is Intermediate!4417) lt!239826) (undefined!5229 lt!239826)))))

(declare-fun e!304851 () SeekEntryResult!4417)

(assert (=> d!80453 (= lt!239826 e!304851)))

(declare-fun c!61483 () Bool)

(assert (=> d!80453 (= c!61483 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!239825 () (_ BitVec 64))

(assert (=> d!80453 (= lt!239825 (select (arr!15994 lt!239742) lt!239743))))

(assert (=> d!80453 (validMask!0 mask!3524)))

(assert (=> d!80453 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239743 lt!239738 lt!239742 mask!3524) lt!239826)))

(declare-fun b!522715 () Bool)

(assert (=> b!522715 (= e!304852 e!304853)))

(declare-fun res!320354 () Bool)

(assert (=> b!522715 (= res!320354 (and ((_ is Intermediate!4417) lt!239826) (not (undefined!5229 lt!239826)) (bvslt (x!48992 lt!239826) #b01111111111111111111111111111110) (bvsge (x!48992 lt!239826) #b00000000000000000000000000000000) (bvsge (x!48992 lt!239826) #b00000000000000000000000000000000)))))

(assert (=> b!522715 (=> (not res!320354) (not e!304853))))

(declare-fun b!522716 () Bool)

(assert (=> b!522716 (= e!304852 (bvsge (x!48992 lt!239826) #b01111111111111111111111111111110))))

(declare-fun b!522717 () Bool)

(assert (=> b!522717 (and (bvsge (index!19873 lt!239826) #b00000000000000000000000000000000) (bvslt (index!19873 lt!239826) (size!16358 lt!239742)))))

(declare-fun res!320352 () Bool)

(assert (=> b!522717 (= res!320352 (= (select (arr!15994 lt!239742) (index!19873 lt!239826)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!522717 (=> res!320352 e!304850)))

(declare-fun b!522718 () Bool)

(assert (=> b!522718 (= e!304851 (Intermediate!4417 true lt!239743 #b00000000000000000000000000000000))))

(declare-fun b!522719 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!522719 (= e!304854 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!239743 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) lt!239738 lt!239742 mask!3524))))

(declare-fun b!522720 () Bool)

(assert (=> b!522720 (and (bvsge (index!19873 lt!239826) #b00000000000000000000000000000000) (bvslt (index!19873 lt!239826) (size!16358 lt!239742)))))

(assert (=> b!522720 (= e!304850 (= (select (arr!15994 lt!239742) (index!19873 lt!239826)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!522721 () Bool)

(assert (=> b!522721 (= e!304851 e!304854)))

(declare-fun c!61484 () Bool)

(assert (=> b!522721 (= c!61484 (or (= lt!239825 lt!239738) (= (bvadd lt!239825 lt!239825) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!80453 c!61483) b!522718))

(assert (= (and d!80453 (not c!61483)) b!522721))

(assert (= (and b!522721 c!61484) b!522714))

(assert (= (and b!522721 (not c!61484)) b!522719))

(assert (= (and d!80453 c!61482) b!522716))

(assert (= (and d!80453 (not c!61482)) b!522715))

(assert (= (and b!522715 res!320354) b!522713))

(assert (= (and b!522713 (not res!320353)) b!522717))

(assert (= (and b!522717 (not res!320352)) b!522720))

(declare-fun m!503867 () Bool)

(assert (=> b!522713 m!503867))

(assert (=> b!522717 m!503867))

(declare-fun m!503869 () Bool)

(assert (=> d!80453 m!503869))

(assert (=> d!80453 m!503761))

(declare-fun m!503871 () Bool)

(assert (=> b!522719 m!503871))

(assert (=> b!522719 m!503871))

(declare-fun m!503873 () Bool)

(assert (=> b!522719 m!503873))

(assert (=> b!522720 m!503867))

(assert (=> b!522568 d!80453))

(declare-fun b!522722 () Bool)

(declare-fun e!304855 () Bool)

(declare-fun e!304856 () Bool)

(assert (=> b!522722 (= e!304855 e!304856)))

(declare-fun lt!239827 () (_ BitVec 64))

(assert (=> b!522722 (= lt!239827 (select (arr!15994 a!3235) j!176))))

(declare-fun lt!239829 () Unit!16279)

(assert (=> b!522722 (= lt!239829 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!239827 j!176))))

(assert (=> b!522722 (arrayContainsKey!0 a!3235 lt!239827 #b00000000000000000000000000000000)))

(declare-fun lt!239828 () Unit!16279)

(assert (=> b!522722 (= lt!239828 lt!239829)))

(declare-fun res!320356 () Bool)

(assert (=> b!522722 (= res!320356 (= (seekEntryOrOpen!0 (select (arr!15994 a!3235) j!176) a!3235 mask!3524) (Found!4417 j!176)))))

(assert (=> b!522722 (=> (not res!320356) (not e!304856))))

(declare-fun call!31798 () Bool)

(declare-fun bm!31795 () Bool)

(assert (=> bm!31795 (= call!31798 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!522723 () Bool)

(assert (=> b!522723 (= e!304855 call!31798)))

(declare-fun d!80463 () Bool)

(declare-fun res!320355 () Bool)

(declare-fun e!304857 () Bool)

(assert (=> d!80463 (=> res!320355 e!304857)))

(assert (=> d!80463 (= res!320355 (bvsge j!176 (size!16358 a!3235)))))

(assert (=> d!80463 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!304857)))

(declare-fun b!522724 () Bool)

(assert (=> b!522724 (= e!304856 call!31798)))

(declare-fun b!522725 () Bool)

(assert (=> b!522725 (= e!304857 e!304855)))

(declare-fun c!61485 () Bool)

(assert (=> b!522725 (= c!61485 (validKeyInArray!0 (select (arr!15994 a!3235) j!176)))))

(assert (= (and d!80463 (not res!320355)) b!522725))

(assert (= (and b!522725 c!61485) b!522722))

(assert (= (and b!522725 (not c!61485)) b!522723))

(assert (= (and b!522722 res!320356) b!522724))

(assert (= (or b!522724 b!522723) bm!31795))

(assert (=> b!522722 m!503731))

(declare-fun m!503875 () Bool)

(assert (=> b!522722 m!503875))

(declare-fun m!503877 () Bool)

(assert (=> b!522722 m!503877))

(assert (=> b!522722 m!503731))

(assert (=> b!522722 m!503733))

(declare-fun m!503879 () Bool)

(assert (=> bm!31795 m!503879))

(assert (=> b!522725 m!503731))

(assert (=> b!522725 m!503731))

(assert (=> b!522725 m!503765))

(assert (=> b!522568 d!80463))

(declare-fun b!522726 () Bool)

(declare-fun lt!239831 () SeekEntryResult!4417)

(assert (=> b!522726 (and (bvsge (index!19873 lt!239831) #b00000000000000000000000000000000) (bvslt (index!19873 lt!239831) (size!16358 a!3235)))))

(declare-fun res!320358 () Bool)

(assert (=> b!522726 (= res!320358 (= (select (arr!15994 a!3235) (index!19873 lt!239831)) (select (arr!15994 a!3235) j!176)))))

(declare-fun e!304858 () Bool)

(assert (=> b!522726 (=> res!320358 e!304858)))

(declare-fun e!304861 () Bool)

(assert (=> b!522726 (= e!304861 e!304858)))

(declare-fun b!522727 () Bool)

(declare-fun e!304862 () SeekEntryResult!4417)

(assert (=> b!522727 (= e!304862 (Intermediate!4417 false lt!239740 #b00000000000000000000000000000000))))

(declare-fun d!80465 () Bool)

(declare-fun e!304860 () Bool)

(assert (=> d!80465 e!304860))

(declare-fun c!61486 () Bool)

(assert (=> d!80465 (= c!61486 (and ((_ is Intermediate!4417) lt!239831) (undefined!5229 lt!239831)))))

(declare-fun e!304859 () SeekEntryResult!4417)

(assert (=> d!80465 (= lt!239831 e!304859)))

(declare-fun c!61487 () Bool)

(assert (=> d!80465 (= c!61487 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!239830 () (_ BitVec 64))

(assert (=> d!80465 (= lt!239830 (select (arr!15994 a!3235) lt!239740))))

(assert (=> d!80465 (validMask!0 mask!3524)))

(assert (=> d!80465 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239740 (select (arr!15994 a!3235) j!176) a!3235 mask!3524) lt!239831)))

(declare-fun b!522728 () Bool)

(assert (=> b!522728 (= e!304860 e!304861)))

(declare-fun res!320359 () Bool)

(assert (=> b!522728 (= res!320359 (and ((_ is Intermediate!4417) lt!239831) (not (undefined!5229 lt!239831)) (bvslt (x!48992 lt!239831) #b01111111111111111111111111111110) (bvsge (x!48992 lt!239831) #b00000000000000000000000000000000) (bvsge (x!48992 lt!239831) #b00000000000000000000000000000000)))))

(assert (=> b!522728 (=> (not res!320359) (not e!304861))))

(declare-fun b!522729 () Bool)

(assert (=> b!522729 (= e!304860 (bvsge (x!48992 lt!239831) #b01111111111111111111111111111110))))

(declare-fun b!522730 () Bool)

(assert (=> b!522730 (and (bvsge (index!19873 lt!239831) #b00000000000000000000000000000000) (bvslt (index!19873 lt!239831) (size!16358 a!3235)))))

(declare-fun res!320357 () Bool)

(assert (=> b!522730 (= res!320357 (= (select (arr!15994 a!3235) (index!19873 lt!239831)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!522730 (=> res!320357 e!304858)))

(declare-fun b!522731 () Bool)

(assert (=> b!522731 (= e!304859 (Intermediate!4417 true lt!239740 #b00000000000000000000000000000000))))

(declare-fun b!522732 () Bool)

(assert (=> b!522732 (= e!304862 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!239740 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) (select (arr!15994 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!522733 () Bool)

(assert (=> b!522733 (and (bvsge (index!19873 lt!239831) #b00000000000000000000000000000000) (bvslt (index!19873 lt!239831) (size!16358 a!3235)))))

(assert (=> b!522733 (= e!304858 (= (select (arr!15994 a!3235) (index!19873 lt!239831)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!522734 () Bool)

(assert (=> b!522734 (= e!304859 e!304862)))

(declare-fun c!61488 () Bool)

(assert (=> b!522734 (= c!61488 (or (= lt!239830 (select (arr!15994 a!3235) j!176)) (= (bvadd lt!239830 lt!239830) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!80465 c!61487) b!522731))

(assert (= (and d!80465 (not c!61487)) b!522734))

(assert (= (and b!522734 c!61488) b!522727))

(assert (= (and b!522734 (not c!61488)) b!522732))

(assert (= (and d!80465 c!61486) b!522729))

(assert (= (and d!80465 (not c!61486)) b!522728))

(assert (= (and b!522728 res!320359) b!522726))

(assert (= (and b!522726 (not res!320358)) b!522730))

(assert (= (and b!522730 (not res!320357)) b!522733))

(declare-fun m!503881 () Bool)

(assert (=> b!522726 m!503881))

(assert (=> b!522730 m!503881))

(declare-fun m!503883 () Bool)

(assert (=> d!80465 m!503883))

(assert (=> d!80465 m!503761))

(declare-fun m!503885 () Bool)

(assert (=> b!522732 m!503885))

(assert (=> b!522732 m!503885))

(assert (=> b!522732 m!503731))

(declare-fun m!503887 () Bool)

(assert (=> b!522732 m!503887))

(assert (=> b!522733 m!503881))

(assert (=> b!522568 d!80465))

(declare-fun d!80467 () Bool)

(assert (=> d!80467 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!239837 () Unit!16279)

(declare-fun choose!38 (array!33277 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16279)

(assert (=> d!80467 (= lt!239837 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!80467 (validMask!0 mask!3524)))

(assert (=> d!80467 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!239837)))

(declare-fun bs!16454 () Bool)

(assert (= bs!16454 d!80467))

(assert (=> bs!16454 m!503757))

(declare-fun m!503903 () Bool)

(assert (=> bs!16454 m!503903))

(assert (=> bs!16454 m!503761))

(assert (=> b!522568 d!80467))

(declare-fun d!80471 () Bool)

(assert (=> d!80471 (= (validKeyInArray!0 (select (arr!15994 a!3235) j!176)) (and (not (= (select (arr!15994 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15994 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!522573 d!80471))

(declare-fun d!80473 () Bool)

(declare-fun res!320364 () Bool)

(declare-fun e!304870 () Bool)

(assert (=> d!80473 (=> res!320364 e!304870)))

(assert (=> d!80473 (= res!320364 (= (select (arr!15994 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!80473 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!304870)))

(declare-fun b!522745 () Bool)

(declare-fun e!304871 () Bool)

(assert (=> b!522745 (= e!304870 e!304871)))

(declare-fun res!320365 () Bool)

(assert (=> b!522745 (=> (not res!320365) (not e!304871))))

(assert (=> b!522745 (= res!320365 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16358 a!3235)))))

(declare-fun b!522746 () Bool)

(assert (=> b!522746 (= e!304871 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!80473 (not res!320364)) b!522745))

(assert (= (and b!522745 res!320365) b!522746))

(assert (=> d!80473 m!503851))

(declare-fun m!503905 () Bool)

(assert (=> b!522746 m!503905))

(assert (=> b!522578 d!80473))

(declare-fun d!80475 () Bool)

(declare-fun lt!239866 () SeekEntryResult!4417)

(assert (=> d!80475 (and (or ((_ is Undefined!4417) lt!239866) (not ((_ is Found!4417) lt!239866)) (and (bvsge (index!19872 lt!239866) #b00000000000000000000000000000000) (bvslt (index!19872 lt!239866) (size!16358 a!3235)))) (or ((_ is Undefined!4417) lt!239866) ((_ is Found!4417) lt!239866) (not ((_ is MissingZero!4417) lt!239866)) (and (bvsge (index!19871 lt!239866) #b00000000000000000000000000000000) (bvslt (index!19871 lt!239866) (size!16358 a!3235)))) (or ((_ is Undefined!4417) lt!239866) ((_ is Found!4417) lt!239866) ((_ is MissingZero!4417) lt!239866) (not ((_ is MissingVacant!4417) lt!239866)) (and (bvsge (index!19874 lt!239866) #b00000000000000000000000000000000) (bvslt (index!19874 lt!239866) (size!16358 a!3235)))) (or ((_ is Undefined!4417) lt!239866) (ite ((_ is Found!4417) lt!239866) (= (select (arr!15994 a!3235) (index!19872 lt!239866)) k0!2280) (ite ((_ is MissingZero!4417) lt!239866) (= (select (arr!15994 a!3235) (index!19871 lt!239866)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4417) lt!239866) (= (select (arr!15994 a!3235) (index!19874 lt!239866)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!304910 () SeekEntryResult!4417)

(assert (=> d!80475 (= lt!239866 e!304910)))

(declare-fun c!61515 () Bool)

(declare-fun lt!239867 () SeekEntryResult!4417)

(assert (=> d!80475 (= c!61515 (and ((_ is Intermediate!4417) lt!239867) (undefined!5229 lt!239867)))))

(assert (=> d!80475 (= lt!239867 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!80475 (validMask!0 mask!3524)))

(assert (=> d!80475 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!239866)))

(declare-fun b!522809 () Bool)

(assert (=> b!522809 (= e!304910 Undefined!4417)))

(declare-fun b!522810 () Bool)

(declare-fun e!304911 () SeekEntryResult!4417)

(assert (=> b!522810 (= e!304911 (Found!4417 (index!19873 lt!239867)))))

(declare-fun b!522811 () Bool)

(assert (=> b!522811 (= e!304910 e!304911)))

(declare-fun lt!239868 () (_ BitVec 64))

(assert (=> b!522811 (= lt!239868 (select (arr!15994 a!3235) (index!19873 lt!239867)))))

(declare-fun c!61516 () Bool)

(assert (=> b!522811 (= c!61516 (= lt!239868 k0!2280))))

(declare-fun b!522812 () Bool)

(declare-fun c!61514 () Bool)

(assert (=> b!522812 (= c!61514 (= lt!239868 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!304909 () SeekEntryResult!4417)

(assert (=> b!522812 (= e!304911 e!304909)))

(declare-fun b!522813 () Bool)

(assert (=> b!522813 (= e!304909 (MissingZero!4417 (index!19873 lt!239867)))))

(declare-fun b!522814 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33277 (_ BitVec 32)) SeekEntryResult!4417)

(assert (=> b!522814 (= e!304909 (seekKeyOrZeroReturnVacant!0 (x!48992 lt!239867) (index!19873 lt!239867) (index!19873 lt!239867) k0!2280 a!3235 mask!3524))))

(assert (= (and d!80475 c!61515) b!522809))

(assert (= (and d!80475 (not c!61515)) b!522811))

(assert (= (and b!522811 c!61516) b!522810))

(assert (= (and b!522811 (not c!61516)) b!522812))

(assert (= (and b!522812 c!61514) b!522813))

(assert (= (and b!522812 (not c!61514)) b!522814))

(assert (=> d!80475 m!503761))

(declare-fun m!503925 () Bool)

(assert (=> d!80475 m!503925))

(declare-fun m!503927 () Bool)

(assert (=> d!80475 m!503927))

(declare-fun m!503929 () Bool)

(assert (=> d!80475 m!503929))

(declare-fun m!503931 () Bool)

(assert (=> d!80475 m!503931))

(declare-fun m!503933 () Bool)

(assert (=> d!80475 m!503933))

(assert (=> d!80475 m!503927))

(declare-fun m!503935 () Bool)

(assert (=> b!522811 m!503935))

(declare-fun m!503937 () Bool)

(assert (=> b!522814 m!503937))

(assert (=> b!522567 d!80475))

(declare-fun d!80483 () Bool)

(declare-fun lt!239869 () SeekEntryResult!4417)

(assert (=> d!80483 (and (or ((_ is Undefined!4417) lt!239869) (not ((_ is Found!4417) lt!239869)) (and (bvsge (index!19872 lt!239869) #b00000000000000000000000000000000) (bvslt (index!19872 lt!239869) (size!16358 a!3235)))) (or ((_ is Undefined!4417) lt!239869) ((_ is Found!4417) lt!239869) (not ((_ is MissingZero!4417) lt!239869)) (and (bvsge (index!19871 lt!239869) #b00000000000000000000000000000000) (bvslt (index!19871 lt!239869) (size!16358 a!3235)))) (or ((_ is Undefined!4417) lt!239869) ((_ is Found!4417) lt!239869) ((_ is MissingZero!4417) lt!239869) (not ((_ is MissingVacant!4417) lt!239869)) (and (bvsge (index!19874 lt!239869) #b00000000000000000000000000000000) (bvslt (index!19874 lt!239869) (size!16358 a!3235)))) (or ((_ is Undefined!4417) lt!239869) (ite ((_ is Found!4417) lt!239869) (= (select (arr!15994 a!3235) (index!19872 lt!239869)) (select (arr!15994 a!3235) j!176)) (ite ((_ is MissingZero!4417) lt!239869) (= (select (arr!15994 a!3235) (index!19871 lt!239869)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4417) lt!239869) (= (select (arr!15994 a!3235) (index!19874 lt!239869)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!304917 () SeekEntryResult!4417)

(assert (=> d!80483 (= lt!239869 e!304917)))

(declare-fun c!61520 () Bool)

(declare-fun lt!239870 () SeekEntryResult!4417)

(assert (=> d!80483 (= c!61520 (and ((_ is Intermediate!4417) lt!239870) (undefined!5229 lt!239870)))))

(assert (=> d!80483 (= lt!239870 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15994 a!3235) j!176) mask!3524) (select (arr!15994 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!80483 (validMask!0 mask!3524)))

(assert (=> d!80483 (= (seekEntryOrOpen!0 (select (arr!15994 a!3235) j!176) a!3235 mask!3524) lt!239869)))

(declare-fun b!522821 () Bool)

(assert (=> b!522821 (= e!304917 Undefined!4417)))

(declare-fun b!522822 () Bool)

(declare-fun e!304920 () SeekEntryResult!4417)

(assert (=> b!522822 (= e!304920 (Found!4417 (index!19873 lt!239870)))))

(declare-fun b!522823 () Bool)

(assert (=> b!522823 (= e!304917 e!304920)))

(declare-fun lt!239871 () (_ BitVec 64))

(assert (=> b!522823 (= lt!239871 (select (arr!15994 a!3235) (index!19873 lt!239870)))))

(declare-fun c!61521 () Bool)

(assert (=> b!522823 (= c!61521 (= lt!239871 (select (arr!15994 a!3235) j!176)))))

(declare-fun b!522824 () Bool)

(declare-fun c!61519 () Bool)

(assert (=> b!522824 (= c!61519 (= lt!239871 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!304916 () SeekEntryResult!4417)

(assert (=> b!522824 (= e!304920 e!304916)))

(declare-fun b!522825 () Bool)

(assert (=> b!522825 (= e!304916 (MissingZero!4417 (index!19873 lt!239870)))))

(declare-fun b!522826 () Bool)

(assert (=> b!522826 (= e!304916 (seekKeyOrZeroReturnVacant!0 (x!48992 lt!239870) (index!19873 lt!239870) (index!19873 lt!239870) (select (arr!15994 a!3235) j!176) a!3235 mask!3524))))

(assert (= (and d!80483 c!61520) b!522821))

(assert (= (and d!80483 (not c!61520)) b!522823))

(assert (= (and b!522823 c!61521) b!522822))

(assert (= (and b!522823 (not c!61521)) b!522824))

(assert (= (and b!522824 c!61519) b!522825))

(assert (= (and b!522824 (not c!61519)) b!522826))

(assert (=> d!80483 m!503761))

(declare-fun m!503939 () Bool)

(assert (=> d!80483 m!503939))

(assert (=> d!80483 m!503753))

(assert (=> d!80483 m!503731))

(declare-fun m!503941 () Bool)

(assert (=> d!80483 m!503941))

(declare-fun m!503943 () Bool)

(assert (=> d!80483 m!503943))

(declare-fun m!503945 () Bool)

(assert (=> d!80483 m!503945))

(assert (=> d!80483 m!503731))

(assert (=> d!80483 m!503753))

(declare-fun m!503947 () Bool)

(assert (=> b!522823 m!503947))

(assert (=> b!522826 m!503731))

(declare-fun m!503949 () Bool)

(assert (=> b!522826 m!503949))

(assert (=> b!522577 d!80483))

(declare-fun d!80485 () Bool)

(declare-fun e!304936 () Bool)

(assert (=> d!80485 e!304936))

(declare-fun res!320400 () Bool)

(assert (=> d!80485 (=> (not res!320400) (not e!304936))))

(assert (=> d!80485 (= res!320400 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16358 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16358 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16358 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16358 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16358 a!3235))))))

(declare-fun lt!239898 () Unit!16279)

(declare-fun choose!47 (array!33277 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16279)

(assert (=> d!80485 (= lt!239898 (choose!47 a!3235 i!1204 k0!2280 j!176 lt!239740 #b00000000000000000000000000000000 (index!19873 lt!239739) (x!48992 lt!239739) mask!3524))))

(assert (=> d!80485 (validMask!0 mask!3524)))

(assert (=> d!80485 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!239740 #b00000000000000000000000000000000 (index!19873 lt!239739) (x!48992 lt!239739) mask!3524) lt!239898)))

(declare-fun b!522857 () Bool)

(assert (=> b!522857 (= e!304936 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239740 (select (store (arr!15994 a!3235) i!1204 k0!2280) j!176) (array!33278 (store (arr!15994 a!3235) i!1204 k0!2280) (size!16358 a!3235)) mask!3524) (Intermediate!4417 false (index!19873 lt!239739) (x!48992 lt!239739))))))

(assert (= (and d!80485 res!320400) b!522857))

(declare-fun m!503981 () Bool)

(assert (=> d!80485 m!503981))

(assert (=> d!80485 m!503761))

(assert (=> b!522857 m!503745))

(assert (=> b!522857 m!503749))

(assert (=> b!522857 m!503749))

(declare-fun m!503983 () Bool)

(assert (=> b!522857 m!503983))

(assert (=> b!522570 d!80485))

(declare-fun b!522866 () Bool)

(declare-fun lt!239900 () SeekEntryResult!4417)

(assert (=> b!522866 (and (bvsge (index!19873 lt!239900) #b00000000000000000000000000000000) (bvslt (index!19873 lt!239900) (size!16358 lt!239742)))))

(declare-fun res!320408 () Bool)

(assert (=> b!522866 (= res!320408 (= (select (arr!15994 lt!239742) (index!19873 lt!239900)) lt!239738))))

(declare-fun e!304943 () Bool)

(assert (=> b!522866 (=> res!320408 e!304943)))

(declare-fun e!304946 () Bool)

(assert (=> b!522866 (= e!304946 e!304943)))

(declare-fun b!522867 () Bool)

(declare-fun e!304947 () SeekEntryResult!4417)

(assert (=> b!522867 (= e!304947 (Intermediate!4417 false lt!239740 #b00000000000000000000000000000000))))

(declare-fun d!80501 () Bool)

(declare-fun e!304945 () Bool)

(assert (=> d!80501 e!304945))

(declare-fun c!61531 () Bool)

(assert (=> d!80501 (= c!61531 (and ((_ is Intermediate!4417) lt!239900) (undefined!5229 lt!239900)))))

(declare-fun e!304944 () SeekEntryResult!4417)

(assert (=> d!80501 (= lt!239900 e!304944)))

(declare-fun c!61532 () Bool)

(assert (=> d!80501 (= c!61532 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!239899 () (_ BitVec 64))

(assert (=> d!80501 (= lt!239899 (select (arr!15994 lt!239742) lt!239740))))

(assert (=> d!80501 (validMask!0 mask!3524)))

(assert (=> d!80501 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239740 lt!239738 lt!239742 mask!3524) lt!239900)))

(declare-fun b!522868 () Bool)

(assert (=> b!522868 (= e!304945 e!304946)))

(declare-fun res!320409 () Bool)

(assert (=> b!522868 (= res!320409 (and ((_ is Intermediate!4417) lt!239900) (not (undefined!5229 lt!239900)) (bvslt (x!48992 lt!239900) #b01111111111111111111111111111110) (bvsge (x!48992 lt!239900) #b00000000000000000000000000000000) (bvsge (x!48992 lt!239900) #b00000000000000000000000000000000)))))

(assert (=> b!522868 (=> (not res!320409) (not e!304946))))

(declare-fun b!522869 () Bool)

(assert (=> b!522869 (= e!304945 (bvsge (x!48992 lt!239900) #b01111111111111111111111111111110))))

(declare-fun b!522870 () Bool)

(assert (=> b!522870 (and (bvsge (index!19873 lt!239900) #b00000000000000000000000000000000) (bvslt (index!19873 lt!239900) (size!16358 lt!239742)))))

(declare-fun res!320407 () Bool)

(assert (=> b!522870 (= res!320407 (= (select (arr!15994 lt!239742) (index!19873 lt!239900)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!522870 (=> res!320407 e!304943)))

(declare-fun b!522871 () Bool)

(assert (=> b!522871 (= e!304944 (Intermediate!4417 true lt!239740 #b00000000000000000000000000000000))))

(declare-fun b!522872 () Bool)

(assert (=> b!522872 (= e!304947 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!239740 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) lt!239738 lt!239742 mask!3524))))

(declare-fun b!522873 () Bool)

(assert (=> b!522873 (and (bvsge (index!19873 lt!239900) #b00000000000000000000000000000000) (bvslt (index!19873 lt!239900) (size!16358 lt!239742)))))

(assert (=> b!522873 (= e!304943 (= (select (arr!15994 lt!239742) (index!19873 lt!239900)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!522874 () Bool)

(assert (=> b!522874 (= e!304944 e!304947)))

(declare-fun c!61533 () Bool)

(assert (=> b!522874 (= c!61533 (or (= lt!239899 lt!239738) (= (bvadd lt!239899 lt!239899) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!80501 c!61532) b!522871))

(assert (= (and d!80501 (not c!61532)) b!522874))

(assert (= (and b!522874 c!61533) b!522867))

(assert (= (and b!522874 (not c!61533)) b!522872))

(assert (= (and d!80501 c!61531) b!522869))

(assert (= (and d!80501 (not c!61531)) b!522868))

(assert (= (and b!522868 res!320409) b!522866))

(assert (= (and b!522866 (not res!320408)) b!522870))

(assert (= (and b!522870 (not res!320407)) b!522873))

(declare-fun m!503985 () Bool)

(assert (=> b!522866 m!503985))

(assert (=> b!522870 m!503985))

(declare-fun m!503987 () Bool)

(assert (=> d!80501 m!503987))

(assert (=> d!80501 m!503761))

(assert (=> b!522872 m!503885))

(assert (=> b!522872 m!503885))

(declare-fun m!503989 () Bool)

(assert (=> b!522872 m!503989))

(assert (=> b!522873 m!503985))

(assert (=> b!522570 d!80501))

(declare-fun d!80503 () Bool)

(assert (=> d!80503 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!47450 d!80503))

(declare-fun d!80515 () Bool)

(assert (=> d!80515 (= (array_inv!11853 a!3235) (bvsge (size!16358 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!47450 d!80515))

(declare-fun d!80517 () Bool)

(assert (=> d!80517 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!522575 d!80517))

(declare-fun b!522936 () Bool)

(declare-fun e!304995 () Bool)

(declare-fun contains!2742 (List!10059 (_ BitVec 64)) Bool)

(assert (=> b!522936 (= e!304995 (contains!2742 Nil!10056 (select (arr!15994 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31808 () Bool)

(declare-fun call!31811 () Bool)

(declare-fun c!61551 () Bool)

(assert (=> bm!31808 (= call!31811 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!61551 (Cons!10055 (select (arr!15994 a!3235) #b00000000000000000000000000000000) Nil!10056) Nil!10056)))))

(declare-fun b!522937 () Bool)

(declare-fun e!304994 () Bool)

(declare-fun e!304993 () Bool)

(assert (=> b!522937 (= e!304994 e!304993)))

(assert (=> b!522937 (= c!61551 (validKeyInArray!0 (select (arr!15994 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!80519 () Bool)

(declare-fun res!320441 () Bool)

(declare-fun e!304992 () Bool)

(assert (=> d!80519 (=> res!320441 e!304992)))

(assert (=> d!80519 (= res!320441 (bvsge #b00000000000000000000000000000000 (size!16358 a!3235)))))

(assert (=> d!80519 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10056) e!304992)))

(declare-fun b!522938 () Bool)

(assert (=> b!522938 (= e!304993 call!31811)))

(declare-fun b!522939 () Bool)

(assert (=> b!522939 (= e!304992 e!304994)))

(declare-fun res!320440 () Bool)

(assert (=> b!522939 (=> (not res!320440) (not e!304994))))

(assert (=> b!522939 (= res!320440 (not e!304995))))

(declare-fun res!320439 () Bool)

(assert (=> b!522939 (=> (not res!320439) (not e!304995))))

(assert (=> b!522939 (= res!320439 (validKeyInArray!0 (select (arr!15994 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!522940 () Bool)

(assert (=> b!522940 (= e!304993 call!31811)))

(assert (= (and d!80519 (not res!320441)) b!522939))

(assert (= (and b!522939 res!320439) b!522936))

(assert (= (and b!522939 res!320440) b!522937))

(assert (= (and b!522937 c!61551) b!522940))

(assert (= (and b!522937 (not c!61551)) b!522938))

(assert (= (or b!522940 b!522938) bm!31808))

(assert (=> b!522936 m!503851))

(assert (=> b!522936 m!503851))

(declare-fun m!504029 () Bool)

(assert (=> b!522936 m!504029))

(assert (=> bm!31808 m!503851))

(declare-fun m!504031 () Bool)

(assert (=> bm!31808 m!504031))

(assert (=> b!522937 m!503851))

(assert (=> b!522937 m!503851))

(assert (=> b!522937 m!503861))

(assert (=> b!522939 m!503851))

(assert (=> b!522939 m!503851))

(assert (=> b!522939 m!503861))

(assert (=> b!522574 d!80519))

(check-sat (not bm!31808) (not d!80475) (not b!522936) (not d!80485) (not b!522814) (not b!522857) (not b!522826) (not b!522719) (not d!80465) (not b!522937) (not b!522725) (not b!522746) (not d!80483) (not b!522732) (not b!522673) (not bm!31795) (not b!522676) (not d!80501) (not d!80467) (not b!522939) (not bm!31794) (not b!522722) (not d!80453) (not b!522872))
(check-sat)
