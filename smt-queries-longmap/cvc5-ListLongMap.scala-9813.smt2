; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116528 () Bool)

(assert start!116528)

(declare-fun b!1374403 () Bool)

(declare-fun res!917589 () Bool)

(declare-fun e!778608 () Bool)

(assert (=> b!1374403 (=> (not res!917589) (not e!778608))))

(declare-datatypes ((array!93228 0))(
  ( (array!93229 (arr!45020 (Array (_ BitVec 32) (_ BitVec 64))) (size!45570 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93228)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374403 (= res!917589 (validKeyInArray!0 (select (arr!45020 a!4142) i!1457)))))

(declare-fun b!1374404 () Bool)

(declare-fun res!917587 () Bool)

(assert (=> b!1374404 (=> (not res!917587) (not e!778608))))

(declare-fun k!2959 () (_ BitVec 64))

(assert (=> b!1374404 (= res!917587 (not (validKeyInArray!0 k!2959)))))

(declare-fun res!917588 () Bool)

(assert (=> start!116528 (=> (not res!917588) (not e!778608))))

(assert (=> start!116528 (= res!917588 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45570 a!4142))))))

(assert (=> start!116528 e!778608))

(assert (=> start!116528 true))

(declare-fun array_inv!34048 (array!93228) Bool)

(assert (=> start!116528 (array_inv!34048 a!4142)))

(declare-fun b!1374406 () Bool)

(assert (=> b!1374406 (= e!778608 (not true))))

(declare-fun lt!603492 () (_ BitVec 32))

(declare-fun lt!603491 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93228 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374406 (= (bvadd lt!603492 lt!603491) (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (size!45570 a!4142)))))

(declare-datatypes ((Unit!45441 0))(
  ( (Unit!45442) )
))
(declare-fun lt!603495 () Unit!45441)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93228 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45441)

(assert (=> b!1374406 (= lt!603495 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4142 #b00000000000000000000000000000000 (size!45570 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603490 () (_ BitVec 32))

(assert (=> b!1374406 (= lt!603490 lt!603491)))

(assert (=> b!1374406 (= lt!603491 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45570 a!4142)))))

(declare-fun lt!603494 () array!93228)

(assert (=> b!1374406 (= lt!603490 (arrayCountValidKeys!0 lt!603494 (bvadd #b00000000000000000000000000000001 i!1457) (size!45570 a!4142)))))

(declare-fun lt!603496 () Unit!45441)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93228 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45441)

(assert (=> b!1374406 (= lt!603496 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374406 (= (arrayCountValidKeys!0 lt!603494 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub lt!603492 #b00000000000000000000000000000001))))

(assert (=> b!1374406 (= lt!603492 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374406 (= lt!603494 (array!93229 (store (arr!45020 a!4142) i!1457 k!2959) (size!45570 a!4142)))))

(declare-fun lt!603493 () Unit!45441)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93228 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45441)

(assert (=> b!1374406 (= lt!603493 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1374405 () Bool)

(declare-fun res!917590 () Bool)

(assert (=> b!1374405 (=> (not res!917590) (not e!778608))))

(assert (=> b!1374405 (= res!917590 (bvslt (size!45570 a!4142) #b01111111111111111111111111111111))))

(assert (= (and start!116528 res!917588) b!1374403))

(assert (= (and b!1374403 res!917589) b!1374404))

(assert (= (and b!1374404 res!917587) b!1374405))

(assert (= (and b!1374405 res!917590) b!1374406))

(declare-fun m!1257739 () Bool)

(assert (=> b!1374403 m!1257739))

(assert (=> b!1374403 m!1257739))

(declare-fun m!1257741 () Bool)

(assert (=> b!1374403 m!1257741))

(declare-fun m!1257743 () Bool)

(assert (=> b!1374404 m!1257743))

(declare-fun m!1257745 () Bool)

(assert (=> start!116528 m!1257745))

(declare-fun m!1257747 () Bool)

(assert (=> b!1374406 m!1257747))

(declare-fun m!1257749 () Bool)

(assert (=> b!1374406 m!1257749))

(declare-fun m!1257751 () Bool)

(assert (=> b!1374406 m!1257751))

(declare-fun m!1257753 () Bool)

(assert (=> b!1374406 m!1257753))

(declare-fun m!1257755 () Bool)

(assert (=> b!1374406 m!1257755))

(declare-fun m!1257757 () Bool)

(assert (=> b!1374406 m!1257757))

(declare-fun m!1257759 () Bool)

(assert (=> b!1374406 m!1257759))

(declare-fun m!1257761 () Bool)

(assert (=> b!1374406 m!1257761))

(declare-fun m!1257763 () Bool)

(assert (=> b!1374406 m!1257763))

(push 1)

(assert (not start!116528))

(assert (not b!1374403))

(assert (not b!1374404))

(assert (not b!1374406))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

