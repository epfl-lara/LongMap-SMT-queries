; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136618 () Bool)

(assert start!136618)

(declare-fun b!1578090 () Bool)

(declare-fun res!1078139 () Bool)

(declare-fun e!880202 () Bool)

(assert (=> b!1578090 (=> (not res!1078139) (not e!880202))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(declare-datatypes ((array!105680 0))(
  ( (array!105681 (arr!50953 (Array (_ BitVec 32) (_ BitVec 64))) (size!51503 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105680)

(assert (=> b!1578090 (= res!1078139 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51503 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50953 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1578091 () Bool)

(declare-fun res!1078137 () Bool)

(assert (=> b!1578091 (=> (not res!1078137) (not e!880202))))

(declare-fun k!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578091 (= res!1078137 (validKeyInArray!0 k!772))))

(declare-fun b!1578092 () Bool)

(declare-fun res!1078138 () Bool)

(assert (=> b!1578092 (=> (not res!1078138) (not e!880202))))

(assert (=> b!1578092 (= res!1078138 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50953 _keys!614) ee!18) k!772)) (not (= (select (arr!50953 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1578093 () Bool)

(assert (=> b!1578093 (= e!880202 false)))

(declare-fun lt!676192 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1578093 (= lt!676192 (nextIndex!0 ee!18 x!466 mask!918))))

(declare-fun res!1078140 () Bool)

(assert (=> start!136618 (=> (not res!1078140) (not e!880202))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136618 (= res!1078140 (validMask!0 mask!918))))

(assert (=> start!136618 e!880202))

(assert (=> start!136618 true))

(declare-fun array_inv!39680 (array!105680) Bool)

(assert (=> start!136618 (array_inv!39680 _keys!614)))

(assert (= (and start!136618 res!1078140) b!1578090))

(assert (= (and b!1578090 res!1078139) b!1578091))

(assert (= (and b!1578091 res!1078137) b!1578092))

(assert (= (and b!1578092 res!1078138) b!1578093))

(declare-fun m!1450189 () Bool)

(assert (=> b!1578092 m!1450189))

(declare-fun m!1450191 () Bool)

(assert (=> start!136618 m!1450191))

(declare-fun m!1450193 () Bool)

(assert (=> start!136618 m!1450193))

(declare-fun m!1450195 () Bool)

(assert (=> b!1578091 m!1450195))

(declare-fun m!1450197 () Bool)

(assert (=> b!1578090 m!1450197))

(declare-fun m!1450199 () Bool)

(assert (=> b!1578093 m!1450199))

(push 1)

(assert (not b!1578093))

(assert (not start!136618))

(assert (not b!1578091))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

