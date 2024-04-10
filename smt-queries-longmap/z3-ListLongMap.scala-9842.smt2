; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116740 () Bool)

(assert start!116740)

(declare-fun b!1375857 () Bool)

(declare-datatypes ((Unit!45581 0))(
  ( (Unit!45582) )
))
(declare-fun e!779434 () Unit!45581)

(declare-fun lt!604891 () Unit!45581)

(assert (=> b!1375857 (= e!779434 lt!604891)))

(declare-fun lt!604887 () Unit!45581)

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93409 0))(
  ( (array!93410 (arr!45108 (Array (_ BitVec 32) (_ BitVec 64))) (size!45658 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93409)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93409 (_ BitVec 32) (_ BitVec 32)) Unit!45581)

(assert (=> b!1375857 (= lt!604887 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65774 () (_ BitVec 32))

(declare-fun lt!604886 () (_ BitVec 32))

(assert (=> b!1375857 (= call!65774 lt!604886)))

(declare-fun lt!604888 () array!93409)

(assert (=> b!1375857 (= lt!604891 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!604888 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65773 () (_ BitVec 32))

(declare-fun lt!604889 () (_ BitVec 32))

(assert (=> b!1375857 (= call!65773 lt!604889)))

(declare-fun b!1375858 () Bool)

(declare-fun e!779436 () Bool)

(declare-fun e!779433 () Bool)

(assert (=> b!1375858 (= e!779436 e!779433)))

(declare-fun res!918824 () Bool)

(assert (=> b!1375858 (=> (not res!918824) (not e!779433))))

(assert (=> b!1375858 (= res!918824 (and (= lt!604889 lt!604886) (not (= to!206 (size!45658 a!4032)))))))

(declare-fun arrayCountValidKeys!0 (array!93409 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375858 (= lt!604886 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375858 (= lt!604889 (arrayCountValidKeys!0 lt!604888 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1375858 (= lt!604888 (array!93410 (store (arr!45108 a!4032) i!1445 k0!2947) (size!45658 a!4032)))))

(declare-fun b!1375859 () Bool)

(declare-fun res!918823 () Bool)

(assert (=> b!1375859 (=> (not res!918823) (not e!779436))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375859 (= res!918823 (validKeyInArray!0 (select (arr!45108 a!4032) i!1445)))))

(declare-fun b!1375860 () Bool)

(declare-fun e!779437 () Bool)

(assert (=> b!1375860 (= e!779433 e!779437)))

(declare-fun res!918822 () Bool)

(assert (=> b!1375860 (=> (not res!918822) (not e!779437))))

(assert (=> b!1375860 (= res!918822 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45658 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!604893 () Unit!45581)

(assert (=> b!1375860 (= lt!604893 e!779434)))

(declare-fun c!127958 () Bool)

(assert (=> b!1375860 (= c!127958 (validKeyInArray!0 (select (arr!45108 a!4032) to!206)))))

(declare-fun b!1375861 () Bool)

(declare-fun res!918821 () Bool)

(assert (=> b!1375861 (=> (not res!918821) (not e!779436))))

(assert (=> b!1375861 (= res!918821 (and (bvslt (size!45658 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45658 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun bm!65770 () Bool)

(assert (=> bm!65770 (= call!65774 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375862 () Bool)

(assert (=> b!1375862 (= e!779437 false)))

(declare-fun lt!604885 () (_ BitVec 32))

(assert (=> b!1375862 (= lt!604885 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun lt!604892 () (_ BitVec 32))

(assert (=> b!1375862 (= lt!604892 (arrayCountValidKeys!0 lt!604888 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun res!918826 () Bool)

(assert (=> start!116740 (=> (not res!918826) (not e!779436))))

(assert (=> start!116740 (= res!918826 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45658 a!4032))))))

(assert (=> start!116740 e!779436))

(assert (=> start!116740 true))

(declare-fun array_inv!34136 (array!93409) Bool)

(assert (=> start!116740 (array_inv!34136 a!4032)))

(declare-fun bm!65771 () Bool)

(assert (=> bm!65771 (= call!65773 (arrayCountValidKeys!0 lt!604888 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375863 () Bool)

(declare-fun res!918825 () Bool)

(assert (=> b!1375863 (=> (not res!918825) (not e!779436))))

(assert (=> b!1375863 (= res!918825 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1375864 () Bool)

(declare-fun lt!604890 () Unit!45581)

(assert (=> b!1375864 (= e!779434 lt!604890)))

(declare-fun lt!604894 () Unit!45581)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93409 (_ BitVec 32) (_ BitVec 32)) Unit!45581)

(assert (=> b!1375864 (= lt!604894 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375864 (= call!65774 (bvadd #b00000000000000000000000000000001 lt!604886))))

(assert (=> b!1375864 (= lt!604890 (lemmaValidKeyIncreasesNumOfKeys!0 lt!604888 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375864 (= call!65773 (bvadd #b00000000000000000000000000000001 lt!604889))))

(assert (= (and start!116740 res!918826) b!1375859))

(assert (= (and b!1375859 res!918823) b!1375863))

(assert (= (and b!1375863 res!918825) b!1375861))

(assert (= (and b!1375861 res!918821) b!1375858))

(assert (= (and b!1375858 res!918824) b!1375860))

(assert (= (and b!1375860 c!127958) b!1375864))

(assert (= (and b!1375860 (not c!127958)) b!1375857))

(assert (= (or b!1375864 b!1375857) bm!65771))

(assert (= (or b!1375864 b!1375857) bm!65770))

(assert (= (and b!1375860 res!918822) b!1375862))

(declare-fun m!1259791 () Bool)

(assert (=> b!1375858 m!1259791))

(declare-fun m!1259793 () Bool)

(assert (=> b!1375858 m!1259793))

(declare-fun m!1259795 () Bool)

(assert (=> b!1375858 m!1259795))

(declare-fun m!1259797 () Bool)

(assert (=> b!1375857 m!1259797))

(declare-fun m!1259799 () Bool)

(assert (=> b!1375857 m!1259799))

(declare-fun m!1259801 () Bool)

(assert (=> b!1375860 m!1259801))

(assert (=> b!1375860 m!1259801))

(declare-fun m!1259803 () Bool)

(assert (=> b!1375860 m!1259803))

(declare-fun m!1259805 () Bool)

(assert (=> bm!65771 m!1259805))

(declare-fun m!1259807 () Bool)

(assert (=> start!116740 m!1259807))

(declare-fun m!1259809 () Bool)

(assert (=> b!1375863 m!1259809))

(declare-fun m!1259811 () Bool)

(assert (=> b!1375862 m!1259811))

(assert (=> b!1375862 m!1259805))

(assert (=> bm!65770 m!1259811))

(declare-fun m!1259813 () Bool)

(assert (=> b!1375859 m!1259813))

(assert (=> b!1375859 m!1259813))

(declare-fun m!1259815 () Bool)

(assert (=> b!1375859 m!1259815))

(declare-fun m!1259817 () Bool)

(assert (=> b!1375864 m!1259817))

(declare-fun m!1259819 () Bool)

(assert (=> b!1375864 m!1259819))

(check-sat (not b!1375860) (not b!1375864) (not b!1375863) (not b!1375858) (not bm!65771) (not b!1375862) (not b!1375859) (not bm!65770) (not start!116740) (not b!1375857))
