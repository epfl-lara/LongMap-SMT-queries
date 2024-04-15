; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116546 () Bool)

(assert start!116546)

(declare-fun b!1374534 () Bool)

(declare-fun res!917765 () Bool)

(declare-fun e!778695 () Bool)

(assert (=> b!1374534 (=> (not res!917765) (not e!778695))))

(declare-datatypes ((array!93205 0))(
  ( (array!93206 (arr!45009 (Array (_ BitVec 32) (_ BitVec 64))) (size!45561 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93205)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374534 (= res!917765 (validKeyInArray!0 (select (arr!45009 a!4142) i!1457)))))

(declare-fun b!1374535 () Bool)

(declare-fun e!778693 () Bool)

(assert (=> b!1374535 (= e!778695 (not e!778693))))

(declare-fun res!917763 () Bool)

(assert (=> b!1374535 (=> res!917763 e!778693)))

(assert (=> b!1374535 (= res!917763 (or (bvslt (size!45561 a!4142) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000)))))

(declare-fun lt!603668 () (_ BitVec 32))

(declare-fun lt!603675 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93205 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374535 (= (bvadd lt!603668 lt!603675) (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (size!45561 a!4142)))))

(declare-datatypes ((Unit!45310 0))(
  ( (Unit!45311) )
))
(declare-fun lt!603670 () Unit!45310)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93205 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45310)

(assert (=> b!1374535 (= lt!603670 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4142 #b00000000000000000000000000000000 (size!45561 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603671 () (_ BitVec 32))

(assert (=> b!1374535 (= lt!603671 lt!603675)))

(assert (=> b!1374535 (= lt!603675 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45561 a!4142)))))

(declare-fun lt!603673 () array!93205)

(assert (=> b!1374535 (= lt!603671 (arrayCountValidKeys!0 lt!603673 (bvadd #b00000000000000000000000000000001 i!1457) (size!45561 a!4142)))))

(declare-fun lt!603669 () Unit!45310)

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93205 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45310)

(assert (=> b!1374535 (= lt!603669 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603674 () (_ BitVec 32))

(assert (=> b!1374535 (= lt!603674 (bvsub lt!603668 #b00000000000000000000000000000001))))

(assert (=> b!1374535 (= lt!603674 (arrayCountValidKeys!0 lt!603673 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374535 (= lt!603668 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374535 (= lt!603673 (array!93206 (store (arr!45009 a!4142) i!1457 k!2959) (size!45561 a!4142)))))

(declare-fun lt!603667 () Unit!45310)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93205 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45310)

(assert (=> b!1374535 (= lt!603667 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun res!917762 () Bool)

(assert (=> start!116546 (=> (not res!917762) (not e!778695))))

(assert (=> start!116546 (= res!917762 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45561 a!4142))))))

(assert (=> start!116546 e!778695))

(assert (=> start!116546 true))

(declare-fun array_inv!34242 (array!93205) Bool)

(assert (=> start!116546 (array_inv!34242 a!4142)))

(declare-fun b!1374536 () Bool)

(declare-fun res!917764 () Bool)

(assert (=> b!1374536 (=> (not res!917764) (not e!778695))))

(assert (=> b!1374536 (= res!917764 (bvslt (size!45561 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1374537 () Bool)

(declare-fun res!917761 () Bool)

(assert (=> b!1374537 (=> (not res!917761) (not e!778695))))

(assert (=> b!1374537 (= res!917761 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1374538 () Bool)

(assert (=> b!1374538 (= e!778693 true)))

(assert (=> b!1374538 (= (bvadd lt!603674 lt!603671) (arrayCountValidKeys!0 lt!603673 #b00000000000000000000000000000000 (size!45561 a!4142)))))

(declare-fun lt!603672 () Unit!45310)

(assert (=> b!1374538 (= lt!603672 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!603673 #b00000000000000000000000000000000 (size!45561 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (= (and start!116546 res!917762) b!1374534))

(assert (= (and b!1374534 res!917765) b!1374537))

(assert (= (and b!1374537 res!917761) b!1374536))

(assert (= (and b!1374536 res!917764) b!1374535))

(assert (= (and b!1374535 (not res!917763)) b!1374538))

(declare-fun m!1257621 () Bool)

(assert (=> b!1374535 m!1257621))

(declare-fun m!1257623 () Bool)

(assert (=> b!1374535 m!1257623))

(declare-fun m!1257625 () Bool)

(assert (=> b!1374535 m!1257625))

(declare-fun m!1257627 () Bool)

(assert (=> b!1374535 m!1257627))

(declare-fun m!1257629 () Bool)

(assert (=> b!1374535 m!1257629))

(declare-fun m!1257631 () Bool)

(assert (=> b!1374535 m!1257631))

(declare-fun m!1257633 () Bool)

(assert (=> b!1374535 m!1257633))

(declare-fun m!1257635 () Bool)

(assert (=> b!1374535 m!1257635))

(declare-fun m!1257637 () Bool)

(assert (=> b!1374535 m!1257637))

(declare-fun m!1257639 () Bool)

(assert (=> b!1374538 m!1257639))

(declare-fun m!1257641 () Bool)

(assert (=> b!1374538 m!1257641))

(declare-fun m!1257643 () Bool)

(assert (=> b!1374537 m!1257643))

(declare-fun m!1257645 () Bool)

(assert (=> start!116546 m!1257645))

(declare-fun m!1257647 () Bool)

(assert (=> b!1374534 m!1257647))

(assert (=> b!1374534 m!1257647))

(declare-fun m!1257649 () Bool)

(assert (=> b!1374534 m!1257649))

(push 1)

(assert (not b!1374535))

(assert (not b!1374537))

(assert (not b!1374534))

(assert (not start!116546))

(assert (not b!1374538))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

