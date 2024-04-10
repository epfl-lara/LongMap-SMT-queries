; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136246 () Bool)

(assert start!136246)

(declare-fun b!1576786 () Bool)

(declare-fun res!1077153 () Bool)

(declare-fun e!879484 () Bool)

(assert (=> b!1576786 (=> (not res!1077153) (not e!879484))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576786 (= res!1077153 (validKeyInArray!0 k!761))))

(declare-fun b!1576787 () Bool)

(declare-fun e!879485 () Bool)

(assert (=> b!1576787 (= e!879484 e!879485)))

(declare-fun res!1077152 () Bool)

(assert (=> b!1576787 (=> (not res!1077152) (not e!879485))))

(declare-fun lt!675793 () Bool)

(declare-datatypes ((SeekEntryResult!13746 0))(
  ( (MissingZero!13746 (index!57382 (_ BitVec 32))) (Found!13746 (index!57383 (_ BitVec 32))) (Intermediate!13746 (undefined!14558 Bool) (index!57384 (_ BitVec 32)) (x!142400 (_ BitVec 32))) (Undefined!13746) (MissingVacant!13746 (index!57385 (_ BitVec 32))) )
))
(declare-fun lt!675792 () SeekEntryResult!13746)

(assert (=> b!1576787 (= res!1077152 (and (or lt!675793 (not (undefined!14558 lt!675792))) (or lt!675793 (undefined!14558 lt!675792))))))

(assert (=> b!1576787 (= lt!675793 (not (is-Intermediate!13746 lt!675792)))))

