; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136660 () Bool)

(assert start!136660)

(declare-fun b!1578282 () Bool)

(declare-fun e!880327 () Bool)

(declare-fun x!466 () (_ BitVec 32))

(assert (=> b!1578282 (= e!880327 (bvsge (bvsub #b01111111111111111111111111111111 (bvadd #b00000000000000000000000000000001 x!466)) (bvsub #b01111111111111111111111111111111 x!466)))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(declare-fun lt!676210 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1578282 (= lt!676210 (nextIndex!0 ee!18 x!466 mask!918))))

(declare-fun res!1078329 () Bool)

(assert (=> start!136660 (=> (not res!1078329) (not e!880327))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136660 (= res!1078329 (validMask!0 mask!918))))

(assert (=> start!136660 e!880327))

(assert (=> start!136660 true))

(declare-datatypes ((array!105722 0))(
  ( (array!105723 (arr!50974 (Array (_ BitVec 32) (_ BitVec 64))) (size!51524 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105722)

(declare-fun array_inv!39701 (array!105722) Bool)

(assert (=> start!136660 (array_inv!39701 _keys!614)))

(declare-fun b!1578279 () Bool)

(declare-fun res!1078328 () Bool)

(assert (=> b!1578279 (=> (not res!1078328) (not e!880327))))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(assert (=> b!1578279 (= res!1078328 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51524 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50974 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1578281 () Bool)

(declare-fun res!1078326 () Bool)

(assert (=> b!1578281 (=> (not res!1078326) (not e!880327))))

(declare-fun k!772 () (_ BitVec 64))

(assert (=> b!1578281 (= res!1078326 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50974 _keys!614) ee!18) k!772)) (not (= (select (arr!50974 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1578280 () Bool)

(declare-fun res!1078327 () Bool)

(assert (=> b!1578280 (=> (not res!1078327) (not e!880327))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578280 (= res!1078327 (validKeyInArray!0 k!772))))

(assert (= (and start!136660 res!1078329) b!1578279))

(assert (= (and b!1578279 res!1078328) b!1578280))

(assert (= (and b!1578280 res!1078327) b!1578281))

(assert (= (and b!1578281 res!1078326) b!1578282))

(declare-fun m!1450381 () Bool)

(assert (=> start!136660 m!1450381))

(declare-fun m!1450383 () Bool)

(assert (=> start!136660 m!1450383))

(declare-fun m!1450385 () Bool)

(assert (=> b!1578280 m!1450385))

(declare-fun m!1450387 () Bool)

(assert (=> b!1578281 m!1450387))

(declare-fun m!1450389 () Bool)

(assert (=> b!1578282 m!1450389))

(declare-fun m!1450391 () Bool)

(assert (=> b!1578279 m!1450391))

(push 1)

(assert (not b!1578282))

(assert (not b!1578280))

(assert (not start!136660))

(check-sat)

(pop 1)

(push 1)

(check-sat)

