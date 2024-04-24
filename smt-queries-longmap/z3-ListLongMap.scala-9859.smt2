; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117070 () Bool)

(assert start!117070)

(declare-fun b!1378153 () Bool)

(declare-datatypes ((Unit!45572 0))(
  ( (Unit!45573) )
))
(declare-fun e!780763 () Unit!45572)

(declare-fun lt!605898 () Unit!45572)

(assert (=> b!1378153 (= e!780763 lt!605898)))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93625 0))(
  ( (array!93626 (arr!45211 (Array (_ BitVec 32) (_ BitVec 64))) (size!45762 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93625)

(declare-fun lt!605895 () Unit!45572)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93625 (_ BitVec 32) (_ BitVec 32)) Unit!45572)

(assert (=> b!1378153 (= lt!605895 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65926 () (_ BitVec 32))

(declare-fun lt!605892 () (_ BitVec 32))

(assert (=> b!1378153 (= call!65926 (bvadd #b00000000000000000000000000000001 lt!605892))))

(declare-fun lt!605893 () array!93625)

(assert (=> b!1378153 (= lt!605898 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605893 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65925 () (_ BitVec 32))

(declare-fun lt!605897 () (_ BitVec 32))

(assert (=> b!1378153 (= call!65925 (bvadd #b00000000000000000000000000000001 lt!605897))))

(declare-fun b!1378154 () Bool)

(declare-fun lt!605891 () Unit!45572)

(assert (=> b!1378154 (= e!780763 lt!605891)))

(declare-fun lt!605896 () Unit!45572)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93625 (_ BitVec 32) (_ BitVec 32)) Unit!45572)

(assert (=> b!1378154 (= lt!605896 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1378154 (= call!65926 lt!605892)))

(assert (=> b!1378154 (= lt!605891 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605893 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1378154 (= call!65925 lt!605897)))

(declare-fun bm!65922 () Bool)

(declare-fun arrayCountValidKeys!0 (array!93625 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!65922 (= call!65925 (arrayCountValidKeys!0 lt!605893 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1378155 () Bool)

(declare-fun res!920242 () Bool)

(declare-fun e!780765 () Bool)

(assert (=> b!1378155 (=> (not res!920242) (not e!780765))))

(assert (=> b!1378155 (= res!920242 (and (bvslt (size!45762 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45762 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1378156 () Bool)

(declare-fun e!780766 () Bool)

(assert (=> b!1378156 (= e!780765 e!780766)))

(declare-fun res!920240 () Bool)

(assert (=> b!1378156 (=> (not res!920240) (not e!780766))))

(assert (=> b!1378156 (= res!920240 (and (= lt!605897 lt!605892) (not (= to!206 (size!45762 a!4032)))))))

(assert (=> b!1378156 (= lt!605892 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1378156 (= lt!605897 (arrayCountValidKeys!0 lt!605893 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1378156 (= lt!605893 (array!93626 (store (arr!45211 a!4032) i!1445 k0!2947) (size!45762 a!4032)))))

(declare-fun b!1378157 () Bool)

(declare-fun res!920243 () Bool)

(assert (=> b!1378157 (=> (not res!920243) (not e!780765))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378157 (= res!920243 (validKeyInArray!0 (select (arr!45211 a!4032) i!1445)))))

(declare-fun bm!65923 () Bool)

(assert (=> bm!65923 (= call!65926 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun res!920244 () Bool)

(assert (=> start!117070 (=> (not res!920244) (not e!780765))))

(assert (=> start!117070 (= res!920244 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45762 a!4032))))))

(assert (=> start!117070 e!780765))

(assert (=> start!117070 true))

(declare-fun array_inv!34492 (array!93625) Bool)

(assert (=> start!117070 (array_inv!34492 a!4032)))

(declare-fun b!1378158 () Bool)

(assert (=> b!1378158 (= e!780766 false)))

(declare-fun lt!605894 () Unit!45572)

(assert (=> b!1378158 (= lt!605894 e!780763)))

(declare-fun c!128404 () Bool)

(assert (=> b!1378158 (= c!128404 (validKeyInArray!0 (select (arr!45211 a!4032) to!206)))))

(declare-fun b!1378159 () Bool)

(declare-fun res!920241 () Bool)

(assert (=> b!1378159 (=> (not res!920241) (not e!780765))))

(assert (=> b!1378159 (= res!920241 (not (validKeyInArray!0 k0!2947)))))

(assert (= (and start!117070 res!920244) b!1378157))

(assert (= (and b!1378157 res!920243) b!1378159))

(assert (= (and b!1378159 res!920241) b!1378155))

(assert (= (and b!1378155 res!920242) b!1378156))

(assert (= (and b!1378156 res!920240) b!1378158))

(assert (= (and b!1378158 c!128404) b!1378153))

(assert (= (and b!1378158 (not c!128404)) b!1378154))

(assert (= (or b!1378153 b!1378154) bm!65923))

(assert (= (or b!1378153 b!1378154) bm!65922))

(declare-fun m!1262571 () Bool)

(assert (=> bm!65923 m!1262571))

(declare-fun m!1262573 () Bool)

(assert (=> b!1378156 m!1262573))

(declare-fun m!1262575 () Bool)

(assert (=> b!1378156 m!1262575))

(declare-fun m!1262577 () Bool)

(assert (=> b!1378156 m!1262577))

(declare-fun m!1262579 () Bool)

(assert (=> start!117070 m!1262579))

(declare-fun m!1262581 () Bool)

(assert (=> b!1378159 m!1262581))

(declare-fun m!1262583 () Bool)

(assert (=> b!1378153 m!1262583))

(declare-fun m!1262585 () Bool)

(assert (=> b!1378153 m!1262585))

(declare-fun m!1262587 () Bool)

(assert (=> b!1378157 m!1262587))

(assert (=> b!1378157 m!1262587))

(declare-fun m!1262589 () Bool)

(assert (=> b!1378157 m!1262589))

(declare-fun m!1262591 () Bool)

(assert (=> bm!65922 m!1262591))

(declare-fun m!1262593 () Bool)

(assert (=> b!1378158 m!1262593))

(assert (=> b!1378158 m!1262593))

(declare-fun m!1262595 () Bool)

(assert (=> b!1378158 m!1262595))

(declare-fun m!1262597 () Bool)

(assert (=> b!1378154 m!1262597))

(declare-fun m!1262599 () Bool)

(assert (=> b!1378154 m!1262599))

(check-sat (not bm!65922) (not b!1378156) (not b!1378153) (not start!117070) (not bm!65923) (not b!1378159) (not b!1378154) (not b!1378158) (not b!1378157))
(check-sat)
