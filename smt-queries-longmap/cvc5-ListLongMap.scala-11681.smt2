; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136636 () Bool)

(assert start!136636)

(declare-fun res!1078218 () Bool)

(declare-fun e!880256 () Bool)

(assert (=> start!136636 (=> (not res!1078218) (not e!880256))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136636 (= res!1078218 (validMask!0 mask!918))))

(assert (=> start!136636 e!880256))

(assert (=> start!136636 true))

(declare-datatypes ((array!105698 0))(
  ( (array!105699 (arr!50962 (Array (_ BitVec 32) (_ BitVec 64))) (size!51512 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105698)

(declare-fun array_inv!39689 (array!105698) Bool)

(assert (=> start!136636 (array_inv!39689 _keys!614)))

(declare-fun b!1578169 () Bool)

(declare-fun res!1078216 () Bool)

(assert (=> b!1578169 (=> (not res!1078216) (not e!880256))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(assert (=> b!1578169 (= res!1078216 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51512 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50962 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1578170 () Bool)

(declare-fun res!1078217 () Bool)

(assert (=> b!1578170 (=> (not res!1078217) (not e!880256))))

(declare-fun k!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578170 (= res!1078217 (validKeyInArray!0 k!772))))

(declare-fun b!1578171 () Bool)

(assert (=> b!1578171 (= e!880256 (bvslt (bvsub #b01111111111111111111111111111111 x!466) #b00000000000000000000000000000000))))

(assert (= (and start!136636 res!1078218) b!1578169))

(assert (= (and b!1578169 res!1078216) b!1578170))

(assert (= (and b!1578170 res!1078217) b!1578171))

(declare-fun m!1450273 () Bool)

(assert (=> start!136636 m!1450273))

(declare-fun m!1450275 () Bool)

(assert (=> start!136636 m!1450275))

(declare-fun m!1450277 () Bool)

(assert (=> b!1578169 m!1450277))

(declare-fun m!1450279 () Bool)

(assert (=> b!1578170 m!1450279))

(push 1)

(assert (not start!136636))

(assert (not b!1578170))

(check-sat)

(pop 1)

(push 1)

(check-sat)

