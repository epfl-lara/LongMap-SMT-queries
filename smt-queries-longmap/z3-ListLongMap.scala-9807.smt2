; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116494 () Bool)

(assert start!116494)

(declare-fun res!917347 () Bool)

(declare-fun e!778467 () Bool)

(assert (=> start!116494 (=> (not res!917347) (not e!778467))))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((array!93194 0))(
  ( (array!93195 (arr!45003 (Array (_ BitVec 32) (_ BitVec 64))) (size!45553 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93194)

(assert (=> start!116494 (= res!917347 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45553 a!4142))))))

(assert (=> start!116494 e!778467))

(assert (=> start!116494 true))

(declare-fun array_inv!34031 (array!93194) Bool)

(assert (=> start!116494 (array_inv!34031 a!4142)))

(declare-fun b!1374159 () Bool)

(declare-fun res!917346 () Bool)

(assert (=> b!1374159 (=> (not res!917346) (not e!778467))))

(assert (=> b!1374159 (= res!917346 (bvslt (size!45553 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1374160 () Bool)

(declare-fun e!778466 () Bool)

(assert (=> b!1374160 (= e!778466 true)))

(declare-fun lt!603292 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93194 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374160 (= lt!603292 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603289 () (_ BitVec 32))

(declare-fun lt!603291 () array!93194)

(assert (=> b!1374160 (= lt!603289 (arrayCountValidKeys!0 lt!603291 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374161 () Bool)

(declare-fun res!917344 () Bool)

(assert (=> b!1374161 (=> (not res!917344) (not e!778467))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374161 (= res!917344 (validKeyInArray!0 (select (arr!45003 a!4142) i!1457)))))

(declare-fun b!1374162 () Bool)

(declare-fun res!917345 () Bool)

(assert (=> b!1374162 (=> (not res!917345) (not e!778467))))

(declare-fun k0!2959 () (_ BitVec 64))

(assert (=> b!1374162 (= res!917345 (not (validKeyInArray!0 k0!2959)))))

(declare-fun b!1374163 () Bool)

(assert (=> b!1374163 (= e!778467 (not e!778466))))

(declare-fun res!917343 () Bool)

(assert (=> b!1374163 (=> res!917343 e!778466)))

(assert (=> b!1374163 (= res!917343 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) i!1457)))))

(assert (=> b!1374163 (= (arrayCountValidKeys!0 lt!603291 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(assert (=> b!1374163 (= lt!603291 (array!93195 (store (arr!45003 a!4142) i!1457 k0!2959) (size!45553 a!4142)))))

(declare-datatypes ((Unit!45407 0))(
  ( (Unit!45408) )
))
(declare-fun lt!603290 () Unit!45407)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93194 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45407)

(assert (=> b!1374163 (= lt!603290 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k0!2959 i!1457))))

(assert (= (and start!116494 res!917347) b!1374161))

(assert (= (and b!1374161 res!917344) b!1374162))

(assert (= (and b!1374162 res!917345) b!1374159))

(assert (= (and b!1374159 res!917346) b!1374163))

(assert (= (and b!1374163 (not res!917343)) b!1374160))

(declare-fun m!1257393 () Bool)

(assert (=> b!1374163 m!1257393))

(declare-fun m!1257395 () Bool)

(assert (=> b!1374163 m!1257395))

(declare-fun m!1257397 () Bool)

(assert (=> b!1374163 m!1257397))

(declare-fun m!1257399 () Bool)

(assert (=> b!1374163 m!1257399))

(declare-fun m!1257401 () Bool)

(assert (=> b!1374162 m!1257401))

(declare-fun m!1257403 () Bool)

(assert (=> start!116494 m!1257403))

(declare-fun m!1257405 () Bool)

(assert (=> b!1374161 m!1257405))

(assert (=> b!1374161 m!1257405))

(declare-fun m!1257407 () Bool)

(assert (=> b!1374161 m!1257407))

(declare-fun m!1257409 () Bool)

(assert (=> b!1374160 m!1257409))

(declare-fun m!1257411 () Bool)

(assert (=> b!1374160 m!1257411))

(check-sat (not b!1374160) (not b!1374163) (not b!1374161) (not b!1374162) (not start!116494))
