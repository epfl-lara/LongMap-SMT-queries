; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116550 () Bool)

(assert start!116550)

(declare-fun b!1374561 () Bool)

(declare-fun res!917747 () Bool)

(declare-fun e!778700 () Bool)

(assert (=> b!1374561 (=> (not res!917747) (not e!778700))))

(declare-datatypes ((array!93250 0))(
  ( (array!93251 (arr!45031 (Array (_ BitVec 32) (_ BitVec 64))) (size!45581 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93250)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374561 (= res!917747 (validKeyInArray!0 (select (arr!45031 a!4142) i!1457)))))

(declare-fun b!1374562 () Bool)

(declare-fun res!917748 () Bool)

(assert (=> b!1374562 (=> (not res!917748) (not e!778700))))

(declare-fun k!2959 () (_ BitVec 64))

(assert (=> b!1374562 (= res!917748 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1374563 () Bool)

(declare-fun e!778702 () Bool)

(assert (=> b!1374563 (= e!778700 (not e!778702))))

(declare-fun res!917745 () Bool)

(assert (=> b!1374563 (=> res!917745 e!778702)))

(assert (=> b!1374563 (= res!917745 (or (bvslt (size!45581 a!4142) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000)))))

(declare-fun lt!603777 () (_ BitVec 32))

(declare-fun lt!603778 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93250 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374563 (= (bvadd lt!603777 lt!603778) (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (size!45581 a!4142)))))

(declare-datatypes ((Unit!45463 0))(
  ( (Unit!45464) )
))
(declare-fun lt!603779 () Unit!45463)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93250 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45463)

(assert (=> b!1374563 (= lt!603779 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4142 #b00000000000000000000000000000000 (size!45581 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603780 () (_ BitVec 32))

(assert (=> b!1374563 (= lt!603780 lt!603778)))

(assert (=> b!1374563 (= lt!603778 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45581 a!4142)))))

(declare-fun lt!603773 () array!93250)

(assert (=> b!1374563 (= lt!603780 (arrayCountValidKeys!0 lt!603773 (bvadd #b00000000000000000000000000000001 i!1457) (size!45581 a!4142)))))

(declare-fun lt!603781 () Unit!45463)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93250 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45463)

(assert (=> b!1374563 (= lt!603781 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603776 () (_ BitVec 32))

(assert (=> b!1374563 (= lt!603776 (bvsub lt!603777 #b00000000000000000000000000000001))))

(assert (=> b!1374563 (= lt!603776 (arrayCountValidKeys!0 lt!603773 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374563 (= lt!603777 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374563 (= lt!603773 (array!93251 (store (arr!45031 a!4142) i!1457 k!2959) (size!45581 a!4142)))))

(declare-fun lt!603774 () Unit!45463)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93250 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45463)

(assert (=> b!1374563 (= lt!603774 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun res!917746 () Bool)

(assert (=> start!116550 (=> (not res!917746) (not e!778700))))

(assert (=> start!116550 (= res!917746 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45581 a!4142))))))

(assert (=> start!116550 e!778700))

(assert (=> start!116550 true))

(declare-fun array_inv!34059 (array!93250) Bool)

(assert (=> start!116550 (array_inv!34059 a!4142)))

(declare-fun b!1374564 () Bool)

(assert (=> b!1374564 (= e!778702 true)))

(assert (=> b!1374564 (= (bvadd lt!603776 lt!603780) (arrayCountValidKeys!0 lt!603773 #b00000000000000000000000000000000 (size!45581 a!4142)))))

(declare-fun lt!603775 () Unit!45463)

(assert (=> b!1374564 (= lt!603775 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!603773 #b00000000000000000000000000000000 (size!45581 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374565 () Bool)

(declare-fun res!917749 () Bool)

(assert (=> b!1374565 (=> (not res!917749) (not e!778700))))

(assert (=> b!1374565 (= res!917749 (bvslt (size!45581 a!4142) #b01111111111111111111111111111111))))

(assert (= (and start!116550 res!917746) b!1374561))

(assert (= (and b!1374561 res!917747) b!1374562))

(assert (= (and b!1374562 res!917748) b!1374565))

(assert (= (and b!1374565 res!917749) b!1374563))

(assert (= (and b!1374563 (not res!917745)) b!1374564))

(declare-fun m!1258057 () Bool)

(assert (=> b!1374563 m!1258057))

(declare-fun m!1258059 () Bool)

(assert (=> b!1374563 m!1258059))

(declare-fun m!1258061 () Bool)

(assert (=> b!1374563 m!1258061))

(declare-fun m!1258063 () Bool)

(assert (=> b!1374563 m!1258063))

(declare-fun m!1258065 () Bool)

(assert (=> b!1374563 m!1258065))

(declare-fun m!1258067 () Bool)

(assert (=> b!1374563 m!1258067))

(declare-fun m!1258069 () Bool)

(assert (=> b!1374563 m!1258069))

(declare-fun m!1258071 () Bool)

(assert (=> b!1374563 m!1258071))

(declare-fun m!1258073 () Bool)

(assert (=> b!1374563 m!1258073))

(declare-fun m!1258075 () Bool)

(assert (=> start!116550 m!1258075))

(declare-fun m!1258077 () Bool)

(assert (=> b!1374562 m!1258077))

(declare-fun m!1258079 () Bool)

(assert (=> b!1374561 m!1258079))

(assert (=> b!1374561 m!1258079))

(declare-fun m!1258081 () Bool)

(assert (=> b!1374561 m!1258081))

(declare-fun m!1258083 () Bool)

(assert (=> b!1374564 m!1258083))

(declare-fun m!1258085 () Bool)

(assert (=> b!1374564 m!1258085))

(push 1)

(assert (not start!116550))

(assert (not b!1374561))

(assert (not b!1374564))

(assert (not b!1374562))

(assert (not b!1374563))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

