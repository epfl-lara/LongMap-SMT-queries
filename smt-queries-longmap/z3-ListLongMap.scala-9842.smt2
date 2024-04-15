; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116734 () Bool)

(assert start!116734)

(declare-fun b!1375772 () Bool)

(declare-fun res!918777 () Bool)

(declare-fun e!779391 () Bool)

(assert (=> b!1375772 (=> (not res!918777) (not e!779391))))

(declare-datatypes ((array!93357 0))(
  ( (array!93358 (arr!45082 (Array (_ BitVec 32) (_ BitVec 64))) (size!45634 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93357)

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375772 (= res!918777 (validKeyInArray!0 (select (arr!45082 a!4032) i!1445)))))

(declare-fun b!1375773 () Bool)

(declare-datatypes ((Unit!45420 0))(
  ( (Unit!45421) )
))
(declare-fun e!779393 () Unit!45420)

(declare-fun lt!604678 () Unit!45420)

(assert (=> b!1375773 (= e!779393 lt!604678)))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun lt!604674 () Unit!45420)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93357 (_ BitVec 32) (_ BitVec 32)) Unit!45420)

(assert (=> b!1375773 (= lt!604674 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65750 () (_ BitVec 32))

(declare-fun lt!604682 () (_ BitVec 32))

(assert (=> b!1375773 (= call!65750 (bvadd #b00000000000000000000000000000001 lt!604682))))

(declare-fun lt!604679 () array!93357)

(assert (=> b!1375773 (= lt!604678 (lemmaValidKeyIncreasesNumOfKeys!0 lt!604679 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65751 () (_ BitVec 32))

(declare-fun lt!604675 () (_ BitVec 32))

(assert (=> b!1375773 (= call!65751 (bvadd #b00000000000000000000000000000001 lt!604675))))

(declare-fun b!1375774 () Bool)

(declare-fun e!779395 () Bool)

(assert (=> b!1375774 (= e!779391 e!779395)))

(declare-fun res!918782 () Bool)

(assert (=> b!1375774 (=> (not res!918782) (not e!779395))))

(assert (=> b!1375774 (= res!918782 (and (= lt!604675 lt!604682) (not (= to!206 (size!45634 a!4032)))))))

(declare-fun arrayCountValidKeys!0 (array!93357 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375774 (= lt!604682 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375774 (= lt!604675 (arrayCountValidKeys!0 lt!604679 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1375774 (= lt!604679 (array!93358 (store (arr!45082 a!4032) i!1445 k0!2947) (size!45634 a!4032)))))

(declare-fun bm!65747 () Bool)

(assert (=> bm!65747 (= call!65751 (arrayCountValidKeys!0 lt!604679 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375775 () Bool)

(declare-fun res!918778 () Bool)

(assert (=> b!1375775 (=> (not res!918778) (not e!779391))))

(assert (=> b!1375775 (= res!918778 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1375776 () Bool)

(declare-fun lt!604681 () Unit!45420)

(assert (=> b!1375776 (= e!779393 lt!604681)))

(declare-fun lt!604680 () Unit!45420)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93357 (_ BitVec 32) (_ BitVec 32)) Unit!45420)

(assert (=> b!1375776 (= lt!604680 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375776 (= call!65750 lt!604682)))

(assert (=> b!1375776 (= lt!604681 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!604679 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375776 (= call!65751 lt!604675)))

(declare-fun res!918780 () Bool)

(assert (=> start!116734 (=> (not res!918780) (not e!779391))))

(assert (=> start!116734 (= res!918780 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45634 a!4032))))))

(assert (=> start!116734 e!779391))

(assert (=> start!116734 true))

(declare-fun array_inv!34315 (array!93357) Bool)

(assert (=> start!116734 (array_inv!34315 a!4032)))

(declare-fun bm!65748 () Bool)

(assert (=> bm!65748 (= call!65750 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375777 () Bool)

(declare-fun res!918781 () Bool)

(assert (=> b!1375777 (=> (not res!918781) (not e!779391))))

(assert (=> b!1375777 (= res!918781 (and (bvslt (size!45634 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45634 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1375778 () Bool)

(declare-fun e!779394 () Bool)

(assert (=> b!1375778 (= e!779394 false)))

(declare-fun lt!604677 () (_ BitVec 32))

(assert (=> b!1375778 (= lt!604677 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun lt!604676 () (_ BitVec 32))

(assert (=> b!1375778 (= lt!604676 (arrayCountValidKeys!0 lt!604679 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375779 () Bool)

(assert (=> b!1375779 (= e!779395 e!779394)))

(declare-fun res!918779 () Bool)

(assert (=> b!1375779 (=> (not res!918779) (not e!779394))))

(assert (=> b!1375779 (= res!918779 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45634 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!604673 () Unit!45420)

(assert (=> b!1375779 (= lt!604673 e!779393)))

(declare-fun c!127940 () Bool)

(assert (=> b!1375779 (= c!127940 (validKeyInArray!0 (select (arr!45082 a!4032) to!206)))))

(assert (= (and start!116734 res!918780) b!1375772))

(assert (= (and b!1375772 res!918777) b!1375775))

(assert (= (and b!1375775 res!918778) b!1375777))

(assert (= (and b!1375777 res!918781) b!1375774))

(assert (= (and b!1375774 res!918782) b!1375779))

(assert (= (and b!1375779 c!127940) b!1375773))

(assert (= (and b!1375779 (not c!127940)) b!1375776))

(assert (= (or b!1375773 b!1375776) bm!65747))

(assert (= (or b!1375773 b!1375776) bm!65748))

(assert (= (and b!1375779 res!918779) b!1375778))

(declare-fun m!1259263 () Bool)

(assert (=> b!1375772 m!1259263))

(assert (=> b!1375772 m!1259263))

(declare-fun m!1259265 () Bool)

(assert (=> b!1375772 m!1259265))

(declare-fun m!1259267 () Bool)

(assert (=> b!1375773 m!1259267))

(declare-fun m!1259269 () Bool)

(assert (=> b!1375773 m!1259269))

(declare-fun m!1259271 () Bool)

(assert (=> b!1375774 m!1259271))

(declare-fun m!1259273 () Bool)

(assert (=> b!1375774 m!1259273))

(declare-fun m!1259275 () Bool)

(assert (=> b!1375774 m!1259275))

(declare-fun m!1259277 () Bool)

(assert (=> b!1375775 m!1259277))

(declare-fun m!1259279 () Bool)

(assert (=> b!1375776 m!1259279))

(declare-fun m!1259281 () Bool)

(assert (=> b!1375776 m!1259281))

(declare-fun m!1259283 () Bool)

(assert (=> b!1375778 m!1259283))

(declare-fun m!1259285 () Bool)

(assert (=> b!1375778 m!1259285))

(declare-fun m!1259287 () Bool)

(assert (=> b!1375779 m!1259287))

(assert (=> b!1375779 m!1259287))

(declare-fun m!1259289 () Bool)

(assert (=> b!1375779 m!1259289))

(assert (=> bm!65748 m!1259283))

(assert (=> bm!65747 m!1259285))

(declare-fun m!1259291 () Bool)

(assert (=> start!116734 m!1259291))

(check-sat (not b!1375776) (not b!1375772) (not b!1375775) (not start!116734) (not bm!65747) (not bm!65748) (not b!1375778) (not b!1375779) (not b!1375774) (not b!1375773))
(check-sat)
