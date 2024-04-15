; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47448 () Bool)

(assert start!47448)

(declare-fun b!522357 () Bool)

(declare-datatypes ((Unit!16294 0))(
  ( (Unit!16295) )
))
(declare-fun e!304635 () Unit!16294)

(declare-fun Unit!16296 () Unit!16294)

(assert (=> b!522357 (= e!304635 Unit!16296)))

(declare-datatypes ((SeekEntryResult!4462 0))(
  ( (MissingZero!4462 (index!20051 (_ BitVec 32))) (Found!4462 (index!20052 (_ BitVec 32))) (Intermediate!4462 (undefined!5274 Bool) (index!20053 (_ BitVec 32)) (x!49035 (_ BitVec 32))) (Undefined!4462) (MissingVacant!4462 (index!20054 (_ BitVec 32))) )
))
(declare-fun lt!239496 () SeekEntryResult!4462)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33284 0))(
  ( (array!33285 (arr!15998 (Array (_ BitVec 32) (_ BitVec 64))) (size!16363 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33284)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!239491 () Unit!16294)

(declare-fun lt!239495 () (_ BitVec 32))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33284 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16294)

(assert (=> b!522357 (= lt!239491 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!239495 #b00000000000000000000000000000000 (index!20053 lt!239496) (x!49035 lt!239496) mask!3524))))

(declare-fun res!320131 () Bool)

(declare-fun lt!239497 () (_ BitVec 64))

(declare-fun lt!239494 () array!33284)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33284 (_ BitVec 32)) SeekEntryResult!4462)

(assert (=> b!522357 (= res!320131 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239495 lt!239497 lt!239494 mask!3524) (Intermediate!4462 false (index!20053 lt!239496) (x!49035 lt!239496))))))

(declare-fun e!304639 () Bool)

(assert (=> b!522357 (=> (not res!320131) (not e!304639))))

(assert (=> b!522357 e!304639))

(declare-fun b!522358 () Bool)

(declare-fun res!320136 () Bool)

(declare-fun e!304636 () Bool)

(assert (=> b!522358 (=> (not res!320136) (not e!304636))))

