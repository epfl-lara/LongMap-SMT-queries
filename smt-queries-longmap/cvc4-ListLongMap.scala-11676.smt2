; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136610 () Bool)

(assert start!136610)

(declare-fun res!1078090 () Bool)

(declare-fun e!880177 () Bool)

(assert (=> start!136610 (=> (not res!1078090) (not e!880177))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136610 (= res!1078090 (validMask!0 mask!918))))

(assert (=> start!136610 e!880177))

(assert (=> start!136610 true))

(declare-datatypes ((array!105672 0))(
  ( (array!105673 (arr!50949 (Array (_ BitVec 32) (_ BitVec 64))) (size!51499 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105672)

(declare-fun array_inv!39676 (array!105672) Bool)

(assert (=> start!136610 (array_inv!39676 _keys!614)))

(declare-fun b!1578044 () Bool)

(declare-fun res!1078089 () Bool)

(assert (=> b!1578044 (=> (not res!1078089) (not e!880177))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun k!772 () (_ BitVec 64))

(declare-fun ee!18 () (_ BitVec 32))

(assert (=> b!1578044 (= res!1078089 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50949 _keys!614) ee!18) k!772)) (not (= (select (arr!50949 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!676180 () (_ BitVec 32))

(declare-fun b!1578045 () Bool)

(assert (=> b!1578045 (= e!880177 (and (bvsge lt!676180 #b00000000000000000000000000000000) (bvslt lt!676180 (bvadd #b00000000000000000000000000000001 mask!918)) (bvslt (bvadd #b00000000000000000000000000000001 x!466) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1578045 (= lt!676180 (nextIndex!0 ee!18 x!466 mask!918))))

(declare-fun b!1578043 () Bool)

(declare-fun res!1078091 () Bool)

(assert (=> b!1578043 (=> (not res!1078091) (not e!880177))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578043 (= res!1078091 (validKeyInArray!0 k!772))))

(declare-fun b!1578042 () Bool)

(declare-fun res!1078092 () Bool)

(assert (=> b!1578042 (=> (not res!1078092) (not e!880177))))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(assert (=> b!1578042 (= res!1078092 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51499 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50949 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!136610 res!1078090) b!1578042))

(assert (= (and b!1578042 res!1078092) b!1578043))

(assert (= (and b!1578043 res!1078091) b!1578044))

(assert (= (and b!1578044 res!1078089) b!1578045))

(declare-fun m!1450141 () Bool)

(assert (=> b!1578043 m!1450141))

(declare-fun m!1450143 () Bool)

(assert (=> b!1578042 m!1450143))

(declare-fun m!1450145 () Bool)

(assert (=> b!1578044 m!1450145))

(declare-fun m!1450147 () Bool)

(assert (=> b!1578045 m!1450147))

(declare-fun m!1450149 () Bool)

(assert (=> start!136610 m!1450149))

(declare-fun m!1450151 () Bool)

(assert (=> start!136610 m!1450151))

(push 1)

(assert (not b!1578043))

(assert (not start!136610))

(assert (not b!1578045))

(check-sat)

(pop 1)

(push 1)

(check-sat)

