; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116836 () Bool)

(assert start!116836)

(declare-fun b!1376797 () Bool)

(declare-fun e!779887 () Bool)

(declare-fun e!779890 () Bool)

(assert (=> b!1376797 (= e!779887 e!779890)))

(declare-fun res!919681 () Bool)

(assert (=> b!1376797 (=> (not res!919681) (not e!779890))))

(declare-datatypes ((array!93505 0))(
  ( (array!93506 (arr!45156 (Array (_ BitVec 32) (_ BitVec 64))) (size!45706 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93505)

(declare-fun lt!605383 () (_ BitVec 32))

(declare-fun lt!605381 () (_ BitVec 32))

(declare-fun to!206 () (_ BitVec 32))

(assert (=> b!1376797 (= res!919681 (and (= lt!605383 lt!605381) (not (= to!206 (size!45706 a!4032)))))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93505 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376797 (= lt!605381 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1376797 (= lt!605383 (arrayCountValidKeys!0 (array!93506 (store (arr!45156 a!4032) i!1445 k0!2947) (size!45706 a!4032)) (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1376798 () Bool)

(declare-fun e!779889 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376798 (= e!779889 (not (validKeyInArray!0 (select (store (arr!45156 a!4032) i!1445 k0!2947) to!206))))))

(declare-fun b!1376799 () Bool)

(declare-fun res!919682 () Bool)

(assert (=> b!1376799 (=> (not res!919682) (not e!779890))))

(assert (=> b!1376799 (= res!919682 (not (validKeyInArray!0 (select (arr!45156 a!4032) to!206))))))

(declare-fun b!1376800 () Bool)

(declare-fun res!919686 () Bool)

(assert (=> b!1376800 (=> (not res!919686) (not e!779887))))

(assert (=> b!1376800 (= res!919686 (and (bvslt (size!45706 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45706 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun res!919687 () Bool)

(assert (=> start!116836 (=> (not res!919687) (not e!779887))))

(assert (=> start!116836 (= res!919687 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45706 a!4032))))))

(assert (=> start!116836 e!779887))

(assert (=> start!116836 true))

(declare-fun array_inv!34184 (array!93505) Bool)

(assert (=> start!116836 (array_inv!34184 a!4032)))

(declare-fun b!1376801 () Bool)

(declare-fun res!919683 () Bool)

(assert (=> b!1376801 (=> (not res!919683) (not e!779887))))

(assert (=> b!1376801 (= res!919683 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1376802 () Bool)

(assert (=> b!1376802 (= e!779890 (not e!779889))))

(declare-fun res!919685 () Bool)

(assert (=> b!1376802 (=> (not res!919685) (not e!779889))))

(assert (=> b!1376802 (= res!919685 (and (bvsge (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000) (bvslt to!206 (size!45706 a!4032))))))

(assert (=> b!1376802 (= (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) lt!605381)))

(declare-datatypes ((Unit!45629 0))(
  ( (Unit!45630) )
))
(declare-fun lt!605382 () Unit!45629)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93505 (_ BitVec 32) (_ BitVec 32)) Unit!45629)

(assert (=> b!1376802 (= lt!605382 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun b!1376803 () Bool)

(declare-fun res!919684 () Bool)

(assert (=> b!1376803 (=> (not res!919684) (not e!779887))))

(assert (=> b!1376803 (= res!919684 (validKeyInArray!0 (select (arr!45156 a!4032) i!1445)))))

(assert (= (and start!116836 res!919687) b!1376803))

(assert (= (and b!1376803 res!919684) b!1376801))

(assert (= (and b!1376801 res!919683) b!1376800))

(assert (= (and b!1376800 res!919686) b!1376797))

(assert (= (and b!1376797 res!919681) b!1376799))

(assert (= (and b!1376799 res!919682) b!1376802))

(assert (= (and b!1376802 res!919685) b!1376798))

(declare-fun m!1260879 () Bool)

(assert (=> b!1376803 m!1260879))

(assert (=> b!1376803 m!1260879))

(declare-fun m!1260881 () Bool)

(assert (=> b!1376803 m!1260881))

(declare-fun m!1260883 () Bool)

(assert (=> b!1376801 m!1260883))

(declare-fun m!1260885 () Bool)

(assert (=> b!1376797 m!1260885))

(declare-fun m!1260887 () Bool)

(assert (=> b!1376797 m!1260887))

(declare-fun m!1260889 () Bool)

(assert (=> b!1376797 m!1260889))

(declare-fun m!1260891 () Bool)

(assert (=> b!1376802 m!1260891))

(declare-fun m!1260893 () Bool)

(assert (=> b!1376802 m!1260893))

(assert (=> b!1376798 m!1260887))

(declare-fun m!1260895 () Bool)

(assert (=> b!1376798 m!1260895))

(assert (=> b!1376798 m!1260895))

(declare-fun m!1260897 () Bool)

(assert (=> b!1376798 m!1260897))

(declare-fun m!1260899 () Bool)

(assert (=> start!116836 m!1260899))

(declare-fun m!1260901 () Bool)

(assert (=> b!1376799 m!1260901))

(assert (=> b!1376799 m!1260901))

(declare-fun m!1260903 () Bool)

(assert (=> b!1376799 m!1260903))

(check-sat (not b!1376801) (not b!1376799) (not b!1376802) (not start!116836) (not b!1376797) (not b!1376803) (not b!1376798))
(check-sat)
