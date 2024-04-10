; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136614 () Bool)

(assert start!136614)

(declare-fun b!1578067 () Bool)

(declare-fun res!1078113 () Bool)

(declare-fun e!880189 () Bool)

(assert (=> b!1578067 (=> (not res!1078113) (not e!880189))))

(declare-fun k0!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578067 (= res!1078113 (validKeyInArray!0 k0!772))))

(declare-fun b!1578068 () Bool)

(declare-fun res!1078116 () Bool)

(assert (=> b!1578068 (=> (not res!1078116) (not e!880189))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(declare-datatypes ((array!105676 0))(
  ( (array!105677 (arr!50951 (Array (_ BitVec 32) (_ BitVec 64))) (size!51501 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105676)

(assert (=> b!1578068 (= res!1078116 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50951 _keys!614) ee!18) k0!772)) (not (= (select (arr!50951 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1578069 () Bool)

(assert (=> b!1578069 (= e!880189 false)))

(declare-fun lt!676186 () (_ BitVec 32))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1578069 (= lt!676186 (nextIndex!0 ee!18 x!466 mask!918))))

(declare-fun b!1578066 () Bool)

(declare-fun res!1078114 () Bool)

(assert (=> b!1578066 (=> (not res!1078114) (not e!880189))))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(assert (=> b!1578066 (= res!1078114 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51501 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50951 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1078115 () Bool)

(assert (=> start!136614 (=> (not res!1078115) (not e!880189))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136614 (= res!1078115 (validMask!0 mask!918))))

(assert (=> start!136614 e!880189))

(assert (=> start!136614 true))

(declare-fun array_inv!39678 (array!105676) Bool)

(assert (=> start!136614 (array_inv!39678 _keys!614)))

(assert (= (and start!136614 res!1078115) b!1578066))

(assert (= (and b!1578066 res!1078114) b!1578067))

(assert (= (and b!1578067 res!1078113) b!1578068))

(assert (= (and b!1578068 res!1078116) b!1578069))

(declare-fun m!1450165 () Bool)

(assert (=> b!1578067 m!1450165))

(declare-fun m!1450167 () Bool)

(assert (=> start!136614 m!1450167))

(declare-fun m!1450169 () Bool)

(assert (=> start!136614 m!1450169))

(declare-fun m!1450171 () Bool)

(assert (=> b!1578066 m!1450171))

(declare-fun m!1450173 () Bool)

(assert (=> b!1578069 m!1450173))

(declare-fun m!1450175 () Bool)

(assert (=> b!1578068 m!1450175))

(check-sat (not start!136614) (not b!1578067) (not b!1578069))
