; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136626 () Bool)

(assert start!136626)

(declare-fun b!1578138 () Bool)

(declare-fun res!1078187 () Bool)

(declare-fun e!880225 () Bool)

(assert (=> b!1578138 (=> (not res!1078187) (not e!880225))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(declare-datatypes ((array!105688 0))(
  ( (array!105689 (arr!50957 (Array (_ BitVec 32) (_ BitVec 64))) (size!51507 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105688)

(assert (=> b!1578138 (= res!1078187 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51507 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50957 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1078186 () Bool)

(assert (=> start!136626 (=> (not res!1078186) (not e!880225))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136626 (= res!1078186 (validMask!0 mask!918))))

(assert (=> start!136626 e!880225))

(assert (=> start!136626 true))

(declare-fun array_inv!39684 (array!105688) Bool)

(assert (=> start!136626 (array_inv!39684 _keys!614)))

(declare-fun b!1578141 () Bool)

(assert (=> b!1578141 (= e!880225 false)))

(declare-fun lt!676204 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1578141 (= lt!676204 (nextIndex!0 ee!18 x!466 mask!918))))

(declare-fun b!1578140 () Bool)

(declare-fun res!1078188 () Bool)

(assert (=> b!1578140 (=> (not res!1078188) (not e!880225))))

(declare-fun k0!772 () (_ BitVec 64))

(assert (=> b!1578140 (= res!1078188 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50957 _keys!614) ee!18) k0!772)) (not (= (select (arr!50957 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1578139 () Bool)

(declare-fun res!1078185 () Bool)

(assert (=> b!1578139 (=> (not res!1078185) (not e!880225))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578139 (= res!1078185 (validKeyInArray!0 k0!772))))

(assert (= (and start!136626 res!1078186) b!1578138))

(assert (= (and b!1578138 res!1078187) b!1578139))

(assert (= (and b!1578139 res!1078185) b!1578140))

(assert (= (and b!1578140 res!1078188) b!1578141))

(declare-fun m!1450237 () Bool)

(assert (=> b!1578140 m!1450237))

(declare-fun m!1450239 () Bool)

(assert (=> b!1578139 m!1450239))

(declare-fun m!1450241 () Bool)

(assert (=> b!1578141 m!1450241))

(declare-fun m!1450243 () Bool)

(assert (=> start!136626 m!1450243))

(declare-fun m!1450245 () Bool)

(assert (=> start!136626 m!1450245))

(declare-fun m!1450247 () Bool)

(assert (=> b!1578138 m!1450247))

(check-sat (not b!1578141) (not start!136626) (not b!1578139))
