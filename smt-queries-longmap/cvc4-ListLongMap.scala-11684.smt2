; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136658 () Bool)

(assert start!136658)

(declare-fun res!1078316 () Bool)

(declare-fun e!880322 () Bool)

(assert (=> start!136658 (=> (not res!1078316) (not e!880322))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136658 (= res!1078316 (validMask!0 mask!918))))

(assert (=> start!136658 e!880322))

(assert (=> start!136658 true))

(declare-datatypes ((array!105720 0))(
  ( (array!105721 (arr!50973 (Array (_ BitVec 32) (_ BitVec 64))) (size!51523 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105720)

(declare-fun array_inv!39700 (array!105720) Bool)

(assert (=> start!136658 (array_inv!39700 _keys!614)))

(declare-fun b!1578268 () Bool)

(declare-fun res!1078315 () Bool)

(assert (=> b!1578268 (=> (not res!1078315) (not e!880322))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(assert (=> b!1578268 (= res!1078315 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51523 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50973 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1578269 () Bool)

(declare-fun res!1078317 () Bool)

(assert (=> b!1578269 (=> (not res!1078317) (not e!880322))))

(declare-fun k!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578269 (= res!1078317 (validKeyInArray!0 k!772))))

(declare-fun b!1578270 () Bool)

(assert (=> b!1578270 (= e!880322 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50973 _keys!614) ee!18) k!772)) (= (select (arr!50973 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantSpotIndex!10 (size!51523 _keys!614))))))

(assert (= (and start!136658 res!1078316) b!1578268))

(assert (= (and b!1578268 res!1078315) b!1578269))

(assert (= (and b!1578269 res!1078317) b!1578270))

(declare-fun m!1450371 () Bool)

(assert (=> start!136658 m!1450371))

(declare-fun m!1450373 () Bool)

(assert (=> start!136658 m!1450373))

(declare-fun m!1450375 () Bool)

(assert (=> b!1578268 m!1450375))

(declare-fun m!1450377 () Bool)

(assert (=> b!1578269 m!1450377))

(declare-fun m!1450379 () Bool)

(assert (=> b!1578270 m!1450379))

(push 1)

(assert (not start!136658))

(assert (not b!1578269))

(check-sat)

(pop 1)

(push 1)

(check-sat)

