; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116612 () Bool)

(assert start!116612)

(declare-fun b!1374882 () Bool)

(declare-fun res!918012 () Bool)

(declare-fun e!778870 () Bool)

(assert (=> b!1374882 (=> (not res!918012) (not e!778870))))

(declare-datatypes ((array!93297 0))(
  ( (array!93298 (arr!45053 (Array (_ BitVec 32) (_ BitVec 64))) (size!45603 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93297)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374882 (= res!918012 (validKeyInArray!0 (select (arr!45053 a!4142) i!1457)))))

(declare-fun b!1374883 () Bool)

(declare-fun res!918011 () Bool)

(assert (=> b!1374883 (=> (not res!918011) (not e!778870))))

(declare-fun k!2959 () (_ BitVec 64))

(assert (=> b!1374883 (= res!918011 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1374884 () Bool)

(declare-fun res!918013 () Bool)

(assert (=> b!1374884 (=> (not res!918013) (not e!778870))))

(assert (=> b!1374884 (= res!918013 (bvslt (size!45603 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1374885 () Bool)

(assert (=> b!1374885 (= e!778870 (not (and (bvsge (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 i!1457) i!1457))))))

(declare-fun arrayCountValidKeys!0 (array!93297 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374885 (= (arrayCountValidKeys!0 (array!93298 (store (arr!45053 a!4142) i!1457 k!2959) (size!45603 a!4142)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!45495 0))(
  ( (Unit!45496) )
))
(declare-fun lt!603915 () Unit!45495)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93297 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45495)

(assert (=> b!1374885 (= lt!603915 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun res!918010 () Bool)

(assert (=> start!116612 (=> (not res!918010) (not e!778870))))

(assert (=> start!116612 (= res!918010 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45603 a!4142))))))

(assert (=> start!116612 e!778870))

(assert (=> start!116612 true))

(declare-fun array_inv!34081 (array!93297) Bool)

(assert (=> start!116612 (array_inv!34081 a!4142)))

(assert (= (and start!116612 res!918010) b!1374882))

(assert (= (and b!1374882 res!918012) b!1374883))

(assert (= (and b!1374883 res!918011) b!1374884))

(assert (= (and b!1374884 res!918013) b!1374885))

(declare-fun m!1258471 () Bool)

(assert (=> b!1374882 m!1258471))

(assert (=> b!1374882 m!1258471))

(declare-fun m!1258473 () Bool)

(assert (=> b!1374882 m!1258473))

(declare-fun m!1258475 () Bool)

(assert (=> b!1374883 m!1258475))

(declare-fun m!1258477 () Bool)

(assert (=> b!1374885 m!1258477))

(declare-fun m!1258479 () Bool)

(assert (=> b!1374885 m!1258479))

(declare-fun m!1258481 () Bool)

(assert (=> b!1374885 m!1258481))

(declare-fun m!1258483 () Bool)

(assert (=> b!1374885 m!1258483))

(declare-fun m!1258485 () Bool)

(assert (=> start!116612 m!1258485))

(push 1)

(assert (not b!1374885))

(assert (not b!1374883))

(assert (not start!116612))

(assert (not b!1374882))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

