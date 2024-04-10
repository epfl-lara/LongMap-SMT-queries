; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136570 () Bool)

(assert start!136570)

(declare-fun b!1577948 () Bool)

(declare-fun res!1077995 () Bool)

(declare-fun e!880130 () Bool)

(assert (=> b!1577948 (=> (not res!1077995) (not e!880130))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun k!772 () (_ BitVec 64))

(declare-fun ee!18 () (_ BitVec 32))

(declare-datatypes ((array!105653 0))(
  ( (array!105654 (arr!50941 (Array (_ BitVec 32) (_ BitVec 64))) (size!51491 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105653)

(assert (=> b!1577948 (= res!1077995 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50941 _keys!614) ee!18) k!772)) (not (= (select (arr!50941 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1077994 () Bool)

(assert (=> start!136570 (=> (not res!1077994) (not e!880130))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136570 (= res!1077994 (validMask!0 mask!918))))

(assert (=> start!136570 e!880130))

(assert (=> start!136570 true))

(declare-fun array_inv!39668 (array!105653) Bool)

(assert (=> start!136570 (array_inv!39668 _keys!614)))

(declare-fun b!1577946 () Bool)

(declare-fun res!1077993 () Bool)

(assert (=> b!1577946 (=> (not res!1077993) (not e!880130))))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(assert (=> b!1577946 (= res!1077993 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51491 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50941 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1577947 () Bool)

(declare-fun res!1077996 () Bool)

(assert (=> b!1577947 (=> (not res!1077996) (not e!880130))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577947 (= res!1077996 (validKeyInArray!0 k!772))))

(declare-fun b!1577949 () Bool)

(assert (=> b!1577949 (= e!880130 false)))

(declare-fun lt!676147 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577949 (= lt!676147 (nextIndex!0 ee!18 x!466 mask!918))))

(assert (= (and start!136570 res!1077994) b!1577946))

(assert (= (and b!1577946 res!1077993) b!1577947))

(assert (= (and b!1577947 res!1077996) b!1577948))

(assert (= (and b!1577948 res!1077995) b!1577949))

(declare-fun m!1450039 () Bool)

(assert (=> start!136570 m!1450039))

(declare-fun m!1450041 () Bool)

(assert (=> start!136570 m!1450041))

(declare-fun m!1450043 () Bool)

(assert (=> b!1577949 m!1450043))

(declare-fun m!1450045 () Bool)

(assert (=> b!1577948 m!1450045))

(declare-fun m!1450047 () Bool)

(assert (=> b!1577946 m!1450047))

(declare-fun m!1450049 () Bool)

(assert (=> b!1577947 m!1450049))

(push 1)

(assert (not b!1577947))

(assert (not start!136570))

(assert (not b!1577949))

(check-sat)

(pop 1)

