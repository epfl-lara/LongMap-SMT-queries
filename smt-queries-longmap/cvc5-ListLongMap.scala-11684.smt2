; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136654 () Bool)

(assert start!136654)

(declare-fun res!1078298 () Bool)

(declare-fun e!880310 () Bool)

(assert (=> start!136654 (=> (not res!1078298) (not e!880310))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136654 (= res!1078298 (validMask!0 mask!918))))

(assert (=> start!136654 e!880310))

(assert (=> start!136654 true))

(declare-datatypes ((array!105716 0))(
  ( (array!105717 (arr!50971 (Array (_ BitVec 32) (_ BitVec 64))) (size!51521 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105716)

(declare-fun array_inv!39698 (array!105716) Bool)

(assert (=> start!136654 (array_inv!39698 _keys!614)))

(declare-fun b!1578250 () Bool)

(declare-fun res!1078297 () Bool)

(assert (=> b!1578250 (=> (not res!1078297) (not e!880310))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(assert (=> b!1578250 (= res!1078297 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51521 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50971 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1578251 () Bool)

(declare-fun res!1078299 () Bool)

(assert (=> b!1578251 (=> (not res!1078299) (not e!880310))))

(declare-fun k!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578251 (= res!1078299 (validKeyInArray!0 k!772))))

(declare-fun b!1578252 () Bool)

(assert (=> b!1578252 (= e!880310 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50971 _keys!614) ee!18) k!772)) (= (select (arr!50971 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantSpotIndex!10 (size!51521 _keys!614))))))

(assert (= (and start!136654 res!1078298) b!1578250))

(assert (= (and b!1578250 res!1078297) b!1578251))

(assert (= (and b!1578251 res!1078299) b!1578252))

(declare-fun m!1450351 () Bool)

(assert (=> start!136654 m!1450351))

(declare-fun m!1450353 () Bool)

(assert (=> start!136654 m!1450353))

(declare-fun m!1450355 () Bool)

(assert (=> b!1578250 m!1450355))

(declare-fun m!1450357 () Bool)

(assert (=> b!1578251 m!1450357))

(declare-fun m!1450359 () Bool)

(assert (=> b!1578252 m!1450359))

(push 1)

(assert (not b!1578251))

(assert (not start!136654))

(check-sat)

(pop 1)

(push 1)

(check-sat)
