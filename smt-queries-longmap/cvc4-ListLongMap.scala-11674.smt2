; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136574 () Bool)

(assert start!136574)

(declare-fun b!1577971 () Bool)

(declare-fun res!1078018 () Bool)

(declare-fun e!880141 () Bool)

(assert (=> b!1577971 (=> (not res!1078018) (not e!880141))))

(declare-fun k!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577971 (= res!1078018 (validKeyInArray!0 k!772))))

(declare-fun b!1577973 () Bool)

(assert (=> b!1577973 (= e!880141 false)))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun lt!676153 () (_ BitVec 32))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577973 (= lt!676153 (nextIndex!0 ee!18 x!466 mask!918))))

(declare-fun b!1577972 () Bool)

(declare-fun res!1078017 () Bool)

(assert (=> b!1577972 (=> (not res!1078017) (not e!880141))))

(declare-datatypes ((array!105657 0))(
  ( (array!105658 (arr!50943 (Array (_ BitVec 32) (_ BitVec 64))) (size!51493 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105657)

(assert (=> b!1577972 (= res!1078017 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50943 _keys!614) ee!18) k!772)) (not (= (select (arr!50943 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1577970 () Bool)

(declare-fun res!1078020 () Bool)

(assert (=> b!1577970 (=> (not res!1078020) (not e!880141))))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(assert (=> b!1577970 (= res!1078020 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51493 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50943 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1078019 () Bool)

(assert (=> start!136574 (=> (not res!1078019) (not e!880141))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136574 (= res!1078019 (validMask!0 mask!918))))

(assert (=> start!136574 e!880141))

(assert (=> start!136574 true))

(declare-fun array_inv!39670 (array!105657) Bool)

(assert (=> start!136574 (array_inv!39670 _keys!614)))

(assert (= (and start!136574 res!1078019) b!1577970))

(assert (= (and b!1577970 res!1078020) b!1577971))

(assert (= (and b!1577971 res!1078018) b!1577972))

(assert (= (and b!1577972 res!1078017) b!1577973))

(declare-fun m!1450063 () Bool)

(assert (=> b!1577971 m!1450063))

(declare-fun m!1450065 () Bool)

(assert (=> b!1577972 m!1450065))

(declare-fun m!1450067 () Bool)

(assert (=> b!1577970 m!1450067))

(declare-fun m!1450069 () Bool)

(assert (=> start!136574 m!1450069))

(declare-fun m!1450071 () Bool)

(assert (=> start!136574 m!1450071))

(declare-fun m!1450073 () Bool)

(assert (=> b!1577973 m!1450073))

(push 1)

(assert (not start!136574))

(assert (not b!1577973))

(assert (not b!1577971))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

