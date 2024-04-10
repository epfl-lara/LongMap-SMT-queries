; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116732 () Bool)

(assert start!116732)

(declare-fun b!1375761 () Bool)

(declare-fun e!779375 () Bool)

(declare-fun e!779376 () Bool)

(assert (=> b!1375761 (= e!779375 e!779376)))

(declare-fun res!918751 () Bool)

(assert (=> b!1375761 (=> (not res!918751) (not e!779376))))

(declare-fun to!206 () (_ BitVec 32))

(declare-datatypes ((array!93401 0))(
  ( (array!93402 (arr!45104 (Array (_ BitVec 32) (_ BitVec 64))) (size!45654 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93401)

(declare-fun lt!604771 () (_ BitVec 32))

(declare-fun lt!604774 () (_ BitVec 32))

(assert (=> b!1375761 (= res!918751 (and (= lt!604771 lt!604774) (not (= to!206 (size!45654 a!4032)))))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93401 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375761 (= lt!604774 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!604773 () array!93401)

(assert (=> b!1375761 (= lt!604771 (arrayCountValidKeys!0 lt!604773 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k!2947 () (_ BitVec 64))

(assert (=> b!1375761 (= lt!604773 (array!93402 (store (arr!45104 a!4032) i!1445 k!2947) (size!45654 a!4032)))))

(declare-fun b!1375762 () Bool)

(declare-datatypes ((Unit!45573 0))(
  ( (Unit!45574) )
))
(declare-fun e!779374 () Unit!45573)

(declare-fun lt!604770 () Unit!45573)

(assert (=> b!1375762 (= e!779374 lt!604770)))

(declare-fun lt!604769 () Unit!45573)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93401 (_ BitVec 32) (_ BitVec 32)) Unit!45573)

(assert (=> b!1375762 (= lt!604769 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65749 () (_ BitVec 32))

(assert (=> b!1375762 (= call!65749 lt!604774)))

(assert (=> b!1375762 (= lt!604770 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!604773 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65750 () (_ BitVec 32))

(assert (=> b!1375762 (= call!65750 lt!604771)))

(declare-fun b!1375763 () Bool)

(declare-fun lt!604772 () Unit!45573)

(assert (=> b!1375763 (= e!779374 lt!604772)))

(declare-fun lt!604767 () Unit!45573)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93401 (_ BitVec 32) (_ BitVec 32)) Unit!45573)

(assert (=> b!1375763 (= lt!604767 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375763 (= call!65749 (bvadd #b00000000000000000000000000000001 lt!604774))))

(assert (=> b!1375763 (= lt!604772 (lemmaValidKeyIncreasesNumOfKeys!0 lt!604773 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375763 (= call!65750 (bvadd #b00000000000000000000000000000001 lt!604771))))

(declare-fun res!918750 () Bool)

(assert (=> start!116732 (=> (not res!918750) (not e!779375))))

(assert (=> start!116732 (= res!918750 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45654 a!4032))))))

(assert (=> start!116732 e!779375))

(assert (=> start!116732 true))

(declare-fun array_inv!34132 (array!93401) Bool)

(assert (=> start!116732 (array_inv!34132 a!4032)))

(declare-fun b!1375764 () Bool)

(declare-fun res!918752 () Bool)

(assert (=> b!1375764 (=> (not res!918752) (not e!779375))))

(assert (=> b!1375764 (= res!918752 (and (bvslt (size!45654 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45654 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1375765 () Bool)

(declare-fun e!779377 () Bool)

(assert (=> b!1375765 (= e!779376 e!779377)))

(declare-fun res!918753 () Bool)

(assert (=> b!1375765 (=> (not res!918753) (not e!779377))))

(assert (=> b!1375765 (= res!918753 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45654 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!604765 () Unit!45573)

(assert (=> b!1375765 (= lt!604765 e!779374)))

(declare-fun c!127946 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375765 (= c!127946 (validKeyInArray!0 (select (arr!45104 a!4032) to!206)))))

(declare-fun bm!65746 () Bool)

(assert (=> bm!65746 (= call!65749 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375766 () Bool)

(declare-fun res!918754 () Bool)

(assert (=> b!1375766 (=> (not res!918754) (not e!779375))))

(assert (=> b!1375766 (= res!918754 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1375767 () Bool)

(assert (=> b!1375767 (= e!779377 false)))

(declare-fun lt!604766 () (_ BitVec 32))

(assert (=> b!1375767 (= lt!604766 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun lt!604768 () (_ BitVec 32))

(assert (=> b!1375767 (= lt!604768 (arrayCountValidKeys!0 lt!604773 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun bm!65747 () Bool)

(assert (=> bm!65747 (= call!65750 (arrayCountValidKeys!0 lt!604773 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375768 () Bool)

(declare-fun res!918749 () Bool)

(assert (=> b!1375768 (=> (not res!918749) (not e!779375))))

(assert (=> b!1375768 (= res!918749 (validKeyInArray!0 (select (arr!45104 a!4032) i!1445)))))

(assert (= (and start!116732 res!918750) b!1375768))

(assert (= (and b!1375768 res!918749) b!1375766))

(assert (= (and b!1375766 res!918754) b!1375764))

(assert (= (and b!1375764 res!918752) b!1375761))

(assert (= (and b!1375761 res!918751) b!1375765))

(assert (= (and b!1375765 c!127946) b!1375763))

(assert (= (and b!1375765 (not c!127946)) b!1375762))

(assert (= (or b!1375763 b!1375762) bm!65746))

(assert (= (or b!1375763 b!1375762) bm!65747))

(assert (= (and b!1375765 res!918753) b!1375767))

(declare-fun m!1259671 () Bool)

(assert (=> start!116732 m!1259671))

(declare-fun m!1259673 () Bool)

(assert (=> b!1375767 m!1259673))

(declare-fun m!1259675 () Bool)

(assert (=> b!1375767 m!1259675))

(assert (=> bm!65747 m!1259675))

(declare-fun m!1259677 () Bool)

(assert (=> b!1375763 m!1259677))

(declare-fun m!1259679 () Bool)

(assert (=> b!1375763 m!1259679))

(declare-fun m!1259681 () Bool)

(assert (=> b!1375766 m!1259681))

(declare-fun m!1259683 () Bool)

(assert (=> b!1375765 m!1259683))

(assert (=> b!1375765 m!1259683))

(declare-fun m!1259685 () Bool)

(assert (=> b!1375765 m!1259685))

(assert (=> bm!65746 m!1259673))

(declare-fun m!1259687 () Bool)

(assert (=> b!1375762 m!1259687))

(declare-fun m!1259689 () Bool)

(assert (=> b!1375762 m!1259689))

(declare-fun m!1259691 () Bool)

(assert (=> b!1375761 m!1259691))

(declare-fun m!1259693 () Bool)

(assert (=> b!1375761 m!1259693))

(declare-fun m!1259695 () Bool)

(assert (=> b!1375761 m!1259695))

(declare-fun m!1259697 () Bool)

(assert (=> b!1375768 m!1259697))

(assert (=> b!1375768 m!1259697))

(declare-fun m!1259699 () Bool)

(assert (=> b!1375768 m!1259699))

(push 1)

(assert (not bm!65746))

(assert (not bm!65747))

(assert (not b!1375765))

(assert (not b!1375761))

(assert (not b!1375763))

(assert (not b!1375767))

(assert (not b!1375766))

(assert (not b!1375762))

