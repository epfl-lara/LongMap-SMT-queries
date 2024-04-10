; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116540 () Bool)

(assert start!116540)

(declare-fun b!1374486 () Bool)

(declare-fun e!778657 () Bool)

(assert (=> b!1374486 (= e!778657 true)))

(declare-datatypes ((array!93240 0))(
  ( (array!93241 (arr!45026 (Array (_ BitVec 32) (_ BitVec 64))) (size!45576 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93240)

(declare-fun lt!603642 () array!93240)

(declare-fun lt!603643 () (_ BitVec 32))

(declare-fun lt!603641 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93240 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374486 (= (bvadd lt!603643 lt!603641) (arrayCountValidKeys!0 lt!603642 #b00000000000000000000000000000000 (size!45576 a!4142)))))

(declare-datatypes ((Unit!45453 0))(
  ( (Unit!45454) )
))
(declare-fun lt!603640 () Unit!45453)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93240 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45453)

(assert (=> b!1374486 (= lt!603640 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!603642 #b00000000000000000000000000000000 (size!45576 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun res!917674 () Bool)

(declare-fun e!778656 () Bool)

(assert (=> start!116540 (=> (not res!917674) (not e!778656))))

(assert (=> start!116540 (= res!917674 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45576 a!4142))))))

(assert (=> start!116540 e!778656))

(assert (=> start!116540 true))

(declare-fun array_inv!34054 (array!93240) Bool)

(assert (=> start!116540 (array_inv!34054 a!4142)))

(declare-fun b!1374487 () Bool)

(declare-fun res!917670 () Bool)

(assert (=> b!1374487 (=> (not res!917670) (not e!778656))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374487 (= res!917670 (validKeyInArray!0 (select (arr!45026 a!4142) i!1457)))))

(declare-fun b!1374488 () Bool)

(declare-fun res!917673 () Bool)

(assert (=> b!1374488 (=> (not res!917673) (not e!778656))))

(assert (=> b!1374488 (= res!917673 (bvslt (size!45576 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1374489 () Bool)

(declare-fun res!917672 () Bool)

(assert (=> b!1374489 (=> (not res!917672) (not e!778656))))

(declare-fun k!2959 () (_ BitVec 64))

(assert (=> b!1374489 (= res!917672 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1374490 () Bool)

(assert (=> b!1374490 (= e!778656 (not e!778657))))

(declare-fun res!917671 () Bool)

(assert (=> b!1374490 (=> res!917671 e!778657)))

(assert (=> b!1374490 (= res!917671 (or (bvslt (size!45576 a!4142) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000)))))

(declare-fun lt!603639 () (_ BitVec 32))

(declare-fun lt!603638 () (_ BitVec 32))

(assert (=> b!1374490 (= (bvadd lt!603639 lt!603638) (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (size!45576 a!4142)))))

(declare-fun lt!603646 () Unit!45453)

(assert (=> b!1374490 (= lt!603646 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4142 #b00000000000000000000000000000000 (size!45576 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374490 (= lt!603641 lt!603638)))

(assert (=> b!1374490 (= lt!603638 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45576 a!4142)))))

(assert (=> b!1374490 (= lt!603641 (arrayCountValidKeys!0 lt!603642 (bvadd #b00000000000000000000000000000001 i!1457) (size!45576 a!4142)))))

(declare-fun lt!603645 () Unit!45453)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93240 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45453)

(assert (=> b!1374490 (= lt!603645 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374490 (= lt!603643 (bvsub lt!603639 #b00000000000000000000000000000001))))

(assert (=> b!1374490 (= lt!603643 (arrayCountValidKeys!0 lt!603642 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374490 (= lt!603639 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374490 (= lt!603642 (array!93241 (store (arr!45026 a!4142) i!1457 k!2959) (size!45576 a!4142)))))

(declare-fun lt!603644 () Unit!45453)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93240 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45453)

(assert (=> b!1374490 (= lt!603644 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(assert (= (and start!116540 res!917674) b!1374487))

(assert (= (and b!1374487 res!917670) b!1374489))

(assert (= (and b!1374489 res!917672) b!1374488))

(assert (= (and b!1374488 res!917673) b!1374490))

(assert (= (and b!1374490 (not res!917671)) b!1374486))

(declare-fun m!1257907 () Bool)

(assert (=> b!1374489 m!1257907))

(declare-fun m!1257909 () Bool)

(assert (=> start!116540 m!1257909))

(declare-fun m!1257911 () Bool)

(assert (=> b!1374487 m!1257911))

(assert (=> b!1374487 m!1257911))

(declare-fun m!1257913 () Bool)

(assert (=> b!1374487 m!1257913))

(declare-fun m!1257915 () Bool)

(assert (=> b!1374486 m!1257915))

(declare-fun m!1257917 () Bool)

(assert (=> b!1374486 m!1257917))

(declare-fun m!1257919 () Bool)

(assert (=> b!1374490 m!1257919))

(declare-fun m!1257921 () Bool)

(assert (=> b!1374490 m!1257921))

(declare-fun m!1257923 () Bool)

(assert (=> b!1374490 m!1257923))

(declare-fun m!1257925 () Bool)

(assert (=> b!1374490 m!1257925))

(declare-fun m!1257927 () Bool)

(assert (=> b!1374490 m!1257927))

(declare-fun m!1257929 () Bool)

(assert (=> b!1374490 m!1257929))

(declare-fun m!1257931 () Bool)

(assert (=> b!1374490 m!1257931))

(declare-fun m!1257933 () Bool)

(assert (=> b!1374490 m!1257933))

(declare-fun m!1257935 () Bool)

(assert (=> b!1374490 m!1257935))

(push 1)

(assert (not start!116540))

(assert (not b!1374486))

(assert (not b!1374489))

(assert (not b!1374487))

(assert (not b!1374490))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

