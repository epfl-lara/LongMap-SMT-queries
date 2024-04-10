; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116588 () Bool)

(assert start!116588)

(declare-fun b!1374740 () Bool)

(declare-fun res!917867 () Bool)

(declare-fun e!778798 () Bool)

(assert (=> b!1374740 (=> (not res!917867) (not e!778798))))

(declare-datatypes ((array!93273 0))(
  ( (array!93274 (arr!45041 (Array (_ BitVec 32) (_ BitVec 64))) (size!45591 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93273)

(assert (=> b!1374740 (= res!917867 (bvslt (size!45591 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1374739 () Bool)

(declare-fun res!917868 () Bool)

(assert (=> b!1374739 (=> (not res!917868) (not e!778798))))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374739 (= res!917868 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1374738 () Bool)

(declare-fun res!917869 () Bool)

(assert (=> b!1374738 (=> (not res!917869) (not e!778798))))

(declare-fun i!1457 () (_ BitVec 32))

(assert (=> b!1374738 (= res!917869 (validKeyInArray!0 (select (arr!45041 a!4142) i!1457)))))

(declare-fun b!1374741 () Bool)

(assert (=> b!1374741 (= e!778798 (not true))))

(declare-fun arrayCountValidKeys!0 (array!93273 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374741 (= (arrayCountValidKeys!0 (array!93274 (store (arr!45041 a!4142) i!1457 k!2959) (size!45591 a!4142)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!45471 0))(
  ( (Unit!45472) )
))
(declare-fun lt!603879 () Unit!45471)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93273 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45471)

(assert (=> b!1374741 (= lt!603879 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun res!917866 () Bool)

(assert (=> start!116588 (=> (not res!917866) (not e!778798))))

(assert (=> start!116588 (= res!917866 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45591 a!4142))))))

(assert (=> start!116588 e!778798))

(assert (=> start!116588 true))

(declare-fun array_inv!34069 (array!93273) Bool)

(assert (=> start!116588 (array_inv!34069 a!4142)))

(assert (= (and start!116588 res!917866) b!1374738))

(assert (= (and b!1374738 res!917869) b!1374739))

(assert (= (and b!1374739 res!917868) b!1374740))

(assert (= (and b!1374740 res!917867) b!1374741))

(declare-fun m!1258279 () Bool)

(assert (=> b!1374739 m!1258279))

(declare-fun m!1258281 () Bool)

(assert (=> b!1374738 m!1258281))

(assert (=> b!1374738 m!1258281))

(declare-fun m!1258283 () Bool)

(assert (=> b!1374738 m!1258283))

(declare-fun m!1258285 () Bool)

(assert (=> b!1374741 m!1258285))

(declare-fun m!1258287 () Bool)

(assert (=> b!1374741 m!1258287))

(declare-fun m!1258289 () Bool)

(assert (=> b!1374741 m!1258289))

(declare-fun m!1258291 () Bool)

(assert (=> b!1374741 m!1258291))

(declare-fun m!1258293 () Bool)

(assert (=> start!116588 m!1258293))

(push 1)

(assert (not start!116588))

(assert (not b!1374739))

(assert (not b!1374738))

(assert (not b!1374741))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

