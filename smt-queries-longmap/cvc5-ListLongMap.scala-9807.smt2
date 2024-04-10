; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116492 () Bool)

(assert start!116492)

(declare-fun res!917328 () Bool)

(declare-fun e!778459 () Bool)

(assert (=> start!116492 (=> (not res!917328) (not e!778459))))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((array!93192 0))(
  ( (array!93193 (arr!45002 (Array (_ BitVec 32) (_ BitVec 64))) (size!45552 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93192)

(assert (=> start!116492 (= res!917328 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45552 a!4142))))))

(assert (=> start!116492 e!778459))

(assert (=> start!116492 true))

(declare-fun array_inv!34030 (array!93192) Bool)

(assert (=> start!116492 (array_inv!34030 a!4142)))

(declare-fun b!1374144 () Bool)

(declare-fun res!917329 () Bool)

(assert (=> b!1374144 (=> (not res!917329) (not e!778459))))

(assert (=> b!1374144 (= res!917329 (bvslt (size!45552 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1374145 () Bool)

(declare-fun e!778457 () Bool)

(assert (=> b!1374145 (= e!778459 (not e!778457))))

(declare-fun res!917330 () Bool)

(assert (=> b!1374145 (=> res!917330 e!778457)))

(assert (=> b!1374145 (= res!917330 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) i!1457)))))

(declare-fun lt!603279 () array!93192)

(declare-fun arrayCountValidKeys!0 (array!93192 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374145 (= (arrayCountValidKeys!0 lt!603279 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(declare-fun k!2959 () (_ BitVec 64))

(assert (=> b!1374145 (= lt!603279 (array!93193 (store (arr!45002 a!4142) i!1457 k!2959) (size!45552 a!4142)))))

(declare-datatypes ((Unit!45405 0))(
  ( (Unit!45406) )
))
(declare-fun lt!603277 () Unit!45405)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93192 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45405)

(assert (=> b!1374145 (= lt!603277 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1374146 () Bool)

(assert (=> b!1374146 (= e!778457 true)))

(declare-fun lt!603280 () (_ BitVec 32))

(assert (=> b!1374146 (= lt!603280 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603278 () (_ BitVec 32))

(assert (=> b!1374146 (= lt!603278 (arrayCountValidKeys!0 lt!603279 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374147 () Bool)

(declare-fun res!917331 () Bool)

(assert (=> b!1374147 (=> (not res!917331) (not e!778459))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374147 (= res!917331 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1374148 () Bool)

(declare-fun res!917332 () Bool)

(assert (=> b!1374148 (=> (not res!917332) (not e!778459))))

(assert (=> b!1374148 (= res!917332 (validKeyInArray!0 (select (arr!45002 a!4142) i!1457)))))

(assert (= (and start!116492 res!917328) b!1374148))

(assert (= (and b!1374148 res!917332) b!1374147))

(assert (= (and b!1374147 res!917331) b!1374144))

(assert (= (and b!1374144 res!917329) b!1374145))

(assert (= (and b!1374145 (not res!917330)) b!1374146))

(declare-fun m!1257373 () Bool)

(assert (=> b!1374146 m!1257373))

(declare-fun m!1257375 () Bool)

(assert (=> b!1374146 m!1257375))

(declare-fun m!1257377 () Bool)

(assert (=> b!1374145 m!1257377))

(declare-fun m!1257379 () Bool)

(assert (=> b!1374145 m!1257379))

(declare-fun m!1257381 () Bool)

(assert (=> b!1374145 m!1257381))

(declare-fun m!1257383 () Bool)

(assert (=> b!1374145 m!1257383))

(declare-fun m!1257385 () Bool)

(assert (=> b!1374147 m!1257385))

(declare-fun m!1257387 () Bool)

(assert (=> b!1374148 m!1257387))

(assert (=> b!1374148 m!1257387))

(declare-fun m!1257389 () Bool)

(assert (=> b!1374148 m!1257389))

(declare-fun m!1257391 () Bool)

(assert (=> start!116492 m!1257391))

(push 1)

(assert (not b!1374145))

(assert (not b!1374146))

(assert (not b!1374147))

(assert (not start!116492))

(assert (not b!1374148))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

