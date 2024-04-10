; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136566 () Bool)

(assert start!136566)

(declare-fun b!1577925 () Bool)

(declare-fun e!880118 () Bool)

(assert (=> b!1577925 (= e!880118 false)))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(declare-fun lt!676141 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577925 (= lt!676141 (nextIndex!0 ee!18 x!466 mask!918))))

(declare-fun res!1077972 () Bool)

(assert (=> start!136566 (=> (not res!1077972) (not e!880118))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136566 (= res!1077972 (validMask!0 mask!918))))

(assert (=> start!136566 e!880118))

(assert (=> start!136566 true))

(declare-datatypes ((array!105649 0))(
  ( (array!105650 (arr!50939 (Array (_ BitVec 32) (_ BitVec 64))) (size!51489 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105649)

(declare-fun array_inv!39666 (array!105649) Bool)

(assert (=> start!136566 (array_inv!39666 _keys!614)))

(declare-fun b!1577923 () Bool)

(declare-fun res!1077969 () Bool)

(assert (=> b!1577923 (=> (not res!1077969) (not e!880118))))

(declare-fun k0!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577923 (= res!1077969 (validKeyInArray!0 k0!772))))

(declare-fun b!1577922 () Bool)

(declare-fun res!1077971 () Bool)

(assert (=> b!1577922 (=> (not res!1077971) (not e!880118))))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(assert (=> b!1577922 (= res!1077971 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51489 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50939 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1577924 () Bool)

(declare-fun res!1077970 () Bool)

(assert (=> b!1577924 (=> (not res!1077970) (not e!880118))))

(assert (=> b!1577924 (= res!1077970 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50939 _keys!614) ee!18) k0!772)) (not (= (select (arr!50939 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!136566 res!1077972) b!1577922))

(assert (= (and b!1577922 res!1077971) b!1577923))

(assert (= (and b!1577923 res!1077969) b!1577924))

(assert (= (and b!1577924 res!1077970) b!1577925))

(declare-fun m!1450015 () Bool)

(assert (=> b!1577925 m!1450015))

(declare-fun m!1450017 () Bool)

(assert (=> b!1577924 m!1450017))

(declare-fun m!1450019 () Bool)

(assert (=> b!1577923 m!1450019))

(declare-fun m!1450021 () Bool)

(assert (=> start!136566 m!1450021))

(declare-fun m!1450023 () Bool)

(assert (=> start!136566 m!1450023))

(declare-fun m!1450025 () Bool)

(assert (=> b!1577922 m!1450025))

(check-sat (not b!1577925) (not b!1577923) (not start!136566))
