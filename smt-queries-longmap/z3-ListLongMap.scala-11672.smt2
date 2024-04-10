; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136560 () Bool)

(assert start!136560)

(declare-fun res!1077935 () Bool)

(declare-fun e!880099 () Bool)

(assert (=> start!136560 (=> (not res!1077935) (not e!880099))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136560 (= res!1077935 (validMask!0 mask!918))))

(assert (=> start!136560 e!880099))

(assert (=> start!136560 true))

(declare-datatypes ((array!105643 0))(
  ( (array!105644 (arr!50936 (Array (_ BitVec 32) (_ BitVec 64))) (size!51486 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105643)

(declare-fun array_inv!39663 (array!105643) Bool)

(assert (=> start!136560 (array_inv!39663 _keys!614)))

(declare-fun b!1577889 () Bool)

(assert (=> b!1577889 (= e!880099 false)))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun lt!676132 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577889 (= lt!676132 (nextIndex!0 ee!18 x!466 mask!918))))

(declare-fun b!1577886 () Bool)

(declare-fun res!1077933 () Bool)

(assert (=> b!1577886 (=> (not res!1077933) (not e!880099))))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(assert (=> b!1577886 (= res!1077933 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51486 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50936 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1577887 () Bool)

(declare-fun res!1077934 () Bool)

(assert (=> b!1577887 (=> (not res!1077934) (not e!880099))))

(declare-fun k0!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577887 (= res!1077934 (validKeyInArray!0 k0!772))))

(declare-fun b!1577888 () Bool)

(declare-fun res!1077936 () Bool)

(assert (=> b!1577888 (=> (not res!1077936) (not e!880099))))

(assert (=> b!1577888 (= res!1077936 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50936 _keys!614) ee!18) k0!772)) (not (= (select (arr!50936 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!136560 res!1077935) b!1577886))

(assert (= (and b!1577886 res!1077933) b!1577887))

(assert (= (and b!1577887 res!1077934) b!1577888))

(assert (= (and b!1577888 res!1077936) b!1577889))

(declare-fun m!1449979 () Bool)

(assert (=> b!1577888 m!1449979))

(declare-fun m!1449981 () Bool)

(assert (=> start!136560 m!1449981))

(declare-fun m!1449983 () Bool)

(assert (=> start!136560 m!1449983))

(declare-fun m!1449985 () Bool)

(assert (=> b!1577887 m!1449985))

(declare-fun m!1449987 () Bool)

(assert (=> b!1577886 m!1449987))

(declare-fun m!1449989 () Bool)

(assert (=> b!1577889 m!1449989))

(check-sat (not b!1577887) (not start!136560) (not b!1577889))