(assert (=> b!522358 (= res!320136 (and (= (size!16363 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16363 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16363 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!522360 () Bool)

(declare-fun e!304640 () Bool)

(assert (=> b!522360 (= e!304636 e!304640)))

(declare-fun res!320127 () Bool)

(assert (=> b!522360 (=> (not res!320127) (not e!304640))))

(declare-fun lt!239490 () SeekEntryResult!4462)

(assert (=> b!522360 (= res!320127 (or (= lt!239490 (MissingZero!4462 i!1204)) (= lt!239490 (MissingVacant!4462 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33284 (_ BitVec 32)) SeekEntryResult!4462)

(assert (=> b!522360 (= lt!239490 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!522361 () Bool)

(declare-fun res!320133 () Bool)

(assert (=> b!522361 (=> (not res!320133) (not e!304640))))

(declare-datatypes ((List!10195 0))(
  ( (Nil!10192) (Cons!10191 (h!11113 (_ BitVec 64)) (t!16414 List!10195)) )
))
(declare-fun arrayNoDuplicates!0 (array!33284 (_ BitVec 32) List!10195) Bool)

(assert (=> b!522361 (= res!320133 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10192))))

(declare-fun b!522362 () Bool)

(declare-fun e!304638 () Bool)

(assert (=> b!522362 (= e!304638 (= (seekEntryOrOpen!0 (select (arr!15998 a!3235) j!176) a!3235 mask!3524) (Found!4462 j!176)))))

(declare-fun b!522363 () Bool)

(declare-fun res!320128 () Bool)

(assert (=> b!522363 (=> (not res!320128) (not e!304636))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!522363 (= res!320128 (validKeyInArray!0 k0!2280))))

(declare-fun b!522364 () Bool)

(declare-fun Unit!16297 () Unit!16294)

(assert (=> b!522364 (= e!304635 Unit!16297)))

(declare-fun b!522365 () Bool)

(declare-fun res!320132 () Bool)

(declare-fun e!304637 () Bool)

(assert (=> b!522365 (=> res!320132 e!304637)))

(get-info :version)

(assert (=> b!522365 (= res!320132 (or (undefined!5274 lt!239496) (not ((_ is Intermediate!4462) lt!239496))))))

(declare-fun b!522366 () Bool)

(declare-fun res!320134 () Bool)

(assert (=> b!522366 (=> (not res!320134) (not e!304636))))

(declare-fun arrayContainsKey!0 (array!33284 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!522366 (= res!320134 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!522367 () Bool)

(declare-fun res!320137 () Bool)

(assert (=> b!522367 (=> (not res!320137) (not e!304640))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33284 (_ BitVec 32)) Bool)

(assert (=> b!522367 (= res!320137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!522368 () Bool)

(assert (=> b!522368 (= e!304637 (bvsle #b00000000000000000000000000000000 (x!49035 lt!239496)))))

(assert (=> b!522368 (and (or (= (select (arr!15998 a!3235) (index!20053 lt!239496)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15998 a!3235) (index!20053 lt!239496)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15998 a!3235) (index!20053 lt!239496)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15998 a!3235) (index!20053 lt!239496)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!239492 () Unit!16294)

(assert (=> b!522368 (= lt!239492 e!304635)))

(declare-fun c!61416 () Bool)

(assert (=> b!522368 (= c!61416 (= (select (arr!15998 a!3235) (index!20053 lt!239496)) (select (arr!15998 a!3235) j!176)))))

(assert (=> b!522368 (and (bvslt (x!49035 lt!239496) #b01111111111111111111111111111110) (or (= (select (arr!15998 a!3235) (index!20053 lt!239496)) (select (arr!15998 a!3235) j!176)) (= (select (arr!15998 a!3235) (index!20053 lt!239496)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15998 a!3235) (index!20053 lt!239496)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!522369 () Bool)

(assert (=> b!522369 (= e!304640 (not e!304637))))

(declare-fun res!320138 () Bool)

(assert (=> b!522369 (=> res!320138 e!304637)))

(declare-fun lt!239489 () (_ BitVec 32))

(assert (=> b!522369 (= res!320138 (= lt!239496 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239489 lt!239497 lt!239494 mask!3524)))))

(assert (=> b!522369 (= lt!239496 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239495 (select (arr!15998 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!522369 (= lt!239489 (toIndex!0 lt!239497 mask!3524))))

(assert (=> b!522369 (= lt!239497 (select (store (arr!15998 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!522369 (= lt!239495 (toIndex!0 (select (arr!15998 a!3235) j!176) mask!3524))))

(assert (=> b!522369 (= lt!239494 (array!33285 (store (arr!15998 a!3235) i!1204 k0!2280) (size!16363 a!3235)))))

(assert (=> b!522369 e!304638))

(declare-fun res!320130 () Bool)

(assert (=> b!522369 (=> (not res!320130) (not e!304638))))

(assert (=> b!522369 (= res!320130 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!239493 () Unit!16294)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33284 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16294)

(assert (=> b!522369 (= lt!239493 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!522370 () Bool)

(declare-fun res!320135 () Bool)

(assert (=> b!522370 (=> (not res!320135) (not e!304636))))

(assert (=> b!522370 (= res!320135 (validKeyInArray!0 (select (arr!15998 a!3235) j!176)))))

(declare-fun b!522359 () Bool)

(assert (=> b!522359 (= e!304639 false)))

(declare-fun res!320129 () Bool)

(assert (=> start!47448 (=> (not res!320129) (not e!304636))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47448 (= res!320129 (validMask!0 mask!3524))))

(assert (=> start!47448 e!304636))

(assert (=> start!47448 true))

(declare-fun array_inv!11881 (array!33284) Bool)

(assert (=> start!47448 (array_inv!11881 a!3235)))

(assert (= (and start!47448 res!320129) b!522358))

(assert (= (and b!522358 res!320136) b!522370))

(assert (= (and b!522370 res!320135) b!522363))

(assert (= (and b!522363 res!320128) b!522366))

(assert (= (and b!522366 res!320134) b!522360))

(assert (= (and b!522360 res!320127) b!522367))

(assert (= (and b!522367 res!320137) b!522361))

(assert (= (and b!522361 res!320133) b!522369))

(assert (= (and b!522369 res!320130) b!522362))

(assert (= (and b!522369 (not res!320138)) b!522365))

(assert (= (and b!522365 (not res!320132)) b!522368))

(assert (= (and b!522368 c!61416) b!522357))

(assert (= (and b!522368 (not c!61416)) b!522364))

(assert (= (and b!522357 res!320131) b!522359))

(declare-fun m!502789 () Bool)

(assert (=> b!522362 m!502789))

(assert (=> b!522362 m!502789))

(declare-fun m!502791 () Bool)

(assert (=> b!522362 m!502791))

(assert (=> b!522370 m!502789))

(assert (=> b!522370 m!502789))

(declare-fun m!502793 () Bool)

(assert (=> b!522370 m!502793))

(declare-fun m!502795 () Bool)

(assert (=> start!47448 m!502795))

(declare-fun m!502797 () Bool)

(assert (=> start!47448 m!502797))

(declare-fun m!502799 () Bool)

(assert (=> b!522357 m!502799))

(declare-fun m!502801 () Bool)

(assert (=> b!522357 m!502801))

(declare-fun m!502803 () Bool)

(assert (=> b!522369 m!502803))

(declare-fun m!502805 () Bool)

(assert (=> b!522369 m!502805))

(declare-fun m!502807 () Bool)

(assert (=> b!522369 m!502807))

(declare-fun m!502809 () Bool)

(assert (=> b!522369 m!502809))

(declare-fun m!502811 () Bool)

(assert (=> b!522369 m!502811))

(assert (=> b!522369 m!502789))

(declare-fun m!502813 () Bool)

(assert (=> b!522369 m!502813))

(assert (=> b!522369 m!502789))

(declare-fun m!502815 () Bool)

(assert (=> b!522369 m!502815))

(assert (=> b!522369 m!502789))

(declare-fun m!502817 () Bool)

(assert (=> b!522369 m!502817))

(declare-fun m!502819 () Bool)

(assert (=> b!522368 m!502819))

(assert (=> b!522368 m!502789))

(declare-fun m!502821 () Bool)

(assert (=> b!522367 m!502821))

(declare-fun m!502823 () Bool)

(assert (=> b!522363 m!502823))

(declare-fun m!502825 () Bool)

(assert (=> b!522361 m!502825))

(declare-fun m!502827 () Bool)

(assert (=> b!522360 m!502827))

(declare-fun m!502829 () Bool)

(assert (=> b!522366 m!502829))

(check-sat (not b!522366) (not b!522370) (not b!522360) (not b!522369) (not start!47448) (not b!522363) (not b!522367) (not b!522361) (not b!522357) (not b!522362))
(check-sat)
(get-model)

(declare-fun d!80209 () Bool)

(assert (=> d!80209 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!522363 d!80209))

(declare-fun b!522473 () Bool)

(declare-fun e!304696 () SeekEntryResult!4462)

(assert (=> b!522473 (= e!304696 (Intermediate!4462 false lt!239495 #b00000000000000000000000000000000))))

(declare-fun b!522474 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!522474 (= e!304696 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!239495 #b00000000000000000000000000000000 mask!3524) (select (arr!15998 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!522475 () Bool)

(declare-fun lt!239557 () SeekEntryResult!4462)

(assert (=> b!522475 (and (bvsge (index!20053 lt!239557) #b00000000000000000000000000000000) (bvslt (index!20053 lt!239557) (size!16363 a!3235)))))

(declare-fun e!304697 () Bool)

(assert (=> b!522475 (= e!304697 (= (select (arr!15998 a!3235) (index!20053 lt!239557)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!522476 () Bool)

(assert (=> b!522476 (and (bvsge (index!20053 lt!239557) #b00000000000000000000000000000000) (bvslt (index!20053 lt!239557) (size!16363 a!3235)))))

(declare-fun res!320217 () Bool)

(assert (=> b!522476 (= res!320217 (= (select (arr!15998 a!3235) (index!20053 lt!239557)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!522476 (=> res!320217 e!304697)))

(declare-fun d!80211 () Bool)

(declare-fun e!304694 () Bool)

(assert (=> d!80211 e!304694))

(declare-fun c!61431 () Bool)

(assert (=> d!80211 (= c!61431 (and ((_ is Intermediate!4462) lt!239557) (undefined!5274 lt!239557)))))

(declare-fun e!304698 () SeekEntryResult!4462)

(assert (=> d!80211 (= lt!239557 e!304698)))

(declare-fun c!61430 () Bool)

(assert (=> d!80211 (= c!61430 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!239556 () (_ BitVec 64))

(assert (=> d!80211 (= lt!239556 (select (arr!15998 a!3235) lt!239495))))

(assert (=> d!80211 (validMask!0 mask!3524)))

(assert (=> d!80211 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239495 (select (arr!15998 a!3235) j!176) a!3235 mask!3524) lt!239557)))

(declare-fun b!522477 () Bool)

(assert (=> b!522477 (= e!304698 e!304696)))

(declare-fun c!61429 () Bool)

(assert (=> b!522477 (= c!61429 (or (= lt!239556 (select (arr!15998 a!3235) j!176)) (= (bvadd lt!239556 lt!239556) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!522478 () Bool)

(declare-fun e!304695 () Bool)

(assert (=> b!522478 (= e!304694 e!304695)))

(declare-fun res!320219 () Bool)

(assert (=> b!522478 (= res!320219 (and ((_ is Intermediate!4462) lt!239557) (not (undefined!5274 lt!239557)) (bvslt (x!49035 lt!239557) #b01111111111111111111111111111110) (bvsge (x!49035 lt!239557) #b00000000000000000000000000000000) (bvsge (x!49035 lt!239557) #b00000000000000000000000000000000)))))

(assert (=> b!522478 (=> (not res!320219) (not e!304695))))

(declare-fun b!522479 () Bool)

(assert (=> b!522479 (and (bvsge (index!20053 lt!239557) #b00000000000000000000000000000000) (bvslt (index!20053 lt!239557) (size!16363 a!3235)))))

(declare-fun res!320218 () Bool)

(assert (=> b!522479 (= res!320218 (= (select (arr!15998 a!3235) (index!20053 lt!239557)) (select (arr!15998 a!3235) j!176)))))

(assert (=> b!522479 (=> res!320218 e!304697)))

(assert (=> b!522479 (= e!304695 e!304697)))

(declare-fun b!522480 () Bool)

(assert (=> b!522480 (= e!304694 (bvsge (x!49035 lt!239557) #b01111111111111111111111111111110))))

(declare-fun b!522481 () Bool)

(assert (=> b!522481 (= e!304698 (Intermediate!4462 true lt!239495 #b00000000000000000000000000000000))))

(assert (= (and d!80211 c!61430) b!522481))

(assert (= (and d!80211 (not c!61430)) b!522477))

(assert (= (and b!522477 c!61429) b!522473))

(assert (= (and b!522477 (not c!61429)) b!522474))

(assert (= (and d!80211 c!61431) b!522480))

(assert (= (and d!80211 (not c!61431)) b!522478))

(assert (= (and b!522478 res!320219) b!522479))

(assert (= (and b!522479 (not res!320218)) b!522476))

(assert (= (and b!522476 (not res!320217)) b!522475))

(declare-fun m!502915 () Bool)

(assert (=> b!522475 m!502915))

(declare-fun m!502917 () Bool)

(assert (=> d!80211 m!502917))

(assert (=> d!80211 m!502795))

(assert (=> b!522476 m!502915))

(assert (=> b!522479 m!502915))

(declare-fun m!502919 () Bool)

(assert (=> b!522474 m!502919))

(assert (=> b!522474 m!502919))

(assert (=> b!522474 m!502789))

(declare-fun m!502921 () Bool)

(assert (=> b!522474 m!502921))

(assert (=> b!522369 d!80211))

(declare-fun d!80213 () Bool)

(declare-fun lt!239563 () (_ BitVec 32))

(declare-fun lt!239562 () (_ BitVec 32))

(assert (=> d!80213 (= lt!239563 (bvmul (bvxor lt!239562 (bvlshr lt!239562 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80213 (= lt!239562 ((_ extract 31 0) (bvand (bvxor (select (arr!15998 a!3235) j!176) (bvlshr (select (arr!15998 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80213 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!320220 (let ((h!11116 ((_ extract 31 0) (bvand (bvxor (select (arr!15998 a!3235) j!176) (bvlshr (select (arr!15998 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49039 (bvmul (bvxor h!11116 (bvlshr h!11116 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49039 (bvlshr x!49039 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!320220 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!320220 #b00000000000000000000000000000000))))))

(assert (=> d!80213 (= (toIndex!0 (select (arr!15998 a!3235) j!176) mask!3524) (bvand (bvxor lt!239563 (bvlshr lt!239563 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!522369 d!80213))

(declare-fun b!522490 () Bool)

(declare-fun e!304706 () Bool)

(declare-fun e!304705 () Bool)

(assert (=> b!522490 (= e!304706 e!304705)))

(declare-fun lt!239572 () (_ BitVec 64))

(assert (=> b!522490 (= lt!239572 (select (arr!15998 a!3235) j!176))))

(declare-fun lt!239570 () Unit!16294)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33284 (_ BitVec 64) (_ BitVec 32)) Unit!16294)

(assert (=> b!522490 (= lt!239570 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!239572 j!176))))

(assert (=> b!522490 (arrayContainsKey!0 a!3235 lt!239572 #b00000000000000000000000000000000)))

(declare-fun lt!239571 () Unit!16294)

(assert (=> b!522490 (= lt!239571 lt!239570)))

(declare-fun res!320226 () Bool)

(assert (=> b!522490 (= res!320226 (= (seekEntryOrOpen!0 (select (arr!15998 a!3235) j!176) a!3235 mask!3524) (Found!4462 j!176)))))

(assert (=> b!522490 (=> (not res!320226) (not e!304705))))

(declare-fun b!522491 () Bool)

(declare-fun call!31786 () Bool)

(assert (=> b!522491 (= e!304706 call!31786)))

(declare-fun b!522492 () Bool)

(declare-fun e!304707 () Bool)

(assert (=> b!522492 (= e!304707 e!304706)))

(declare-fun c!61434 () Bool)

(assert (=> b!522492 (= c!61434 (validKeyInArray!0 (select (arr!15998 a!3235) j!176)))))

(declare-fun bm!31783 () Bool)

(assert (=> bm!31783 (= call!31786 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!80215 () Bool)

(declare-fun res!320225 () Bool)

(assert (=> d!80215 (=> res!320225 e!304707)))

(assert (=> d!80215 (= res!320225 (bvsge j!176 (size!16363 a!3235)))))

(assert (=> d!80215 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!304707)))

(declare-fun b!522493 () Bool)

(assert (=> b!522493 (= e!304705 call!31786)))

(assert (= (and d!80215 (not res!320225)) b!522492))

(assert (= (and b!522492 c!61434) b!522490))

(assert (= (and b!522492 (not c!61434)) b!522491))

(assert (= (and b!522490 res!320226) b!522493))

(assert (= (or b!522493 b!522491) bm!31783))

(assert (=> b!522490 m!502789))

(declare-fun m!502923 () Bool)

(assert (=> b!522490 m!502923))

(declare-fun m!502925 () Bool)

(assert (=> b!522490 m!502925))

(assert (=> b!522490 m!502789))

(assert (=> b!522490 m!502791))

(assert (=> b!522492 m!502789))

(assert (=> b!522492 m!502789))

(assert (=> b!522492 m!502793))

(declare-fun m!502927 () Bool)

(assert (=> bm!31783 m!502927))

(assert (=> b!522369 d!80215))

(declare-fun d!80219 () Bool)

(declare-fun lt!239574 () (_ BitVec 32))

(declare-fun lt!239573 () (_ BitVec 32))

(assert (=> d!80219 (= lt!239574 (bvmul (bvxor lt!239573 (bvlshr lt!239573 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80219 (= lt!239573 ((_ extract 31 0) (bvand (bvxor lt!239497 (bvlshr lt!239497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80219 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!320220 (let ((h!11116 ((_ extract 31 0) (bvand (bvxor lt!239497 (bvlshr lt!239497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49039 (bvmul (bvxor h!11116 (bvlshr h!11116 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49039 (bvlshr x!49039 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!320220 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!320220 #b00000000000000000000000000000000))))))

(assert (=> d!80219 (= (toIndex!0 lt!239497 mask!3524) (bvand (bvxor lt!239574 (bvlshr lt!239574 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!522369 d!80219))

(declare-fun d!80221 () Bool)

(assert (=> d!80221 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!239577 () Unit!16294)

(declare-fun choose!38 (array!33284 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16294)

(assert (=> d!80221 (= lt!239577 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!80221 (validMask!0 mask!3524)))

(assert (=> d!80221 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!239577)))

(declare-fun bs!16408 () Bool)

(assert (= bs!16408 d!80221))

(assert (=> bs!16408 m!502817))

(declare-fun m!502929 () Bool)

(assert (=> bs!16408 m!502929))

(assert (=> bs!16408 m!502795))

(assert (=> b!522369 d!80221))

(declare-fun b!522494 () Bool)

(declare-fun e!304710 () SeekEntryResult!4462)

(assert (=> b!522494 (= e!304710 (Intermediate!4462 false lt!239489 #b00000000000000000000000000000000))))

(declare-fun b!522495 () Bool)

(assert (=> b!522495 (= e!304710 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!239489 #b00000000000000000000000000000000 mask!3524) lt!239497 lt!239494 mask!3524))))

(declare-fun b!522496 () Bool)

(declare-fun lt!239579 () SeekEntryResult!4462)

(assert (=> b!522496 (and (bvsge (index!20053 lt!239579) #b00000000000000000000000000000000) (bvslt (index!20053 lt!239579) (size!16363 lt!239494)))))

(declare-fun e!304711 () Bool)

(assert (=> b!522496 (= e!304711 (= (select (arr!15998 lt!239494) (index!20053 lt!239579)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!522497 () Bool)

(assert (=> b!522497 (and (bvsge (index!20053 lt!239579) #b00000000000000000000000000000000) (bvslt (index!20053 lt!239579) (size!16363 lt!239494)))))

(declare-fun res!320227 () Bool)

(assert (=> b!522497 (= res!320227 (= (select (arr!15998 lt!239494) (index!20053 lt!239579)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!522497 (=> res!320227 e!304711)))

(declare-fun d!80223 () Bool)

(declare-fun e!304708 () Bool)

(assert (=> d!80223 e!304708))

(declare-fun c!61437 () Bool)

(assert (=> d!80223 (= c!61437 (and ((_ is Intermediate!4462) lt!239579) (undefined!5274 lt!239579)))))

(declare-fun e!304712 () SeekEntryResult!4462)

(assert (=> d!80223 (= lt!239579 e!304712)))

(declare-fun c!61436 () Bool)

(assert (=> d!80223 (= c!61436 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!239578 () (_ BitVec 64))

(assert (=> d!80223 (= lt!239578 (select (arr!15998 lt!239494) lt!239489))))

(assert (=> d!80223 (validMask!0 mask!3524)))

(assert (=> d!80223 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239489 lt!239497 lt!239494 mask!3524) lt!239579)))

(declare-fun b!522498 () Bool)

(assert (=> b!522498 (= e!304712 e!304710)))

(declare-fun c!61435 () Bool)

(assert (=> b!522498 (= c!61435 (or (= lt!239578 lt!239497) (= (bvadd lt!239578 lt!239578) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!522499 () Bool)

(declare-fun e!304709 () Bool)

(assert (=> b!522499 (= e!304708 e!304709)))

(declare-fun res!320229 () Bool)

(assert (=> b!522499 (= res!320229 (and ((_ is Intermediate!4462) lt!239579) (not (undefined!5274 lt!239579)) (bvslt (x!49035 lt!239579) #b01111111111111111111111111111110) (bvsge (x!49035 lt!239579) #b00000000000000000000000000000000) (bvsge (x!49035 lt!239579) #b00000000000000000000000000000000)))))

(assert (=> b!522499 (=> (not res!320229) (not e!304709))))

(declare-fun b!522500 () Bool)

(assert (=> b!522500 (and (bvsge (index!20053 lt!239579) #b00000000000000000000000000000000) (bvslt (index!20053 lt!239579) (size!16363 lt!239494)))))

(declare-fun res!320228 () Bool)

(assert (=> b!522500 (= res!320228 (= (select (arr!15998 lt!239494) (index!20053 lt!239579)) lt!239497))))

(assert (=> b!522500 (=> res!320228 e!304711)))

(assert (=> b!522500 (= e!304709 e!304711)))

(declare-fun b!522501 () Bool)

(assert (=> b!522501 (= e!304708 (bvsge (x!49035 lt!239579) #b01111111111111111111111111111110))))

(declare-fun b!522502 () Bool)

(assert (=> b!522502 (= e!304712 (Intermediate!4462 true lt!239489 #b00000000000000000000000000000000))))

(assert (= (and d!80223 c!61436) b!522502))

(assert (= (and d!80223 (not c!61436)) b!522498))

(assert (= (and b!522498 c!61435) b!522494))

(assert (= (and b!522498 (not c!61435)) b!522495))

(assert (= (and d!80223 c!61437) b!522501))

(assert (= (and d!80223 (not c!61437)) b!522499))

(assert (= (and b!522499 res!320229) b!522500))

(assert (= (and b!522500 (not res!320228)) b!522497))

(assert (= (and b!522497 (not res!320227)) b!522496))

(declare-fun m!502931 () Bool)

(assert (=> b!522496 m!502931))

(declare-fun m!502933 () Bool)

(assert (=> d!80223 m!502933))

(assert (=> d!80223 m!502795))

(assert (=> b!522497 m!502931))

(assert (=> b!522500 m!502931))

(declare-fun m!502935 () Bool)

(assert (=> b!522495 m!502935))

(assert (=> b!522495 m!502935))

(declare-fun m!502937 () Bool)

(assert (=> b!522495 m!502937))

(assert (=> b!522369 d!80223))

(declare-fun d!80227 () Bool)

(assert (=> d!80227 (= (validKeyInArray!0 (select (arr!15998 a!3235) j!176)) (and (not (= (select (arr!15998 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15998 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!522370 d!80227))

(declare-fun b!522533 () Bool)

(declare-fun lt!239594 () SeekEntryResult!4462)

(declare-fun e!304733 () SeekEntryResult!4462)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33284 (_ BitVec 32)) SeekEntryResult!4462)

(assert (=> b!522533 (= e!304733 (seekKeyOrZeroReturnVacant!0 (x!49035 lt!239594) (index!20053 lt!239594) (index!20053 lt!239594) k0!2280 a!3235 mask!3524))))

(declare-fun b!522534 () Bool)

(assert (=> b!522534 (= e!304733 (MissingZero!4462 (index!20053 lt!239594)))))

(declare-fun b!522535 () Bool)

(declare-fun e!304731 () SeekEntryResult!4462)

(assert (=> b!522535 (= e!304731 Undefined!4462)))

(declare-fun b!522536 () Bool)

(declare-fun c!61452 () Bool)

(declare-fun lt!239592 () (_ BitVec 64))

(assert (=> b!522536 (= c!61452 (= lt!239592 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!304732 () SeekEntryResult!4462)

(assert (=> b!522536 (= e!304732 e!304733)))

(declare-fun d!80229 () Bool)

(declare-fun lt!239593 () SeekEntryResult!4462)

(assert (=> d!80229 (and (or ((_ is Undefined!4462) lt!239593) (not ((_ is Found!4462) lt!239593)) (and (bvsge (index!20052 lt!239593) #b00000000000000000000000000000000) (bvslt (index!20052 lt!239593) (size!16363 a!3235)))) (or ((_ is Undefined!4462) lt!239593) ((_ is Found!4462) lt!239593) (not ((_ is MissingZero!4462) lt!239593)) (and (bvsge (index!20051 lt!239593) #b00000000000000000000000000000000) (bvslt (index!20051 lt!239593) (size!16363 a!3235)))) (or ((_ is Undefined!4462) lt!239593) ((_ is Found!4462) lt!239593) ((_ is MissingZero!4462) lt!239593) (not ((_ is MissingVacant!4462) lt!239593)) (and (bvsge (index!20054 lt!239593) #b00000000000000000000000000000000) (bvslt (index!20054 lt!239593) (size!16363 a!3235)))) (or ((_ is Undefined!4462) lt!239593) (ite ((_ is Found!4462) lt!239593) (= (select (arr!15998 a!3235) (index!20052 lt!239593)) k0!2280) (ite ((_ is MissingZero!4462) lt!239593) (= (select (arr!15998 a!3235) (index!20051 lt!239593)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4462) lt!239593) (= (select (arr!15998 a!3235) (index!20054 lt!239593)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80229 (= lt!239593 e!304731)))

(declare-fun c!61451 () Bool)

(assert (=> d!80229 (= c!61451 (and ((_ is Intermediate!4462) lt!239594) (undefined!5274 lt!239594)))))

(assert (=> d!80229 (= lt!239594 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!80229 (validMask!0 mask!3524)))

(assert (=> d!80229 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!239593)))

(declare-fun b!522537 () Bool)

(assert (=> b!522537 (= e!304732 (Found!4462 (index!20053 lt!239594)))))

(declare-fun b!522538 () Bool)

(assert (=> b!522538 (= e!304731 e!304732)))

(assert (=> b!522538 (= lt!239592 (select (arr!15998 a!3235) (index!20053 lt!239594)))))

(declare-fun c!61450 () Bool)

(assert (=> b!522538 (= c!61450 (= lt!239592 k0!2280))))

(assert (= (and d!80229 c!61451) b!522535))

(assert (= (and d!80229 (not c!61451)) b!522538))

(assert (= (and b!522538 c!61450) b!522537))

(assert (= (and b!522538 (not c!61450)) b!522536))

(assert (= (and b!522536 c!61452) b!522534))

(assert (= (and b!522536 (not c!61452)) b!522533))

(declare-fun m!502943 () Bool)

(assert (=> b!522533 m!502943))

(declare-fun m!502945 () Bool)

(assert (=> d!80229 m!502945))

(declare-fun m!502947 () Bool)

(assert (=> d!80229 m!502947))

(assert (=> d!80229 m!502795))

(assert (=> d!80229 m!502945))

(declare-fun m!502949 () Bool)

(assert (=> d!80229 m!502949))

(declare-fun m!502951 () Bool)

(assert (=> d!80229 m!502951))

(declare-fun m!502953 () Bool)

(assert (=> d!80229 m!502953))

(declare-fun m!502955 () Bool)

(assert (=> b!522538 m!502955))

(assert (=> b!522360 d!80229))

(declare-fun d!80239 () Bool)

(declare-fun res!320240 () Bool)

(declare-fun e!304747 () Bool)

(assert (=> d!80239 (=> res!320240 e!304747)))

(assert (=> d!80239 (= res!320240 (= (select (arr!15998 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!80239 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!304747)))

(declare-fun b!522561 () Bool)

(declare-fun e!304748 () Bool)

(assert (=> b!522561 (= e!304747 e!304748)))

(declare-fun res!320241 () Bool)

(assert (=> b!522561 (=> (not res!320241) (not e!304748))))

(assert (=> b!522561 (= res!320241 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16363 a!3235)))))

(declare-fun b!522562 () Bool)

(assert (=> b!522562 (= e!304748 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!80239 (not res!320240)) b!522561))

(assert (= (and b!522561 res!320241) b!522562))

(declare-fun m!502969 () Bool)

(assert (=> d!80239 m!502969))

(declare-fun m!502971 () Bool)

(assert (=> b!522562 m!502971))

(assert (=> b!522366 d!80239))

(declare-fun b!522587 () Bool)

(declare-fun e!304767 () Bool)

(declare-fun e!304768 () Bool)

(assert (=> b!522587 (= e!304767 e!304768)))

(declare-fun res!320253 () Bool)

(assert (=> b!522587 (=> (not res!320253) (not e!304768))))

(declare-fun e!304766 () Bool)

(assert (=> b!522587 (= res!320253 (not e!304766))))

(declare-fun res!320254 () Bool)

(assert (=> b!522587 (=> (not res!320254) (not e!304766))))

(assert (=> b!522587 (= res!320254 (validKeyInArray!0 (select (arr!15998 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!522588 () Bool)

(declare-fun contains!2746 (List!10195 (_ BitVec 64)) Bool)

(assert (=> b!522588 (= e!304766 (contains!2746 Nil!10192 (select (arr!15998 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31788 () Bool)

(declare-fun call!31791 () Bool)

(declare-fun c!61469 () Bool)

(assert (=> bm!31788 (= call!31791 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!61469 (Cons!10191 (select (arr!15998 a!3235) #b00000000000000000000000000000000) Nil!10192) Nil!10192)))))

(declare-fun b!522589 () Bool)

(declare-fun e!304769 () Bool)

(assert (=> b!522589 (= e!304769 call!31791)))

(declare-fun d!80243 () Bool)

(declare-fun res!320252 () Bool)

(assert (=> d!80243 (=> res!320252 e!304767)))

(assert (=> d!80243 (= res!320252 (bvsge #b00000000000000000000000000000000 (size!16363 a!3235)))))

(assert (=> d!80243 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10192) e!304767)))

(declare-fun b!522590 () Bool)

(assert (=> b!522590 (= e!304768 e!304769)))

(assert (=> b!522590 (= c!61469 (validKeyInArray!0 (select (arr!15998 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!522591 () Bool)

(assert (=> b!522591 (= e!304769 call!31791)))

(assert (= (and d!80243 (not res!320252)) b!522587))

(assert (= (and b!522587 res!320254) b!522588))

(assert (= (and b!522587 res!320253) b!522590))

(assert (= (and b!522590 c!61469) b!522589))

(assert (= (and b!522590 (not c!61469)) b!522591))

(assert (= (or b!522589 b!522591) bm!31788))

(assert (=> b!522587 m!502969))

(assert (=> b!522587 m!502969))

(declare-fun m!502987 () Bool)

(assert (=> b!522587 m!502987))

(assert (=> b!522588 m!502969))

(assert (=> b!522588 m!502969))

(declare-fun m!502989 () Bool)

(assert (=> b!522588 m!502989))

(assert (=> bm!31788 m!502969))

(declare-fun m!502991 () Bool)

(assert (=> bm!31788 m!502991))

(assert (=> b!522590 m!502969))

(assert (=> b!522590 m!502969))

(assert (=> b!522590 m!502987))

(assert (=> b!522361 d!80243))

(declare-fun b!522596 () Bool)

(declare-fun e!304774 () Bool)

(declare-fun e!304773 () Bool)

(assert (=> b!522596 (= e!304774 e!304773)))

(declare-fun lt!239618 () (_ BitVec 64))

(assert (=> b!522596 (= lt!239618 (select (arr!15998 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!239616 () Unit!16294)

(assert (=> b!522596 (= lt!239616 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!239618 #b00000000000000000000000000000000))))

(assert (=> b!522596 (arrayContainsKey!0 a!3235 lt!239618 #b00000000000000000000000000000000)))

(declare-fun lt!239617 () Unit!16294)

(assert (=> b!522596 (= lt!239617 lt!239616)))

(declare-fun res!320258 () Bool)

(assert (=> b!522596 (= res!320258 (= (seekEntryOrOpen!0 (select (arr!15998 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4462 #b00000000000000000000000000000000)))))

(assert (=> b!522596 (=> (not res!320258) (not e!304773))))

(declare-fun b!522597 () Bool)

(declare-fun call!31793 () Bool)

(assert (=> b!522597 (= e!304774 call!31793)))

(declare-fun b!522598 () Bool)

(declare-fun e!304775 () Bool)

(assert (=> b!522598 (= e!304775 e!304774)))

(declare-fun c!61471 () Bool)

(assert (=> b!522598 (= c!61471 (validKeyInArray!0 (select (arr!15998 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31790 () Bool)

(assert (=> bm!31790 (= call!31793 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!80247 () Bool)

(declare-fun res!320257 () Bool)

(assert (=> d!80247 (=> res!320257 e!304775)))

(assert (=> d!80247 (= res!320257 (bvsge #b00000000000000000000000000000000 (size!16363 a!3235)))))

(assert (=> d!80247 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!304775)))

(declare-fun b!522599 () Bool)

(assert (=> b!522599 (= e!304773 call!31793)))

(assert (= (and d!80247 (not res!320257)) b!522598))

(assert (= (and b!522598 c!61471) b!522596))

(assert (= (and b!522598 (not c!61471)) b!522597))

(assert (= (and b!522596 res!320258) b!522599))

(assert (= (or b!522599 b!522597) bm!31790))

(assert (=> b!522596 m!502969))

(declare-fun m!503005 () Bool)

(assert (=> b!522596 m!503005))

(declare-fun m!503007 () Bool)

(assert (=> b!522596 m!503007))

(assert (=> b!522596 m!502969))

(declare-fun m!503009 () Bool)

(assert (=> b!522596 m!503009))

(assert (=> b!522598 m!502969))

(assert (=> b!522598 m!502969))

(assert (=> b!522598 m!502987))

(declare-fun m!503011 () Bool)

(assert (=> bm!31790 m!503011))

(assert (=> b!522367 d!80247))

(declare-fun e!304778 () SeekEntryResult!4462)

(declare-fun b!522600 () Bool)

(declare-fun lt!239621 () SeekEntryResult!4462)

(assert (=> b!522600 (= e!304778 (seekKeyOrZeroReturnVacant!0 (x!49035 lt!239621) (index!20053 lt!239621) (index!20053 lt!239621) (select (arr!15998 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!522601 () Bool)

(assert (=> b!522601 (= e!304778 (MissingZero!4462 (index!20053 lt!239621)))))

(declare-fun b!522602 () Bool)

(declare-fun e!304776 () SeekEntryResult!4462)

(assert (=> b!522602 (= e!304776 Undefined!4462)))

(declare-fun b!522603 () Bool)

(declare-fun c!61474 () Bool)

(declare-fun lt!239619 () (_ BitVec 64))

(assert (=> b!522603 (= c!61474 (= lt!239619 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!304777 () SeekEntryResult!4462)

(assert (=> b!522603 (= e!304777 e!304778)))

(declare-fun d!80251 () Bool)

(declare-fun lt!239620 () SeekEntryResult!4462)

(assert (=> d!80251 (and (or ((_ is Undefined!4462) lt!239620) (not ((_ is Found!4462) lt!239620)) (and (bvsge (index!20052 lt!239620) #b00000000000000000000000000000000) (bvslt (index!20052 lt!239620) (size!16363 a!3235)))) (or ((_ is Undefined!4462) lt!239620) ((_ is Found!4462) lt!239620) (not ((_ is MissingZero!4462) lt!239620)) (and (bvsge (index!20051 lt!239620) #b00000000000000000000000000000000) (bvslt (index!20051 lt!239620) (size!16363 a!3235)))) (or ((_ is Undefined!4462) lt!239620) ((_ is Found!4462) lt!239620) ((_ is MissingZero!4462) lt!239620) (not ((_ is MissingVacant!4462) lt!239620)) (and (bvsge (index!20054 lt!239620) #b00000000000000000000000000000000) (bvslt (index!20054 lt!239620) (size!16363 a!3235)))) (or ((_ is Undefined!4462) lt!239620) (ite ((_ is Found!4462) lt!239620) (= (select (arr!15998 a!3235) (index!20052 lt!239620)) (select (arr!15998 a!3235) j!176)) (ite ((_ is MissingZero!4462) lt!239620) (= (select (arr!15998 a!3235) (index!20051 lt!239620)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4462) lt!239620) (= (select (arr!15998 a!3235) (index!20054 lt!239620)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80251 (= lt!239620 e!304776)))

(declare-fun c!61473 () Bool)

(assert (=> d!80251 (= c!61473 (and ((_ is Intermediate!4462) lt!239621) (undefined!5274 lt!239621)))))

(assert (=> d!80251 (= lt!239621 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15998 a!3235) j!176) mask!3524) (select (arr!15998 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!80251 (validMask!0 mask!3524)))

(assert (=> d!80251 (= (seekEntryOrOpen!0 (select (arr!15998 a!3235) j!176) a!3235 mask!3524) lt!239620)))

(declare-fun b!522604 () Bool)

(assert (=> b!522604 (= e!304777 (Found!4462 (index!20053 lt!239621)))))

(declare-fun b!522605 () Bool)

(assert (=> b!522605 (= e!304776 e!304777)))

(assert (=> b!522605 (= lt!239619 (select (arr!15998 a!3235) (index!20053 lt!239621)))))

(declare-fun c!61472 () Bool)

(assert (=> b!522605 (= c!61472 (= lt!239619 (select (arr!15998 a!3235) j!176)))))

(assert (= (and d!80251 c!61473) b!522602))

(assert (= (and d!80251 (not c!61473)) b!522605))

(assert (= (and b!522605 c!61472) b!522604))

(assert (= (and b!522605 (not c!61472)) b!522603))

(assert (= (and b!522603 c!61474) b!522601))

(assert (= (and b!522603 (not c!61474)) b!522600))

(assert (=> b!522600 m!502789))

(declare-fun m!503013 () Bool)

(assert (=> b!522600 m!503013))

(assert (=> d!80251 m!502815))

(assert (=> d!80251 m!502789))

(declare-fun m!503015 () Bool)

(assert (=> d!80251 m!503015))

(assert (=> d!80251 m!502795))

(assert (=> d!80251 m!502789))

(assert (=> d!80251 m!502815))

(declare-fun m!503017 () Bool)

(assert (=> d!80251 m!503017))

(declare-fun m!503019 () Bool)

(assert (=> d!80251 m!503019))

(declare-fun m!503021 () Bool)

(assert (=> d!80251 m!503021))

(declare-fun m!503023 () Bool)

(assert (=> b!522605 m!503023))

(assert (=> b!522362 d!80251))

(declare-fun d!80253 () Bool)

(declare-fun e!304796 () Bool)

(assert (=> d!80253 e!304796))

(declare-fun res!320273 () Bool)

(assert (=> d!80253 (=> (not res!320273) (not e!304796))))

(assert (=> d!80253 (= res!320273 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16363 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16363 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16363 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16363 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16363 a!3235))))))

(declare-fun lt!239627 () Unit!16294)

(declare-fun choose!47 (array!33284 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16294)

(assert (=> d!80253 (= lt!239627 (choose!47 a!3235 i!1204 k0!2280 j!176 lt!239495 #b00000000000000000000000000000000 (index!20053 lt!239496) (x!49035 lt!239496) mask!3524))))

(assert (=> d!80253 (validMask!0 mask!3524)))

(assert (=> d!80253 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!239495 #b00000000000000000000000000000000 (index!20053 lt!239496) (x!49035 lt!239496) mask!3524) lt!239627)))

(declare-fun b!522626 () Bool)

(assert (=> b!522626 (= e!304796 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239495 (select (store (arr!15998 a!3235) i!1204 k0!2280) j!176) (array!33285 (store (arr!15998 a!3235) i!1204 k0!2280) (size!16363 a!3235)) mask!3524) (Intermediate!4462 false (index!20053 lt!239496) (x!49035 lt!239496))))))

(assert (= (and d!80253 res!320273) b!522626))

(declare-fun m!503033 () Bool)

(assert (=> d!80253 m!503033))

(assert (=> d!80253 m!502795))

(assert (=> b!522626 m!502805))

(assert (=> b!522626 m!502809))

(assert (=> b!522626 m!502809))

(declare-fun m!503035 () Bool)

(assert (=> b!522626 m!503035))

(assert (=> b!522357 d!80253))

(declare-fun b!522627 () Bool)

(declare-fun e!304799 () SeekEntryResult!4462)

(assert (=> b!522627 (= e!304799 (Intermediate!4462 false lt!239495 #b00000000000000000000000000000000))))

(declare-fun b!522628 () Bool)

(assert (=> b!522628 (= e!304799 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!239495 #b00000000000000000000000000000000 mask!3524) lt!239497 lt!239494 mask!3524))))

(declare-fun b!522629 () Bool)

(declare-fun lt!239629 () SeekEntryResult!4462)

(assert (=> b!522629 (and (bvsge (index!20053 lt!239629) #b00000000000000000000000000000000) (bvslt (index!20053 lt!239629) (size!16363 lt!239494)))))

(declare-fun e!304800 () Bool)

(assert (=> b!522629 (= e!304800 (= (select (arr!15998 lt!239494) (index!20053 lt!239629)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!522630 () Bool)

(assert (=> b!522630 (and (bvsge (index!20053 lt!239629) #b00000000000000000000000000000000) (bvslt (index!20053 lt!239629) (size!16363 lt!239494)))))

(declare-fun res!320274 () Bool)

(assert (=> b!522630 (= res!320274 (= (select (arr!15998 lt!239494) (index!20053 lt!239629)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!522630 (=> res!320274 e!304800)))

(declare-fun d!80259 () Bool)

(declare-fun e!304797 () Bool)

(assert (=> d!80259 e!304797))

(declare-fun c!61480 () Bool)

(assert (=> d!80259 (= c!61480 (and ((_ is Intermediate!4462) lt!239629) (undefined!5274 lt!239629)))))

(declare-fun e!304801 () SeekEntryResult!4462)

(assert (=> d!80259 (= lt!239629 e!304801)))

(declare-fun c!61479 () Bool)

(assert (=> d!80259 (= c!61479 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!239628 () (_ BitVec 64))

(assert (=> d!80259 (= lt!239628 (select (arr!15998 lt!239494) lt!239495))))

(assert (=> d!80259 (validMask!0 mask!3524)))

(assert (=> d!80259 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239495 lt!239497 lt!239494 mask!3524) lt!239629)))

(declare-fun b!522631 () Bool)

(assert (=> b!522631 (= e!304801 e!304799)))

(declare-fun c!61478 () Bool)

(assert (=> b!522631 (= c!61478 (or (= lt!239628 lt!239497) (= (bvadd lt!239628 lt!239628) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!522632 () Bool)

(declare-fun e!304798 () Bool)

(assert (=> b!522632 (= e!304797 e!304798)))

(declare-fun res!320276 () Bool)

(assert (=> b!522632 (= res!320276 (and ((_ is Intermediate!4462) lt!239629) (not (undefined!5274 lt!239629)) (bvslt (x!49035 lt!239629) #b01111111111111111111111111111110) (bvsge (x!49035 lt!239629) #b00000000000000000000000000000000) (bvsge (x!49035 lt!239629) #b00000000000000000000000000000000)))))

(assert (=> b!522632 (=> (not res!320276) (not e!304798))))

(declare-fun b!522633 () Bool)

(assert (=> b!522633 (and (bvsge (index!20053 lt!239629) #b00000000000000000000000000000000) (bvslt (index!20053 lt!239629) (size!16363 lt!239494)))))

(declare-fun res!320275 () Bool)

(assert (=> b!522633 (= res!320275 (= (select (arr!15998 lt!239494) (index!20053 lt!239629)) lt!239497))))

(assert (=> b!522633 (=> res!320275 e!304800)))

(assert (=> b!522633 (= e!304798 e!304800)))

(declare-fun b!522634 () Bool)

(assert (=> b!522634 (= e!304797 (bvsge (x!49035 lt!239629) #b01111111111111111111111111111110))))

(declare-fun b!522635 () Bool)

(assert (=> b!522635 (= e!304801 (Intermediate!4462 true lt!239495 #b00000000000000000000000000000000))))

(assert (= (and d!80259 c!61479) b!522635))

(assert (= (and d!80259 (not c!61479)) b!522631))

(assert (= (and b!522631 c!61478) b!522627))

(assert (= (and b!522631 (not c!61478)) b!522628))

(assert (= (and d!80259 c!61480) b!522634))

(assert (= (and d!80259 (not c!61480)) b!522632))

(assert (= (and b!522632 res!320276) b!522633))

(assert (= (and b!522633 (not res!320275)) b!522630))

(assert (= (and b!522630 (not res!320274)) b!522629))

(declare-fun m!503037 () Bool)

(assert (=> b!522629 m!503037))

(declare-fun m!503039 () Bool)

(assert (=> d!80259 m!503039))

(assert (=> d!80259 m!502795))

(assert (=> b!522630 m!503037))

(assert (=> b!522633 m!503037))

(assert (=> b!522628 m!502919))

(assert (=> b!522628 m!502919))

(declare-fun m!503041 () Bool)

(assert (=> b!522628 m!503041))

(assert (=> b!522357 d!80259))

(declare-fun d!80261 () Bool)

(assert (=> d!80261 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!47448 d!80261))

(declare-fun d!80269 () Bool)

(assert (=> d!80269 (= (array_inv!11881 a!3235) (bvsge (size!16363 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!47448 d!80269))

(check-sat (not bm!31788) (not b!522490) (not d!80211) (not b!522533) (not b!522598) (not b!522590) (not b!522474) (not b!522596) (not bm!31783) (not d!80259) (not b!522626) (not d!80253) (not d!80229) (not b!522600) (not bm!31790) (not b!522588) (not b!522587) (not b!522562) (not b!522492) (not d!80223) (not d!80251) (not b!522628) (not d!80221) (not b!522495))
(check-sat)
