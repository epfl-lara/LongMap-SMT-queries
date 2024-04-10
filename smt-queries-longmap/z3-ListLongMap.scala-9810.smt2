; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116512 () Bool)

(assert start!116512)

(declare-fun b!1374294 () Bool)

(declare-fun res!917478 () Bool)

(declare-fun e!778548 () Bool)

(assert (=> b!1374294 (=> (not res!917478) (not e!778548))))

(declare-datatypes ((array!93212 0))(
  ( (array!93213 (arr!45012 (Array (_ BitVec 32) (_ BitVec 64))) (size!45562 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93212)

(assert (=> b!1374294 (= res!917478 (bvslt (size!45562 a!4142) #b01111111111111111111111111111111))))

(declare-fun res!917479 () Bool)

(assert (=> start!116512 (=> (not res!917479) (not e!778548))))

(declare-fun i!1457 () (_ BitVec 32))

(assert (=> start!116512 (= res!917479 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45562 a!4142))))))

(assert (=> start!116512 e!778548))

(assert (=> start!116512 true))

(declare-fun array_inv!34040 (array!93212) Bool)

(assert (=> start!116512 (array_inv!34040 a!4142)))

(declare-fun b!1374295 () Bool)

(declare-fun res!917481 () Bool)

(assert (=> b!1374295 (=> (not res!917481) (not e!778548))))

(declare-fun k0!2959 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374295 (= res!917481 (not (validKeyInArray!0 k0!2959)))))

(declare-fun b!1374296 () Bool)

(declare-fun e!778549 () Bool)

(assert (=> b!1374296 (= e!778548 (not e!778549))))

(declare-fun res!917482 () Bool)

(assert (=> b!1374296 (=> res!917482 e!778549)))

(assert (=> b!1374296 (= res!917482 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) i!1457)))))

(declare-fun lt!603399 () array!93212)

(declare-fun arrayCountValidKeys!0 (array!93212 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374296 (= (arrayCountValidKeys!0 lt!603399 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(assert (=> b!1374296 (= lt!603399 (array!93213 (store (arr!45012 a!4142) i!1457 k0!2959) (size!45562 a!4142)))))

(declare-datatypes ((Unit!45425 0))(
  ( (Unit!45426) )
))
(declare-fun lt!603400 () Unit!45425)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93212 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45425)

(assert (=> b!1374296 (= lt!603400 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k0!2959 i!1457))))

(declare-fun b!1374297 () Bool)

(assert (=> b!1374297 (= e!778549 true)))

(declare-fun lt!603398 () (_ BitVec 32))

(assert (=> b!1374297 (= lt!603398 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603397 () (_ BitVec 32))

(assert (=> b!1374297 (= lt!603397 (arrayCountValidKeys!0 lt!603399 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374298 () Bool)

(declare-fun res!917480 () Bool)

(assert (=> b!1374298 (=> (not res!917480) (not e!778548))))

(assert (=> b!1374298 (= res!917480 (validKeyInArray!0 (select (arr!45012 a!4142) i!1457)))))

(assert (= (and start!116512 res!917479) b!1374298))

(assert (= (and b!1374298 res!917480) b!1374295))

(assert (= (and b!1374295 res!917481) b!1374294))

(assert (= (and b!1374294 res!917478) b!1374296))

(assert (= (and b!1374296 (not res!917482)) b!1374297))

(declare-fun m!1257573 () Bool)

(assert (=> b!1374295 m!1257573))

(declare-fun m!1257575 () Bool)

(assert (=> start!116512 m!1257575))

(declare-fun m!1257577 () Bool)

(assert (=> b!1374297 m!1257577))

(declare-fun m!1257579 () Bool)

(assert (=> b!1374297 m!1257579))

(declare-fun m!1257581 () Bool)

(assert (=> b!1374298 m!1257581))

(assert (=> b!1374298 m!1257581))

(declare-fun m!1257583 () Bool)

(assert (=> b!1374298 m!1257583))

(declare-fun m!1257585 () Bool)

(assert (=> b!1374296 m!1257585))

(declare-fun m!1257587 () Bool)

(assert (=> b!1374296 m!1257587))

(declare-fun m!1257589 () Bool)

(assert (=> b!1374296 m!1257589))

(declare-fun m!1257591 () Bool)

(assert (=> b!1374296 m!1257591))

(check-sat (not start!116512) (not b!1374298) (not b!1374295) (not b!1374296) (not b!1374297))
