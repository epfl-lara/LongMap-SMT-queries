; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116506 () Bool)

(assert start!116506)

(declare-fun b!1374249 () Bool)

(declare-fun res!917436 () Bool)

(declare-fun e!778521 () Bool)

(assert (=> b!1374249 (=> (not res!917436) (not e!778521))))

(declare-datatypes ((array!93206 0))(
  ( (array!93207 (arr!45009 (Array (_ BitVec 32) (_ BitVec 64))) (size!45559 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93206)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374249 (= res!917436 (validKeyInArray!0 (select (arr!45009 a!4142) i!1457)))))

(declare-fun b!1374250 () Bool)

(declare-fun e!778520 () Bool)

(assert (=> b!1374250 (= e!778520 true)))

(declare-fun lt!603364 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93206 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374250 (= lt!603364 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603362 () (_ BitVec 32))

(declare-fun lt!603361 () array!93206)

(assert (=> b!1374250 (= lt!603362 (arrayCountValidKeys!0 lt!603361 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374251 () Bool)

(declare-fun res!917433 () Bool)

(assert (=> b!1374251 (=> (not res!917433) (not e!778521))))

(declare-fun k0!2959 () (_ BitVec 64))

(assert (=> b!1374251 (= res!917433 (not (validKeyInArray!0 k0!2959)))))

(declare-fun res!917435 () Bool)

(assert (=> start!116506 (=> (not res!917435) (not e!778521))))

(assert (=> start!116506 (= res!917435 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45559 a!4142))))))

(assert (=> start!116506 e!778521))

(assert (=> start!116506 true))

(declare-fun array_inv!34037 (array!93206) Bool)

(assert (=> start!116506 (array_inv!34037 a!4142)))

(declare-fun b!1374252 () Bool)

(declare-fun res!917434 () Bool)

(assert (=> b!1374252 (=> (not res!917434) (not e!778521))))

(assert (=> b!1374252 (= res!917434 (bvslt (size!45559 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1374253 () Bool)

(assert (=> b!1374253 (= e!778521 (not e!778520))))

(declare-fun res!917437 () Bool)

(assert (=> b!1374253 (=> res!917437 e!778520)))

(assert (=> b!1374253 (= res!917437 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) i!1457)))))

(assert (=> b!1374253 (= (arrayCountValidKeys!0 lt!603361 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(assert (=> b!1374253 (= lt!603361 (array!93207 (store (arr!45009 a!4142) i!1457 k0!2959) (size!45559 a!4142)))))

(declare-datatypes ((Unit!45419 0))(
  ( (Unit!45420) )
))
(declare-fun lt!603363 () Unit!45419)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93206 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45419)

(assert (=> b!1374253 (= lt!603363 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k0!2959 i!1457))))

(assert (= (and start!116506 res!917435) b!1374249))

(assert (= (and b!1374249 res!917436) b!1374251))

(assert (= (and b!1374251 res!917433) b!1374252))

(assert (= (and b!1374252 res!917434) b!1374253))

(assert (= (and b!1374253 (not res!917437)) b!1374250))

(declare-fun m!1257513 () Bool)

(assert (=> start!116506 m!1257513))

(declare-fun m!1257515 () Bool)

(assert (=> b!1374251 m!1257515))

(declare-fun m!1257517 () Bool)

(assert (=> b!1374253 m!1257517))

(declare-fun m!1257519 () Bool)

(assert (=> b!1374253 m!1257519))

(declare-fun m!1257521 () Bool)

(assert (=> b!1374253 m!1257521))

(declare-fun m!1257523 () Bool)

(assert (=> b!1374253 m!1257523))

(declare-fun m!1257525 () Bool)

(assert (=> b!1374249 m!1257525))

(assert (=> b!1374249 m!1257525))

(declare-fun m!1257527 () Bool)

(assert (=> b!1374249 m!1257527))

(declare-fun m!1257529 () Bool)

(assert (=> b!1374250 m!1257529))

(declare-fun m!1257531 () Bool)

(assert (=> b!1374250 m!1257531))

(check-sat (not b!1374249) (not b!1374253) (not b!1374251) (not start!116506) (not b!1374250))
