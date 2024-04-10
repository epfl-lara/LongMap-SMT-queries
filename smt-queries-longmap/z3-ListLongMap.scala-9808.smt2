; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116500 () Bool)

(assert start!116500)

(declare-fun res!917390 () Bool)

(declare-fun e!778493 () Bool)

(assert (=> start!116500 (=> (not res!917390) (not e!778493))))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((array!93200 0))(
  ( (array!93201 (arr!45006 (Array (_ BitVec 32) (_ BitVec 64))) (size!45556 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93200)

(assert (=> start!116500 (= res!917390 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45556 a!4142))))))

(assert (=> start!116500 e!778493))

(assert (=> start!116500 true))

(declare-fun array_inv!34034 (array!93200) Bool)

(assert (=> start!116500 (array_inv!34034 a!4142)))

(declare-fun b!1374204 () Bool)

(declare-fun res!917388 () Bool)

(assert (=> b!1374204 (=> (not res!917388) (not e!778493))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374204 (= res!917388 (validKeyInArray!0 (select (arr!45006 a!4142) i!1457)))))

(declare-fun b!1374205 () Bool)

(declare-fun res!917389 () Bool)

(assert (=> b!1374205 (=> (not res!917389) (not e!778493))))

(assert (=> b!1374205 (= res!917389 (bvslt (size!45556 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1374206 () Bool)

(declare-fun e!778494 () Bool)

(assert (=> b!1374206 (= e!778493 (not e!778494))))

(declare-fun res!917391 () Bool)

(assert (=> b!1374206 (=> res!917391 e!778494)))

(assert (=> b!1374206 (= res!917391 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) i!1457)))))

(declare-fun lt!603325 () array!93200)

(declare-fun arrayCountValidKeys!0 (array!93200 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374206 (= (arrayCountValidKeys!0 lt!603325 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(declare-fun k0!2959 () (_ BitVec 64))

(assert (=> b!1374206 (= lt!603325 (array!93201 (store (arr!45006 a!4142) i!1457 k0!2959) (size!45556 a!4142)))))

(declare-datatypes ((Unit!45413 0))(
  ( (Unit!45414) )
))
(declare-fun lt!603327 () Unit!45413)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93200 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45413)

(assert (=> b!1374206 (= lt!603327 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k0!2959 i!1457))))

(declare-fun b!1374207 () Bool)

(declare-fun res!917392 () Bool)

(assert (=> b!1374207 (=> (not res!917392) (not e!778493))))

(assert (=> b!1374207 (= res!917392 (not (validKeyInArray!0 k0!2959)))))

(declare-fun b!1374208 () Bool)

(assert (=> b!1374208 (= e!778494 true)))

(declare-fun lt!603326 () (_ BitVec 32))

(assert (=> b!1374208 (= lt!603326 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603328 () (_ BitVec 32))

(assert (=> b!1374208 (= lt!603328 (arrayCountValidKeys!0 lt!603325 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (= (and start!116500 res!917390) b!1374204))

(assert (= (and b!1374204 res!917388) b!1374207))

(assert (= (and b!1374207 res!917392) b!1374205))

(assert (= (and b!1374205 res!917389) b!1374206))

(assert (= (and b!1374206 (not res!917391)) b!1374208))

(declare-fun m!1257453 () Bool)

(assert (=> b!1374206 m!1257453))

(declare-fun m!1257455 () Bool)

(assert (=> b!1374206 m!1257455))

(declare-fun m!1257457 () Bool)

(assert (=> b!1374206 m!1257457))

(declare-fun m!1257459 () Bool)

(assert (=> b!1374206 m!1257459))

(declare-fun m!1257461 () Bool)

(assert (=> b!1374208 m!1257461))

(declare-fun m!1257463 () Bool)

(assert (=> b!1374208 m!1257463))

(declare-fun m!1257465 () Bool)

(assert (=> b!1374204 m!1257465))

(assert (=> b!1374204 m!1257465))

(declare-fun m!1257467 () Bool)

(assert (=> b!1374204 m!1257467))

(declare-fun m!1257469 () Bool)

(assert (=> start!116500 m!1257469))

(declare-fun m!1257471 () Bool)

(assert (=> b!1374207 m!1257471))

(check-sat (not b!1374204) (not b!1374208) (not b!1374207) (not b!1374206) (not start!116500))
