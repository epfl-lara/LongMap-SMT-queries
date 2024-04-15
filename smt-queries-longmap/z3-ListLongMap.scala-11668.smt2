; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136378 () Bool)

(assert start!136378)

(declare-fun e!879643 () Bool)

(declare-fun x!458 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13752 0))(
  ( (MissingZero!13752 (index!57406 (_ BitVec 32))) (Found!13752 (index!57407 (_ BitVec 32))) (Intermediate!13752 (undefined!14564 Bool) (index!57408 (_ BitVec 32)) (x!142528 (_ BitVec 32))) (Undefined!13752) (MissingVacant!13752 (index!57409 (_ BitVec 32))) )
))
(declare-fun lt!675699 () SeekEntryResult!13752)

(declare-fun b!1577096 () Bool)

(declare-datatypes ((array!105536 0))(
  ( (array!105537 (arr!50888 (Array (_ BitVec 32) (_ BitVec 64))) (size!51440 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105536)

(get-info :version)

(assert (=> b!1577096 (= e!879643 (and ((_ is Intermediate!13752) lt!675699) (not (undefined!14564 lt!675699)) (bvslt (x!142528 lt!675699) #b01111111111111111111111111111110) (bvsge (x!142528 lt!675699) #b00000000000000000000000000000000) (bvsge (x!142528 lt!675699) x!458) (or (bvslt (index!57408 lt!675699) #b00000000000000000000000000000000) (bvsge (index!57408 lt!675699) (size!51440 _keys!610)))))))

(declare-fun k0!768 () (_ BitVec 64))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105536 (_ BitVec 32)) SeekEntryResult!13752)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577096 (= lt!675699 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458) (nextIndex!0 ee!12 x!458 mask!910) k0!768 _keys!610 mask!910))))

(declare-fun b!1577093 () Bool)

(declare-fun res!1077540 () Bool)

(assert (=> b!1577093 (=> (not res!1077540) (not e!879643))))

(assert (=> b!1577093 (= res!1077540 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51440 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1577095 () Bool)

(declare-fun res!1077541 () Bool)

(assert (=> b!1577095 (=> (not res!1077541) (not e!879643))))

(assert (=> b!1577095 (= res!1077541 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50888 _keys!610) ee!12) k0!768)) (not (= (bvadd (select (arr!50888 _keys!610) ee!12) (select (arr!50888 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1077542 () Bool)

(assert (=> start!136378 (=> (not res!1077542) (not e!879643))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136378 (= res!1077542 (validMask!0 mask!910))))

(assert (=> start!136378 e!879643))

(assert (=> start!136378 true))

(declare-fun array_inv!39824 (array!105536) Bool)

(assert (=> start!136378 (array_inv!39824 _keys!610)))

(declare-fun b!1577094 () Bool)

(declare-fun res!1077543 () Bool)

(assert (=> b!1577094 (=> (not res!1077543) (not e!879643))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577094 (= res!1077543 (validKeyInArray!0 k0!768))))

(assert (= (and start!136378 res!1077542) b!1577093))

(assert (= (and b!1577093 res!1077540) b!1577094))

(assert (= (and b!1577094 res!1077543) b!1577095))

(assert (= (and b!1577095 res!1077541) b!1577096))

(declare-fun m!1448793 () Bool)

(assert (=> b!1577096 m!1448793))

(assert (=> b!1577096 m!1448793))

(declare-fun m!1448795 () Bool)

(assert (=> b!1577096 m!1448795))

(declare-fun m!1448797 () Bool)

(assert (=> b!1577095 m!1448797))

(declare-fun m!1448799 () Bool)

(assert (=> start!136378 m!1448799))

(declare-fun m!1448801 () Bool)

(assert (=> start!136378 m!1448801))

(declare-fun m!1448803 () Bool)

(assert (=> b!1577094 m!1448803))

(check-sat (not b!1577096) (not start!136378) (not b!1577094))
(check-sat)
(get-model)

(declare-fun b!1577139 () Bool)

(declare-fun e!879671 () SeekEntryResult!13752)

(assert (=> b!1577139 (= e!879671 (Intermediate!13752 false (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458)))))

(declare-fun b!1577140 () Bool)

(declare-fun e!879668 () SeekEntryResult!13752)

(assert (=> b!1577140 (= e!879668 e!879671)))

(declare-fun c!146071 () Bool)

(declare-fun lt!675711 () (_ BitVec 64))

(assert (=> b!1577140 (= c!146071 (or (= lt!675711 k0!768) (= (bvadd lt!675711 lt!675711) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1577141 () Bool)

(assert (=> b!1577141 (= e!879671 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458) mask!910) k0!768 _keys!610 mask!910))))

(declare-fun b!1577142 () Bool)

(declare-fun e!879670 () Bool)

(declare-fun e!879669 () Bool)

(assert (=> b!1577142 (= e!879670 e!879669)))

(declare-fun res!1077574 () Bool)

(declare-fun lt!675710 () SeekEntryResult!13752)

(assert (=> b!1577142 (= res!1077574 (and ((_ is Intermediate!13752) lt!675710) (not (undefined!14564 lt!675710)) (bvslt (x!142528 lt!675710) #b01111111111111111111111111111110) (bvsge (x!142528 lt!675710) #b00000000000000000000000000000000) (bvsge (x!142528 lt!675710) (bvadd #b00000000000000000000000000000001 x!458))))))

(assert (=> b!1577142 (=> (not res!1077574) (not e!879669))))

(declare-fun b!1577143 () Bool)

(assert (=> b!1577143 (= e!879670 (bvsge (x!142528 lt!675710) #b01111111111111111111111111111110))))

(declare-fun b!1577144 () Bool)

(assert (=> b!1577144 (and (bvsge (index!57408 lt!675710) #b00000000000000000000000000000000) (bvslt (index!57408 lt!675710) (size!51440 _keys!610)))))

(declare-fun e!879667 () Bool)

(assert (=> b!1577144 (= e!879667 (= (select (arr!50888 _keys!610) (index!57408 lt!675710)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1577145 () Bool)

(assert (=> b!1577145 (and (bvsge (index!57408 lt!675710) #b00000000000000000000000000000000) (bvslt (index!57408 lt!675710) (size!51440 _keys!610)))))

(declare-fun res!1077575 () Bool)

(assert (=> b!1577145 (= res!1077575 (= (select (arr!50888 _keys!610) (index!57408 lt!675710)) k0!768))))

(assert (=> b!1577145 (=> res!1077575 e!879667)))

(assert (=> b!1577145 (= e!879669 e!879667)))

(declare-fun d!165623 () Bool)

(assert (=> d!165623 e!879670))

(declare-fun c!146069 () Bool)

(assert (=> d!165623 (= c!146069 (and ((_ is Intermediate!13752) lt!675710) (undefined!14564 lt!675710)))))

(assert (=> d!165623 (= lt!675710 e!879668)))

(declare-fun c!146070 () Bool)

(assert (=> d!165623 (= c!146070 (bvsge (bvadd #b00000000000000000000000000000001 x!458) #b01111111111111111111111111111110))))

(assert (=> d!165623 (= lt!675711 (select (arr!50888 _keys!610) (nextIndex!0 ee!12 x!458 mask!910)))))

(assert (=> d!165623 (validMask!0 mask!910)))

(assert (=> d!165623 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458) (nextIndex!0 ee!12 x!458 mask!910) k0!768 _keys!610 mask!910) lt!675710)))

(declare-fun b!1577146 () Bool)

(assert (=> b!1577146 (and (bvsge (index!57408 lt!675710) #b00000000000000000000000000000000) (bvslt (index!57408 lt!675710) (size!51440 _keys!610)))))

(declare-fun res!1077576 () Bool)

(assert (=> b!1577146 (= res!1077576 (= (select (arr!50888 _keys!610) (index!57408 lt!675710)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1577146 (=> res!1077576 e!879667)))

(declare-fun b!1577147 () Bool)

(assert (=> b!1577147 (= e!879668 (Intermediate!13752 true (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458)))))

(assert (= (and d!165623 c!146070) b!1577147))

(assert (= (and d!165623 (not c!146070)) b!1577140))

(assert (= (and b!1577140 c!146071) b!1577139))

(assert (= (and b!1577140 (not c!146071)) b!1577141))

(assert (= (and d!165623 c!146069) b!1577143))

(assert (= (and d!165623 (not c!146069)) b!1577142))

(assert (= (and b!1577142 res!1077574) b!1577145))

(assert (= (and b!1577145 (not res!1077575)) b!1577146))

(assert (= (and b!1577146 (not res!1077576)) b!1577144))

(declare-fun m!1448829 () Bool)

(assert (=> b!1577146 m!1448829))

(assert (=> b!1577145 m!1448829))

(assert (=> b!1577141 m!1448793))

(declare-fun m!1448831 () Bool)

(assert (=> b!1577141 m!1448831))

(assert (=> b!1577141 m!1448831))

(declare-fun m!1448833 () Bool)

(assert (=> b!1577141 m!1448833))

(assert (=> d!165623 m!1448793))

(declare-fun m!1448835 () Bool)

(assert (=> d!165623 m!1448835))

(assert (=> d!165623 m!1448799))

(assert (=> b!1577144 m!1448829))

(assert (=> b!1577096 d!165623))

(declare-fun d!165633 () Bool)

(declare-fun lt!675714 () (_ BitVec 32))

(assert (=> d!165633 (and (bvsge lt!675714 #b00000000000000000000000000000000) (bvslt lt!675714 (bvadd mask!910 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!165633 (= lt!675714 (choose!52 ee!12 x!458 mask!910))))

(assert (=> d!165633 (validMask!0 mask!910)))

(assert (=> d!165633 (= (nextIndex!0 ee!12 x!458 mask!910) lt!675714)))

(declare-fun bs!45537 () Bool)

(assert (= bs!45537 d!165633))

(declare-fun m!1448837 () Bool)

(assert (=> bs!45537 m!1448837))

(assert (=> bs!45537 m!1448799))

(assert (=> b!1577096 d!165633))

(declare-fun d!165635 () Bool)

(assert (=> d!165635 (= (validMask!0 mask!910) (and (or (= mask!910 #b00000000000000000000000000000111) (= mask!910 #b00000000000000000000000000001111) (= mask!910 #b00000000000000000000000000011111) (= mask!910 #b00000000000000000000000000111111) (= mask!910 #b00000000000000000000000001111111) (= mask!910 #b00000000000000000000000011111111) (= mask!910 #b00000000000000000000000111111111) (= mask!910 #b00000000000000000000001111111111) (= mask!910 #b00000000000000000000011111111111) (= mask!910 #b00000000000000000000111111111111) (= mask!910 #b00000000000000000001111111111111) (= mask!910 #b00000000000000000011111111111111) (= mask!910 #b00000000000000000111111111111111) (= mask!910 #b00000000000000001111111111111111) (= mask!910 #b00000000000000011111111111111111) (= mask!910 #b00000000000000111111111111111111) (= mask!910 #b00000000000001111111111111111111) (= mask!910 #b00000000000011111111111111111111) (= mask!910 #b00000000000111111111111111111111) (= mask!910 #b00000000001111111111111111111111) (= mask!910 #b00000000011111111111111111111111) (= mask!910 #b00000000111111111111111111111111) (= mask!910 #b00000001111111111111111111111111) (= mask!910 #b00000011111111111111111111111111) (= mask!910 #b00000111111111111111111111111111) (= mask!910 #b00001111111111111111111111111111) (= mask!910 #b00011111111111111111111111111111) (= mask!910 #b00111111111111111111111111111111)) (bvsle mask!910 #b00111111111111111111111111111111)))))

(assert (=> start!136378 d!165635))

(declare-fun d!165641 () Bool)

(assert (=> d!165641 (= (array_inv!39824 _keys!610) (bvsge (size!51440 _keys!610) #b00000000000000000000000000000000))))

(assert (=> start!136378 d!165641))

(declare-fun d!165643 () Bool)

(assert (=> d!165643 (= (validKeyInArray!0 k0!768) (and (not (= k0!768 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!768 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1577094 d!165643))

(check-sat (not d!165623) (not b!1577141) (not d!165633))
(check-sat)
