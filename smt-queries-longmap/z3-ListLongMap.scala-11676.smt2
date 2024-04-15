; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136570 () Bool)

(assert start!136570)

(declare-fun b!1577706 () Bool)

(declare-fun res!1077937 () Bool)

(declare-fun e!879967 () Bool)

(assert (=> b!1577706 (=> (not res!1077937) (not e!879967))))

(declare-fun k0!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577706 (= res!1077937 (validKeyInArray!0 k0!772))))

(declare-fun res!1077939 () Bool)

(assert (=> start!136570 (=> (not res!1077939) (not e!879967))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136570 (= res!1077939 (validMask!0 mask!918))))

(assert (=> start!136570 e!879967))

(assert (=> start!136570 true))

(declare-datatypes ((array!105599 0))(
  ( (array!105600 (arr!50912 (Array (_ BitVec 32) (_ BitVec 64))) (size!51464 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105599)

(declare-fun array_inv!39848 (array!105599) Bool)

(assert (=> start!136570 (array_inv!39848 _keys!614)))

(declare-fun b!1577705 () Bool)

(declare-fun res!1077936 () Bool)

(assert (=> b!1577705 (=> (not res!1077936) (not e!879967))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(assert (=> b!1577705 (= res!1077936 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51464 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50912 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1577707 () Bool)

(declare-fun res!1077938 () Bool)

(assert (=> b!1577707 (=> (not res!1077938) (not e!879967))))

(assert (=> b!1577707 (= res!1077938 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50912 _keys!614) ee!18) k0!772)) (not (= (select (arr!50912 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1577708 () Bool)

(declare-fun lt!675888 () (_ BitVec 32))

(assert (=> b!1577708 (= e!879967 (and (bvsge lt!675888 #b00000000000000000000000000000000) (bvslt lt!675888 (bvadd #b00000000000000000000000000000001 mask!918)) (bvslt (bvadd #b00000000000000000000000000000001 x!466) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577708 (= lt!675888 (nextIndex!0 ee!18 x!466 mask!918))))

(assert (= (and start!136570 res!1077939) b!1577705))

(assert (= (and b!1577705 res!1077936) b!1577706))

(assert (= (and b!1577706 res!1077937) b!1577707))

(assert (= (and b!1577707 res!1077938) b!1577708))

(declare-fun m!1449225 () Bool)

(assert (=> b!1577705 m!1449225))

(declare-fun m!1449227 () Bool)

(assert (=> b!1577708 m!1449227))

(declare-fun m!1449229 () Bool)

(assert (=> b!1577707 m!1449229))

(declare-fun m!1449231 () Bool)

(assert (=> b!1577706 m!1449231))

(declare-fun m!1449233 () Bool)

(assert (=> start!136570 m!1449233))

(declare-fun m!1449235 () Bool)

(assert (=> start!136570 m!1449235))

(check-sat (not b!1577708) (not b!1577706) (not start!136570))
(check-sat)
