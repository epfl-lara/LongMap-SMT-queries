; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116694 () Bool)

(assert start!116694)

(declare-fun b!1375361 () Bool)

(declare-fun res!918428 () Bool)

(declare-fun e!779135 () Bool)

(assert (=> b!1375361 (=> (not res!918428) (not e!779135))))

(declare-datatypes ((array!93363 0))(
  ( (array!93364 (arr!45085 (Array (_ BitVec 32) (_ BitVec 64))) (size!45635 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93363)

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375361 (= res!918428 (validKeyInArray!0 (select (arr!45085 a!4032) i!1445)))))

(declare-fun res!918425 () Bool)

(assert (=> start!116694 (=> (not res!918425) (not e!779135))))

(assert (=> start!116694 (= res!918425 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45635 a!4032))))))

(assert (=> start!116694 e!779135))

(assert (=> start!116694 true))

(declare-fun array_inv!34113 (array!93363) Bool)

(assert (=> start!116694 (array_inv!34113 a!4032)))

(declare-fun b!1375362 () Bool)

(declare-fun res!918430 () Bool)

(assert (=> b!1375362 (=> (not res!918430) (not e!779135))))

(declare-fun to!206 () (_ BitVec 32))

(assert (=> b!1375362 (= res!918430 (and (bvslt (size!45635 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45635 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1375363 () Bool)

(declare-fun e!779136 () Bool)

(assert (=> b!1375363 (= e!779135 e!779136)))

(declare-fun res!918427 () Bool)

(assert (=> b!1375363 (=> (not res!918427) (not e!779136))))

(declare-fun lt!604339 () (_ BitVec 32))

(declare-fun lt!604338 () (_ BitVec 32))

(assert (=> b!1375363 (= res!918427 (and (= lt!604338 lt!604339) (not (= to!206 (size!45635 a!4032)))))))

(declare-fun arrayCountValidKeys!0 (array!93363 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375363 (= lt!604339 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k!2947 () (_ BitVec 64))

(assert (=> b!1375363 (= lt!604338 (arrayCountValidKeys!0 (array!93364 (store (arr!45085 a!4032) i!1445 k!2947) (size!45635 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1375364 () Bool)

(assert (=> b!1375364 (= e!779136 (not true))))

(assert (=> b!1375364 (= (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (bvadd #b00000000000000000000000000000001 lt!604339))))

(declare-datatypes ((Unit!45541 0))(
  ( (Unit!45542) )
))
(declare-fun lt!604337 () Unit!45541)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93363 (_ BitVec 32) (_ BitVec 32)) Unit!45541)

(assert (=> b!1375364 (= lt!604337 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1375365 () Bool)

(declare-fun res!918426 () Bool)

(assert (=> b!1375365 (=> (not res!918426) (not e!779136))))

(assert (=> b!1375365 (= res!918426 (validKeyInArray!0 (select (arr!45085 a!4032) to!206)))))

(declare-fun b!1375366 () Bool)

(declare-fun res!918429 () Bool)

(assert (=> b!1375366 (=> (not res!918429) (not e!779135))))

(assert (=> b!1375366 (= res!918429 (not (validKeyInArray!0 k!2947)))))

(assert (= (and start!116694 res!918425) b!1375361))

(assert (= (and b!1375361 res!918428) b!1375366))

(assert (= (and b!1375366 res!918429) b!1375362))

(assert (= (and b!1375362 res!918430) b!1375363))

(assert (= (and b!1375363 res!918427) b!1375365))

(assert (= (and b!1375365 res!918426) b!1375364))

(declare-fun m!1259181 () Bool)

(assert (=> b!1375361 m!1259181))

(assert (=> b!1375361 m!1259181))

(declare-fun m!1259183 () Bool)

(assert (=> b!1375361 m!1259183))

(declare-fun m!1259185 () Bool)

(assert (=> b!1375365 m!1259185))

(assert (=> b!1375365 m!1259185))

(declare-fun m!1259187 () Bool)

(assert (=> b!1375365 m!1259187))

(declare-fun m!1259189 () Bool)

(assert (=> b!1375363 m!1259189))

(declare-fun m!1259191 () Bool)

(assert (=> b!1375363 m!1259191))

(declare-fun m!1259193 () Bool)

(assert (=> b!1375363 m!1259193))

(declare-fun m!1259195 () Bool)

(assert (=> start!116694 m!1259195))

(declare-fun m!1259197 () Bool)

(assert (=> b!1375364 m!1259197))

(declare-fun m!1259199 () Bool)

(assert (=> b!1375364 m!1259199))

(declare-fun m!1259201 () Bool)

(assert (=> b!1375366 m!1259201))

(push 1)

