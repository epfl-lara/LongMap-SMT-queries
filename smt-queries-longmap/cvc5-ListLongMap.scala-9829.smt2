; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116894 () Bool)

(assert start!116894)

(declare-fun b!1376487 () Bool)

(declare-fun e!779880 () Bool)

(assert (=> b!1376487 (= e!779880 true)))

(declare-fun lt!604669 () (_ BitVec 32))

(declare-datatypes ((array!93449 0))(
  ( (array!93450 (arr!45123 (Array (_ BitVec 32) (_ BitVec 64))) (size!45674 (_ BitVec 32))) )
))
(declare-fun lt!604671 () array!93449)

(declare-fun a!4142 () array!93449)

(declare-fun lt!604676 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93449 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376487 (= (bvadd lt!604669 lt!604676) (arrayCountValidKeys!0 lt!604671 #b00000000000000000000000000000000 (size!45674 a!4142)))))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((Unit!45468 0))(
  ( (Unit!45469) )
))
(declare-fun lt!604675 () Unit!45468)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93449 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45468)

(assert (=> b!1376487 (= lt!604675 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!604671 #b00000000000000000000000000000000 (size!45674 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun res!918762 () Bool)

(declare-fun e!779881 () Bool)

(assert (=> start!116894 (=> (not res!918762) (not e!779881))))

(assert (=> start!116894 (= res!918762 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45674 a!4142))))))

(assert (=> start!116894 e!779881))

(assert (=> start!116894 true))

(declare-fun array_inv!34404 (array!93449) Bool)

(assert (=> start!116894 (array_inv!34404 a!4142)))

(declare-fun b!1376488 () Bool)

(declare-fun res!918761 () Bool)

(assert (=> b!1376488 (=> (not res!918761) (not e!779881))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376488 (= res!918761 (validKeyInArray!0 (select (arr!45123 a!4142) i!1457)))))

(declare-fun b!1376489 () Bool)

(declare-fun res!918760 () Bool)

(assert (=> b!1376489 (=> (not res!918760) (not e!779881))))

(assert (=> b!1376489 (= res!918760 (bvslt (size!45674 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1376490 () Bool)

(assert (=> b!1376490 (= e!779881 (not e!779880))))

(declare-fun res!918758 () Bool)

(assert (=> b!1376490 (=> res!918758 e!779880)))

(assert (=> b!1376490 (= res!918758 (or (bvslt (size!45674 a!4142) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000)))))

(declare-fun lt!604672 () (_ BitVec 32))

(declare-fun lt!604673 () (_ BitVec 32))

(assert (=> b!1376490 (= (bvadd lt!604672 lt!604673) (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (size!45674 a!4142)))))

(declare-fun lt!604677 () Unit!45468)

(assert (=> b!1376490 (= lt!604677 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4142 #b00000000000000000000000000000000 (size!45674 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1376490 (= lt!604676 lt!604673)))

(assert (=> b!1376490 (= lt!604673 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45674 a!4142)))))

(assert (=> b!1376490 (= lt!604676 (arrayCountValidKeys!0 lt!604671 (bvadd #b00000000000000000000000000000001 i!1457) (size!45674 a!4142)))))

(declare-fun lt!604674 () Unit!45468)

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93449 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45468)

(assert (=> b!1376490 (= lt!604674 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1376490 (= lt!604669 (bvsub lt!604672 #b00000000000000000000000000000001))))

(assert (=> b!1376490 (= lt!604669 (arrayCountValidKeys!0 lt!604671 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1376490 (= lt!604672 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1376490 (= lt!604671 (array!93450 (store (arr!45123 a!4142) i!1457 k!2959) (size!45674 a!4142)))))

(declare-fun lt!604670 () Unit!45468)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93449 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45468)

(assert (=> b!1376490 (= lt!604670 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1376491 () Bool)

(declare-fun res!918759 () Bool)

(assert (=> b!1376491 (=> (not res!918759) (not e!779881))))

(assert (=> b!1376491 (= res!918759 (not (validKeyInArray!0 k!2959)))))

(assert (= (and start!116894 res!918762) b!1376488))

(assert (= (and b!1376488 res!918761) b!1376491))

(assert (= (and b!1376491 res!918759) b!1376489))

(assert (= (and b!1376489 res!918760) b!1376490))

(assert (= (and b!1376490 (not res!918758)) b!1376487))

(declare-fun m!1260551 () Bool)

(assert (=> start!116894 m!1260551))

(declare-fun m!1260553 () Bool)

(assert (=> b!1376491 m!1260553))

(declare-fun m!1260555 () Bool)

(assert (=> b!1376490 m!1260555))

(declare-fun m!1260557 () Bool)

(assert (=> b!1376490 m!1260557))

(declare-fun m!1260559 () Bool)

(assert (=> b!1376490 m!1260559))

(declare-fun m!1260561 () Bool)

(assert (=> b!1376490 m!1260561))

(declare-fun m!1260563 () Bool)

(assert (=> b!1376490 m!1260563))

(declare-fun m!1260565 () Bool)

(assert (=> b!1376490 m!1260565))

(declare-fun m!1260567 () Bool)

(assert (=> b!1376490 m!1260567))

(declare-fun m!1260569 () Bool)

(assert (=> b!1376490 m!1260569))

(declare-fun m!1260571 () Bool)

(assert (=> b!1376490 m!1260571))

(declare-fun m!1260573 () Bool)

(assert (=> b!1376487 m!1260573))

(declare-fun m!1260575 () Bool)

(assert (=> b!1376487 m!1260575))

(declare-fun m!1260577 () Bool)

(assert (=> b!1376488 m!1260577))

(assert (=> b!1376488 m!1260577))

(declare-fun m!1260579 () Bool)

(assert (=> b!1376488 m!1260579))

(push 1)

(assert (not b!1376487))

(assert (not b!1376491))

(assert (not start!116894))

(assert (not b!1376490))

(assert (not b!1376488))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

