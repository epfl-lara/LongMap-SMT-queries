; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116508 () Bool)

(assert start!116508)

(declare-fun b!1374264 () Bool)

(declare-fun e!778529 () Bool)

(assert (=> b!1374264 (= e!778529 true)))

(declare-fun lt!603376 () (_ BitVec 32))

(declare-datatypes ((array!93208 0))(
  ( (array!93209 (arr!45010 (Array (_ BitVec 32) (_ BitVec 64))) (size!45560 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93208)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93208 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374264 (= lt!603376 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603374 () (_ BitVec 32))

(declare-fun lt!603373 () array!93208)

(assert (=> b!1374264 (= lt!603374 (arrayCountValidKeys!0 lt!603373 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374265 () Bool)

(declare-fun e!778531 () Bool)

(assert (=> b!1374265 (= e!778531 (not e!778529))))

(declare-fun res!917452 () Bool)

(assert (=> b!1374265 (=> res!917452 e!778529)))

(assert (=> b!1374265 (= res!917452 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) i!1457)))))

(assert (=> b!1374265 (= (arrayCountValidKeys!0 lt!603373 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(declare-fun k!2959 () (_ BitVec 64))

(assert (=> b!1374265 (= lt!603373 (array!93209 (store (arr!45010 a!4142) i!1457 k!2959) (size!45560 a!4142)))))

(declare-datatypes ((Unit!45421 0))(
  ( (Unit!45422) )
))
(declare-fun lt!603375 () Unit!45421)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93208 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45421)

(assert (=> b!1374265 (= lt!603375 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1374266 () Bool)

(declare-fun res!917448 () Bool)

(assert (=> b!1374266 (=> (not res!917448) (not e!778531))))

(assert (=> b!1374266 (= res!917448 (bvslt (size!45560 a!4142) #b01111111111111111111111111111111))))

(declare-fun res!917451 () Bool)

(assert (=> start!116508 (=> (not res!917451) (not e!778531))))

(assert (=> start!116508 (= res!917451 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45560 a!4142))))))

(assert (=> start!116508 e!778531))

(assert (=> start!116508 true))

(declare-fun array_inv!34038 (array!93208) Bool)

(assert (=> start!116508 (array_inv!34038 a!4142)))

(declare-fun b!1374267 () Bool)

(declare-fun res!917450 () Bool)

(assert (=> b!1374267 (=> (not res!917450) (not e!778531))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374267 (= res!917450 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1374268 () Bool)

(declare-fun res!917449 () Bool)

(assert (=> b!1374268 (=> (not res!917449) (not e!778531))))

(assert (=> b!1374268 (= res!917449 (validKeyInArray!0 (select (arr!45010 a!4142) i!1457)))))

(assert (= (and start!116508 res!917451) b!1374268))

(assert (= (and b!1374268 res!917449) b!1374267))

(assert (= (and b!1374267 res!917450) b!1374266))

(assert (= (and b!1374266 res!917448) b!1374265))

(assert (= (and b!1374265 (not res!917452)) b!1374264))

(declare-fun m!1257533 () Bool)

(assert (=> b!1374268 m!1257533))

(assert (=> b!1374268 m!1257533))

(declare-fun m!1257535 () Bool)

(assert (=> b!1374268 m!1257535))

(declare-fun m!1257537 () Bool)

(assert (=> b!1374264 m!1257537))

(declare-fun m!1257539 () Bool)

(assert (=> b!1374264 m!1257539))

(declare-fun m!1257541 () Bool)

(assert (=> b!1374265 m!1257541))

(declare-fun m!1257543 () Bool)

(assert (=> b!1374265 m!1257543))

(declare-fun m!1257545 () Bool)

(assert (=> b!1374265 m!1257545))

(declare-fun m!1257547 () Bool)

(assert (=> b!1374265 m!1257547))

(declare-fun m!1257549 () Bool)

(assert (=> start!116508 m!1257549))

(declare-fun m!1257551 () Bool)

(assert (=> b!1374267 m!1257551))

(push 1)

(assert (not b!1374264))

(assert (not b!1374267))

(assert (not b!1374268))

(assert (not start!116508))

(assert (not b!1374265))

(check-sat)

(pop 1)

