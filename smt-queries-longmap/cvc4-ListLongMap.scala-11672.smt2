; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136562 () Bool)

(assert start!136562)

(declare-fun b!1577898 () Bool)

(declare-fun res!1077948 () Bool)

(declare-fun e!880106 () Bool)

(assert (=> b!1577898 (=> (not res!1077948) (not e!880106))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(declare-datatypes ((array!105645 0))(
  ( (array!105646 (arr!50937 (Array (_ BitVec 32) (_ BitVec 64))) (size!51487 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105645)

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(assert (=> b!1577898 (= res!1077948 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51487 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50937 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1577899 () Bool)

(declare-fun res!1077946 () Bool)

(assert (=> b!1577899 (=> (not res!1077946) (not e!880106))))

(declare-fun k!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577899 (= res!1077946 (validKeyInArray!0 k!772))))

(declare-fun b!1577900 () Bool)

(declare-fun res!1077945 () Bool)

(assert (=> b!1577900 (=> (not res!1077945) (not e!880106))))

(assert (=> b!1577900 (= res!1077945 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50937 _keys!614) ee!18) k!772)) (not (= (select (arr!50937 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1577901 () Bool)

(assert (=> b!1577901 (= e!880106 false)))

(declare-fun lt!676135 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577901 (= lt!676135 (nextIndex!0 ee!18 x!466 mask!918))))

(declare-fun res!1077947 () Bool)

(assert (=> start!136562 (=> (not res!1077947) (not e!880106))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136562 (= res!1077947 (validMask!0 mask!918))))

(assert (=> start!136562 e!880106))

(assert (=> start!136562 true))

(declare-fun array_inv!39664 (array!105645) Bool)

(assert (=> start!136562 (array_inv!39664 _keys!614)))

(assert (= (and start!136562 res!1077947) b!1577898))

(assert (= (and b!1577898 res!1077948) b!1577899))

(assert (= (and b!1577899 res!1077946) b!1577900))

(assert (= (and b!1577900 res!1077945) b!1577901))

(declare-fun m!1449991 () Bool)

(assert (=> b!1577901 m!1449991))

(declare-fun m!1449993 () Bool)

(assert (=> b!1577899 m!1449993))

(declare-fun m!1449995 () Bool)

(assert (=> b!1577900 m!1449995))

(declare-fun m!1449997 () Bool)

(assert (=> b!1577898 m!1449997))

(declare-fun m!1449999 () Bool)

(assert (=> start!136562 m!1449999))

(declare-fun m!1450001 () Bool)

(assert (=> start!136562 m!1450001))

(push 1)

(assert (not b!1577899))

(assert (not start!136562))

(assert (not b!1577901))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

