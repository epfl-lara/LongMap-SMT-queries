; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136628 () Bool)

(assert start!136628)

(declare-fun b!1578150 () Bool)

(declare-fun res!1078198 () Bool)

(declare-fun e!880231 () Bool)

(assert (=> b!1578150 (=> (not res!1078198) (not e!880231))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(declare-datatypes ((array!105690 0))(
  ( (array!105691 (arr!50958 (Array (_ BitVec 32) (_ BitVec 64))) (size!51508 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105690)

(assert (=> b!1578150 (= res!1078198 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51508 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50958 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1578153 () Bool)

(assert (=> b!1578153 (= e!880231 false)))

(declare-fun lt!676207 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1578153 (= lt!676207 (nextIndex!0 ee!18 x!466 mask!918))))

(declare-fun b!1578151 () Bool)

(declare-fun res!1078199 () Bool)

(assert (=> b!1578151 (=> (not res!1078199) (not e!880231))))

(declare-fun k!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578151 (= res!1078199 (validKeyInArray!0 k!772))))

(declare-fun b!1578152 () Bool)

(declare-fun res!1078197 () Bool)

(assert (=> b!1578152 (=> (not res!1078197) (not e!880231))))

(assert (=> b!1578152 (= res!1078197 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50958 _keys!614) ee!18) k!772)) (not (= (select (arr!50958 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1078200 () Bool)

(assert (=> start!136628 (=> (not res!1078200) (not e!880231))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136628 (= res!1078200 (validMask!0 mask!918))))

(assert (=> start!136628 e!880231))

(assert (=> start!136628 true))

(declare-fun array_inv!39685 (array!105690) Bool)

(assert (=> start!136628 (array_inv!39685 _keys!614)))

(assert (= (and start!136628 res!1078200) b!1578150))

(assert (= (and b!1578150 res!1078198) b!1578151))

(assert (= (and b!1578151 res!1078199) b!1578152))

(assert (= (and b!1578152 res!1078197) b!1578153))

(declare-fun m!1450249 () Bool)

(assert (=> b!1578151 m!1450249))

(declare-fun m!1450251 () Bool)

(assert (=> b!1578153 m!1450251))

(declare-fun m!1450253 () Bool)

(assert (=> b!1578150 m!1450253))

(declare-fun m!1450255 () Bool)

(assert (=> start!136628 m!1450255))

(declare-fun m!1450257 () Bool)

(assert (=> start!136628 m!1450257))

(declare-fun m!1450259 () Bool)

(assert (=> b!1578152 m!1450259))

(push 1)

(assert (not b!1578153))

(assert (not start!136628))

(assert (not b!1578151))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

