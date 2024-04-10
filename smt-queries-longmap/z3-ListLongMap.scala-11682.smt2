; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136644 () Bool)

(assert start!136644)

(declare-fun res!1078254 () Bool)

(declare-fun e!880280 () Bool)

(assert (=> start!136644 (=> (not res!1078254) (not e!880280))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136644 (= res!1078254 (validMask!0 mask!918))))

(assert (=> start!136644 e!880280))

(assert (=> start!136644 true))

(declare-datatypes ((array!105706 0))(
  ( (array!105707 (arr!50966 (Array (_ BitVec 32) (_ BitVec 64))) (size!51516 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105706)

(declare-fun array_inv!39693 (array!105706) Bool)

(assert (=> start!136644 (array_inv!39693 _keys!614)))

(declare-fun b!1578205 () Bool)

(declare-fun res!1078253 () Bool)

(assert (=> b!1578205 (=> (not res!1078253) (not e!880280))))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(declare-fun x!466 () (_ BitVec 32))

(assert (=> b!1578205 (= res!1078253 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51516 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50966 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1578206 () Bool)

(declare-fun res!1078252 () Bool)

(assert (=> b!1578206 (=> (not res!1078252) (not e!880280))))

(declare-fun k0!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578206 (= res!1078252 (validKeyInArray!0 k0!772))))

(declare-fun b!1578207 () Bool)

(assert (=> b!1578207 (= e!880280 (bvsge ee!18 (size!51516 _keys!614)))))

(assert (= (and start!136644 res!1078254) b!1578205))

(assert (= (and b!1578205 res!1078253) b!1578206))

(assert (= (and b!1578206 res!1078252) b!1578207))

(declare-fun m!1450305 () Bool)

(assert (=> start!136644 m!1450305))

(declare-fun m!1450307 () Bool)

(assert (=> start!136644 m!1450307))

(declare-fun m!1450309 () Bool)

(assert (=> b!1578205 m!1450309))

(declare-fun m!1450311 () Bool)

(assert (=> b!1578206 m!1450311))

(check-sat (not start!136644) (not b!1578206))
(check-sat)
