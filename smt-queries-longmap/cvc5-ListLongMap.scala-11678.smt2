; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136586 () Bool)

(assert start!136586)

(declare-fun res!1078032 () Bool)

(declare-fun e!880016 () Bool)

(assert (=> start!136586 (=> (not res!1078032) (not e!880016))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136586 (= res!1078032 (validMask!0 mask!918))))

(assert (=> start!136586 e!880016))

(assert (=> start!136586 true))

(declare-datatypes ((array!105615 0))(
  ( (array!105616 (arr!50920 (Array (_ BitVec 32) (_ BitVec 64))) (size!51472 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105615)

(declare-fun array_inv!39856 (array!105615) Bool)

(assert (=> start!136586 (array_inv!39856 _keys!614)))

(declare-fun b!1577802 () Bool)

(declare-fun res!1078035 () Bool)

(assert (=> b!1577802 (=> (not res!1078035) (not e!880016))))

(declare-fun k!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577802 (= res!1078035 (validKeyInArray!0 k!772))))

(declare-fun b!1577803 () Bool)

(declare-fun res!1078034 () Bool)

(assert (=> b!1577803 (=> (not res!1078034) (not e!880016))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(assert (=> b!1577803 (= res!1078034 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50920 _keys!614) ee!18) k!772)) (not (= (select (arr!50920 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1577801 () Bool)

(declare-fun res!1078033 () Bool)

(assert (=> b!1577801 (=> (not res!1078033) (not e!880016))))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(assert (=> b!1577801 (= res!1078033 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51472 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50920 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1577804 () Bool)

(assert (=> b!1577804 (= e!880016 false)))

(declare-fun lt!675912 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577804 (= lt!675912 (nextIndex!0 ee!18 x!466 mask!918))))

(assert (= (and start!136586 res!1078032) b!1577801))

(assert (= (and b!1577801 res!1078033) b!1577802))

(assert (= (and b!1577802 res!1078035) b!1577803))

(assert (= (and b!1577803 res!1078034) b!1577804))

(declare-fun m!1449321 () Bool)

(assert (=> b!1577802 m!1449321))

(declare-fun m!1449323 () Bool)

(assert (=> b!1577804 m!1449323))

(declare-fun m!1449325 () Bool)

(assert (=> b!1577803 m!1449325))

(declare-fun m!1449327 () Bool)

(assert (=> start!136586 m!1449327))

(declare-fun m!1449329 () Bool)

(assert (=> start!136586 m!1449329))

(declare-fun m!1449331 () Bool)

(assert (=> b!1577801 m!1449331))

(push 1)

(assert (not start!136586))

(assert (not b!1577804))

(assert (not b!1577802))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

