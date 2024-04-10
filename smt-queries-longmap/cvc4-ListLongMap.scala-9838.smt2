; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116718 () Bool)

(assert start!116718)

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93387 0))(
  ( (array!93388 (arr!45097 (Array (_ BitVec 32) (_ BitVec 64))) (size!45647 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93387)

(declare-fun bm!65704 () Bool)

(declare-fun call!65707 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93387 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!65704 (= call!65707 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun lt!604563 () array!93387)

(declare-fun bm!65705 () Bool)

(declare-fun call!65708 () (_ BitVec 32))

(assert (=> bm!65705 (= call!65708 (arrayCountValidKeys!0 lt!604563 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375593 () Bool)

(declare-datatypes ((Unit!45559 0))(
  ( (Unit!45560) )
))
(declare-fun e!779268 () Unit!45559)

(declare-fun lt!604564 () Unit!45559)

(assert (=> b!1375593 (= e!779268 lt!604564)))

(declare-fun lt!604559 () Unit!45559)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93387 (_ BitVec 32) (_ BitVec 32)) Unit!45559)

(assert (=> b!1375593 (= lt!604559 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!604557 () (_ BitVec 32))

(assert (=> b!1375593 (= call!65707 lt!604557)))

(assert (=> b!1375593 (= lt!604564 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!604563 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!604561 () (_ BitVec 32))

(assert (=> b!1375593 (= call!65708 lt!604561)))

(declare-fun b!1375594 () Bool)

(declare-fun e!779269 () Bool)

(declare-fun e!779270 () Bool)

(assert (=> b!1375594 (= e!779269 e!779270)))

(declare-fun res!918626 () Bool)

(assert (=> b!1375594 (=> (not res!918626) (not e!779270))))

(assert (=> b!1375594 (= res!918626 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45647 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!604558 () Unit!45559)

(assert (=> b!1375594 (= lt!604558 e!779268)))

(declare-fun c!127925 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375594 (= c!127925 (validKeyInArray!0 (select (arr!45097 a!4032) to!206)))))

(declare-fun b!1375595 () Bool)

(assert (=> b!1375595 (= e!779270 false)))

(declare-fun lt!604562 () (_ BitVec 32))

(assert (=> b!1375595 (= lt!604562 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun lt!604556 () (_ BitVec 32))

(assert (=> b!1375595 (= lt!604556 (arrayCountValidKeys!0 lt!604563 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun res!918628 () Bool)

(declare-fun e!779271 () Bool)

(assert (=> start!116718 (=> (not res!918628) (not e!779271))))

(assert (=> start!116718 (= res!918628 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45647 a!4032))))))

(assert (=> start!116718 e!779271))

(assert (=> start!116718 true))

(declare-fun array_inv!34125 (array!93387) Bool)

(assert (=> start!116718 (array_inv!34125 a!4032)))

(declare-fun b!1375596 () Bool)

(assert (=> b!1375596 (= e!779271 e!779269)))

(declare-fun res!918625 () Bool)

(assert (=> b!1375596 (=> (not res!918625) (not e!779269))))

(assert (=> b!1375596 (= res!918625 (and (= lt!604561 lt!604557) (not (= to!206 (size!45647 a!4032)))))))

(assert (=> b!1375596 (= lt!604557 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375596 (= lt!604561 (arrayCountValidKeys!0 lt!604563 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k!2947 () (_ BitVec 64))

(assert (=> b!1375596 (= lt!604563 (array!93388 (store (arr!45097 a!4032) i!1445 k!2947) (size!45647 a!4032)))))

(declare-fun b!1375597 () Bool)

(declare-fun res!918624 () Bool)

(assert (=> b!1375597 (=> (not res!918624) (not e!779271))))

(assert (=> b!1375597 (= res!918624 (validKeyInArray!0 (select (arr!45097 a!4032) i!1445)))))

(declare-fun b!1375598 () Bool)

(declare-fun res!918627 () Bool)

(assert (=> b!1375598 (=> (not res!918627) (not e!779271))))

(assert (=> b!1375598 (= res!918627 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1375599 () Bool)

(declare-fun res!918623 () Bool)

(assert (=> b!1375599 (=> (not res!918623) (not e!779271))))

(assert (=> b!1375599 (= res!918623 (and (bvslt (size!45647 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45647 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1375600 () Bool)

(declare-fun lt!604555 () Unit!45559)

(assert (=> b!1375600 (= e!779268 lt!604555)))

(declare-fun lt!604560 () Unit!45559)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93387 (_ BitVec 32) (_ BitVec 32)) Unit!45559)

(assert (=> b!1375600 (= lt!604560 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375600 (= call!65707 (bvadd #b00000000000000000000000000000001 lt!604557))))

(assert (=> b!1375600 (= lt!604555 (lemmaValidKeyIncreasesNumOfKeys!0 lt!604563 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375600 (= call!65708 (bvadd #b00000000000000000000000000000001 lt!604561))))

(assert (= (and start!116718 res!918628) b!1375597))

(assert (= (and b!1375597 res!918624) b!1375598))

(assert (= (and b!1375598 res!918627) b!1375599))

(assert (= (and b!1375599 res!918623) b!1375596))

(assert (= (and b!1375596 res!918625) b!1375594))

(assert (= (and b!1375594 c!127925) b!1375600))

(assert (= (and b!1375594 (not c!127925)) b!1375593))

(assert (= (or b!1375600 b!1375593) bm!65704))

(assert (= (or b!1375600 b!1375593) bm!65705))

(assert (= (and b!1375594 res!918626) b!1375595))

(declare-fun m!1259461 () Bool)

(assert (=> bm!65704 m!1259461))

(assert (=> b!1375595 m!1259461))

(declare-fun m!1259463 () Bool)

(assert (=> b!1375595 m!1259463))

(declare-fun m!1259465 () Bool)

(assert (=> start!116718 m!1259465))

(declare-fun m!1259467 () Bool)

(assert (=> b!1375597 m!1259467))

(assert (=> b!1375597 m!1259467))

(declare-fun m!1259469 () Bool)

(assert (=> b!1375597 m!1259469))

(declare-fun m!1259471 () Bool)

(assert (=> b!1375598 m!1259471))

(declare-fun m!1259473 () Bool)

(assert (=> b!1375600 m!1259473))

(declare-fun m!1259475 () Bool)

(assert (=> b!1375600 m!1259475))

(declare-fun m!1259477 () Bool)

(assert (=> b!1375593 m!1259477))

(declare-fun m!1259479 () Bool)

(assert (=> b!1375593 m!1259479))

(assert (=> bm!65705 m!1259463))

(declare-fun m!1259481 () Bool)

(assert (=> b!1375596 m!1259481))

(declare-fun m!1259483 () Bool)

(assert (=> b!1375596 m!1259483))

(declare-fun m!1259485 () Bool)

(assert (=> b!1375596 m!1259485))

(declare-fun m!1259487 () Bool)

(assert (=> b!1375594 m!1259487))

(assert (=> b!1375594 m!1259487))

(declare-fun m!1259489 () Bool)

(assert (=> b!1375594 m!1259489))

(push 1)

(assert (not b!1375594))

(assert (not b!1375596))

(assert (not b!1375597))

(assert (not b!1375595))

(assert (not b!1375600))

(assert (not bm!65705))

(assert (not b!1375598))

(assert (not bm!65704))

(assert (not b!1375593))

(assert (not start!116718))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

