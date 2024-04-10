; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116714 () Bool)

(assert start!116714)

(declare-fun b!1375545 () Bool)

(declare-fun e!779240 () Bool)

(declare-fun e!779241 () Bool)

(assert (=> b!1375545 (= e!779240 e!779241)))

(declare-fun res!918592 () Bool)

(assert (=> b!1375545 (=> (not res!918592) (not e!779241))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun lt!604495 () (_ BitVec 32))

(declare-fun lt!604496 () (_ BitVec 32))

(declare-datatypes ((array!93383 0))(
  ( (array!93384 (arr!45095 (Array (_ BitVec 32) (_ BitVec 64))) (size!45645 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93383)

(assert (=> b!1375545 (= res!918592 (and (= lt!604495 lt!604496) (not (= to!206 (size!45645 a!4032)))))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93383 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375545 (= lt!604496 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!604503 () array!93383)

(assert (=> b!1375545 (= lt!604495 (arrayCountValidKeys!0 lt!604503 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k!2947 () (_ BitVec 64))

(assert (=> b!1375545 (= lt!604503 (array!93384 (store (arr!45095 a!4032) i!1445 k!2947) (size!45645 a!4032)))))

(declare-fun b!1375546 () Bool)

(declare-fun e!779242 () Bool)

(assert (=> b!1375546 (= e!779241 e!779242)))

(declare-fun res!918591 () Bool)

(assert (=> b!1375546 (=> (not res!918591) (not e!779242))))

(assert (=> b!1375546 (= res!918591 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45645 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-datatypes ((Unit!45555 0))(
  ( (Unit!45556) )
))
(declare-fun lt!604499 () Unit!45555)

(declare-fun e!779239 () Unit!45555)

(assert (=> b!1375546 (= lt!604499 e!779239)))

(declare-fun c!127919 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375546 (= c!127919 (validKeyInArray!0 (select (arr!45095 a!4032) to!206)))))

(declare-fun b!1375547 () Bool)

(declare-fun res!918589 () Bool)

(assert (=> b!1375547 (=> (not res!918589) (not e!779240))))

(assert (=> b!1375547 (= res!918589 (not (validKeyInArray!0 k!2947)))))

(declare-fun bm!65692 () Bool)

(declare-fun call!65696 () (_ BitVec 32))

(assert (=> bm!65692 (= call!65696 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun bm!65693 () Bool)

(declare-fun call!65695 () (_ BitVec 32))

(assert (=> bm!65693 (= call!65695 (arrayCountValidKeys!0 lt!604503 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375548 () Bool)

(declare-fun res!918590 () Bool)

(assert (=> b!1375548 (=> (not res!918590) (not e!779240))))

(assert (=> b!1375548 (= res!918590 (validKeyInArray!0 (select (arr!45095 a!4032) i!1445)))))

(declare-fun res!918587 () Bool)

(assert (=> start!116714 (=> (not res!918587) (not e!779240))))

(assert (=> start!116714 (= res!918587 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45645 a!4032))))))

(assert (=> start!116714 e!779240))

(assert (=> start!116714 true))

(declare-fun array_inv!34123 (array!93383) Bool)

(assert (=> start!116714 (array_inv!34123 a!4032)))

(declare-fun b!1375549 () Bool)

(assert (=> b!1375549 (= e!779242 false)))

(declare-fun lt!604500 () (_ BitVec 32))

(assert (=> b!1375549 (= lt!604500 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun lt!604502 () (_ BitVec 32))

(assert (=> b!1375549 (= lt!604502 (arrayCountValidKeys!0 lt!604503 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375550 () Bool)

(declare-fun lt!604497 () Unit!45555)

(assert (=> b!1375550 (= e!779239 lt!604497)))

(declare-fun lt!604498 () Unit!45555)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93383 (_ BitVec 32) (_ BitVec 32)) Unit!45555)

(assert (=> b!1375550 (= lt!604498 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375550 (= call!65696 lt!604496)))

(assert (=> b!1375550 (= lt!604497 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!604503 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375550 (= call!65695 lt!604495)))

(declare-fun b!1375551 () Bool)

(declare-fun res!918588 () Bool)

(assert (=> b!1375551 (=> (not res!918588) (not e!779240))))

(assert (=> b!1375551 (= res!918588 (and (bvslt (size!45645 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45645 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1375552 () Bool)

(declare-fun lt!604504 () Unit!45555)

(assert (=> b!1375552 (= e!779239 lt!604504)))

(declare-fun lt!604501 () Unit!45555)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93383 (_ BitVec 32) (_ BitVec 32)) Unit!45555)

(assert (=> b!1375552 (= lt!604501 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375552 (= call!65696 (bvadd #b00000000000000000000000000000001 lt!604496))))

(assert (=> b!1375552 (= lt!604504 (lemmaValidKeyIncreasesNumOfKeys!0 lt!604503 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375552 (= call!65695 (bvadd #b00000000000000000000000000000001 lt!604495))))

(assert (= (and start!116714 res!918587) b!1375548))

(assert (= (and b!1375548 res!918590) b!1375547))

(assert (= (and b!1375547 res!918589) b!1375551))

(assert (= (and b!1375551 res!918588) b!1375545))

(assert (= (and b!1375545 res!918592) b!1375546))

(assert (= (and b!1375546 c!127919) b!1375552))

(assert (= (and b!1375546 (not c!127919)) b!1375550))

(assert (= (or b!1375552 b!1375550) bm!65693))

(assert (= (or b!1375552 b!1375550) bm!65692))

(assert (= (and b!1375546 res!918591) b!1375549))

(declare-fun m!1259401 () Bool)

(assert (=> b!1375552 m!1259401))

(declare-fun m!1259403 () Bool)

(assert (=> b!1375552 m!1259403))

(declare-fun m!1259405 () Bool)

(assert (=> start!116714 m!1259405))

(declare-fun m!1259407 () Bool)

(assert (=> b!1375546 m!1259407))

(assert (=> b!1375546 m!1259407))

(declare-fun m!1259409 () Bool)

(assert (=> b!1375546 m!1259409))

(declare-fun m!1259411 () Bool)

(assert (=> b!1375550 m!1259411))

(declare-fun m!1259413 () Bool)

(assert (=> b!1375550 m!1259413))

(declare-fun m!1259415 () Bool)

(assert (=> b!1375547 m!1259415))

(declare-fun m!1259417 () Bool)

(assert (=> bm!65692 m!1259417))

(declare-fun m!1259419 () Bool)

(assert (=> b!1375545 m!1259419))

(declare-fun m!1259421 () Bool)

(assert (=> b!1375545 m!1259421))

(declare-fun m!1259423 () Bool)

(assert (=> b!1375545 m!1259423))

(declare-fun m!1259425 () Bool)

(assert (=> bm!65693 m!1259425))

(declare-fun m!1259427 () Bool)

(assert (=> b!1375548 m!1259427))

(assert (=> b!1375548 m!1259427))

(declare-fun m!1259429 () Bool)

(assert (=> b!1375548 m!1259429))

(assert (=> b!1375549 m!1259417))

(assert (=> b!1375549 m!1259425))

(push 1)

(assert (not b!1375549))

(assert (not start!116714))

(assert (not bm!65693))

(assert (not b!1375547))

(assert (not b!1375548))

(assert (not b!1375552))

(assert (not b!1375545))

(assert (not b!1375550))

(assert (not bm!65692))

