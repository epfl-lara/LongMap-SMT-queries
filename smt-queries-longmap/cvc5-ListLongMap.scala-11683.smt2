; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136648 () Bool)

(assert start!136648)

(declare-fun res!1078272 () Bool)

(declare-fun e!880292 () Bool)

(assert (=> start!136648 (=> (not res!1078272) (not e!880292))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136648 (= res!1078272 (validMask!0 mask!918))))

(assert (=> start!136648 e!880292))

(assert (=> start!136648 true))

(declare-datatypes ((array!105710 0))(
  ( (array!105711 (arr!50968 (Array (_ BitVec 32) (_ BitVec 64))) (size!51518 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105710)

(declare-fun array_inv!39695 (array!105710) Bool)

(assert (=> start!136648 (array_inv!39695 _keys!614)))

(declare-fun b!1578223 () Bool)

(declare-fun res!1078271 () Bool)

(assert (=> b!1578223 (=> (not res!1078271) (not e!880292))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(assert (=> b!1578223 (= res!1078271 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51518 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50968 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1578224 () Bool)

(declare-fun res!1078270 () Bool)

(assert (=> b!1578224 (=> (not res!1078270) (not e!880292))))

(declare-fun k!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578224 (= res!1078270 (validKeyInArray!0 k!772))))

(declare-fun b!1578225 () Bool)

(assert (=> b!1578225 (= e!880292 (and (bvslt x!466 #b01111111111111111111111111111110) (= (select (arr!50968 _keys!614) ee!18) k!772) (bvsge ee!18 (size!51518 _keys!614))))))

(assert (= (and start!136648 res!1078272) b!1578223))

(assert (= (and b!1578223 res!1078271) b!1578224))

(assert (= (and b!1578224 res!1078270) b!1578225))

(declare-fun m!1450321 () Bool)

(assert (=> start!136648 m!1450321))

(declare-fun m!1450323 () Bool)

(assert (=> start!136648 m!1450323))

(declare-fun m!1450325 () Bool)

(assert (=> b!1578223 m!1450325))

(declare-fun m!1450327 () Bool)

(assert (=> b!1578224 m!1450327))

(declare-fun m!1450329 () Bool)

(assert (=> b!1578225 m!1450329))

(push 1)

(assert (not b!1578224))

(assert (not start!136648))

(check-sat)

(pop 1)

(push 1)

(check-sat)
