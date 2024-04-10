; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116510 () Bool)

(assert start!116510)

(declare-fun b!1374279 () Bool)

(declare-fun res!917464 () Bool)

(declare-fun e!778538 () Bool)

(assert (=> b!1374279 (=> (not res!917464) (not e!778538))))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374279 (= res!917464 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1374280 () Bool)

(declare-fun res!917465 () Bool)

(assert (=> b!1374280 (=> (not res!917465) (not e!778538))))

(declare-datatypes ((array!93210 0))(
  ( (array!93211 (arr!45011 (Array (_ BitVec 32) (_ BitVec 64))) (size!45561 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93210)

(assert (=> b!1374280 (= res!917465 (bvslt (size!45561 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1374281 () Bool)

(declare-fun e!778539 () Bool)

(assert (=> b!1374281 (= e!778538 (not e!778539))))

(declare-fun res!917467 () Bool)

(assert (=> b!1374281 (=> res!917467 e!778539)))

(declare-fun i!1457 () (_ BitVec 32))

(assert (=> b!1374281 (= res!917467 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) i!1457)))))

(declare-fun lt!603387 () array!93210)

(declare-fun arrayCountValidKeys!0 (array!93210 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374281 (= (arrayCountValidKeys!0 lt!603387 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(assert (=> b!1374281 (= lt!603387 (array!93211 (store (arr!45011 a!4142) i!1457 k!2959) (size!45561 a!4142)))))

(declare-datatypes ((Unit!45423 0))(
  ( (Unit!45424) )
))
(declare-fun lt!603386 () Unit!45423)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93210 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45423)

(assert (=> b!1374281 (= lt!603386 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun res!917463 () Bool)

(assert (=> start!116510 (=> (not res!917463) (not e!778538))))

(assert (=> start!116510 (= res!917463 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45561 a!4142))))))

(assert (=> start!116510 e!778538))

(assert (=> start!116510 true))

(declare-fun array_inv!34039 (array!93210) Bool)

(assert (=> start!116510 (array_inv!34039 a!4142)))

(declare-fun b!1374282 () Bool)

(assert (=> b!1374282 (= e!778539 true)))

(declare-fun lt!603385 () (_ BitVec 32))

(assert (=> b!1374282 (= lt!603385 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603388 () (_ BitVec 32))

(assert (=> b!1374282 (= lt!603388 (arrayCountValidKeys!0 lt!603387 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374283 () Bool)

(declare-fun res!917466 () Bool)

(assert (=> b!1374283 (=> (not res!917466) (not e!778538))))

(assert (=> b!1374283 (= res!917466 (validKeyInArray!0 (select (arr!45011 a!4142) i!1457)))))

(assert (= (and start!116510 res!917463) b!1374283))

(assert (= (and b!1374283 res!917466) b!1374279))

(assert (= (and b!1374279 res!917464) b!1374280))

(assert (= (and b!1374280 res!917465) b!1374281))

(assert (= (and b!1374281 (not res!917467)) b!1374282))

(declare-fun m!1257553 () Bool)

(assert (=> b!1374282 m!1257553))

(declare-fun m!1257555 () Bool)

(assert (=> b!1374282 m!1257555))

(declare-fun m!1257557 () Bool)

(assert (=> b!1374283 m!1257557))

(assert (=> b!1374283 m!1257557))

(declare-fun m!1257559 () Bool)

(assert (=> b!1374283 m!1257559))

(declare-fun m!1257561 () Bool)

(assert (=> start!116510 m!1257561))

(declare-fun m!1257563 () Bool)

(assert (=> b!1374281 m!1257563))

(declare-fun m!1257565 () Bool)

(assert (=> b!1374281 m!1257565))

(declare-fun m!1257567 () Bool)

(assert (=> b!1374281 m!1257567))

(declare-fun m!1257569 () Bool)

(assert (=> b!1374281 m!1257569))

(declare-fun m!1257571 () Bool)

(assert (=> b!1374279 m!1257571))

(push 1)

(assert (not b!1374283))

(assert (not b!1374281))

(assert (not b!1374279))

(assert (not b!1374282))

(assert (not start!116510))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

