; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136532 () Bool)

(assert start!136532)

(declare-fun b!1577622 () Bool)

(declare-fun res!1077853 () Bool)

(declare-fun e!879925 () Bool)

(assert (=> b!1577622 (=> (not res!1077853) (not e!879925))))

(declare-fun k!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577622 (= res!1077853 (validKeyInArray!0 k!772))))

(declare-fun b!1577623 () Bool)

(declare-fun res!1077852 () Bool)

(assert (=> b!1577623 (=> (not res!1077852) (not e!879925))))

(declare-datatypes ((array!105582 0))(
  ( (array!105583 (arr!50905 (Array (_ BitVec 32) (_ BitVec 64))) (size!51457 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105582)

(declare-fun x!466 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(assert (=> b!1577623 (= res!1077852 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50905 _keys!614) ee!18) k!772)) (not (= (select (arr!50905 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1577621 () Bool)

(declare-fun res!1077854 () Bool)

(assert (=> b!1577621 (=> (not res!1077854) (not e!879925))))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun mask!918 () (_ BitVec 32))

(assert (=> b!1577621 (= res!1077854 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51457 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50905 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1077855 () Bool)

(assert (=> start!136532 (=> (not res!1077855) (not e!879925))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136532 (= res!1077855 (validMask!0 mask!918))))

(assert (=> start!136532 e!879925))

(assert (=> start!136532 true))

(declare-fun array_inv!39841 (array!105582) Bool)

(assert (=> start!136532 (array_inv!39841 _keys!614)))

(declare-fun b!1577624 () Bool)

(assert (=> b!1577624 (= e!879925 false)))

(declare-fun lt!675858 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577624 (= lt!675858 (nextIndex!0 ee!18 x!466 mask!918))))

(assert (= (and start!136532 res!1077855) b!1577621))

(assert (= (and b!1577621 res!1077854) b!1577622))

(assert (= (and b!1577622 res!1077853) b!1577623))

(assert (= (and b!1577623 res!1077852) b!1577624))

(declare-fun m!1449135 () Bool)

(assert (=> b!1577622 m!1449135))

(declare-fun m!1449137 () Bool)

(assert (=> b!1577623 m!1449137))

(declare-fun m!1449139 () Bool)

(assert (=> start!136532 m!1449139))

(declare-fun m!1449141 () Bool)

(assert (=> start!136532 m!1449141))

(declare-fun m!1449143 () Bool)

(assert (=> b!1577624 m!1449143))

(declare-fun m!1449145 () Bool)

(assert (=> b!1577621 m!1449145))

(push 1)

(assert (not start!136532))

(assert (not b!1577622))

(assert (not b!1577624))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

