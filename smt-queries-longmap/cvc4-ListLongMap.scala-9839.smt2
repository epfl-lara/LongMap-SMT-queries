; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116724 () Bool)

(assert start!116724)

(declare-fun b!1375665 () Bool)

(declare-fun e!779313 () Bool)

(assert (=> b!1375665 (= e!779313 false)))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93393 0))(
  ( (array!93394 (arr!45100 (Array (_ BitVec 32) (_ BitVec 64))) (size!45650 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93393)

(declare-fun lt!604648 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93393 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375665 (= lt!604648 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun lt!604651 () (_ BitVec 32))

(declare-fun lt!604650 () array!93393)

(assert (=> b!1375665 (= lt!604651 (arrayCountValidKeys!0 lt!604650 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun res!918678 () Bool)

(declare-fun e!779317 () Bool)

(assert (=> start!116724 (=> (not res!918678) (not e!779317))))

(assert (=> start!116724 (= res!918678 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45650 a!4032))))))

(assert (=> start!116724 e!779317))

(assert (=> start!116724 true))

(declare-fun array_inv!34128 (array!93393) Bool)

(assert (=> start!116724 (array_inv!34128 a!4032)))

(declare-fun call!65726 () (_ BitVec 32))

(declare-fun bm!65722 () Bool)

(assert (=> bm!65722 (= call!65726 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375666 () Bool)

(declare-fun res!918680 () Bool)

(assert (=> b!1375666 (=> (not res!918680) (not e!779317))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375666 (= res!918680 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1375667 () Bool)

(declare-datatypes ((Unit!45565 0))(
  ( (Unit!45566) )
))
(declare-fun e!779314 () Unit!45565)

(declare-fun lt!604652 () Unit!45565)

(assert (=> b!1375667 (= e!779314 lt!604652)))

(declare-fun lt!604654 () Unit!45565)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93393 (_ BitVec 32) (_ BitVec 32)) Unit!45565)

(assert (=> b!1375667 (= lt!604654 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!604647 () (_ BitVec 32))

(assert (=> b!1375667 (= call!65726 (bvadd #b00000000000000000000000000000001 lt!604647))))

(assert (=> b!1375667 (= lt!604652 (lemmaValidKeyIncreasesNumOfKeys!0 lt!604650 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65725 () (_ BitVec 32))

(declare-fun lt!604653 () (_ BitVec 32))

(assert (=> b!1375667 (= call!65725 (bvadd #b00000000000000000000000000000001 lt!604653))))

(declare-fun bm!65723 () Bool)

(assert (=> bm!65723 (= call!65725 (arrayCountValidKeys!0 lt!604650 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375668 () Bool)

(declare-fun res!918682 () Bool)

(assert (=> b!1375668 (=> (not res!918682) (not e!779317))))

(assert (=> b!1375668 (= res!918682 (and (bvslt (size!45650 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45650 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1375669 () Bool)

(declare-fun res!918679 () Bool)

(assert (=> b!1375669 (=> (not res!918679) (not e!779317))))

(assert (=> b!1375669 (= res!918679 (validKeyInArray!0 (select (arr!45100 a!4032) i!1445)))))

(declare-fun b!1375670 () Bool)

(declare-fun lt!604646 () Unit!45565)

(assert (=> b!1375670 (= e!779314 lt!604646)))

(declare-fun lt!604649 () Unit!45565)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93393 (_ BitVec 32) (_ BitVec 32)) Unit!45565)

(assert (=> b!1375670 (= lt!604649 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375670 (= call!65726 lt!604647)))

(assert (=> b!1375670 (= lt!604646 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!604650 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375670 (= call!65725 lt!604653)))

(declare-fun b!1375671 () Bool)

(declare-fun e!779316 () Bool)

(assert (=> b!1375671 (= e!779317 e!779316)))

(declare-fun res!918681 () Bool)

(assert (=> b!1375671 (=> (not res!918681) (not e!779316))))

(assert (=> b!1375671 (= res!918681 (and (= lt!604653 lt!604647) (not (= to!206 (size!45650 a!4032)))))))

(assert (=> b!1375671 (= lt!604647 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375671 (= lt!604653 (arrayCountValidKeys!0 lt!604650 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375671 (= lt!604650 (array!93394 (store (arr!45100 a!4032) i!1445 k!2947) (size!45650 a!4032)))))

(declare-fun b!1375672 () Bool)

(assert (=> b!1375672 (= e!779316 e!779313)))

(declare-fun res!918677 () Bool)

(assert (=> b!1375672 (=> (not res!918677) (not e!779313))))

(assert (=> b!1375672 (= res!918677 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45650 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!604645 () Unit!45565)

(assert (=> b!1375672 (= lt!604645 e!779314)))

(declare-fun c!127934 () Bool)

(assert (=> b!1375672 (= c!127934 (validKeyInArray!0 (select (arr!45100 a!4032) to!206)))))

(assert (= (and start!116724 res!918678) b!1375669))

(assert (= (and b!1375669 res!918679) b!1375666))

(assert (= (and b!1375666 res!918680) b!1375668))

(assert (= (and b!1375668 res!918682) b!1375671))

(assert (= (and b!1375671 res!918681) b!1375672))

(assert (= (and b!1375672 c!127934) b!1375667))

(assert (= (and b!1375672 (not c!127934)) b!1375670))

(assert (= (or b!1375667 b!1375670) bm!65723))

(assert (= (or b!1375667 b!1375670) bm!65722))

(assert (= (and b!1375672 res!918677) b!1375665))

(declare-fun m!1259551 () Bool)

(assert (=> b!1375666 m!1259551))

(declare-fun m!1259553 () Bool)

(assert (=> b!1375667 m!1259553))

(declare-fun m!1259555 () Bool)

(assert (=> b!1375667 m!1259555))

(declare-fun m!1259557 () Bool)

(assert (=> b!1375670 m!1259557))

(declare-fun m!1259559 () Bool)

(assert (=> b!1375670 m!1259559))

(declare-fun m!1259561 () Bool)

(assert (=> start!116724 m!1259561))

(declare-fun m!1259563 () Bool)

(assert (=> b!1375665 m!1259563))

(declare-fun m!1259565 () Bool)

(assert (=> b!1375665 m!1259565))

(declare-fun m!1259567 () Bool)

(assert (=> b!1375669 m!1259567))

(assert (=> b!1375669 m!1259567))

(declare-fun m!1259569 () Bool)

(assert (=> b!1375669 m!1259569))

(declare-fun m!1259571 () Bool)

(assert (=> b!1375671 m!1259571))

(declare-fun m!1259573 () Bool)

(assert (=> b!1375671 m!1259573))

(declare-fun m!1259575 () Bool)

(assert (=> b!1375671 m!1259575))

(declare-fun m!1259577 () Bool)

(assert (=> b!1375672 m!1259577))

(assert (=> b!1375672 m!1259577))

(declare-fun m!1259579 () Bool)

(assert (=> b!1375672 m!1259579))

(assert (=> bm!65722 m!1259563))

(assert (=> bm!65723 m!1259565))

(push 1)

(assert (not bm!65723))

(assert (not start!116724))

(assert (not b!1375670))

(assert (not b!1375665))

(assert (not b!1375667))

(assert (not b!1375671))

(assert (not b!1375669))

(assert (not bm!65722))

(assert (not b!1375666))

(assert (not b!1375672))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

