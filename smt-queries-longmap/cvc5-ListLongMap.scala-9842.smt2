; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116738 () Bool)

(assert start!116738)

(declare-fun res!918803 () Bool)

(declare-fun e!779422 () Bool)

(assert (=> start!116738 (=> (not res!918803) (not e!779422))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93407 0))(
  ( (array!93408 (arr!45107 (Array (_ BitVec 32) (_ BitVec 64))) (size!45657 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93407)

(assert (=> start!116738 (= res!918803 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45657 a!4032))))))

(assert (=> start!116738 e!779422))

(assert (=> start!116738 true))

(declare-fun array_inv!34135 (array!93407) Bool)

(assert (=> start!116738 (array_inv!34135 a!4032)))

(declare-fun b!1375833 () Bool)

(declare-datatypes ((Unit!45579 0))(
  ( (Unit!45580) )
))
(declare-fun e!779420 () Unit!45579)

(declare-fun lt!604858 () Unit!45579)

(assert (=> b!1375833 (= e!779420 lt!604858)))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun lt!604860 () Unit!45579)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93407 (_ BitVec 32) (_ BitVec 32)) Unit!45579)

(assert (=> b!1375833 (= lt!604860 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65767 () (_ BitVec 32))

(declare-fun lt!604862 () (_ BitVec 32))

(assert (=> b!1375833 (= call!65767 (bvadd #b00000000000000000000000000000001 lt!604862))))

(declare-fun lt!604856 () array!93407)

(assert (=> b!1375833 (= lt!604858 (lemmaValidKeyIncreasesNumOfKeys!0 lt!604856 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65768 () (_ BitVec 32))

(declare-fun lt!604859 () (_ BitVec 32))

(assert (=> b!1375833 (= call!65768 (bvadd #b00000000000000000000000000000001 lt!604859))))

(declare-fun b!1375834 () Bool)

(declare-fun lt!604857 () Unit!45579)

(assert (=> b!1375834 (= e!779420 lt!604857)))

(declare-fun lt!604855 () Unit!45579)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93407 (_ BitVec 32) (_ BitVec 32)) Unit!45579)

(assert (=> b!1375834 (= lt!604855 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375834 (= call!65767 lt!604862)))

(assert (=> b!1375834 (= lt!604857 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!604856 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375834 (= call!65768 lt!604859)))

(declare-fun b!1375835 () Bool)

(declare-fun e!779418 () Bool)

(assert (=> b!1375835 (= e!779418 false)))

(declare-fun lt!604864 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93407 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375835 (= lt!604864 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun lt!604861 () (_ BitVec 32))

(assert (=> b!1375835 (= lt!604861 (arrayCountValidKeys!0 lt!604856 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375836 () Bool)

(declare-fun res!918808 () Bool)

(assert (=> b!1375836 (=> (not res!918808) (not e!779422))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375836 (= res!918808 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1375837 () Bool)

(declare-fun e!779421 () Bool)

(assert (=> b!1375837 (= e!779422 e!779421)))

(declare-fun res!918807 () Bool)

(assert (=> b!1375837 (=> (not res!918807) (not e!779421))))

(assert (=> b!1375837 (= res!918807 (and (= lt!604859 lt!604862) (not (= to!206 (size!45657 a!4032)))))))

(assert (=> b!1375837 (= lt!604862 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375837 (= lt!604859 (arrayCountValidKeys!0 lt!604856 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375837 (= lt!604856 (array!93408 (store (arr!45107 a!4032) i!1445 k!2947) (size!45657 a!4032)))))

(declare-fun b!1375838 () Bool)

(assert (=> b!1375838 (= e!779421 e!779418)))

(declare-fun res!918804 () Bool)

(assert (=> b!1375838 (=> (not res!918804) (not e!779418))))

(assert (=> b!1375838 (= res!918804 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45657 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!604863 () Unit!45579)

(assert (=> b!1375838 (= lt!604863 e!779420)))

(declare-fun c!127955 () Bool)

(assert (=> b!1375838 (= c!127955 (validKeyInArray!0 (select (arr!45107 a!4032) to!206)))))

(declare-fun bm!65764 () Bool)

(assert (=> bm!65764 (= call!65767 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375839 () Bool)

(declare-fun res!918806 () Bool)

(assert (=> b!1375839 (=> (not res!918806) (not e!779422))))

(assert (=> b!1375839 (= res!918806 (and (bvslt (size!45657 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45657 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1375840 () Bool)

(declare-fun res!918805 () Bool)

(assert (=> b!1375840 (=> (not res!918805) (not e!779422))))

(assert (=> b!1375840 (= res!918805 (validKeyInArray!0 (select (arr!45107 a!4032) i!1445)))))

(declare-fun bm!65765 () Bool)

(assert (=> bm!65765 (= call!65768 (arrayCountValidKeys!0 lt!604856 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(assert (= (and start!116738 res!918803) b!1375840))

(assert (= (and b!1375840 res!918805) b!1375836))

(assert (= (and b!1375836 res!918808) b!1375839))

(assert (= (and b!1375839 res!918806) b!1375837))

(assert (= (and b!1375837 res!918807) b!1375838))

(assert (= (and b!1375838 c!127955) b!1375833))

(assert (= (and b!1375838 (not c!127955)) b!1375834))

(assert (= (or b!1375833 b!1375834) bm!65764))

(assert (= (or b!1375833 b!1375834) bm!65765))

(assert (= (and b!1375838 res!918804) b!1375835))

(declare-fun m!1259761 () Bool)

(assert (=> b!1375834 m!1259761))

(declare-fun m!1259763 () Bool)

(assert (=> b!1375834 m!1259763))

(declare-fun m!1259765 () Bool)

(assert (=> bm!65765 m!1259765))

(declare-fun m!1259767 () Bool)

(assert (=> b!1375837 m!1259767))

(declare-fun m!1259769 () Bool)

(assert (=> b!1375837 m!1259769))

(declare-fun m!1259771 () Bool)

(assert (=> b!1375837 m!1259771))

(declare-fun m!1259773 () Bool)

(assert (=> bm!65764 m!1259773))

(assert (=> b!1375835 m!1259773))

(assert (=> b!1375835 m!1259765))

(declare-fun m!1259775 () Bool)

(assert (=> b!1375833 m!1259775))

(declare-fun m!1259777 () Bool)

(assert (=> b!1375833 m!1259777))

(declare-fun m!1259779 () Bool)

(assert (=> b!1375836 m!1259779))

(declare-fun m!1259781 () Bool)

(assert (=> b!1375838 m!1259781))

(assert (=> b!1375838 m!1259781))

(declare-fun m!1259783 () Bool)

(assert (=> b!1375838 m!1259783))

(declare-fun m!1259785 () Bool)

(assert (=> start!116738 m!1259785))

(declare-fun m!1259787 () Bool)

(assert (=> b!1375840 m!1259787))

(assert (=> b!1375840 m!1259787))

(declare-fun m!1259789 () Bool)

(assert (=> b!1375840 m!1259789))

(push 1)

(assert (not start!116738))

(assert (not b!1375835))

(assert (not b!1375838))

(assert (not bm!65764))

