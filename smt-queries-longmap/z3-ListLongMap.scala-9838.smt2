; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116716 () Bool)

(assert start!116716)

(declare-fun b!1375570 () Bool)

(declare-fun res!918607 () Bool)

(declare-fun e!779257 () Bool)

(assert (=> b!1375570 (=> (not res!918607) (not e!779257))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93385 0))(
  ( (array!93386 (arr!45096 (Array (_ BitVec 32) (_ BitVec 64))) (size!45646 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93385)

(declare-fun to!206 () (_ BitVec 32))

(assert (=> b!1375570 (= res!918607 (and (bvslt (size!45646 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45646 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1375571 () Bool)

(declare-fun e!779253 () Bool)

(assert (=> b!1375571 (= e!779253 false)))

(declare-fun lt!604528 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93385 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375571 (= lt!604528 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun lt!604527 () (_ BitVec 32))

(declare-fun lt!604526 () array!93385)

(assert (=> b!1375571 (= lt!604527 (arrayCountValidKeys!0 lt!604526 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375572 () Bool)

(declare-fun res!918609 () Bool)

(assert (=> b!1375572 (=> (not res!918609) (not e!779257))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375572 (= res!918609 (validKeyInArray!0 (select (arr!45096 a!4032) i!1445)))))

(declare-fun bm!65698 () Bool)

(declare-fun call!65702 () (_ BitVec 32))

(assert (=> bm!65698 (= call!65702 (arrayCountValidKeys!0 lt!604526 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375573 () Bool)

(declare-fun e!779254 () Bool)

(assert (=> b!1375573 (= e!779257 e!779254)))

(declare-fun res!918608 () Bool)

(assert (=> b!1375573 (=> (not res!918608) (not e!779254))))

(declare-fun lt!604532 () (_ BitVec 32))

(declare-fun lt!604534 () (_ BitVec 32))

(assert (=> b!1375573 (= res!918608 (and (= lt!604534 lt!604532) (not (= to!206 (size!45646 a!4032)))))))

(assert (=> b!1375573 (= lt!604532 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375573 (= lt!604534 (arrayCountValidKeys!0 lt!604526 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1375573 (= lt!604526 (array!93386 (store (arr!45096 a!4032) i!1445 k0!2947) (size!45646 a!4032)))))

(declare-fun b!1375574 () Bool)

(declare-datatypes ((Unit!45557 0))(
  ( (Unit!45558) )
))
(declare-fun e!779255 () Unit!45557)

(declare-fun lt!604530 () Unit!45557)

(assert (=> b!1375574 (= e!779255 lt!604530)))

(declare-fun lt!604525 () Unit!45557)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93385 (_ BitVec 32) (_ BitVec 32)) Unit!45557)

(assert (=> b!1375574 (= lt!604525 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65701 () (_ BitVec 32))

(assert (=> b!1375574 (= call!65701 (bvadd #b00000000000000000000000000000001 lt!604532))))

(assert (=> b!1375574 (= lt!604530 (lemmaValidKeyIncreasesNumOfKeys!0 lt!604526 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375574 (= call!65702 (bvadd #b00000000000000000000000000000001 lt!604534))))

(declare-fun b!1375575 () Bool)

(assert (=> b!1375575 (= e!779254 e!779253)))

(declare-fun res!918605 () Bool)

(assert (=> b!1375575 (=> (not res!918605) (not e!779253))))

(assert (=> b!1375575 (= res!918605 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45646 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!604529 () Unit!45557)

(assert (=> b!1375575 (= lt!604529 e!779255)))

(declare-fun c!127922 () Bool)

(assert (=> b!1375575 (= c!127922 (validKeyInArray!0 (select (arr!45096 a!4032) to!206)))))

(declare-fun res!918606 () Bool)

(assert (=> start!116716 (=> (not res!918606) (not e!779257))))

(assert (=> start!116716 (= res!918606 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45646 a!4032))))))

(assert (=> start!116716 e!779257))

(assert (=> start!116716 true))

(declare-fun array_inv!34124 (array!93385) Bool)

(assert (=> start!116716 (array_inv!34124 a!4032)))

(declare-fun b!1375569 () Bool)

(declare-fun lt!604533 () Unit!45557)

(assert (=> b!1375569 (= e!779255 lt!604533)))

(declare-fun lt!604531 () Unit!45557)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93385 (_ BitVec 32) (_ BitVec 32)) Unit!45557)

(assert (=> b!1375569 (= lt!604531 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375569 (= call!65701 lt!604532)))

(assert (=> b!1375569 (= lt!604533 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!604526 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375569 (= call!65702 lt!604534)))

(declare-fun bm!65699 () Bool)

(assert (=> bm!65699 (= call!65701 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375576 () Bool)

(declare-fun res!918610 () Bool)

(assert (=> b!1375576 (=> (not res!918610) (not e!779257))))

(assert (=> b!1375576 (= res!918610 (not (validKeyInArray!0 k0!2947)))))

(assert (= (and start!116716 res!918606) b!1375572))

(assert (= (and b!1375572 res!918609) b!1375576))

(assert (= (and b!1375576 res!918610) b!1375570))

(assert (= (and b!1375570 res!918607) b!1375573))

(assert (= (and b!1375573 res!918608) b!1375575))

(assert (= (and b!1375575 c!127922) b!1375574))

(assert (= (and b!1375575 (not c!127922)) b!1375569))

(assert (= (or b!1375574 b!1375569) bm!65698))

(assert (= (or b!1375574 b!1375569) bm!65699))

(assert (= (and b!1375575 res!918605) b!1375571))

(declare-fun m!1259431 () Bool)

(assert (=> start!116716 m!1259431))

(declare-fun m!1259433 () Bool)

(assert (=> bm!65699 m!1259433))

(declare-fun m!1259435 () Bool)

(assert (=> b!1375574 m!1259435))

(declare-fun m!1259437 () Bool)

(assert (=> b!1375574 m!1259437))

(declare-fun m!1259439 () Bool)

(assert (=> b!1375576 m!1259439))

(assert (=> b!1375571 m!1259433))

(declare-fun m!1259441 () Bool)

(assert (=> b!1375571 m!1259441))

(declare-fun m!1259443 () Bool)

(assert (=> b!1375573 m!1259443))

(declare-fun m!1259445 () Bool)

(assert (=> b!1375573 m!1259445))

(declare-fun m!1259447 () Bool)

(assert (=> b!1375573 m!1259447))

(declare-fun m!1259449 () Bool)

(assert (=> b!1375572 m!1259449))

(assert (=> b!1375572 m!1259449))

(declare-fun m!1259451 () Bool)

(assert (=> b!1375572 m!1259451))

(assert (=> bm!65698 m!1259441))

(declare-fun m!1259453 () Bool)

(assert (=> b!1375575 m!1259453))

(assert (=> b!1375575 m!1259453))

(declare-fun m!1259455 () Bool)

(assert (=> b!1375575 m!1259455))

(declare-fun m!1259457 () Bool)

(assert (=> b!1375569 m!1259457))

(declare-fun m!1259459 () Bool)

(assert (=> b!1375569 m!1259459))

(check-sat (not start!116716) (not b!1375576) (not b!1375571) (not bm!65699) (not b!1375569) (not bm!65698) (not b!1375574) (not b!1375572) (not b!1375573) (not b!1375575))
