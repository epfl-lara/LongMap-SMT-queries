; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116514 () Bool)

(assert start!116514)

(declare-fun b!1374309 () Bool)

(declare-fun res!917496 () Bool)

(declare-fun e!778556 () Bool)

(assert (=> b!1374309 (=> (not res!917496) (not e!778556))))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374309 (= res!917496 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1374310 () Bool)

(declare-fun e!778557 () Bool)

(assert (=> b!1374310 (= e!778557 true)))

(declare-fun lt!603409 () (_ BitVec 32))

(declare-datatypes ((array!93214 0))(
  ( (array!93215 (arr!45013 (Array (_ BitVec 32) (_ BitVec 64))) (size!45563 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93214)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93214 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374310 (= lt!603409 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603411 () (_ BitVec 32))

(declare-fun lt!603412 () array!93214)

(assert (=> b!1374310 (= lt!603411 (arrayCountValidKeys!0 lt!603412 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374311 () Bool)

(assert (=> b!1374311 (= e!778556 (not e!778557))))

(declare-fun res!917497 () Bool)

(assert (=> b!1374311 (=> res!917497 e!778557)))

(assert (=> b!1374311 (= res!917497 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) i!1457)))))

(assert (=> b!1374311 (= (arrayCountValidKeys!0 lt!603412 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(assert (=> b!1374311 (= lt!603412 (array!93215 (store (arr!45013 a!4142) i!1457 k!2959) (size!45563 a!4142)))))

(declare-datatypes ((Unit!45427 0))(
  ( (Unit!45428) )
))
(declare-fun lt!603410 () Unit!45427)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93214 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45427)

(assert (=> b!1374311 (= lt!603410 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1374312 () Bool)

(declare-fun res!917495 () Bool)

(assert (=> b!1374312 (=> (not res!917495) (not e!778556))))

(assert (=> b!1374312 (= res!917495 (bvslt (size!45563 a!4142) #b01111111111111111111111111111111))))

(declare-fun res!917493 () Bool)

(assert (=> start!116514 (=> (not res!917493) (not e!778556))))

(assert (=> start!116514 (= res!917493 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45563 a!4142))))))

(assert (=> start!116514 e!778556))

(assert (=> start!116514 true))

(declare-fun array_inv!34041 (array!93214) Bool)

(assert (=> start!116514 (array_inv!34041 a!4142)))

(declare-fun b!1374313 () Bool)

(declare-fun res!917494 () Bool)

(assert (=> b!1374313 (=> (not res!917494) (not e!778556))))

(assert (=> b!1374313 (= res!917494 (validKeyInArray!0 (select (arr!45013 a!4142) i!1457)))))

(assert (= (and start!116514 res!917493) b!1374313))

(assert (= (and b!1374313 res!917494) b!1374309))

(assert (= (and b!1374309 res!917496) b!1374312))

(assert (= (and b!1374312 res!917495) b!1374311))

(assert (= (and b!1374311 (not res!917497)) b!1374310))

(declare-fun m!1257593 () Bool)

(assert (=> b!1374310 m!1257593))

(declare-fun m!1257595 () Bool)

(assert (=> b!1374310 m!1257595))

(declare-fun m!1257597 () Bool)

(assert (=> b!1374311 m!1257597))

(declare-fun m!1257599 () Bool)

(assert (=> b!1374311 m!1257599))

(declare-fun m!1257601 () Bool)

(assert (=> b!1374311 m!1257601))

(declare-fun m!1257603 () Bool)

(assert (=> b!1374311 m!1257603))

(declare-fun m!1257605 () Bool)

(assert (=> b!1374309 m!1257605))

(declare-fun m!1257607 () Bool)

(assert (=> start!116514 m!1257607))

(declare-fun m!1257609 () Bool)

(assert (=> b!1374313 m!1257609))

(assert (=> b!1374313 m!1257609))

(declare-fun m!1257611 () Bool)

(assert (=> b!1374313 m!1257611))

(push 1)

(assert (not b!1374313))

(assert (not start!116514))

(assert (not b!1374310))

(assert (not b!1374311))

(assert (not b!1374309))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

