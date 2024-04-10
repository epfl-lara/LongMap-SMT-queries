; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116502 () Bool)

(assert start!116502)

(declare-fun b!1374220 () Bool)

(declare-fun res!917404 () Bool)

(declare-fun e!778504 () Bool)

(assert (=> b!1374220 (=> (not res!917404) (not e!778504))))

(declare-datatypes ((array!93202 0))(
  ( (array!93203 (arr!45007 (Array (_ BitVec 32) (_ BitVec 64))) (size!45557 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93202)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374220 (= res!917404 (validKeyInArray!0 (select (arr!45007 a!4142) i!1457)))))

(declare-fun b!1374221 () Bool)

(declare-fun e!778503 () Bool)

(assert (=> b!1374221 (= e!778503 true)))

(declare-fun lt!603338 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93202 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374221 (= lt!603338 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603337 () (_ BitVec 32))

(declare-fun lt!603340 () array!93202)

(assert (=> b!1374221 (= lt!603337 (arrayCountValidKeys!0 lt!603340 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun res!917403 () Bool)

(assert (=> start!116502 (=> (not res!917403) (not e!778504))))

(assert (=> start!116502 (= res!917403 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45557 a!4142))))))

(assert (=> start!116502 e!778504))

(assert (=> start!116502 true))

(declare-fun array_inv!34035 (array!93202) Bool)

(assert (=> start!116502 (array_inv!34035 a!4142)))

(declare-fun b!1374219 () Bool)

(assert (=> b!1374219 (= e!778504 (not e!778503))))

(declare-fun res!917406 () Bool)

(assert (=> b!1374219 (=> res!917406 e!778503)))

(assert (=> b!1374219 (= res!917406 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) i!1457)))))

(assert (=> b!1374219 (= (arrayCountValidKeys!0 lt!603340 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(declare-fun k!2959 () (_ BitVec 64))

(assert (=> b!1374219 (= lt!603340 (array!93203 (store (arr!45007 a!4142) i!1457 k!2959) (size!45557 a!4142)))))

(declare-datatypes ((Unit!45415 0))(
  ( (Unit!45416) )
))
(declare-fun lt!603339 () Unit!45415)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93202 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45415)

(assert (=> b!1374219 (= lt!603339 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1374222 () Bool)

(declare-fun res!917407 () Bool)

(assert (=> b!1374222 (=> (not res!917407) (not e!778504))))

(assert (=> b!1374222 (= res!917407 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1374223 () Bool)

(declare-fun res!917405 () Bool)

(assert (=> b!1374223 (=> (not res!917405) (not e!778504))))

(assert (=> b!1374223 (= res!917405 (bvslt (size!45557 a!4142) #b01111111111111111111111111111111))))

(assert (= (and start!116502 res!917403) b!1374220))

(assert (= (and b!1374220 res!917404) b!1374222))

(assert (= (and b!1374222 res!917407) b!1374223))

(assert (= (and b!1374223 res!917405) b!1374219))

(assert (= (and b!1374219 (not res!917406)) b!1374221))

(declare-fun m!1257473 () Bool)

(assert (=> b!1374222 m!1257473))

(declare-fun m!1257475 () Bool)

(assert (=> b!1374220 m!1257475))

(assert (=> b!1374220 m!1257475))

(declare-fun m!1257477 () Bool)

(assert (=> b!1374220 m!1257477))

(declare-fun m!1257479 () Bool)

(assert (=> b!1374221 m!1257479))

(declare-fun m!1257481 () Bool)

(assert (=> b!1374221 m!1257481))

(declare-fun m!1257483 () Bool)

(assert (=> b!1374219 m!1257483))

(declare-fun m!1257485 () Bool)

(assert (=> b!1374219 m!1257485))

(declare-fun m!1257487 () Bool)

(assert (=> b!1374219 m!1257487))

(declare-fun m!1257489 () Bool)

(assert (=> b!1374219 m!1257489))

(declare-fun m!1257491 () Bool)

(assert (=> start!116502 m!1257491))

(push 1)

(assert (not b!1374222))

(assert (not b!1374219))

(assert (not b!1374220))

(assert (not b!1374221))

(assert (not start!116502))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

