; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136608 () Bool)

(assert start!136608)

(declare-fun res!1078077 () Bool)

(declare-fun e!880172 () Bool)

(assert (=> start!136608 (=> (not res!1078077) (not e!880172))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136608 (= res!1078077 (validMask!0 mask!918))))

(assert (=> start!136608 e!880172))

(assert (=> start!136608 true))

(declare-datatypes ((array!105670 0))(
  ( (array!105671 (arr!50948 (Array (_ BitVec 32) (_ BitVec 64))) (size!51498 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105670)

(declare-fun array_inv!39675 (array!105670) Bool)

(assert (=> start!136608 (array_inv!39675 _keys!614)))

(declare-fun b!1578032 () Bool)

(declare-fun res!1078078 () Bool)

(assert (=> b!1578032 (=> (not res!1078078) (not e!880172))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun k0!772 () (_ BitVec 64))

(declare-fun ee!18 () (_ BitVec 32))

(assert (=> b!1578032 (= res!1078078 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50948 _keys!614) ee!18) k0!772)) (not (= (select (arr!50948 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1578031 () Bool)

(declare-fun res!1078080 () Bool)

(assert (=> b!1578031 (=> (not res!1078080) (not e!880172))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578031 (= res!1078080 (validKeyInArray!0 k0!772))))

(declare-fun b!1578030 () Bool)

(declare-fun res!1078079 () Bool)

(assert (=> b!1578030 (=> (not res!1078079) (not e!880172))))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(assert (=> b!1578030 (= res!1078079 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51498 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50948 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!676177 () (_ BitVec 32))

(declare-fun b!1578033 () Bool)

(assert (=> b!1578033 (= e!880172 (and (bvsge lt!676177 #b00000000000000000000000000000000) (bvslt lt!676177 (bvadd #b00000000000000000000000000000001 mask!918)) (bvslt (bvadd #b00000000000000000000000000000001 x!466) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1578033 (= lt!676177 (nextIndex!0 ee!18 x!466 mask!918))))

(assert (= (and start!136608 res!1078077) b!1578030))

(assert (= (and b!1578030 res!1078079) b!1578031))

(assert (= (and b!1578031 res!1078080) b!1578032))

(assert (= (and b!1578032 res!1078078) b!1578033))

(declare-fun m!1450129 () Bool)

(assert (=> b!1578033 m!1450129))

(declare-fun m!1450131 () Bool)

(assert (=> b!1578031 m!1450131))

(declare-fun m!1450133 () Bool)

(assert (=> start!136608 m!1450133))

(declare-fun m!1450135 () Bool)

(assert (=> start!136608 m!1450135))

(declare-fun m!1450137 () Bool)

(assert (=> b!1578032 m!1450137))

(declare-fun m!1450139 () Bool)

(assert (=> b!1578030 m!1450139))

(check-sat (not b!1578031) (not start!136608) (not b!1578033))
(check-sat)
