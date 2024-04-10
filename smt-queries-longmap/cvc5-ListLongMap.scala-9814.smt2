; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116534 () Bool)

(assert start!116534)

(declare-fun b!1374441 () Bool)

(declare-fun e!778629 () Bool)

(assert (=> b!1374441 (= e!778629 true)))

(declare-datatypes ((array!93234 0))(
  ( (array!93235 (arr!45023 (Array (_ BitVec 32) (_ BitVec 64))) (size!45573 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93234)

(declare-fun lt!603562 () array!93234)

(declare-fun lt!603561 () (_ BitVec 32))

(declare-fun lt!603564 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93234 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374441 (= (bvadd lt!603561 lt!603564) (arrayCountValidKeys!0 lt!603562 #b00000000000000000000000000000000 (size!45573 a!4142)))))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((Unit!45447 0))(
  ( (Unit!45448) )
))
(declare-fun lt!603558 () Unit!45447)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93234 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45447)

(assert (=> b!1374441 (= lt!603558 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!603562 #b00000000000000000000000000000000 (size!45573 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374442 () Bool)

(declare-fun res!917628 () Bool)

(declare-fun e!778628 () Bool)

(assert (=> b!1374442 (=> (not res!917628) (not e!778628))))

(assert (=> b!1374442 (= res!917628 (bvslt (size!45573 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1374443 () Bool)

(declare-fun res!917629 () Bool)

(assert (=> b!1374443 (=> (not res!917629) (not e!778628))))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374443 (= res!917629 (not (validKeyInArray!0 k!2959)))))

(declare-fun res!917627 () Bool)

(assert (=> start!116534 (=> (not res!917627) (not e!778628))))

(assert (=> start!116534 (= res!917627 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45573 a!4142))))))

(assert (=> start!116534 e!778628))

(assert (=> start!116534 true))

(declare-fun array_inv!34051 (array!93234) Bool)

(assert (=> start!116534 (array_inv!34051 a!4142)))

(declare-fun b!1374444 () Bool)

(declare-fun res!917625 () Bool)

(assert (=> b!1374444 (=> (not res!917625) (not e!778628))))

(assert (=> b!1374444 (= res!917625 (validKeyInArray!0 (select (arr!45023 a!4142) i!1457)))))

(declare-fun b!1374445 () Bool)

(assert (=> b!1374445 (= e!778628 (not e!778629))))

(declare-fun res!917626 () Bool)

(assert (=> b!1374445 (=> res!917626 e!778629)))

(assert (=> b!1374445 (= res!917626 (or (bvslt (size!45573 a!4142) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000)))))

(declare-fun lt!603565 () (_ BitVec 32))

(declare-fun lt!603560 () (_ BitVec 32))

(assert (=> b!1374445 (= (bvadd lt!603565 lt!603560) (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (size!45573 a!4142)))))

(declare-fun lt!603563 () Unit!45447)

(assert (=> b!1374445 (= lt!603563 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4142 #b00000000000000000000000000000000 (size!45573 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374445 (= lt!603564 lt!603560)))

(assert (=> b!1374445 (= lt!603560 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45573 a!4142)))))

(assert (=> b!1374445 (= lt!603564 (arrayCountValidKeys!0 lt!603562 (bvadd #b00000000000000000000000000000001 i!1457) (size!45573 a!4142)))))

(declare-fun lt!603557 () Unit!45447)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93234 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45447)

(assert (=> b!1374445 (= lt!603557 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374445 (= lt!603561 (bvsub lt!603565 #b00000000000000000000000000000001))))

(assert (=> b!1374445 (= lt!603561 (arrayCountValidKeys!0 lt!603562 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374445 (= lt!603565 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374445 (= lt!603562 (array!93235 (store (arr!45023 a!4142) i!1457 k!2959) (size!45573 a!4142)))))

(declare-fun lt!603559 () Unit!45447)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93234 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45447)

(assert (=> b!1374445 (= lt!603559 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(assert (= (and start!116534 res!917627) b!1374444))

(assert (= (and b!1374444 res!917625) b!1374443))

(assert (= (and b!1374443 res!917629) b!1374442))

(assert (= (and b!1374442 res!917628) b!1374445))

(assert (= (and b!1374445 (not res!917626)) b!1374441))

(declare-fun m!1257817 () Bool)

(assert (=> b!1374445 m!1257817))

(declare-fun m!1257819 () Bool)

(assert (=> b!1374445 m!1257819))

(declare-fun m!1257821 () Bool)

(assert (=> b!1374445 m!1257821))

(declare-fun m!1257823 () Bool)

(assert (=> b!1374445 m!1257823))

(declare-fun m!1257825 () Bool)

(assert (=> b!1374445 m!1257825))

(declare-fun m!1257827 () Bool)

(assert (=> b!1374445 m!1257827))

(declare-fun m!1257829 () Bool)

(assert (=> b!1374445 m!1257829))

(declare-fun m!1257831 () Bool)

(assert (=> b!1374445 m!1257831))

(declare-fun m!1257833 () Bool)

(assert (=> b!1374445 m!1257833))

(declare-fun m!1257835 () Bool)

(assert (=> b!1374443 m!1257835))

(declare-fun m!1257837 () Bool)

(assert (=> start!116534 m!1257837))

(declare-fun m!1257839 () Bool)

(assert (=> b!1374441 m!1257839))

(declare-fun m!1257841 () Bool)

(assert (=> b!1374441 m!1257841))

(declare-fun m!1257843 () Bool)

(assert (=> b!1374444 m!1257843))

(assert (=> b!1374444 m!1257843))

(declare-fun m!1257845 () Bool)

(assert (=> b!1374444 m!1257845))

(push 1)

(assert (not start!116534))

(assert (not b!1374443))

(assert (not b!1374444))

(assert (not b!1374445))

(assert (not b!1374441))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

