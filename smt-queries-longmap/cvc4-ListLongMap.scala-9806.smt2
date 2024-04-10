; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116490 () Bool)

(assert start!116490)

(declare-fun res!917314 () Bool)

(declare-fun e!778449 () Bool)

(assert (=> start!116490 (=> (not res!917314) (not e!778449))))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((array!93190 0))(
  ( (array!93191 (arr!45001 (Array (_ BitVec 32) (_ BitVec 64))) (size!45551 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93190)

(assert (=> start!116490 (= res!917314 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45551 a!4142))))))

(assert (=> start!116490 e!778449))

(assert (=> start!116490 true))

(declare-fun array_inv!34029 (array!93190) Bool)

(assert (=> start!116490 (array_inv!34029 a!4142)))

(declare-fun b!1374129 () Bool)

(declare-fun res!917316 () Bool)

(assert (=> b!1374129 (=> (not res!917316) (not e!778449))))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374129 (= res!917316 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1374130 () Bool)

(declare-fun e!778450 () Bool)

(assert (=> b!1374130 (= e!778449 (not e!778450))))

(declare-fun res!917317 () Bool)

(assert (=> b!1374130 (=> res!917317 e!778450)))

(assert (=> b!1374130 (= res!917317 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) i!1457)))))

(declare-fun lt!603267 () array!93190)

(declare-fun arrayCountValidKeys!0 (array!93190 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374130 (= (arrayCountValidKeys!0 lt!603267 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(assert (=> b!1374130 (= lt!603267 (array!93191 (store (arr!45001 a!4142) i!1457 k!2959) (size!45551 a!4142)))))

(declare-datatypes ((Unit!45403 0))(
  ( (Unit!45404) )
))
(declare-fun lt!603266 () Unit!45403)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93190 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45403)

(assert (=> b!1374130 (= lt!603266 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1374131 () Bool)

(assert (=> b!1374131 (= e!778450 true)))

(declare-fun lt!603268 () (_ BitVec 32))

(assert (=> b!1374131 (= lt!603268 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603265 () (_ BitVec 32))

(assert (=> b!1374131 (= lt!603265 (arrayCountValidKeys!0 lt!603267 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374132 () Bool)

(declare-fun res!917315 () Bool)

(assert (=> b!1374132 (=> (not res!917315) (not e!778449))))

(assert (=> b!1374132 (= res!917315 (bvslt (size!45551 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1374133 () Bool)

(declare-fun res!917313 () Bool)

(assert (=> b!1374133 (=> (not res!917313) (not e!778449))))

(assert (=> b!1374133 (= res!917313 (validKeyInArray!0 (select (arr!45001 a!4142) i!1457)))))

(assert (= (and start!116490 res!917314) b!1374133))

(assert (= (and b!1374133 res!917313) b!1374129))

(assert (= (and b!1374129 res!917316) b!1374132))

(assert (= (and b!1374132 res!917315) b!1374130))

(assert (= (and b!1374130 (not res!917317)) b!1374131))

(declare-fun m!1257353 () Bool)

(assert (=> b!1374130 m!1257353))

(declare-fun m!1257355 () Bool)

(assert (=> b!1374130 m!1257355))

(declare-fun m!1257357 () Bool)

(assert (=> b!1374130 m!1257357))

(declare-fun m!1257359 () Bool)

(assert (=> b!1374130 m!1257359))

(declare-fun m!1257361 () Bool)

(assert (=> b!1374129 m!1257361))

(declare-fun m!1257363 () Bool)

(assert (=> b!1374131 m!1257363))

(declare-fun m!1257365 () Bool)

(assert (=> b!1374131 m!1257365))

(declare-fun m!1257367 () Bool)

(assert (=> b!1374133 m!1257367))

(assert (=> b!1374133 m!1257367))

(declare-fun m!1257369 () Bool)

(assert (=> b!1374133 m!1257369))

(declare-fun m!1257371 () Bool)

(assert (=> start!116490 m!1257371))

(push 1)

(assert (not b!1374130))

(assert (not b!1374129))

(assert (not start!116490))

(assert (not b!1374131))

(assert (not b!1374133))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

