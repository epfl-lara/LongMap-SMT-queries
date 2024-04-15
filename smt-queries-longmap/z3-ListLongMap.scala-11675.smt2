; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136540 () Bool)

(assert start!136540)

(declare-fun b!1577672 () Bool)

(declare-fun e!879949 () Bool)

(declare-fun lt!675870 () (_ BitVec 32))

(declare-fun mask!918 () (_ BitVec 32))

(assert (=> b!1577672 (= e!879949 (or (bvslt lt!675870 #b00000000000000000000000000000000) (bvsge lt!675870 (bvadd #b00000000000000000000000000000001 mask!918))))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577672 (= lt!675870 (nextIndex!0 ee!18 x!466 mask!918))))

(declare-fun b!1577671 () Bool)

(declare-fun res!1077900 () Bool)

(assert (=> b!1577671 (=> (not res!1077900) (not e!879949))))

(declare-fun k0!772 () (_ BitVec 64))

(declare-datatypes ((array!105590 0))(
  ( (array!105591 (arr!50909 (Array (_ BitVec 32) (_ BitVec 64))) (size!51461 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105590)

(assert (=> b!1577671 (= res!1077900 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50909 _keys!614) ee!18) k0!772)) (not (= (select (arr!50909 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1577669 () Bool)

(declare-fun res!1077901 () Bool)

(assert (=> b!1577669 (=> (not res!1077901) (not e!879949))))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(assert (=> b!1577669 (= res!1077901 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51461 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50909 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1077903 () Bool)

(assert (=> start!136540 (=> (not res!1077903) (not e!879949))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136540 (= res!1077903 (validMask!0 mask!918))))

(assert (=> start!136540 e!879949))

(assert (=> start!136540 true))

(declare-fun array_inv!39845 (array!105590) Bool)

(assert (=> start!136540 (array_inv!39845 _keys!614)))

(declare-fun b!1577670 () Bool)

(declare-fun res!1077902 () Bool)

(assert (=> b!1577670 (=> (not res!1077902) (not e!879949))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577670 (= res!1077902 (validKeyInArray!0 k0!772))))

(assert (= (and start!136540 res!1077903) b!1577669))

(assert (= (and b!1577669 res!1077901) b!1577670))

(assert (= (and b!1577670 res!1077902) b!1577671))

(assert (= (and b!1577671 res!1077900) b!1577672))

(declare-fun m!1449183 () Bool)

(assert (=> b!1577672 m!1449183))

(declare-fun m!1449185 () Bool)

(assert (=> b!1577671 m!1449185))

(declare-fun m!1449187 () Bool)

(assert (=> start!136540 m!1449187))

(declare-fun m!1449189 () Bool)

(assert (=> start!136540 m!1449189))

(declare-fun m!1449191 () Bool)

(assert (=> b!1577669 m!1449191))

(declare-fun m!1449193 () Bool)

(assert (=> b!1577670 m!1449193))

(check-sat (not b!1577672) (not b!1577670) (not start!136540))
(check-sat)
(get-model)

(declare-fun d!165757 () Bool)

(declare-fun lt!675879 () (_ BitVec 32))

(assert (=> d!165757 (and (bvsge lt!675879 #b00000000000000000000000000000000) (bvslt lt!675879 (bvadd mask!918 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!165757 (= lt!675879 (choose!52 ee!18 x!466 mask!918))))

(assert (=> d!165757 (validMask!0 mask!918)))

(assert (=> d!165757 (= (nextIndex!0 ee!18 x!466 mask!918) lt!675879)))

(declare-fun bs!45570 () Bool)

(assert (= bs!45570 d!165757))

(declare-fun m!1449219 () Bool)

(assert (=> bs!45570 m!1449219))

(assert (=> bs!45570 m!1449187))

(assert (=> b!1577672 d!165757))

(declare-fun d!165759 () Bool)

(assert (=> d!165759 (= (validKeyInArray!0 k0!772) (and (not (= k0!772 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!772 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1577670 d!165759))

(declare-fun d!165761 () Bool)

(assert (=> d!165761 (= (validMask!0 mask!918) (and (or (= mask!918 #b00000000000000000000000000000111) (= mask!918 #b00000000000000000000000000001111) (= mask!918 #b00000000000000000000000000011111) (= mask!918 #b00000000000000000000000000111111) (= mask!918 #b00000000000000000000000001111111) (= mask!918 #b00000000000000000000000011111111) (= mask!918 #b00000000000000000000000111111111) (= mask!918 #b00000000000000000000001111111111) (= mask!918 #b00000000000000000000011111111111) (= mask!918 #b00000000000000000000111111111111) (= mask!918 #b00000000000000000001111111111111) (= mask!918 #b00000000000000000011111111111111) (= mask!918 #b00000000000000000111111111111111) (= mask!918 #b00000000000000001111111111111111) (= mask!918 #b00000000000000011111111111111111) (= mask!918 #b00000000000000111111111111111111) (= mask!918 #b00000000000001111111111111111111) (= mask!918 #b00000000000011111111111111111111) (= mask!918 #b00000000000111111111111111111111) (= mask!918 #b00000000001111111111111111111111) (= mask!918 #b00000000011111111111111111111111) (= mask!918 #b00000000111111111111111111111111) (= mask!918 #b00000001111111111111111111111111) (= mask!918 #b00000011111111111111111111111111) (= mask!918 #b00000111111111111111111111111111) (= mask!918 #b00001111111111111111111111111111) (= mask!918 #b00011111111111111111111111111111) (= mask!918 #b00111111111111111111111111111111)) (bvsle mask!918 #b00111111111111111111111111111111)))))

(assert (=> start!136540 d!165761))

(declare-fun d!165767 () Bool)

(assert (=> d!165767 (= (array_inv!39845 _keys!614) (bvsge (size!51461 _keys!614) #b00000000000000000000000000000000))))

(assert (=> start!136540 d!165767))

(check-sat (not d!165757))
(check-sat)
