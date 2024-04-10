; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136664 () Bool)

(assert start!136664)

(declare-fun b!1578305 () Bool)

(declare-fun res!1078350 () Bool)

(declare-fun e!880340 () Bool)

(assert (=> b!1578305 (=> (not res!1078350) (not e!880340))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(declare-datatypes ((array!105726 0))(
  ( (array!105727 (arr!50976 (Array (_ BitVec 32) (_ BitVec 64))) (size!51526 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105726)

(declare-fun k!772 () (_ BitVec 64))

(assert (=> b!1578305 (= res!1078350 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50976 _keys!614) ee!18) k!772)) (not (= (select (arr!50976 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1078352 () Bool)

(assert (=> start!136664 (=> (not res!1078352) (not e!880340))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136664 (= res!1078352 (validMask!0 mask!918))))

(assert (=> start!136664 e!880340))

(assert (=> start!136664 true))

(declare-fun array_inv!39703 (array!105726) Bool)

(assert (=> start!136664 (array_inv!39703 _keys!614)))

(declare-fun b!1578303 () Bool)

(declare-fun res!1078353 () Bool)

(assert (=> b!1578303 (=> (not res!1078353) (not e!880340))))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(assert (=> b!1578303 (= res!1078353 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51526 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50976 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1578304 () Bool)

(declare-fun res!1078351 () Bool)

(assert (=> b!1578304 (=> (not res!1078351) (not e!880340))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578304 (= res!1078351 (validKeyInArray!0 k!772))))

(declare-fun b!1578306 () Bool)

(assert (=> b!1578306 (= e!880340 (bvsge (bvsub #b01111111111111111111111111111111 (bvadd #b00000000000000000000000000000001 x!466)) (bvsub #b01111111111111111111111111111111 x!466)))))

(declare-fun lt!676216 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1578306 (= lt!676216 (nextIndex!0 ee!18 x!466 mask!918))))

(assert (= (and start!136664 res!1078352) b!1578303))

(assert (= (and b!1578303 res!1078353) b!1578304))

(assert (= (and b!1578304 res!1078351) b!1578305))

(assert (= (and b!1578305 res!1078350) b!1578306))

(declare-fun m!1450405 () Bool)

(assert (=> b!1578304 m!1450405))

(declare-fun m!1450407 () Bool)

(assert (=> b!1578305 m!1450407))

(declare-fun m!1450409 () Bool)

(assert (=> b!1578303 m!1450409))

(declare-fun m!1450411 () Bool)

(assert (=> start!136664 m!1450411))

(declare-fun m!1450413 () Bool)

(assert (=> start!136664 m!1450413))

(declare-fun m!1450415 () Bool)

(assert (=> b!1578306 m!1450415))

(push 1)

(assert (not b!1578304))

(assert (not start!136664))

(assert (not b!1578306))

(check-sat)

(pop 1)

(push 1)

(check-sat)

