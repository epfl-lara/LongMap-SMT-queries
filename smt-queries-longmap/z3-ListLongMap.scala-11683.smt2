; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136650 () Bool)

(assert start!136650)

(declare-fun res!1078279 () Bool)

(declare-fun e!880297 () Bool)

(assert (=> start!136650 (=> (not res!1078279) (not e!880297))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136650 (= res!1078279 (validMask!0 mask!918))))

(assert (=> start!136650 e!880297))

(assert (=> start!136650 true))

(declare-datatypes ((array!105712 0))(
  ( (array!105713 (arr!50969 (Array (_ BitVec 32) (_ BitVec 64))) (size!51519 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105712)

(declare-fun array_inv!39696 (array!105712) Bool)

(assert (=> start!136650 (array_inv!39696 _keys!614)))

(declare-fun b!1578232 () Bool)

(declare-fun res!1078281 () Bool)

(assert (=> b!1578232 (=> (not res!1078281) (not e!880297))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(assert (=> b!1578232 (= res!1078281 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51519 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50969 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1578233 () Bool)

(declare-fun res!1078280 () Bool)

(assert (=> b!1578233 (=> (not res!1078280) (not e!880297))))

(declare-fun k0!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578233 (= res!1078280 (validKeyInArray!0 k0!772))))

(declare-fun b!1578234 () Bool)

(assert (=> b!1578234 (= e!880297 (and (bvslt x!466 #b01111111111111111111111111111110) (= (select (arr!50969 _keys!614) ee!18) k0!772) (bvsge ee!18 (size!51519 _keys!614))))))

(assert (= (and start!136650 res!1078279) b!1578232))

(assert (= (and b!1578232 res!1078281) b!1578233))

(assert (= (and b!1578233 res!1078280) b!1578234))

(declare-fun m!1450331 () Bool)

(assert (=> start!136650 m!1450331))

(declare-fun m!1450333 () Bool)

(assert (=> start!136650 m!1450333))

(declare-fun m!1450335 () Bool)

(assert (=> b!1578232 m!1450335))

(declare-fun m!1450337 () Bool)

(assert (=> b!1578233 m!1450337))

(declare-fun m!1450339 () Bool)

(assert (=> b!1578234 m!1450339))

(check-sat (not b!1578233) (not start!136650))
(check-sat)
