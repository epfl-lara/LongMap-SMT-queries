; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136450 () Bool)

(assert start!136450)

(declare-fun x!458 () (_ BitVec 32))

(declare-fun e!879770 () Bool)

(declare-datatypes ((array!105554 0))(
  ( (array!105555 (arr!50894 (Array (_ BitVec 32) (_ BitVec 64))) (size!51446 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105554)

(declare-fun b!1577330 () Bool)

(declare-fun k0!768 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!13758 0))(
  ( (MissingZero!13758 (index!57430 (_ BitVec 32))) (Found!13758 (index!57431 (_ BitVec 32))) (Intermediate!13758 (undefined!14570 Bool) (index!57432 (_ BitVec 32)) (x!142562 (_ BitVec 32))) (Undefined!13758) (MissingVacant!13758 (index!57433 (_ BitVec 32))) )
))
(declare-fun lt!675771 () SeekEntryResult!13758)

(get-info :version)

(assert (=> b!1577330 (= e!879770 (and ((_ is Intermediate!13758) lt!675771) (not (undefined!14570 lt!675771)) (bvslt (x!142562 lt!675771) #b01111111111111111111111111111110) (bvsge (x!142562 lt!675771) #b00000000000000000000000000000000) (bvsge (x!142562 lt!675771) x!458) (not (= (select (arr!50894 _keys!610) (index!57432 lt!675771)) k0!768)) (not (= (select (arr!50894 _keys!610) (index!57432 lt!675771)) #b0000000000000000000000000000000000000000000000000000000000000000)) (or (bvslt (index!57432 lt!675771) #b00000000000000000000000000000000) (bvsge (index!57432 lt!675771) (size!51446 _keys!610)))))))

(declare-fun ee!12 () (_ BitVec 32))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105554 (_ BitVec 32)) SeekEntryResult!13758)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577330 (= lt!675771 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458) (nextIndex!0 ee!12 x!458 mask!910) k0!768 _keys!610 mask!910))))

(declare-fun b!1577328 () Bool)

(declare-fun res!1077667 () Bool)

(assert (=> b!1577328 (=> (not res!1077667) (not e!879770))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577328 (= res!1077667 (validKeyInArray!0 k0!768))))

(declare-fun b!1577329 () Bool)

(declare-fun res!1077668 () Bool)

(assert (=> b!1577329 (=> (not res!1077668) (not e!879770))))

(assert (=> b!1577329 (= res!1077668 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50894 _keys!610) ee!12) k0!768)) (not (= (bvadd (select (arr!50894 _keys!610) ee!12) (select (arr!50894 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1077666 () Bool)

(assert (=> start!136450 (=> (not res!1077666) (not e!879770))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136450 (= res!1077666 (validMask!0 mask!910))))

(assert (=> start!136450 e!879770))

(assert (=> start!136450 true))

(declare-fun array_inv!39830 (array!105554) Bool)

(assert (=> start!136450 (array_inv!39830 _keys!610)))

(declare-fun b!1577327 () Bool)

(declare-fun res!1077669 () Bool)

(assert (=> b!1577327 (=> (not res!1077669) (not e!879770))))

(assert (=> b!1577327 (= res!1077669 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51446 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(assert (= (and start!136450 res!1077666) b!1577327))

(assert (= (and b!1577327 res!1077669) b!1577328))

(assert (= (and b!1577328 res!1077667) b!1577329))

(assert (= (and b!1577329 res!1077668) b!1577330))

(declare-fun m!1448931 () Bool)

(assert (=> b!1577330 m!1448931))

(declare-fun m!1448933 () Bool)

(assert (=> b!1577330 m!1448933))

(assert (=> b!1577330 m!1448933))

(declare-fun m!1448935 () Bool)

(assert (=> b!1577330 m!1448935))

(declare-fun m!1448937 () Bool)

(assert (=> b!1577328 m!1448937))

(declare-fun m!1448939 () Bool)

(assert (=> b!1577329 m!1448939))

(declare-fun m!1448941 () Bool)

(assert (=> start!136450 m!1448941))

(declare-fun m!1448943 () Bool)

(assert (=> start!136450 m!1448943))

(check-sat (not b!1577330) (not start!136450) (not b!1577328))
(check-sat)
(get-model)

(declare-fun d!165687 () Bool)

(declare-fun e!879796 () Bool)

(assert (=> d!165687 e!879796))

(declare-fun c!146124 () Bool)

(declare-fun lt!675782 () SeekEntryResult!13758)

(assert (=> d!165687 (= c!146124 (and ((_ is Intermediate!13758) lt!675782) (undefined!14570 lt!675782)))))

(declare-fun e!879795 () SeekEntryResult!13758)

(assert (=> d!165687 (= lt!675782 e!879795)))

(declare-fun c!146123 () Bool)

(assert (=> d!165687 (= c!146123 (bvsge (bvadd #b00000000000000000000000000000001 x!458) #b01111111111111111111111111111110))))

(declare-fun lt!675783 () (_ BitVec 64))

(assert (=> d!165687 (= lt!675783 (select (arr!50894 _keys!610) (nextIndex!0 ee!12 x!458 mask!910)))))

(assert (=> d!165687 (validMask!0 mask!910)))

(assert (=> d!165687 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458) (nextIndex!0 ee!12 x!458 mask!910) k0!768 _keys!610 mask!910) lt!675782)))

(declare-fun b!1577373 () Bool)

(assert (=> b!1577373 (= e!879796 (bvsge (x!142562 lt!675782) #b01111111111111111111111111111110))))

(declare-fun b!1577374 () Bool)

(declare-fun e!879797 () SeekEntryResult!13758)

(assert (=> b!1577374 (= e!879797 (Intermediate!13758 false (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458)))))

(declare-fun b!1577375 () Bool)

(assert (=> b!1577375 (and (bvsge (index!57432 lt!675782) #b00000000000000000000000000000000) (bvslt (index!57432 lt!675782) (size!51446 _keys!610)))))

(declare-fun res!1077702 () Bool)

(assert (=> b!1577375 (= res!1077702 (= (select (arr!50894 _keys!610) (index!57432 lt!675782)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!879793 () Bool)

(assert (=> b!1577375 (=> res!1077702 e!879793)))

(declare-fun b!1577376 () Bool)

(assert (=> b!1577376 (= e!879795 (Intermediate!13758 true (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458)))))

(declare-fun b!1577377 () Bool)

(assert (=> b!1577377 (and (bvsge (index!57432 lt!675782) #b00000000000000000000000000000000) (bvslt (index!57432 lt!675782) (size!51446 _keys!610)))))

(assert (=> b!1577377 (= e!879793 (= (select (arr!50894 _keys!610) (index!57432 lt!675782)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1577378 () Bool)

(assert (=> b!1577378 (= e!879795 e!879797)))

(declare-fun c!146125 () Bool)

(assert (=> b!1577378 (= c!146125 (or (= lt!675783 k0!768) (= (bvadd lt!675783 lt!675783) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1577379 () Bool)

(declare-fun e!879794 () Bool)

(assert (=> b!1577379 (= e!879796 e!879794)))

(declare-fun res!1077700 () Bool)

(assert (=> b!1577379 (= res!1077700 (and ((_ is Intermediate!13758) lt!675782) (not (undefined!14570 lt!675782)) (bvslt (x!142562 lt!675782) #b01111111111111111111111111111110) (bvsge (x!142562 lt!675782) #b00000000000000000000000000000000) (bvsge (x!142562 lt!675782) (bvadd #b00000000000000000000000000000001 x!458))))))

(assert (=> b!1577379 (=> (not res!1077700) (not e!879794))))

(declare-fun b!1577380 () Bool)

(assert (=> b!1577380 (= e!879797 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458) mask!910) k0!768 _keys!610 mask!910))))

(declare-fun b!1577381 () Bool)

(assert (=> b!1577381 (and (bvsge (index!57432 lt!675782) #b00000000000000000000000000000000) (bvslt (index!57432 lt!675782) (size!51446 _keys!610)))))

(declare-fun res!1077701 () Bool)

(assert (=> b!1577381 (= res!1077701 (= (select (arr!50894 _keys!610) (index!57432 lt!675782)) k0!768))))

(assert (=> b!1577381 (=> res!1077701 e!879793)))

(assert (=> b!1577381 (= e!879794 e!879793)))

(assert (= (and d!165687 c!146123) b!1577376))

(assert (= (and d!165687 (not c!146123)) b!1577378))

(assert (= (and b!1577378 c!146125) b!1577374))

(assert (= (and b!1577378 (not c!146125)) b!1577380))

(assert (= (and d!165687 c!146124) b!1577373))

(assert (= (and d!165687 (not c!146124)) b!1577379))

(assert (= (and b!1577379 res!1077700) b!1577381))

(assert (= (and b!1577381 (not res!1077701)) b!1577375))

(assert (= (and b!1577375 (not res!1077702)) b!1577377))

(declare-fun m!1448973 () Bool)

(assert (=> b!1577375 m!1448973))

(assert (=> b!1577377 m!1448973))

(assert (=> d!165687 m!1448933))

(declare-fun m!1448975 () Bool)

(assert (=> d!165687 m!1448975))

(assert (=> d!165687 m!1448941))

(assert (=> b!1577381 m!1448973))

(assert (=> b!1577380 m!1448933))

(declare-fun m!1448977 () Bool)

(assert (=> b!1577380 m!1448977))

(assert (=> b!1577380 m!1448977))

(declare-fun m!1448979 () Bool)

(assert (=> b!1577380 m!1448979))

(assert (=> b!1577330 d!165687))

(declare-fun d!165691 () Bool)

(declare-fun lt!675786 () (_ BitVec 32))

(assert (=> d!165691 (and (bvsge lt!675786 #b00000000000000000000000000000000) (bvslt lt!675786 (bvadd mask!910 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!165691 (= lt!675786 (choose!52 ee!12 x!458 mask!910))))

(assert (=> d!165691 (validMask!0 mask!910)))

(assert (=> d!165691 (= (nextIndex!0 ee!12 x!458 mask!910) lt!675786)))

(declare-fun bs!45549 () Bool)

(assert (= bs!45549 d!165691))

(declare-fun m!1448981 () Bool)

(assert (=> bs!45549 m!1448981))

(assert (=> bs!45549 m!1448941))

(assert (=> b!1577330 d!165691))

(declare-fun d!165693 () Bool)

(assert (=> d!165693 (= (validMask!0 mask!910) (and (or (= mask!910 #b00000000000000000000000000000111) (= mask!910 #b00000000000000000000000000001111) (= mask!910 #b00000000000000000000000000011111) (= mask!910 #b00000000000000000000000000111111) (= mask!910 #b00000000000000000000000001111111) (= mask!910 #b00000000000000000000000011111111) (= mask!910 #b00000000000000000000000111111111) (= mask!910 #b00000000000000000000001111111111) (= mask!910 #b00000000000000000000011111111111) (= mask!910 #b00000000000000000000111111111111) (= mask!910 #b00000000000000000001111111111111) (= mask!910 #b00000000000000000011111111111111) (= mask!910 #b00000000000000000111111111111111) (= mask!910 #b00000000000000001111111111111111) (= mask!910 #b00000000000000011111111111111111) (= mask!910 #b00000000000000111111111111111111) (= mask!910 #b00000000000001111111111111111111) (= mask!910 #b00000000000011111111111111111111) (= mask!910 #b00000000000111111111111111111111) (= mask!910 #b00000000001111111111111111111111) (= mask!910 #b00000000011111111111111111111111) (= mask!910 #b00000000111111111111111111111111) (= mask!910 #b00000001111111111111111111111111) (= mask!910 #b00000011111111111111111111111111) (= mask!910 #b00000111111111111111111111111111) (= mask!910 #b00001111111111111111111111111111) (= mask!910 #b00011111111111111111111111111111) (= mask!910 #b00111111111111111111111111111111)) (bvsle mask!910 #b00111111111111111111111111111111)))))

(assert (=> start!136450 d!165693))

(declare-fun d!165699 () Bool)

(assert (=> d!165699 (= (array_inv!39830 _keys!610) (bvsge (size!51446 _keys!610) #b00000000000000000000000000000000))))

(assert (=> start!136450 d!165699))

(declare-fun d!165701 () Bool)

(assert (=> d!165701 (= (validKeyInArray!0 k0!768) (and (not (= k0!768 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!768 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1577328 d!165701))

(check-sat (not d!165687) (not b!1577380) (not d!165691))
(check-sat)
