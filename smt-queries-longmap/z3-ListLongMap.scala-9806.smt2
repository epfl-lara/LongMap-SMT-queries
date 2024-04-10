; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116488 () Bool)

(assert start!116488)

(declare-fun b!1374114 () Bool)

(declare-fun res!917299 () Bool)

(declare-fun e!778440 () Bool)

(assert (=> b!1374114 (=> (not res!917299) (not e!778440))))

(declare-datatypes ((array!93188 0))(
  ( (array!93189 (arr!45000 (Array (_ BitVec 32) (_ BitVec 64))) (size!45550 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93188)

(assert (=> b!1374114 (= res!917299 (bvslt (size!45550 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1374115 () Bool)

(declare-fun e!778441 () Bool)

(assert (=> b!1374115 (= e!778440 (not e!778441))))

(declare-fun res!917298 () Bool)

(assert (=> b!1374115 (=> res!917298 e!778441)))

(declare-fun i!1457 () (_ BitVec 32))

(assert (=> b!1374115 (= res!917298 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) i!1457)))))

(declare-fun lt!603253 () array!93188)

(declare-fun arrayCountValidKeys!0 (array!93188 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374115 (= (arrayCountValidKeys!0 lt!603253 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(declare-fun k0!2959 () (_ BitVec 64))

(assert (=> b!1374115 (= lt!603253 (array!93189 (store (arr!45000 a!4142) i!1457 k0!2959) (size!45550 a!4142)))))

(declare-datatypes ((Unit!45401 0))(
  ( (Unit!45402) )
))
(declare-fun lt!603254 () Unit!45401)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93188 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45401)

(assert (=> b!1374115 (= lt!603254 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k0!2959 i!1457))))

(declare-fun b!1374116 () Bool)

(declare-fun res!917300 () Bool)

(assert (=> b!1374116 (=> (not res!917300) (not e!778440))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374116 (= res!917300 (validKeyInArray!0 (select (arr!45000 a!4142) i!1457)))))

(declare-fun b!1374118 () Bool)

(assert (=> b!1374118 (= e!778441 true)))

(declare-fun lt!603256 () (_ BitVec 32))

(assert (=> b!1374118 (= lt!603256 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603255 () (_ BitVec 32))

(assert (=> b!1374118 (= lt!603255 (arrayCountValidKeys!0 lt!603253 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun res!917302 () Bool)

(assert (=> start!116488 (=> (not res!917302) (not e!778440))))

(assert (=> start!116488 (= res!917302 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45550 a!4142))))))

(assert (=> start!116488 e!778440))

(assert (=> start!116488 true))

(declare-fun array_inv!34028 (array!93188) Bool)

(assert (=> start!116488 (array_inv!34028 a!4142)))

(declare-fun b!1374117 () Bool)

(declare-fun res!917301 () Bool)

(assert (=> b!1374117 (=> (not res!917301) (not e!778440))))

(assert (=> b!1374117 (= res!917301 (not (validKeyInArray!0 k0!2959)))))

(assert (= (and start!116488 res!917302) b!1374116))

(assert (= (and b!1374116 res!917300) b!1374117))

(assert (= (and b!1374117 res!917301) b!1374114))

(assert (= (and b!1374114 res!917299) b!1374115))

(assert (= (and b!1374115 (not res!917298)) b!1374118))

(declare-fun m!1257333 () Bool)

(assert (=> b!1374117 m!1257333))

(declare-fun m!1257335 () Bool)

(assert (=> b!1374118 m!1257335))

(declare-fun m!1257337 () Bool)

(assert (=> b!1374118 m!1257337))

(declare-fun m!1257339 () Bool)

(assert (=> start!116488 m!1257339))

(declare-fun m!1257341 () Bool)

(assert (=> b!1374115 m!1257341))

(declare-fun m!1257343 () Bool)

(assert (=> b!1374115 m!1257343))

(declare-fun m!1257345 () Bool)

(assert (=> b!1374115 m!1257345))

(declare-fun m!1257347 () Bool)

(assert (=> b!1374115 m!1257347))

(declare-fun m!1257349 () Bool)

(assert (=> b!1374116 m!1257349))

(assert (=> b!1374116 m!1257349))

(declare-fun m!1257351 () Bool)

(assert (=> b!1374116 m!1257351))

(check-sat (not b!1374116) (not b!1374117) (not start!116488) (not b!1374118) (not b!1374115))
