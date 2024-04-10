; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136632 () Bool)

(assert start!136632)

(declare-fun res!1078206 () Bool)

(declare-fun e!880243 () Bool)

(assert (=> start!136632 (=> (not res!1078206) (not e!880243))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136632 (= res!1078206 (validMask!0 mask!918))))

(assert (=> start!136632 e!880243))

(assert (=> start!136632 true))

(declare-datatypes ((array!105694 0))(
  ( (array!105695 (arr!50960 (Array (_ BitVec 32) (_ BitVec 64))) (size!51510 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105694)

(declare-fun array_inv!39687 (array!105694) Bool)

(assert (=> start!136632 (array_inv!39687 _keys!614)))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(declare-fun b!1578159 () Bool)

(assert (=> b!1578159 (= e!880243 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51510 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge vacantSpotIndex!10 (size!51510 _keys!614))))))

(assert (= (and start!136632 res!1078206) b!1578159))

(declare-fun m!1450265 () Bool)

(assert (=> start!136632 m!1450265))

(declare-fun m!1450267 () Bool)

(assert (=> start!136632 m!1450267))

(check-sat (not start!136632))
(check-sat)
