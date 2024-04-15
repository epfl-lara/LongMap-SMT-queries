; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116540 () Bool)

(assert start!116540)

(declare-fun b!1374489 () Bool)

(declare-fun res!917720 () Bool)

(declare-fun e!778666 () Bool)

(assert (=> b!1374489 (=> (not res!917720) (not e!778666))))

(declare-datatypes ((array!93199 0))(
  ( (array!93200 (arr!45006 (Array (_ BitVec 32) (_ BitVec 64))) (size!45558 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93199)

(assert (=> b!1374489 (= res!917720 (bvslt (size!45558 a!4142) #b01111111111111111111111111111111))))

(declare-fun res!917718 () Bool)

(assert (=> start!116540 (=> (not res!917718) (not e!778666))))

(declare-fun i!1457 () (_ BitVec 32))

(assert (=> start!116540 (= res!917718 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45558 a!4142))))))

(assert (=> start!116540 e!778666))

(assert (=> start!116540 true))

(declare-fun array_inv!34239 (array!93199) Bool)

(assert (=> start!116540 (array_inv!34239 a!4142)))

(declare-fun b!1374490 () Bool)

(declare-fun e!778667 () Bool)

(assert (=> b!1374490 (= e!778667 true)))

(declare-fun lt!603592 () (_ BitVec 32))

(declare-fun lt!603589 () array!93199)

(declare-fun lt!603590 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93199 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374490 (= (bvadd lt!603592 lt!603590) (arrayCountValidKeys!0 lt!603589 #b00000000000000000000000000000000 (size!45558 a!4142)))))

(declare-datatypes ((Unit!45304 0))(
  ( (Unit!45305) )
))
(declare-fun lt!603588 () Unit!45304)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93199 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45304)

(assert (=> b!1374490 (= lt!603588 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!603589 #b00000000000000000000000000000000 (size!45558 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374491 () Bool)

(declare-fun res!917717 () Bool)

(assert (=> b!1374491 (=> (not res!917717) (not e!778666))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374491 (= res!917717 (validKeyInArray!0 (select (arr!45006 a!4142) i!1457)))))

(declare-fun b!1374492 () Bool)

(assert (=> b!1374492 (= e!778666 (not e!778667))))

(declare-fun res!917719 () Bool)

(assert (=> b!1374492 (=> res!917719 e!778667)))

(assert (=> b!1374492 (= res!917719 (or (bvslt (size!45558 a!4142) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000)))))

(declare-fun lt!603586 () (_ BitVec 32))

(declare-fun lt!603587 () (_ BitVec 32))

(assert (=> b!1374492 (= (bvadd lt!603586 lt!603587) (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (size!45558 a!4142)))))

(declare-fun lt!603591 () Unit!45304)

(assert (=> b!1374492 (= lt!603591 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4142 #b00000000000000000000000000000000 (size!45558 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374492 (= lt!603590 lt!603587)))

(assert (=> b!1374492 (= lt!603587 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45558 a!4142)))))

(assert (=> b!1374492 (= lt!603590 (arrayCountValidKeys!0 lt!603589 (bvadd #b00000000000000000000000000000001 i!1457) (size!45558 a!4142)))))

(declare-fun lt!603593 () Unit!45304)

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93199 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45304)

(assert (=> b!1374492 (= lt!603593 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374492 (= lt!603592 (bvsub lt!603586 #b00000000000000000000000000000001))))

(assert (=> b!1374492 (= lt!603592 (arrayCountValidKeys!0 lt!603589 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374492 (= lt!603586 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374492 (= lt!603589 (array!93200 (store (arr!45006 a!4142) i!1457 k!2959) (size!45558 a!4142)))))

(declare-fun lt!603594 () Unit!45304)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93199 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45304)

(assert (=> b!1374492 (= lt!603594 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1374493 () Bool)

(declare-fun res!917716 () Bool)

(assert (=> b!1374493 (=> (not res!917716) (not e!778666))))

(assert (=> b!1374493 (= res!917716 (not (validKeyInArray!0 k!2959)))))

(assert (= (and start!116540 res!917718) b!1374491))

(assert (= (and b!1374491 res!917717) b!1374493))

(assert (= (and b!1374493 res!917716) b!1374489))

(assert (= (and b!1374489 res!917720) b!1374492))

(assert (= (and b!1374492 (not res!917719)) b!1374490))

(declare-fun m!1257531 () Bool)

(assert (=> b!1374493 m!1257531))

(declare-fun m!1257533 () Bool)

(assert (=> b!1374491 m!1257533))

(assert (=> b!1374491 m!1257533))

(declare-fun m!1257535 () Bool)

(assert (=> b!1374491 m!1257535))

(declare-fun m!1257537 () Bool)

(assert (=> start!116540 m!1257537))

(declare-fun m!1257539 () Bool)

(assert (=> b!1374492 m!1257539))

(declare-fun m!1257541 () Bool)

(assert (=> b!1374492 m!1257541))

(declare-fun m!1257543 () Bool)

(assert (=> b!1374492 m!1257543))

(declare-fun m!1257545 () Bool)

(assert (=> b!1374492 m!1257545))

(declare-fun m!1257547 () Bool)

(assert (=> b!1374492 m!1257547))

(declare-fun m!1257549 () Bool)

(assert (=> b!1374492 m!1257549))

(declare-fun m!1257551 () Bool)

(assert (=> b!1374492 m!1257551))

(declare-fun m!1257553 () Bool)

(assert (=> b!1374492 m!1257553))

(declare-fun m!1257555 () Bool)

(assert (=> b!1374492 m!1257555))

(declare-fun m!1257557 () Bool)

(assert (=> b!1374490 m!1257557))

(declare-fun m!1257559 () Bool)

(assert (=> b!1374490 m!1257559))

(push 1)

(assert (not start!116540))

(assert (not b!1374492))

(assert (not b!1374491))

(assert (not b!1374493))

(assert (not b!1374490))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

