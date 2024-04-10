; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116730 () Bool)

(assert start!116730)

(declare-fun b!1375737 () Bool)

(declare-datatypes ((Unit!45571 0))(
  ( (Unit!45572) )
))
(declare-fun e!779360 () Unit!45571)

(declare-fun lt!604744 () Unit!45571)

(assert (=> b!1375737 (= e!779360 lt!604744)))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93399 0))(
  ( (array!93400 (arr!45103 (Array (_ BitVec 32) (_ BitVec 64))) (size!45653 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93399)

(declare-fun lt!604735 () Unit!45571)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93399 (_ BitVec 32) (_ BitVec 32)) Unit!45571)

(assert (=> b!1375737 (= lt!604735 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65743 () (_ BitVec 32))

(declare-fun lt!604741 () (_ BitVec 32))

(assert (=> b!1375737 (= call!65743 lt!604741)))

(declare-fun lt!604739 () array!93399)

(assert (=> b!1375737 (= lt!604744 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!604739 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65744 () (_ BitVec 32))

(declare-fun lt!604738 () (_ BitVec 32))

(assert (=> b!1375737 (= call!65744 lt!604738)))

(declare-fun b!1375738 () Bool)

(declare-fun lt!604743 () Unit!45571)

(assert (=> b!1375738 (= e!779360 lt!604743)))

(declare-fun lt!604740 () Unit!45571)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93399 (_ BitVec 32) (_ BitVec 32)) Unit!45571)

(assert (=> b!1375738 (= lt!604740 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375738 (= call!65743 (bvadd #b00000000000000000000000000000001 lt!604741))))

(assert (=> b!1375738 (= lt!604743 (lemmaValidKeyIncreasesNumOfKeys!0 lt!604739 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375738 (= call!65744 (bvadd #b00000000000000000000000000000001 lt!604738))))

(declare-fun bm!65740 () Bool)

(declare-fun arrayCountValidKeys!0 (array!93399 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!65740 (= call!65743 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun res!918732 () Bool)

(declare-fun e!779359 () Bool)

(assert (=> start!116730 (=> (not res!918732) (not e!779359))))

(assert (=> start!116730 (= res!918732 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45653 a!4032))))))

(assert (=> start!116730 e!779359))

(assert (=> start!116730 true))

(declare-fun array_inv!34131 (array!93399) Bool)

(assert (=> start!116730 (array_inv!34131 a!4032)))

(declare-fun b!1375739 () Bool)

(declare-fun e!779358 () Bool)

(declare-fun e!779362 () Bool)

(assert (=> b!1375739 (= e!779358 e!779362)))

(declare-fun res!918734 () Bool)

(assert (=> b!1375739 (=> (not res!918734) (not e!779362))))

(assert (=> b!1375739 (= res!918734 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45653 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!604736 () Unit!45571)

(assert (=> b!1375739 (= lt!604736 e!779360)))

(declare-fun c!127943 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375739 (= c!127943 (validKeyInArray!0 (select (arr!45103 a!4032) to!206)))))

(declare-fun bm!65741 () Bool)

(assert (=> bm!65741 (= call!65744 (arrayCountValidKeys!0 lt!604739 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375740 () Bool)

(assert (=> b!1375740 (= e!779359 e!779358)))

(declare-fun res!918735 () Bool)

(assert (=> b!1375740 (=> (not res!918735) (not e!779358))))

(assert (=> b!1375740 (= res!918735 (and (= lt!604738 lt!604741) (not (= to!206 (size!45653 a!4032)))))))

(assert (=> b!1375740 (= lt!604741 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375740 (= lt!604738 (arrayCountValidKeys!0 lt!604739 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k!2947 () (_ BitVec 64))

(assert (=> b!1375740 (= lt!604739 (array!93400 (store (arr!45103 a!4032) i!1445 k!2947) (size!45653 a!4032)))))

(declare-fun b!1375741 () Bool)

(declare-fun res!918731 () Bool)

(assert (=> b!1375741 (=> (not res!918731) (not e!779359))))

(assert (=> b!1375741 (= res!918731 (validKeyInArray!0 (select (arr!45103 a!4032) i!1445)))))

(declare-fun b!1375742 () Bool)

(declare-fun res!918733 () Bool)

(assert (=> b!1375742 (=> (not res!918733) (not e!779359))))

(assert (=> b!1375742 (= res!918733 (and (bvslt (size!45653 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45653 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1375743 () Bool)

(assert (=> b!1375743 (= e!779362 false)))

(declare-fun lt!604742 () (_ BitVec 32))

(assert (=> b!1375743 (= lt!604742 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun lt!604737 () (_ BitVec 32))

(assert (=> b!1375743 (= lt!604737 (arrayCountValidKeys!0 lt!604739 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375744 () Bool)

(declare-fun res!918736 () Bool)

(assert (=> b!1375744 (=> (not res!918736) (not e!779359))))

(assert (=> b!1375744 (= res!918736 (not (validKeyInArray!0 k!2947)))))

(assert (= (and start!116730 res!918732) b!1375741))

(assert (= (and b!1375741 res!918731) b!1375744))

(assert (= (and b!1375744 res!918736) b!1375742))

(assert (= (and b!1375742 res!918733) b!1375740))

(assert (= (and b!1375740 res!918735) b!1375739))

(assert (= (and b!1375739 c!127943) b!1375738))

(assert (= (and b!1375739 (not c!127943)) b!1375737))

(assert (= (or b!1375738 b!1375737) bm!65740))

(assert (= (or b!1375738 b!1375737) bm!65741))

(assert (= (and b!1375739 res!918734) b!1375743))

(declare-fun m!1259641 () Bool)

(assert (=> bm!65741 m!1259641))

(declare-fun m!1259643 () Bool)

(assert (=> b!1375744 m!1259643))

(declare-fun m!1259645 () Bool)

(assert (=> b!1375738 m!1259645))

(declare-fun m!1259647 () Bool)

(assert (=> b!1375738 m!1259647))

(declare-fun m!1259649 () Bool)

(assert (=> b!1375739 m!1259649))

(assert (=> b!1375739 m!1259649))

(declare-fun m!1259651 () Bool)

(assert (=> b!1375739 m!1259651))

(declare-fun m!1259653 () Bool)

(assert (=> b!1375737 m!1259653))

(declare-fun m!1259655 () Bool)

(assert (=> b!1375737 m!1259655))

(declare-fun m!1259657 () Bool)

(assert (=> b!1375743 m!1259657))

(assert (=> b!1375743 m!1259641))

(declare-fun m!1259659 () Bool)

(assert (=> b!1375740 m!1259659))

(declare-fun m!1259661 () Bool)

(assert (=> b!1375740 m!1259661))

(declare-fun m!1259663 () Bool)

(assert (=> b!1375740 m!1259663))

(assert (=> bm!65740 m!1259657))

(declare-fun m!1259665 () Bool)

(assert (=> b!1375741 m!1259665))

(assert (=> b!1375741 m!1259665))

(declare-fun m!1259667 () Bool)

(assert (=> b!1375741 m!1259667))

(declare-fun m!1259669 () Bool)

(assert (=> start!116730 m!1259669))

(push 1)

(assert (not b!1375739))

(assert (not b!1375740))

(assert (not bm!65741))

(assert (not b!1375744))

(assert (not bm!65740))

(assert (not start!116730))

(assert (not b!1375741))

(assert (not b!1375743))

(assert (not b!1375738))

(assert (not b!1375737))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

