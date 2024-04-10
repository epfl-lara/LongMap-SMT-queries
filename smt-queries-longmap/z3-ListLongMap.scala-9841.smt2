; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116734 () Bool)

(assert start!116734)

(declare-fun call!65756 () (_ BitVec 32))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93403 0))(
  ( (array!93404 (arr!45105 (Array (_ BitVec 32) (_ BitVec 64))) (size!45655 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93403)

(declare-fun bm!65752 () Bool)

(declare-fun arrayCountValidKeys!0 (array!93403 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!65752 (= call!65756 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375785 () Bool)

(declare-fun e!779391 () Bool)

(declare-fun e!779388 () Bool)

(assert (=> b!1375785 (= e!779391 e!779388)))

(declare-fun res!918769 () Bool)

(assert (=> b!1375785 (=> (not res!918769) (not e!779388))))

(declare-fun lt!604801 () (_ BitVec 32))

(declare-fun lt!604797 () (_ BitVec 32))

(assert (=> b!1375785 (= res!918769 (and (= lt!604797 lt!604801) (not (= to!206 (size!45655 a!4032)))))))

(assert (=> b!1375785 (= lt!604801 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!604802 () array!93403)

(assert (=> b!1375785 (= lt!604797 (arrayCountValidKeys!0 lt!604802 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1375785 (= lt!604802 (array!93404 (store (arr!45105 a!4032) i!1445 k0!2947) (size!45655 a!4032)))))

(declare-fun b!1375786 () Bool)

(declare-datatypes ((Unit!45575 0))(
  ( (Unit!45576) )
))
(declare-fun e!779390 () Unit!45575)

(declare-fun lt!604798 () Unit!45575)

(assert (=> b!1375786 (= e!779390 lt!604798)))

(declare-fun lt!604796 () Unit!45575)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93403 (_ BitVec 32) (_ BitVec 32)) Unit!45575)

(assert (=> b!1375786 (= lt!604796 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375786 (= call!65756 (bvadd #b00000000000000000000000000000001 lt!604801))))

(assert (=> b!1375786 (= lt!604798 (lemmaValidKeyIncreasesNumOfKeys!0 lt!604802 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65755 () (_ BitVec 32))

(assert (=> b!1375786 (= call!65755 (bvadd #b00000000000000000000000000000001 lt!604797))))

(declare-fun b!1375787 () Bool)

(declare-fun e!779392 () Bool)

(assert (=> b!1375787 (= e!779392 false)))

(declare-fun lt!604799 () (_ BitVec 32))

(assert (=> b!1375787 (= lt!604799 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun lt!604795 () (_ BitVec 32))

(assert (=> b!1375787 (= lt!604795 (arrayCountValidKeys!0 lt!604802 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375788 () Bool)

(declare-fun res!918772 () Bool)

(assert (=> b!1375788 (=> (not res!918772) (not e!779391))))

(assert (=> b!1375788 (= res!918772 (and (bvslt (size!45655 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45655 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun bm!65753 () Bool)

(assert (=> bm!65753 (= call!65755 (arrayCountValidKeys!0 lt!604802 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375790 () Bool)

(declare-fun res!918768 () Bool)

(assert (=> b!1375790 (=> (not res!918768) (not e!779391))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375790 (= res!918768 (not (validKeyInArray!0 k0!2947)))))

(declare-fun res!918770 () Bool)

(assert (=> start!116734 (=> (not res!918770) (not e!779391))))

(assert (=> start!116734 (= res!918770 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45655 a!4032))))))

(assert (=> start!116734 e!779391))

(assert (=> start!116734 true))

(declare-fun array_inv!34133 (array!93403) Bool)

(assert (=> start!116734 (array_inv!34133 a!4032)))

(declare-fun b!1375789 () Bool)

(assert (=> b!1375789 (= e!779388 e!779392)))

(declare-fun res!918771 () Bool)

(assert (=> b!1375789 (=> (not res!918771) (not e!779392))))

(assert (=> b!1375789 (= res!918771 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45655 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!604804 () Unit!45575)

(assert (=> b!1375789 (= lt!604804 e!779390)))

(declare-fun c!127949 () Bool)

(assert (=> b!1375789 (= c!127949 (validKeyInArray!0 (select (arr!45105 a!4032) to!206)))))

(declare-fun b!1375791 () Bool)

(declare-fun res!918767 () Bool)

(assert (=> b!1375791 (=> (not res!918767) (not e!779391))))

(assert (=> b!1375791 (= res!918767 (validKeyInArray!0 (select (arr!45105 a!4032) i!1445)))))

(declare-fun b!1375792 () Bool)

(declare-fun lt!604803 () Unit!45575)

(assert (=> b!1375792 (= e!779390 lt!604803)))

(declare-fun lt!604800 () Unit!45575)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93403 (_ BitVec 32) (_ BitVec 32)) Unit!45575)

(assert (=> b!1375792 (= lt!604800 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375792 (= call!65756 lt!604801)))

(assert (=> b!1375792 (= lt!604803 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!604802 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375792 (= call!65755 lt!604797)))

(assert (= (and start!116734 res!918770) b!1375791))

(assert (= (and b!1375791 res!918767) b!1375790))

(assert (= (and b!1375790 res!918768) b!1375788))

(assert (= (and b!1375788 res!918772) b!1375785))

(assert (= (and b!1375785 res!918769) b!1375789))

(assert (= (and b!1375789 c!127949) b!1375786))

(assert (= (and b!1375789 (not c!127949)) b!1375792))

(assert (= (or b!1375786 b!1375792) bm!65753))

(assert (= (or b!1375786 b!1375792) bm!65752))

(assert (= (and b!1375789 res!918771) b!1375787))

(declare-fun m!1259701 () Bool)

(assert (=> b!1375791 m!1259701))

(assert (=> b!1375791 m!1259701))

(declare-fun m!1259703 () Bool)

(assert (=> b!1375791 m!1259703))

(declare-fun m!1259705 () Bool)

(assert (=> bm!65752 m!1259705))

(declare-fun m!1259707 () Bool)

(assert (=> b!1375790 m!1259707))

(declare-fun m!1259709 () Bool)

(assert (=> b!1375785 m!1259709))

(declare-fun m!1259711 () Bool)

(assert (=> b!1375785 m!1259711))

(declare-fun m!1259713 () Bool)

(assert (=> b!1375785 m!1259713))

(declare-fun m!1259715 () Bool)

(assert (=> start!116734 m!1259715))

(declare-fun m!1259717 () Bool)

(assert (=> b!1375789 m!1259717))

(assert (=> b!1375789 m!1259717))

(declare-fun m!1259719 () Bool)

(assert (=> b!1375789 m!1259719))

(assert (=> b!1375787 m!1259705))

(declare-fun m!1259721 () Bool)

(assert (=> b!1375787 m!1259721))

(declare-fun m!1259723 () Bool)

(assert (=> b!1375792 m!1259723))

(declare-fun m!1259725 () Bool)

(assert (=> b!1375792 m!1259725))

(assert (=> bm!65753 m!1259721))

(declare-fun m!1259727 () Bool)

(assert (=> b!1375786 m!1259727))

(declare-fun m!1259729 () Bool)

(assert (=> b!1375786 m!1259729))

(check-sat (not b!1375791) (not b!1375789) (not bm!65752) (not b!1375787) (not start!116734) (not b!1375790) (not b!1375792) (not b!1375785) (not b!1375786) (not bm!65753))
