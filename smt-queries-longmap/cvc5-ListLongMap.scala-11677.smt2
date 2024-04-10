; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136612 () Bool)

(assert start!136612)

(declare-fun b!1578056 () Bool)

(declare-fun res!1078101 () Bool)

(declare-fun e!880183 () Bool)

(assert (=> b!1578056 (=> (not res!1078101) (not e!880183))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun k!772 () (_ BitVec 64))

(declare-fun ee!18 () (_ BitVec 32))

(declare-datatypes ((array!105674 0))(
  ( (array!105675 (arr!50950 (Array (_ BitVec 32) (_ BitVec 64))) (size!51500 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105674)

(assert (=> b!1578056 (= res!1078101 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50950 _keys!614) ee!18) k!772)) (not (= (select (arr!50950 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1078103 () Bool)

(assert (=> start!136612 (=> (not res!1078103) (not e!880183))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136612 (= res!1078103 (validMask!0 mask!918))))

(assert (=> start!136612 e!880183))

(assert (=> start!136612 true))

(declare-fun array_inv!39677 (array!105674) Bool)

(assert (=> start!136612 (array_inv!39677 _keys!614)))

(declare-fun b!1578055 () Bool)

(declare-fun res!1078102 () Bool)

(assert (=> b!1578055 (=> (not res!1078102) (not e!880183))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578055 (= res!1078102 (validKeyInArray!0 k!772))))

(declare-fun b!1578054 () Bool)

(declare-fun res!1078104 () Bool)

(assert (=> b!1578054 (=> (not res!1078104) (not e!880183))))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(assert (=> b!1578054 (= res!1078104 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51500 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50950 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1578057 () Bool)

(assert (=> b!1578057 (= e!880183 false)))

(declare-fun lt!676183 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1578057 (= lt!676183 (nextIndex!0 ee!18 x!466 mask!918))))

(assert (= (and start!136612 res!1078103) b!1578054))

(assert (= (and b!1578054 res!1078104) b!1578055))

(assert (= (and b!1578055 res!1078102) b!1578056))

(assert (= (and b!1578056 res!1078101) b!1578057))

(declare-fun m!1450153 () Bool)

(assert (=> b!1578057 m!1450153))

(declare-fun m!1450155 () Bool)

(assert (=> b!1578056 m!1450155))

(declare-fun m!1450157 () Bool)

(assert (=> b!1578054 m!1450157))

(declare-fun m!1450159 () Bool)

(assert (=> start!136612 m!1450159))

(declare-fun m!1450161 () Bool)

(assert (=> start!136612 m!1450161))

(declare-fun m!1450163 () Bool)

(assert (=> b!1578055 m!1450163))

(push 1)

(assert (not b!1578057))

(assert (not start!136612))

(assert (not b!1578055))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

