; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136662 () Bool)

(assert start!136662)

(declare-fun b!1578293 () Bool)

(declare-fun res!1078341 () Bool)

(declare-fun e!880334 () Bool)

(assert (=> b!1578293 (=> (not res!1078341) (not e!880334))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun k0!772 () (_ BitVec 64))

(declare-fun ee!18 () (_ BitVec 32))

(declare-datatypes ((array!105724 0))(
  ( (array!105725 (arr!50975 (Array (_ BitVec 32) (_ BitVec 64))) (size!51525 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105724)

(assert (=> b!1578293 (= res!1078341 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50975 _keys!614) ee!18) k0!772)) (not (= (select (arr!50975 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1078339 () Bool)

(assert (=> start!136662 (=> (not res!1078339) (not e!880334))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136662 (= res!1078339 (validMask!0 mask!918))))

(assert (=> start!136662 e!880334))

(assert (=> start!136662 true))

(declare-fun array_inv!39702 (array!105724) Bool)

(assert (=> start!136662 (array_inv!39702 _keys!614)))

(declare-fun b!1578294 () Bool)

(assert (=> b!1578294 (= e!880334 (bvsge (bvsub #b01111111111111111111111111111111 (bvadd #b00000000000000000000000000000001 x!466)) (bvsub #b01111111111111111111111111111111 x!466)))))

(declare-fun lt!676213 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1578294 (= lt!676213 (nextIndex!0 ee!18 x!466 mask!918))))

(declare-fun b!1578292 () Bool)

(declare-fun res!1078338 () Bool)

(assert (=> b!1578292 (=> (not res!1078338) (not e!880334))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578292 (= res!1078338 (validKeyInArray!0 k0!772))))

(declare-fun b!1578291 () Bool)

(declare-fun res!1078340 () Bool)

(assert (=> b!1578291 (=> (not res!1078340) (not e!880334))))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(assert (=> b!1578291 (= res!1078340 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51525 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50975 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!136662 res!1078339) b!1578291))

(assert (= (and b!1578291 res!1078340) b!1578292))

(assert (= (and b!1578292 res!1078338) b!1578293))

(assert (= (and b!1578293 res!1078341) b!1578294))

(declare-fun m!1450393 () Bool)

(assert (=> b!1578291 m!1450393))

(declare-fun m!1450395 () Bool)

(assert (=> b!1578294 m!1450395))

(declare-fun m!1450397 () Bool)

(assert (=> b!1578292 m!1450397))

(declare-fun m!1450399 () Bool)

(assert (=> b!1578293 m!1450399))

(declare-fun m!1450401 () Bool)

(assert (=> start!136662 m!1450401))

(declare-fun m!1450403 () Bool)

(assert (=> start!136662 m!1450403))

(check-sat (not b!1578294) (not b!1578292) (not start!136662))
(check-sat)
