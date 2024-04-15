; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116510 () Bool)

(assert start!116510)

(declare-fun res!917512 () Bool)

(declare-fun e!778551 () Bool)

(assert (=> start!116510 (=> (not res!917512) (not e!778551))))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((array!93169 0))(
  ( (array!93170 (arr!44991 (Array (_ BitVec 32) (_ BitVec 64))) (size!45543 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93169)

(assert (=> start!116510 (= res!917512 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45543 a!4142))))))

(assert (=> start!116510 e!778551))

(assert (=> start!116510 true))

(declare-fun array_inv!34224 (array!93169) Bool)

(assert (=> start!116510 (array_inv!34224 a!4142)))

(declare-fun b!1374282 () Bool)

(declare-fun res!917509 () Bool)

(assert (=> b!1374282 (=> (not res!917509) (not e!778551))))

(assert (=> b!1374282 (= res!917509 (bvslt (size!45543 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1374283 () Bool)

(declare-fun e!778549 () Bool)

(assert (=> b!1374283 (= e!778551 (not e!778549))))

(declare-fun res!917511 () Bool)

(assert (=> b!1374283 (=> res!917511 e!778549)))

(assert (=> b!1374283 (= res!917511 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) i!1457)))))

(declare-fun lt!603260 () array!93169)

(declare-fun arrayCountValidKeys!0 (array!93169 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374283 (= (arrayCountValidKeys!0 lt!603260 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(declare-fun k!2959 () (_ BitVec 64))

(assert (=> b!1374283 (= lt!603260 (array!93170 (store (arr!44991 a!4142) i!1457 k!2959) (size!45543 a!4142)))))

(declare-datatypes ((Unit!45274 0))(
  ( (Unit!45275) )
))
(declare-fun lt!603259 () Unit!45274)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93169 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45274)

(assert (=> b!1374283 (= lt!603259 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1374284 () Bool)

(declare-fun res!917510 () Bool)

(assert (=> b!1374284 (=> (not res!917510) (not e!778551))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374284 (= res!917510 (validKeyInArray!0 (select (arr!44991 a!4142) i!1457)))))

(declare-fun b!1374285 () Bool)

(declare-fun res!917513 () Bool)

(assert (=> b!1374285 (=> (not res!917513) (not e!778551))))

(assert (=> b!1374285 (= res!917513 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1374286 () Bool)

(assert (=> b!1374286 (= e!778549 true)))

(declare-fun lt!603261 () (_ BitVec 32))

(assert (=> b!1374286 (= lt!603261 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603258 () (_ BitVec 32))

(assert (=> b!1374286 (= lt!603258 (arrayCountValidKeys!0 lt!603260 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (= (and start!116510 res!917512) b!1374284))

(assert (= (and b!1374284 res!917510) b!1374285))

(assert (= (and b!1374285 res!917513) b!1374282))

(assert (= (and b!1374282 res!917509) b!1374283))

(assert (= (and b!1374283 (not res!917511)) b!1374286))

(declare-fun m!1257127 () Bool)

(assert (=> b!1374286 m!1257127))

(declare-fun m!1257129 () Bool)

(assert (=> b!1374286 m!1257129))

(declare-fun m!1257131 () Bool)

(assert (=> b!1374283 m!1257131))

(declare-fun m!1257133 () Bool)

(assert (=> b!1374283 m!1257133))

(declare-fun m!1257135 () Bool)

(assert (=> b!1374283 m!1257135))

(declare-fun m!1257137 () Bool)

(assert (=> b!1374283 m!1257137))

(declare-fun m!1257139 () Bool)

(assert (=> start!116510 m!1257139))

(declare-fun m!1257141 () Bool)

(assert (=> b!1374284 m!1257141))

(assert (=> b!1374284 m!1257141))

(declare-fun m!1257143 () Bool)

(assert (=> b!1374284 m!1257143))

(declare-fun m!1257145 () Bool)

(assert (=> b!1374285 m!1257145))

(push 1)

(assert (not b!1374285))

(assert (not b!1374283))

(assert (not start!116510))

(assert (not b!1374284))

(assert (not b!1374286))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

