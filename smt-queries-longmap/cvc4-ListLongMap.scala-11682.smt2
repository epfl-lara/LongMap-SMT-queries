; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136646 () Bool)

(assert start!136646)

(declare-fun res!1078261 () Bool)

(declare-fun e!880285 () Bool)

(assert (=> start!136646 (=> (not res!1078261) (not e!880285))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136646 (= res!1078261 (validMask!0 mask!918))))

(assert (=> start!136646 e!880285))

(assert (=> start!136646 true))

(declare-datatypes ((array!105708 0))(
  ( (array!105709 (arr!50967 (Array (_ BitVec 32) (_ BitVec 64))) (size!51517 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105708)

(declare-fun array_inv!39694 (array!105708) Bool)

(assert (=> start!136646 (array_inv!39694 _keys!614)))

(declare-fun b!1578214 () Bool)

(declare-fun res!1078263 () Bool)

(assert (=> b!1578214 (=> (not res!1078263) (not e!880285))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(assert (=> b!1578214 (= res!1078263 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51517 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50967 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1578215 () Bool)

(declare-fun res!1078262 () Bool)

(assert (=> b!1578215 (=> (not res!1078262) (not e!880285))))

(declare-fun k!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578215 (= res!1078262 (validKeyInArray!0 k!772))))

(declare-fun b!1578216 () Bool)

(assert (=> b!1578216 (= e!880285 (bvsge ee!18 (size!51517 _keys!614)))))

(assert (= (and start!136646 res!1078261) b!1578214))

(assert (= (and b!1578214 res!1078263) b!1578215))

(assert (= (and b!1578215 res!1078262) b!1578216))

(declare-fun m!1450313 () Bool)

(assert (=> start!136646 m!1450313))

(declare-fun m!1450315 () Bool)

(assert (=> start!136646 m!1450315))

(declare-fun m!1450317 () Bool)

(assert (=> b!1578214 m!1450317))

(declare-fun m!1450319 () Bool)

(assert (=> b!1578215 m!1450319))

(push 1)

(assert (not b!1578215))

(assert (not start!136646))

(check-sat)

(pop 1)

(push 1)

(check-sat)

