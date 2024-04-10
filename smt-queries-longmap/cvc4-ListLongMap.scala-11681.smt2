; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136640 () Bool)

(assert start!136640)

(declare-fun res!1078234 () Bool)

(declare-fun e!880267 () Bool)

(assert (=> start!136640 (=> (not res!1078234) (not e!880267))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136640 (= res!1078234 (validMask!0 mask!918))))

(assert (=> start!136640 e!880267))

(assert (=> start!136640 true))

(declare-datatypes ((array!105702 0))(
  ( (array!105703 (arr!50964 (Array (_ BitVec 32) (_ BitVec 64))) (size!51514 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105702)

(declare-fun array_inv!39691 (array!105702) Bool)

(assert (=> start!136640 (array_inv!39691 _keys!614)))

(declare-fun b!1578187 () Bool)

(declare-fun res!1078236 () Bool)

(assert (=> b!1578187 (=> (not res!1078236) (not e!880267))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(assert (=> b!1578187 (= res!1078236 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51514 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50964 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1578188 () Bool)

(declare-fun res!1078235 () Bool)

(assert (=> b!1578188 (=> (not res!1078235) (not e!880267))))

(declare-fun k!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578188 (= res!1078235 (validKeyInArray!0 k!772))))

(declare-fun b!1578189 () Bool)

(assert (=> b!1578189 (= e!880267 (bvslt (bvsub #b01111111111111111111111111111111 x!466) #b00000000000000000000000000000000))))

(assert (= (and start!136640 res!1078234) b!1578187))

(assert (= (and b!1578187 res!1078236) b!1578188))

(assert (= (and b!1578188 res!1078235) b!1578189))

(declare-fun m!1450289 () Bool)

(assert (=> start!136640 m!1450289))

(declare-fun m!1450291 () Bool)

(assert (=> start!136640 m!1450291))

(declare-fun m!1450293 () Bool)

(assert (=> b!1578187 m!1450293))

(declare-fun m!1450295 () Bool)

(assert (=> b!1578188 m!1450295))

(push 1)

(assert (not b!1578188))

(assert (not start!136640))

(check-sat)

(pop 1)

(push 1)

(check-sat)

