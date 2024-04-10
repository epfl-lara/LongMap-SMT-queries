; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136638 () Bool)

(assert start!136638)

(declare-fun res!1078225 () Bool)

(declare-fun e!880261 () Bool)

(assert (=> start!136638 (=> (not res!1078225) (not e!880261))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136638 (= res!1078225 (validMask!0 mask!918))))

(assert (=> start!136638 e!880261))

(assert (=> start!136638 true))

(declare-datatypes ((array!105700 0))(
  ( (array!105701 (arr!50963 (Array (_ BitVec 32) (_ BitVec 64))) (size!51513 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105700)

(declare-fun array_inv!39690 (array!105700) Bool)

(assert (=> start!136638 (array_inv!39690 _keys!614)))

(declare-fun b!1578178 () Bool)

(declare-fun res!1078226 () Bool)

(assert (=> b!1578178 (=> (not res!1078226) (not e!880261))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(assert (=> b!1578178 (= res!1078226 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51513 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50963 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1578179 () Bool)

(declare-fun res!1078227 () Bool)

(assert (=> b!1578179 (=> (not res!1078227) (not e!880261))))

(declare-fun k0!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578179 (= res!1078227 (validKeyInArray!0 k0!772))))

(declare-fun b!1578180 () Bool)

(assert (=> b!1578180 (= e!880261 (bvslt (bvsub #b01111111111111111111111111111111 x!466) #b00000000000000000000000000000000))))

(assert (= (and start!136638 res!1078225) b!1578178))

(assert (= (and b!1578178 res!1078226) b!1578179))

(assert (= (and b!1578179 res!1078227) b!1578180))

(declare-fun m!1450281 () Bool)

(assert (=> start!136638 m!1450281))

(declare-fun m!1450283 () Bool)

(assert (=> start!136638 m!1450283))

(declare-fun m!1450285 () Bool)

(assert (=> b!1578178 m!1450285))

(declare-fun m!1450287 () Bool)

(assert (=> b!1578179 m!1450287))

(check-sat (not b!1578179) (not start!136638))
(check-sat)
