; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116736 () Bool)

(assert start!116736)

(declare-fun b!1375809 () Bool)

(declare-fun res!918789 () Bool)

(declare-fun e!779406 () Bool)

(assert (=> b!1375809 (=> (not res!918789) (not e!779406))))

(declare-datatypes ((array!93405 0))(
  ( (array!93406 (arr!45106 (Array (_ BitVec 32) (_ BitVec 64))) (size!45656 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93405)

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375809 (= res!918789 (validKeyInArray!0 (select (arr!45106 a!4032) i!1445)))))

(declare-fun b!1375810 () Bool)

(declare-fun e!779405 () Bool)

(assert (=> b!1375810 (= e!779406 e!779405)))

(declare-fun res!918790 () Bool)

(assert (=> b!1375810 (=> (not res!918790) (not e!779405))))

(declare-fun lt!604832 () (_ BitVec 32))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun lt!604825 () (_ BitVec 32))

(assert (=> b!1375810 (= res!918790 (and (= lt!604832 lt!604825) (not (= to!206 (size!45656 a!4032)))))))

(declare-fun arrayCountValidKeys!0 (array!93405 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375810 (= lt!604825 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!604831 () array!93405)

(assert (=> b!1375810 (= lt!604832 (arrayCountValidKeys!0 lt!604831 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k!2947 () (_ BitVec 64))

(assert (=> b!1375810 (= lt!604831 (array!93406 (store (arr!45106 a!4032) i!1445 k!2947) (size!45656 a!4032)))))

(declare-fun bm!65758 () Bool)

(declare-fun call!65761 () (_ BitVec 32))

(assert (=> bm!65758 (= call!65761 (arrayCountValidKeys!0 lt!604831 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375811 () Bool)

(declare-fun res!918788 () Bool)

(assert (=> b!1375811 (=> (not res!918788) (not e!779406))))

(assert (=> b!1375811 (= res!918788 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1375812 () Bool)

(declare-fun res!918786 () Bool)

(assert (=> b!1375812 (=> (not res!918786) (not e!779406))))

(assert (=> b!1375812 (= res!918786 (and (bvslt (size!45656 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45656 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1375813 () Bool)

(declare-fun e!779403 () Bool)

(assert (=> b!1375813 (= e!779405 e!779403)))

(declare-fun res!918787 () Bool)

(assert (=> b!1375813 (=> (not res!918787) (not e!779403))))

(assert (=> b!1375813 (= res!918787 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45656 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-datatypes ((Unit!45577 0))(
  ( (Unit!45578) )
))
(declare-fun lt!604830 () Unit!45577)

(declare-fun e!779407 () Unit!45577)

(assert (=> b!1375813 (= lt!604830 e!779407)))

(declare-fun c!127952 () Bool)

(assert (=> b!1375813 (= c!127952 (validKeyInArray!0 (select (arr!45106 a!4032) to!206)))))

(declare-fun b!1375814 () Bool)

(declare-fun lt!604828 () Unit!45577)

(assert (=> b!1375814 (= e!779407 lt!604828)))

(declare-fun lt!604829 () Unit!45577)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93405 (_ BitVec 32) (_ BitVec 32)) Unit!45577)

(assert (=> b!1375814 (= lt!604829 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65762 () (_ BitVec 32))

(assert (=> b!1375814 (= call!65762 (bvadd #b00000000000000000000000000000001 lt!604825))))

(assert (=> b!1375814 (= lt!604828 (lemmaValidKeyIncreasesNumOfKeys!0 lt!604831 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375814 (= call!65761 (bvadd #b00000000000000000000000000000001 lt!604832))))

(declare-fun b!1375815 () Bool)

(declare-fun lt!604827 () Unit!45577)

(assert (=> b!1375815 (= e!779407 lt!604827)))

(declare-fun lt!604834 () Unit!45577)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93405 (_ BitVec 32) (_ BitVec 32)) Unit!45577)

(assert (=> b!1375815 (= lt!604834 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375815 (= call!65762 lt!604825)))

(assert (=> b!1375815 (= lt!604827 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!604831 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375815 (= call!65761 lt!604832)))

(declare-fun b!1375816 () Bool)

(assert (=> b!1375816 (= e!779403 false)))

(declare-fun lt!604833 () (_ BitVec 32))

(assert (=> b!1375816 (= lt!604833 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun lt!604826 () (_ BitVec 32))

(assert (=> b!1375816 (= lt!604826 (arrayCountValidKeys!0 lt!604831 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun bm!65759 () Bool)

(assert (=> bm!65759 (= call!65762 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun res!918785 () Bool)

(assert (=> start!116736 (=> (not res!918785) (not e!779406))))

(assert (=> start!116736 (= res!918785 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45656 a!4032))))))

(assert (=> start!116736 e!779406))

(assert (=> start!116736 true))

(declare-fun array_inv!34134 (array!93405) Bool)

(assert (=> start!116736 (array_inv!34134 a!4032)))

(assert (= (and start!116736 res!918785) b!1375809))

(assert (= (and b!1375809 res!918789) b!1375811))

(assert (= (and b!1375811 res!918788) b!1375812))

(assert (= (and b!1375812 res!918786) b!1375810))

(assert (= (and b!1375810 res!918790) b!1375813))

(assert (= (and b!1375813 c!127952) b!1375814))

(assert (= (and b!1375813 (not c!127952)) b!1375815))

(assert (= (or b!1375814 b!1375815) bm!65758))

(assert (= (or b!1375814 b!1375815) bm!65759))

(assert (= (and b!1375813 res!918787) b!1375816))

(declare-fun m!1259731 () Bool)

(assert (=> b!1375811 m!1259731))

(declare-fun m!1259733 () Bool)

(assert (=> bm!65758 m!1259733))

(declare-fun m!1259735 () Bool)

(assert (=> b!1375814 m!1259735))

(declare-fun m!1259737 () Bool)

(assert (=> b!1375814 m!1259737))

(declare-fun m!1259739 () Bool)

(assert (=> b!1375813 m!1259739))

(assert (=> b!1375813 m!1259739))

(declare-fun m!1259741 () Bool)

(assert (=> b!1375813 m!1259741))

(declare-fun m!1259743 () Bool)

(assert (=> b!1375816 m!1259743))

(assert (=> b!1375816 m!1259733))

(declare-fun m!1259745 () Bool)

(assert (=> b!1375815 m!1259745))

(declare-fun m!1259747 () Bool)

(assert (=> b!1375815 m!1259747))

(assert (=> bm!65759 m!1259743))

(declare-fun m!1259749 () Bool)

(assert (=> b!1375809 m!1259749))

(assert (=> b!1375809 m!1259749))

(declare-fun m!1259751 () Bool)

(assert (=> b!1375809 m!1259751))

(declare-fun m!1259753 () Bool)

(assert (=> start!116736 m!1259753))

(declare-fun m!1259755 () Bool)

(assert (=> b!1375810 m!1259755))

(declare-fun m!1259757 () Bool)

(assert (=> b!1375810 m!1259757))

(declare-fun m!1259759 () Bool)

(assert (=> b!1375810 m!1259759))

(push 1)

(assert (not b!1375814))

(assert (not bm!65759))

(assert (not b!1375813))

(assert (not b!1375816))

(assert (not b!1375809))

(assert (not b!1375811))

(assert (not start!116736))

(assert (not bm!65758))

(assert (not b!1375810))

(assert (not b!1375815))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

