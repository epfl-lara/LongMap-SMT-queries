; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116538 () Bool)

(assert start!116538)

(declare-fun b!1374471 () Bool)

(declare-fun e!778646 () Bool)

(assert (=> b!1374471 (= e!778646 true)))

(declare-fun lt!603613 () (_ BitVec 32))

(declare-datatypes ((array!93238 0))(
  ( (array!93239 (arr!45025 (Array (_ BitVec 32) (_ BitVec 64))) (size!45575 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93238)

(declare-fun lt!603619 () array!93238)

(declare-fun lt!603617 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93238 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374471 (= (bvadd lt!603613 lt!603617) (arrayCountValidKeys!0 lt!603619 #b00000000000000000000000000000000 (size!45575 a!4142)))))

(declare-datatypes ((Unit!45451 0))(
  ( (Unit!45452) )
))
(declare-fun lt!603618 () Unit!45451)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93238 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45451)

(assert (=> b!1374471 (= lt!603618 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!603619 #b00000000000000000000000000000000 (size!45575 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374472 () Bool)

(declare-fun res!917657 () Bool)

(declare-fun e!778648 () Bool)

(assert (=> b!1374472 (=> (not res!917657) (not e!778648))))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374472 (= res!917657 (not (validKeyInArray!0 k!2959)))))

(declare-fun res!917655 () Bool)

(assert (=> start!116538 (=> (not res!917655) (not e!778648))))

(assert (=> start!116538 (= res!917655 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45575 a!4142))))))

(assert (=> start!116538 e!778648))

(assert (=> start!116538 true))

(declare-fun array_inv!34053 (array!93238) Bool)

(assert (=> start!116538 (array_inv!34053 a!4142)))

(declare-fun b!1374473 () Bool)

(declare-fun res!917658 () Bool)

(assert (=> b!1374473 (=> (not res!917658) (not e!778648))))

(assert (=> b!1374473 (= res!917658 (validKeyInArray!0 (select (arr!45025 a!4142) i!1457)))))

(declare-fun b!1374474 () Bool)

(declare-fun res!917656 () Bool)

(assert (=> b!1374474 (=> (not res!917656) (not e!778648))))

(assert (=> b!1374474 (= res!917656 (bvslt (size!45575 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1374475 () Bool)

(assert (=> b!1374475 (= e!778648 (not e!778646))))

(declare-fun res!917659 () Bool)

(assert (=> b!1374475 (=> res!917659 e!778646)))

(assert (=> b!1374475 (= res!917659 (or (bvslt (size!45575 a!4142) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000)))))

(declare-fun lt!603612 () (_ BitVec 32))

(declare-fun lt!603615 () (_ BitVec 32))

(assert (=> b!1374475 (= (bvadd lt!603612 lt!603615) (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (size!45575 a!4142)))))

(declare-fun lt!603616 () Unit!45451)

(assert (=> b!1374475 (= lt!603616 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4142 #b00000000000000000000000000000000 (size!45575 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374475 (= lt!603617 lt!603615)))

(assert (=> b!1374475 (= lt!603615 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45575 a!4142)))))

(assert (=> b!1374475 (= lt!603617 (arrayCountValidKeys!0 lt!603619 (bvadd #b00000000000000000000000000000001 i!1457) (size!45575 a!4142)))))

(declare-fun lt!603611 () Unit!45451)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93238 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45451)

(assert (=> b!1374475 (= lt!603611 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374475 (= lt!603613 (bvsub lt!603612 #b00000000000000000000000000000001))))

(assert (=> b!1374475 (= lt!603613 (arrayCountValidKeys!0 lt!603619 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374475 (= lt!603612 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374475 (= lt!603619 (array!93239 (store (arr!45025 a!4142) i!1457 k!2959) (size!45575 a!4142)))))

(declare-fun lt!603614 () Unit!45451)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93238 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45451)

(assert (=> b!1374475 (= lt!603614 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(assert (= (and start!116538 res!917655) b!1374473))

(assert (= (and b!1374473 res!917658) b!1374472))

(assert (= (and b!1374472 res!917657) b!1374474))

(assert (= (and b!1374474 res!917656) b!1374475))

(assert (= (and b!1374475 (not res!917659)) b!1374471))

(declare-fun m!1257877 () Bool)

(assert (=> b!1374475 m!1257877))

(declare-fun m!1257879 () Bool)

(assert (=> b!1374475 m!1257879))

(declare-fun m!1257881 () Bool)

(assert (=> b!1374475 m!1257881))

(declare-fun m!1257883 () Bool)

(assert (=> b!1374475 m!1257883))

(declare-fun m!1257885 () Bool)

(assert (=> b!1374475 m!1257885))

(declare-fun m!1257887 () Bool)

(assert (=> b!1374475 m!1257887))

(declare-fun m!1257889 () Bool)

(assert (=> b!1374475 m!1257889))

(declare-fun m!1257891 () Bool)

(assert (=> b!1374475 m!1257891))

(declare-fun m!1257893 () Bool)

(assert (=> b!1374475 m!1257893))

(declare-fun m!1257895 () Bool)

(assert (=> b!1374471 m!1257895))

(declare-fun m!1257897 () Bool)

(assert (=> b!1374471 m!1257897))

(declare-fun m!1257899 () Bool)

(assert (=> start!116538 m!1257899))

(declare-fun m!1257901 () Bool)

(assert (=> b!1374473 m!1257901))

(assert (=> b!1374473 m!1257901))

(declare-fun m!1257903 () Bool)

(assert (=> b!1374473 m!1257903))

(declare-fun m!1257905 () Bool)

(assert (=> b!1374472 m!1257905))

(push 1)

(assert (not b!1374473))

(assert (not b!1374471))

(assert (not b!1374475))

(assert (not start!116538))

(assert (not b!1374472))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