(declare-datatypes ((array!105512 0))(
  ( (array!105513 (arr!50881 (Array (_ BitVec 32) (_ BitVec 64))) (size!51431 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105512)

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105512 (_ BitVec 32)) SeekEntryResult!13746)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576787 (= lt!675792 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(declare-fun b!1576785 () Bool)

(declare-fun res!1077150 () Bool)

(assert (=> b!1576785 (=> (not res!1077150) (not e!879484))))

(assert (=> b!1576785 (= res!1077150 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51431 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1576788 () Bool)

(declare-fun lt!675791 () SeekEntryResult!13746)

(assert (=> b!1576788 (= e!879485 (and (not (is-Undefined!13746 lt!675791)) (not (is-Found!13746 lt!675791)) (not (is-MissingZero!13746 lt!675791)) (is-MissingVacant!13746 lt!675791) (or (bvslt (index!57385 lt!675791) #b00000000000000000000000000000000) (bvsge (index!57385 lt!675791) (size!51431 _keys!605)))))))

(declare-fun err!198 () SeekEntryResult!13746)

(assert (=> b!1576788 (= lt!675791 err!198)))

(assert (=> b!1576788 true))

(declare-fun res!1077151 () Bool)

(assert (=> start!136246 (=> (not res!1077151) (not e!879484))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136246 (= res!1077151 (validMask!0 mask!898))))

(assert (=> start!136246 e!879484))

(assert (=> start!136246 true))

(declare-fun array_inv!39608 (array!105512) Bool)

(assert (=> start!136246 (array_inv!39608 _keys!605)))

(assert (= (and start!136246 res!1077151) b!1576785))

(assert (= (and b!1576785 res!1077150) b!1576786))

(assert (= (and b!1576786 res!1077153) b!1576787))

(assert (= (and b!1576787 res!1077152) b!1576788))

(declare-fun m!1449229 () Bool)

(assert (=> b!1576786 m!1449229))

(declare-fun m!1449231 () Bool)

(assert (=> b!1576787 m!1449231))

(assert (=> b!1576787 m!1449231))

(declare-fun m!1449233 () Bool)

(assert (=> b!1576787 m!1449233))

(declare-fun m!1449235 () Bool)

(assert (=> start!136246 m!1449235))

(declare-fun m!1449237 () Bool)

(assert (=> start!136246 m!1449237))

(push 1)

(assert (not start!136246))

(assert (not b!1576786))

(assert (not b!1576787))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!165753 () Bool)

(assert (=> d!165753 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!136246 d!165753))

(declare-fun d!165763 () Bool)

(assert (=> d!165763 (= (array_inv!39608 _keys!605) (bvsge (size!51431 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!136246 d!165763))

(declare-fun d!165765 () Bool)

(assert (=> d!165765 (= (validKeyInArray!0 k!761) (and (not (= k!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1576786 d!165765))

(declare-fun b!1576858 () Bool)

(declare-fun e!879529 () Bool)

(declare-fun lt!675829 () SeekEntryResult!13746)

(assert (=> b!1576858 (= e!879529 (bvsge (x!142400 lt!675829) #b01111111111111111111111111111110))))

(declare-fun b!1576859 () Bool)

(assert (=> b!1576859 (and (bvsge (index!57384 lt!675829) #b00000000000000000000000000000000) (bvslt (index!57384 lt!675829) (size!51431 _keys!605)))))

(declare-fun e!879530 () Bool)

(assert (=> b!1576859 (= e!879530 (= (select (arr!50881 _keys!605) (index!57384 lt!675829)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1576860 () Bool)

(assert (=> b!1576860 (and (bvsge (index!57384 lt!675829) #b00000000000000000000000000000000) (bvslt (index!57384 lt!675829) (size!51431 _keys!605)))))

(declare-fun res!1077195 () Bool)

(assert (=> b!1576860 (= res!1077195 (= (select (arr!50881 _keys!605) (index!57384 lt!675829)) k!761))))

(assert (=> b!1576860 (=> res!1077195 e!879530)))

(declare-fun e!879531 () Bool)

(assert (=> b!1576860 (= e!879531 e!879530)))

(declare-fun d!165767 () Bool)

(assert (=> d!165767 e!879529))

(declare-fun c!146115 () Bool)

(assert (=> d!165767 (= c!146115 (and (is-Intermediate!13746 lt!675829) (undefined!14558 lt!675829)))))

(declare-fun e!879532 () SeekEntryResult!13746)

(assert (=> d!165767 (= lt!675829 e!879532)))

(declare-fun c!146114 () Bool)

(assert (=> d!165767 (= c!146114 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!675828 () (_ BitVec 64))

(assert (=> d!165767 (= lt!675828 (select (arr!50881 _keys!605) (toIndex!0 k!761 mask!898)))))

(assert (=> d!165767 (validMask!0 mask!898)))

(assert (=> d!165767 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898) lt!675829)))

(declare-fun b!1576861 () Bool)

(assert (=> b!1576861 (= e!879532 (Intermediate!13746 true (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1576862 () Bool)

(declare-fun e!879533 () SeekEntryResult!13746)

(assert (=> b!1576862 (= e!879532 e!879533)))

(declare-fun c!146113 () Bool)

(assert (=> b!1576862 (= c!146113 (or (= lt!675828 k!761) (= (bvadd lt!675828 lt!675828) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1576863 () Bool)

(assert (=> b!1576863 (and (bvsge (index!57384 lt!675829) #b00000000000000000000000000000000) (bvslt (index!57384 lt!675829) (size!51431 _keys!605)))))

(declare-fun res!1077196 () Bool)

(assert (=> b!1576863 (= res!1077196 (= (select (arr!50881 _keys!605) (index!57384 lt!675829)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1576863 (=> res!1077196 e!879530)))

(declare-fun b!1576864 () Bool)

(assert (=> b!1576864 (= e!879529 e!879531)))

(declare-fun res!1077194 () Bool)

(assert (=> b!1576864 (= res!1077194 (and (is-Intermediate!13746 lt!675829) (not (undefined!14558 lt!675829)) (bvslt (x!142400 lt!675829) #b01111111111111111111111111111110) (bvsge (x!142400 lt!675829) #b00000000000000000000000000000000) (bvsge (x!142400 lt!675829) #b00000000000000000000000000000000)))))

(assert (=> b!1576864 (=> (not res!1077194) (not e!879531))))

(declare-fun b!1576865 () Bool)

(assert (=> b!1576865 (= e!879533 (Intermediate!13746 false (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1576866 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576866 (= e!879533 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and d!165767 c!146114) b!1576861))

(assert (= (and d!165767 (not c!146114)) b!1576862))

(assert (= (and b!1576862 c!146113) b!1576865))

(assert (= (and b!1576862 (not c!146113)) b!1576866))

(assert (= (and d!165767 c!146115) b!1576858))

(assert (= (and d!165767 (not c!146115)) b!1576864))

(assert (= (and b!1576864 res!1077194) b!1576860))

(assert (= (and b!1576860 (not res!1077195)) b!1576863))

