; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135564 () Bool)

(assert start!135564)

(declare-fun b!1575398 () Bool)

(declare-fun e!878652 () Bool)

(declare-fun e!878653 () Bool)

(assert (=> b!1575398 (= e!878652 e!878653)))

(declare-fun res!1075632 () Bool)

(assert (=> b!1575398 (=> (not res!1075632) (not e!878653))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!13565 0))(
  ( (MissingZero!13565 (index!56658 (_ BitVec 32))) (Found!13565 (index!56659 (_ BitVec 32))) (Intermediate!13565 (undefined!14377 Bool) (index!56660 (_ BitVec 32)) (x!141648 (_ BitVec 32))) (Undefined!13565) (MissingVacant!13565 (index!56661 (_ BitVec 32))) )
))
(declare-fun lt!675114 () SeekEntryResult!13565)

(declare-fun mask!889 () (_ BitVec 32))

(declare-datatypes ((array!105209 0))(
  ( (array!105210 (arr!50758 (Array (_ BitVec 32) (_ BitVec 64))) (size!51309 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105209)

(get-info :version)

(assert (=> b!1575398 (= res!1075632 (and (not (undefined!14377 lt!675114)) ((_ is Intermediate!13565) lt!675114) (not (= (select (arr!50758 _keys!600) (index!56660 lt!675114)) k0!754)) (not (= (select (arr!50758 _keys!600) (index!56660 lt!675114)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50758 _keys!600) (index!56660 lt!675114)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!56660 lt!675114) #b00000000000000000000000000000000) (bvslt (index!56660 lt!675114) (bvadd #b00000000000000000000000000000001 mask!889))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105209 (_ BitVec 32)) SeekEntryResult!13565)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575398 (= lt!675114 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(declare-fun b!1575397 () Bool)

(declare-fun res!1075634 () Bool)

(assert (=> b!1575397 (=> (not res!1075634) (not e!878652))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575397 (= res!1075634 (validKeyInArray!0 k0!754))))

(declare-fun res!1075633 () Bool)

(assert (=> start!135564 (=> (not res!1075633) (not e!878652))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135564 (= res!1075633 (validMask!0 mask!889))))

(assert (=> start!135564 e!878652))

(assert (=> start!135564 true))

(declare-fun array_inv!39713 (array!105209) Bool)

(assert (=> start!135564 (array_inv!39713 _keys!600)))

(declare-fun b!1575399 () Bool)

(declare-fun lt!675113 () SeekEntryResult!13565)

(assert (=> b!1575399 (= e!878653 (and (not ((_ is MissingVacant!13565) lt!675113)) ((_ is Found!13565) lt!675113) (or (bvslt (index!56659 lt!675113) #b00000000000000000000000000000000) (bvsge (index!56659 lt!675113) (size!51309 _keys!600)))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105209 (_ BitVec 32)) SeekEntryResult!13565)

(assert (=> b!1575399 (= lt!675113 (seekKeyOrZeroReturnVacant!0 (x!141648 lt!675114) (index!56660 lt!675114) (index!56660 lt!675114) k0!754 _keys!600 mask!889))))

(declare-fun b!1575396 () Bool)

(declare-fun res!1075631 () Bool)

(assert (=> b!1575396 (=> (not res!1075631) (not e!878652))))

(assert (=> b!1575396 (= res!1075631 (= (size!51309 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(assert (= (and start!135564 res!1075633) b!1575396))

(assert (= (and b!1575396 res!1075631) b!1575397))

(assert (= (and b!1575397 res!1075634) b!1575398))

(assert (= (and b!1575398 res!1075632) b!1575399))

(declare-fun m!1448865 () Bool)

(assert (=> b!1575398 m!1448865))

(declare-fun m!1448867 () Bool)

(assert (=> b!1575398 m!1448867))

(assert (=> b!1575398 m!1448867))

(declare-fun m!1448869 () Bool)

(assert (=> b!1575398 m!1448869))

(declare-fun m!1448871 () Bool)

(assert (=> b!1575397 m!1448871))

(declare-fun m!1448873 () Bool)

(assert (=> start!135564 m!1448873))

(declare-fun m!1448875 () Bool)

(assert (=> start!135564 m!1448875))

(declare-fun m!1448877 () Bool)

(assert (=> b!1575399 m!1448877))

(check-sat (not b!1575399) (not b!1575398) (not start!135564) (not b!1575397))
(check-sat)
(get-model)

(declare-fun b!1575436 () Bool)

(declare-fun e!878679 () SeekEntryResult!13565)

(assert (=> b!1575436 (= e!878679 Undefined!13565)))

(declare-fun d!165595 () Bool)

(declare-fun lt!675132 () SeekEntryResult!13565)

(assert (=> d!165595 (and (or ((_ is Undefined!13565) lt!675132) (not ((_ is Found!13565) lt!675132)) (and (bvsge (index!56659 lt!675132) #b00000000000000000000000000000000) (bvslt (index!56659 lt!675132) (size!51309 _keys!600)))) (or ((_ is Undefined!13565) lt!675132) ((_ is Found!13565) lt!675132) (not ((_ is MissingVacant!13565) lt!675132)) (not (= (index!56661 lt!675132) (index!56660 lt!675114))) (and (bvsge (index!56661 lt!675132) #b00000000000000000000000000000000) (bvslt (index!56661 lt!675132) (size!51309 _keys!600)))) (or ((_ is Undefined!13565) lt!675132) (ite ((_ is Found!13565) lt!675132) (= (select (arr!50758 _keys!600) (index!56659 lt!675132)) k0!754) (and ((_ is MissingVacant!13565) lt!675132) (= (index!56661 lt!675132) (index!56660 lt!675114)) (= (select (arr!50758 _keys!600) (index!56661 lt!675132)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!165595 (= lt!675132 e!878679)))

(declare-fun c!146150 () Bool)

(assert (=> d!165595 (= c!146150 (bvsge (x!141648 lt!675114) #b01111111111111111111111111111110))))

(declare-fun lt!675131 () (_ BitVec 64))

(assert (=> d!165595 (= lt!675131 (select (arr!50758 _keys!600) (index!56660 lt!675114)))))

(assert (=> d!165595 (validMask!0 mask!889)))

(assert (=> d!165595 (= (seekKeyOrZeroReturnVacant!0 (x!141648 lt!675114) (index!56660 lt!675114) (index!56660 lt!675114) k0!754 _keys!600 mask!889) lt!675132)))

(declare-fun b!1575437 () Bool)

(declare-fun c!146148 () Bool)

(assert (=> b!1575437 (= c!146148 (= lt!675131 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!878680 () SeekEntryResult!13565)

(declare-fun e!878681 () SeekEntryResult!13565)

(assert (=> b!1575437 (= e!878680 e!878681)))

(declare-fun b!1575438 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575438 (= e!878681 (seekKeyOrZeroReturnVacant!0 (bvadd (x!141648 lt!675114) #b00000000000000000000000000000001) (nextIndex!0 (index!56660 lt!675114) (bvadd (x!141648 lt!675114) #b00000000000000000000000000000001) mask!889) (index!56660 lt!675114) k0!754 _keys!600 mask!889))))

(declare-fun b!1575439 () Bool)

(assert (=> b!1575439 (= e!878679 e!878680)))

(declare-fun c!146149 () Bool)

(assert (=> b!1575439 (= c!146149 (= lt!675131 k0!754))))

(declare-fun b!1575440 () Bool)

(assert (=> b!1575440 (= e!878680 (Found!13565 (index!56660 lt!675114)))))

(declare-fun b!1575441 () Bool)

(assert (=> b!1575441 (= e!878681 (MissingVacant!13565 (index!56660 lt!675114)))))

(assert (= (and d!165595 c!146150) b!1575436))

(assert (= (and d!165595 (not c!146150)) b!1575439))

(assert (= (and b!1575439 c!146149) b!1575440))

(assert (= (and b!1575439 (not c!146149)) b!1575437))

(assert (= (and b!1575437 c!146148) b!1575441))

(assert (= (and b!1575437 (not c!146148)) b!1575438))

(declare-fun m!1448907 () Bool)

(assert (=> d!165595 m!1448907))

(declare-fun m!1448909 () Bool)

(assert (=> d!165595 m!1448909))

(assert (=> d!165595 m!1448865))

(assert (=> d!165595 m!1448873))

(declare-fun m!1448911 () Bool)

(assert (=> b!1575438 m!1448911))

(assert (=> b!1575438 m!1448911))

(declare-fun m!1448913 () Bool)

(assert (=> b!1575438 m!1448913))

(assert (=> b!1575399 d!165595))

(declare-fun b!1575486 () Bool)

(declare-fun e!878709 () Bool)

(declare-fun lt!675147 () SeekEntryResult!13565)

(assert (=> b!1575486 (= e!878709 (bvsge (x!141648 lt!675147) #b01111111111111111111111111111110))))

(declare-fun b!1575487 () Bool)

(assert (=> b!1575487 (and (bvsge (index!56660 lt!675147) #b00000000000000000000000000000000) (bvslt (index!56660 lt!675147) (size!51309 _keys!600)))))

(declare-fun res!1075666 () Bool)

(assert (=> b!1575487 (= res!1075666 (= (select (arr!50758 _keys!600) (index!56660 lt!675147)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!878705 () Bool)

(assert (=> b!1575487 (=> res!1075666 e!878705)))

(declare-fun d!165601 () Bool)

(assert (=> d!165601 e!878709))

(declare-fun c!146171 () Bool)

(assert (=> d!165601 (= c!146171 (and ((_ is Intermediate!13565) lt!675147) (undefined!14377 lt!675147)))))

(declare-fun e!878707 () SeekEntryResult!13565)

(assert (=> d!165601 (= lt!675147 e!878707)))

(declare-fun c!146170 () Bool)

(assert (=> d!165601 (= c!146170 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!675148 () (_ BitVec 64))

(assert (=> d!165601 (= lt!675148 (select (arr!50758 _keys!600) (toIndex!0 k0!754 mask!889)))))

(assert (=> d!165601 (validMask!0 mask!889)))

(assert (=> d!165601 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889) lt!675147)))

(declare-fun b!1575488 () Bool)

(declare-fun e!878708 () Bool)

(assert (=> b!1575488 (= e!878709 e!878708)))

(declare-fun res!1075667 () Bool)

(assert (=> b!1575488 (= res!1075667 (and ((_ is Intermediate!13565) lt!675147) (not (undefined!14377 lt!675147)) (bvslt (x!141648 lt!675147) #b01111111111111111111111111111110) (bvsge (x!141648 lt!675147) #b00000000000000000000000000000000) (bvsge (x!141648 lt!675147) #b00000000000000000000000000000000)))))

(assert (=> b!1575488 (=> (not res!1075667) (not e!878708))))

(declare-fun b!1575489 () Bool)

(assert (=> b!1575489 (and (bvsge (index!56660 lt!675147) #b00000000000000000000000000000000) (bvslt (index!56660 lt!675147) (size!51309 _keys!600)))))

(assert (=> b!1575489 (= e!878705 (= (select (arr!50758 _keys!600) (index!56660 lt!675147)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1575490 () Bool)

(declare-fun e!878706 () SeekEntryResult!13565)

(assert (=> b!1575490 (= e!878707 e!878706)))

(declare-fun c!146172 () Bool)

(assert (=> b!1575490 (= c!146172 (or (= lt!675148 k0!754) (= (bvadd lt!675148 lt!675148) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1575491 () Bool)

(assert (=> b!1575491 (= e!878706 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!754 mask!889) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!889) k0!754 _keys!600 mask!889))))

(declare-fun b!1575492 () Bool)

(assert (=> b!1575492 (and (bvsge (index!56660 lt!675147) #b00000000000000000000000000000000) (bvslt (index!56660 lt!675147) (size!51309 _keys!600)))))

(declare-fun res!1075665 () Bool)

(assert (=> b!1575492 (= res!1075665 (= (select (arr!50758 _keys!600) (index!56660 lt!675147)) k0!754))))

(assert (=> b!1575492 (=> res!1075665 e!878705)))

(assert (=> b!1575492 (= e!878708 e!878705)))

(declare-fun b!1575493 () Bool)

(assert (=> b!1575493 (= e!878706 (Intermediate!13565 false (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1575494 () Bool)

(assert (=> b!1575494 (= e!878707 (Intermediate!13565 true (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(assert (= (and d!165601 c!146170) b!1575494))

(assert (= (and d!165601 (not c!146170)) b!1575490))

(assert (= (and b!1575490 c!146172) b!1575493))

(assert (= (and b!1575490 (not c!146172)) b!1575491))

(assert (= (and d!165601 c!146171) b!1575486))

(assert (= (and d!165601 (not c!146171)) b!1575488))

(assert (= (and b!1575488 res!1075667) b!1575492))

(assert (= (and b!1575492 (not res!1075665)) b!1575487))

(assert (= (and b!1575487 (not res!1075666)) b!1575489))

(assert (=> d!165601 m!1448867))

(declare-fun m!1448923 () Bool)

(assert (=> d!165601 m!1448923))

(assert (=> d!165601 m!1448873))

(declare-fun m!1448925 () Bool)

(assert (=> b!1575487 m!1448925))

(assert (=> b!1575491 m!1448867))

(declare-fun m!1448927 () Bool)

(assert (=> b!1575491 m!1448927))

(assert (=> b!1575491 m!1448927))

(declare-fun m!1448929 () Bool)

(assert (=> b!1575491 m!1448929))

(assert (=> b!1575492 m!1448925))

(assert (=> b!1575489 m!1448925))

(assert (=> b!1575398 d!165601))

(declare-fun d!165611 () Bool)

(declare-fun lt!675160 () (_ BitVec 32))

(declare-fun lt!675159 () (_ BitVec 32))

(assert (=> d!165611 (= lt!675160 (bvmul (bvxor lt!675159 (bvlshr lt!675159 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165611 (= lt!675159 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165611 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1075674 (let ((h!38278 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141655 (bvmul (bvxor h!38278 (bvlshr h!38278 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141655 (bvlshr x!141655 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1075674 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1075674 #b00000000000000000000000000000000))))))

(assert (=> d!165611 (= (toIndex!0 k0!754 mask!889) (bvand (bvxor lt!675160 (bvlshr lt!675160 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1575398 d!165611))

(declare-fun d!165613 () Bool)

(assert (=> d!165613 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!135564 d!165613))

(declare-fun d!165621 () Bool)

(assert (=> d!165621 (= (array_inv!39713 _keys!600) (bvsge (size!51309 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!135564 d!165621))

(declare-fun d!165623 () Bool)

(assert (=> d!165623 (= (validKeyInArray!0 k0!754) (and (not (= k0!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1575397 d!165623))

(check-sat (not d!165595) (not b!1575438) (not d!165601) (not b!1575491))
(check-sat)
