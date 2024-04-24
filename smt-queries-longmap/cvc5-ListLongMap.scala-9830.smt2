; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116900 () Bool)

(assert start!116900)

(declare-fun b!1376532 () Bool)

(declare-fun e!779906 () Bool)

(declare-fun lt!604766 () (_ BitVec 32))

(declare-fun lt!604772 () (_ BitVec 32))

(assert (=> b!1376532 (= e!779906 (= lt!604766 (bvsub lt!604772 #b00000000000000000000000000000001)))))

(declare-fun lt!604775 () (_ BitVec 32))

(declare-fun lt!604774 () (_ BitVec 32))

(assert (=> b!1376532 (= (bvadd lt!604775 lt!604774) lt!604766)))

(declare-datatypes ((array!93455 0))(
  ( (array!93456 (arr!45126 (Array (_ BitVec 32) (_ BitVec 64))) (size!45677 (_ BitVec 32))) )
))
(declare-fun lt!604768 () array!93455)

(declare-fun a!4142 () array!93455)

(declare-fun arrayCountValidKeys!0 (array!93455 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376532 (= lt!604766 (arrayCountValidKeys!0 lt!604768 #b00000000000000000000000000000000 (size!45677 a!4142)))))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((Unit!45474 0))(
  ( (Unit!45475) )
))
(declare-fun lt!604776 () Unit!45474)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93455 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45474)

(assert (=> b!1376532 (= lt!604776 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!604768 #b00000000000000000000000000000000 (size!45677 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1376533 () Bool)

(declare-fun res!918806 () Bool)

(declare-fun e!779908 () Bool)

(assert (=> b!1376533 (=> (not res!918806) (not e!779908))))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376533 (= res!918806 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1376534 () Bool)

(assert (=> b!1376534 (= e!779908 (not e!779906))))

(declare-fun res!918807 () Bool)

(assert (=> b!1376534 (=> res!918807 e!779906)))

(assert (=> b!1376534 (= res!918807 (or (bvslt (size!45677 a!4142) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000)))))

(declare-fun lt!604767 () (_ BitVec 32))

(declare-fun lt!604769 () (_ BitVec 32))

(assert (=> b!1376534 (= (bvadd lt!604767 lt!604769) lt!604772)))

(assert (=> b!1376534 (= lt!604772 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (size!45677 a!4142)))))

(declare-fun lt!604771 () Unit!45474)

(assert (=> b!1376534 (= lt!604771 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4142 #b00000000000000000000000000000000 (size!45677 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1376534 (= lt!604774 lt!604769)))

(assert (=> b!1376534 (= lt!604769 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45677 a!4142)))))

(assert (=> b!1376534 (= lt!604774 (arrayCountValidKeys!0 lt!604768 (bvadd #b00000000000000000000000000000001 i!1457) (size!45677 a!4142)))))

(declare-fun lt!604773 () Unit!45474)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93455 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45474)

(assert (=> b!1376534 (= lt!604773 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1376534 (= lt!604775 (bvsub lt!604767 #b00000000000000000000000000000001))))

(assert (=> b!1376534 (= lt!604775 (arrayCountValidKeys!0 lt!604768 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1376534 (= lt!604767 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1376534 (= lt!604768 (array!93456 (store (arr!45126 a!4142) i!1457 k!2959) (size!45677 a!4142)))))

(declare-fun lt!604770 () Unit!45474)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93455 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45474)

(assert (=> b!1376534 (= lt!604770 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun res!918805 () Bool)

(assert (=> start!116900 (=> (not res!918805) (not e!779908))))

(assert (=> start!116900 (= res!918805 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45677 a!4142))))))

(assert (=> start!116900 e!779908))

(assert (=> start!116900 true))

(declare-fun array_inv!34407 (array!93455) Bool)

(assert (=> start!116900 (array_inv!34407 a!4142)))

(declare-fun b!1376535 () Bool)

(declare-fun res!918804 () Bool)

(assert (=> b!1376535 (=> (not res!918804) (not e!779908))))

(assert (=> b!1376535 (= res!918804 (validKeyInArray!0 (select (arr!45126 a!4142) i!1457)))))

(declare-fun b!1376536 () Bool)

(declare-fun res!918803 () Bool)

(assert (=> b!1376536 (=> (not res!918803) (not e!779908))))

(assert (=> b!1376536 (= res!918803 (bvslt (size!45677 a!4142) #b01111111111111111111111111111111))))

(assert (= (and start!116900 res!918805) b!1376535))

(assert (= (and b!1376535 res!918804) b!1376533))

(assert (= (and b!1376533 res!918806) b!1376536))

(assert (= (and b!1376536 res!918803) b!1376534))

(assert (= (and b!1376534 (not res!918807)) b!1376532))

(declare-fun m!1260641 () Bool)

(assert (=> b!1376535 m!1260641))

(assert (=> b!1376535 m!1260641))

(declare-fun m!1260643 () Bool)

(assert (=> b!1376535 m!1260643))

(declare-fun m!1260645 () Bool)

(assert (=> start!116900 m!1260645))

(declare-fun m!1260647 () Bool)

(assert (=> b!1376534 m!1260647))

(declare-fun m!1260649 () Bool)

(assert (=> b!1376534 m!1260649))

(declare-fun m!1260651 () Bool)

(assert (=> b!1376534 m!1260651))

(declare-fun m!1260653 () Bool)

(assert (=> b!1376534 m!1260653))

(declare-fun m!1260655 () Bool)

(assert (=> b!1376534 m!1260655))

(declare-fun m!1260657 () Bool)

(assert (=> b!1376534 m!1260657))

(declare-fun m!1260659 () Bool)

(assert (=> b!1376534 m!1260659))

(declare-fun m!1260661 () Bool)

(assert (=> b!1376534 m!1260661))

(declare-fun m!1260663 () Bool)

(assert (=> b!1376534 m!1260663))

(declare-fun m!1260665 () Bool)

(assert (=> b!1376532 m!1260665))

(declare-fun m!1260667 () Bool)

(assert (=> b!1376532 m!1260667))

(declare-fun m!1260669 () Bool)

(assert (=> b!1376533 m!1260669))

(push 1)

(assert (not b!1376533))

(assert (not start!116900))

(assert (not b!1376532))

(assert (not b!1376534))

(assert (not b!1376535))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

