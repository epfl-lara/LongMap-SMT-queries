; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136592 () Bool)

(assert start!136592)

(declare-fun b!1577837 () Bool)

(declare-fun res!1078068 () Bool)

(declare-fun e!880034 () Bool)

(assert (=> b!1577837 (=> (not res!1078068) (not e!880034))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(declare-datatypes ((array!105621 0))(
  ( (array!105622 (arr!50923 (Array (_ BitVec 32) (_ BitVec 64))) (size!51475 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105621)

(assert (=> b!1577837 (= res!1078068 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51475 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50923 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1577839 () Bool)

(declare-fun res!1078069 () Bool)

(assert (=> b!1577839 (=> (not res!1078069) (not e!880034))))

(declare-fun k!772 () (_ BitVec 64))

(assert (=> b!1577839 (= res!1078069 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50923 _keys!614) ee!18) k!772)) (not (= (select (arr!50923 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1577838 () Bool)

(declare-fun res!1078070 () Bool)

(assert (=> b!1577838 (=> (not res!1078070) (not e!880034))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577838 (= res!1078070 (validKeyInArray!0 k!772))))

(declare-fun res!1078071 () Bool)

(assert (=> start!136592 (=> (not res!1078071) (not e!880034))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136592 (= res!1078071 (validMask!0 mask!918))))

(assert (=> start!136592 e!880034))

(assert (=> start!136592 true))

(declare-fun array_inv!39859 (array!105621) Bool)

(assert (=> start!136592 (array_inv!39859 _keys!614)))

(declare-fun b!1577840 () Bool)

(assert (=> b!1577840 (= e!880034 false)))

(declare-fun lt!675921 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577840 (= lt!675921 (nextIndex!0 ee!18 x!466 mask!918))))

(assert (= (and start!136592 res!1078071) b!1577837))

(assert (= (and b!1577837 res!1078068) b!1577838))

(assert (= (and b!1577838 res!1078070) b!1577839))

(assert (= (and b!1577839 res!1078069) b!1577840))

(declare-fun m!1449357 () Bool)

(assert (=> b!1577837 m!1449357))

(declare-fun m!1449359 () Bool)

(assert (=> start!136592 m!1449359))

(declare-fun m!1449361 () Bool)

(assert (=> start!136592 m!1449361))

(declare-fun m!1449363 () Bool)

(assert (=> b!1577838 m!1449363))

(declare-fun m!1449365 () Bool)

(assert (=> b!1577840 m!1449365))

(declare-fun m!1449367 () Bool)

(assert (=> b!1577839 m!1449367))

(push 1)

(assert (not b!1577838))

(assert (not start!136592))

(assert (not b!1577840))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

