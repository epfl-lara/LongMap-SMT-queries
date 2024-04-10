; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116708 () Bool)

(assert start!116708)

(declare-fun b!1375473 () Bool)

(declare-fun res!918537 () Bool)

(declare-fun e!779195 () Bool)

(assert (=> b!1375473 (=> (not res!918537) (not e!779195))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93377 0))(
  ( (array!93378 (arr!45092 (Array (_ BitVec 32) (_ BitVec 64))) (size!45642 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93377)

(assert (=> b!1375473 (= res!918537 (and (bvslt (size!45642 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45642 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun res!918534 () Bool)

(assert (=> start!116708 (=> (not res!918534) (not e!779195))))

(assert (=> start!116708 (= res!918534 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45642 a!4032))))))

(assert (=> start!116708 e!779195))

(assert (=> start!116708 true))

(declare-fun array_inv!34120 (array!93377) Bool)

(assert (=> start!116708 (array_inv!34120 a!4032)))

(declare-fun call!65678 () (_ BitVec 32))

(declare-fun bm!65674 () Bool)

(declare-fun lt!604408 () array!93377)

(declare-fun arrayCountValidKeys!0 (array!93377 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!65674 (= call!65678 (arrayCountValidKeys!0 lt!604408 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375474 () Bool)

(declare-datatypes ((Unit!45549 0))(
  ( (Unit!45550) )
))
(declare-fun e!779196 () Unit!45549)

(declare-fun lt!604406 () Unit!45549)

(assert (=> b!1375474 (= e!779196 lt!604406)))

(declare-fun lt!604409 () Unit!45549)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93377 (_ BitVec 32) (_ BitVec 32)) Unit!45549)

(assert (=> b!1375474 (= lt!604409 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65677 () (_ BitVec 32))

(declare-fun lt!604407 () (_ BitVec 32))

(assert (=> b!1375474 (= call!65677 lt!604407)))

(assert (=> b!1375474 (= lt!604406 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!604408 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!604414 () (_ BitVec 32))

(assert (=> b!1375474 (= call!65678 lt!604414)))

(declare-fun b!1375475 () Bool)

(declare-fun res!918536 () Bool)

(assert (=> b!1375475 (=> (not res!918536) (not e!779195))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375475 (= res!918536 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1375476 () Bool)

(declare-fun res!918533 () Bool)

(assert (=> b!1375476 (=> (not res!918533) (not e!779195))))

(assert (=> b!1375476 (= res!918533 (validKeyInArray!0 (select (arr!45092 a!4032) i!1445)))))

(declare-fun b!1375477 () Bool)

(declare-fun e!779197 () Bool)

(assert (=> b!1375477 (= e!779197 false)))

(declare-fun lt!604412 () (_ BitVec 32))

(assert (=> b!1375477 (= lt!604412 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun lt!604413 () (_ BitVec 32))

(assert (=> b!1375477 (= lt!604413 (arrayCountValidKeys!0 lt!604408 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun bm!65675 () Bool)

(assert (=> bm!65675 (= call!65677 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375478 () Bool)

(declare-fun e!779193 () Bool)

(assert (=> b!1375478 (= e!779193 e!779197)))

(declare-fun res!918538 () Bool)

(assert (=> b!1375478 (=> (not res!918538) (not e!779197))))

(assert (=> b!1375478 (= res!918538 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45642 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!604411 () Unit!45549)

(assert (=> b!1375478 (= lt!604411 e!779196)))

(declare-fun c!127910 () Bool)

(assert (=> b!1375478 (= c!127910 (validKeyInArray!0 (select (arr!45092 a!4032) to!206)))))

(declare-fun b!1375479 () Bool)

(assert (=> b!1375479 (= e!779195 e!779193)))

(declare-fun res!918535 () Bool)

(assert (=> b!1375479 (=> (not res!918535) (not e!779193))))

(assert (=> b!1375479 (= res!918535 (and (= lt!604414 lt!604407) (not (= to!206 (size!45642 a!4032)))))))

(assert (=> b!1375479 (= lt!604407 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375479 (= lt!604414 (arrayCountValidKeys!0 lt!604408 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375479 (= lt!604408 (array!93378 (store (arr!45092 a!4032) i!1445 k!2947) (size!45642 a!4032)))))

(declare-fun b!1375480 () Bool)

(declare-fun lt!604410 () Unit!45549)

(assert (=> b!1375480 (= e!779196 lt!604410)))

(declare-fun lt!604405 () Unit!45549)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93377 (_ BitVec 32) (_ BitVec 32)) Unit!45549)

(assert (=> b!1375480 (= lt!604405 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375480 (= call!65677 (bvadd #b00000000000000000000000000000001 lt!604407))))

(assert (=> b!1375480 (= lt!604410 (lemmaValidKeyIncreasesNumOfKeys!0 lt!604408 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375480 (= call!65678 (bvadd #b00000000000000000000000000000001 lt!604414))))

(assert (= (and start!116708 res!918534) b!1375476))

(assert (= (and b!1375476 res!918533) b!1375475))

(assert (= (and b!1375475 res!918536) b!1375473))

(assert (= (and b!1375473 res!918537) b!1375479))

(assert (= (and b!1375479 res!918535) b!1375478))

(assert (= (and b!1375478 c!127910) b!1375480))

(assert (= (and b!1375478 (not c!127910)) b!1375474))

(assert (= (or b!1375480 b!1375474) bm!65675))

(assert (= (or b!1375480 b!1375474) bm!65674))

(assert (= (and b!1375478 res!918538) b!1375477))

(declare-fun m!1259311 () Bool)

(assert (=> b!1375475 m!1259311))

(declare-fun m!1259313 () Bool)

(assert (=> b!1375477 m!1259313))

(declare-fun m!1259315 () Bool)

(assert (=> b!1375477 m!1259315))

(assert (=> bm!65674 m!1259315))

(declare-fun m!1259317 () Bool)

(assert (=> b!1375476 m!1259317))

(assert (=> b!1375476 m!1259317))

(declare-fun m!1259319 () Bool)

(assert (=> b!1375476 m!1259319))

(declare-fun m!1259321 () Bool)

(assert (=> b!1375479 m!1259321))

(declare-fun m!1259323 () Bool)

(assert (=> b!1375479 m!1259323))

(declare-fun m!1259325 () Bool)

(assert (=> b!1375479 m!1259325))

(declare-fun m!1259327 () Bool)

(assert (=> b!1375474 m!1259327))

(declare-fun m!1259329 () Bool)

(assert (=> b!1375474 m!1259329))

(declare-fun m!1259331 () Bool)

(assert (=> start!116708 m!1259331))

(declare-fun m!1259333 () Bool)

(assert (=> b!1375480 m!1259333))

(declare-fun m!1259335 () Bool)

(assert (=> b!1375480 m!1259335))

(assert (=> bm!65675 m!1259313))

(declare-fun m!1259337 () Bool)

(assert (=> b!1375478 m!1259337))

(assert (=> b!1375478 m!1259337))

(declare-fun m!1259339 () Bool)

(assert (=> b!1375478 m!1259339))

(push 1)

