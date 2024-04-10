; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116706 () Bool)

(assert start!116706)

(declare-fun b!1375451 () Bool)

(declare-fun res!918520 () Bool)

(declare-fun e!779180 () Bool)

(assert (=> b!1375451 (=> (not res!918520) (not e!779180))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93375 0))(
  ( (array!93376 (arr!45091 (Array (_ BitVec 32) (_ BitVec 64))) (size!45641 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93375)

(assert (=> b!1375451 (= res!918520 (and (bvslt (size!45641 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45641 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1375452 () Bool)

(declare-fun res!918516 () Bool)

(declare-fun e!779181 () Bool)

(assert (=> b!1375452 (=> (not res!918516) (not e!779181))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375452 (= res!918516 (not (validKeyInArray!0 (select (arr!45091 a!4032) to!206))))))

(declare-fun b!1375453 () Bool)

(assert (=> b!1375453 (= e!779181 (not true))))

(declare-fun lt!604382 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93375 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375453 (= (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) lt!604382)))

(declare-datatypes ((Unit!45547 0))(
  ( (Unit!45548) )
))
(declare-fun lt!604383 () Unit!45547)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93375 (_ BitVec 32) (_ BitVec 32)) Unit!45547)

(assert (=> b!1375453 (= lt!604383 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun res!918517 () Bool)

(assert (=> start!116706 (=> (not res!918517) (not e!779180))))

(assert (=> start!116706 (= res!918517 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45641 a!4032))))))

(assert (=> start!116706 e!779180))

(assert (=> start!116706 true))

(declare-fun array_inv!34119 (array!93375) Bool)

(assert (=> start!116706 (array_inv!34119 a!4032)))

(declare-fun b!1375454 () Bool)

(declare-fun res!918519 () Bool)

(assert (=> b!1375454 (=> (not res!918519) (not e!779180))))

(assert (=> b!1375454 (= res!918519 (validKeyInArray!0 (select (arr!45091 a!4032) i!1445)))))

(declare-fun b!1375455 () Bool)

(assert (=> b!1375455 (= e!779180 e!779181)))

(declare-fun res!918515 () Bool)

(assert (=> b!1375455 (=> (not res!918515) (not e!779181))))

(declare-fun lt!604384 () (_ BitVec 32))

(assert (=> b!1375455 (= res!918515 (and (= lt!604384 lt!604382) (not (= to!206 (size!45641 a!4032)))))))

(assert (=> b!1375455 (= lt!604382 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k!2947 () (_ BitVec 64))

(assert (=> b!1375455 (= lt!604384 (arrayCountValidKeys!0 (array!93376 (store (arr!45091 a!4032) i!1445 k!2947) (size!45641 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1375456 () Bool)

(declare-fun res!918518 () Bool)

(assert (=> b!1375456 (=> (not res!918518) (not e!779180))))

(assert (=> b!1375456 (= res!918518 (not (validKeyInArray!0 k!2947)))))

(assert (= (and start!116706 res!918517) b!1375454))

(assert (= (and b!1375454 res!918519) b!1375456))

(assert (= (and b!1375456 res!918518) b!1375451))

(assert (= (and b!1375451 res!918520) b!1375455))

(assert (= (and b!1375455 res!918515) b!1375452))

(assert (= (and b!1375452 res!918516) b!1375453))

(declare-fun m!1259289 () Bool)

(assert (=> b!1375455 m!1259289))

(declare-fun m!1259291 () Bool)

(assert (=> b!1375455 m!1259291))

(declare-fun m!1259293 () Bool)

(assert (=> b!1375455 m!1259293))

(declare-fun m!1259295 () Bool)

(assert (=> b!1375453 m!1259295))

(declare-fun m!1259297 () Bool)

(assert (=> b!1375453 m!1259297))

(declare-fun m!1259299 () Bool)

(assert (=> b!1375452 m!1259299))

(assert (=> b!1375452 m!1259299))

(declare-fun m!1259301 () Bool)

(assert (=> b!1375452 m!1259301))

(declare-fun m!1259303 () Bool)

(assert (=> b!1375454 m!1259303))

(assert (=> b!1375454 m!1259303))

(declare-fun m!1259305 () Bool)

(assert (=> b!1375454 m!1259305))

(declare-fun m!1259307 () Bool)

(assert (=> b!1375456 m!1259307))

(declare-fun m!1259309 () Bool)

(assert (=> start!116706 m!1259309))

(push 1)

(assert (not b!1375453))

(assert (not start!116706))

