; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116848 () Bool)

(assert start!116848)

(declare-fun call!65882 () (_ BitVec 32))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun bm!65878 () Bool)

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93517 0))(
  ( (array!93518 (arr!45162 (Array (_ BitVec 32) (_ BitVec 64))) (size!45712 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93517)

(declare-fun arrayCountValidKeys!0 (array!93517 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!65878 (= call!65882 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376923 () Bool)

(declare-fun e!779960 () Bool)

(assert (=> b!1376923 (= e!779960 false)))

(declare-datatypes ((Unit!45641 0))(
  ( (Unit!45642) )
))
(declare-fun lt!605511 () Unit!45641)

(declare-fun e!779961 () Unit!45641)

(assert (=> b!1376923 (= lt!605511 e!779961)))

(declare-fun c!128012 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376923 (= c!128012 (validKeyInArray!0 (select (arr!45162 a!4032) to!206)))))

(declare-fun b!1376924 () Bool)

(declare-fun e!779959 () Bool)

(assert (=> b!1376924 (= e!779959 e!779960)))

(declare-fun res!919782 () Bool)

(assert (=> b!1376924 (=> (not res!919782) (not e!779960))))

(declare-fun lt!605507 () (_ BitVec 32))

(declare-fun lt!605506 () (_ BitVec 32))

(assert (=> b!1376924 (= res!919782 (and (= lt!605506 lt!605507) (not (= to!206 (size!45712 a!4032)))))))

(assert (=> b!1376924 (= lt!605507 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!605505 () array!93517)

(assert (=> b!1376924 (= lt!605506 (arrayCountValidKeys!0 lt!605505 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1376924 (= lt!605505 (array!93518 (store (arr!45162 a!4032) i!1445 k0!2947) (size!45712 a!4032)))))

(declare-fun b!1376925 () Bool)

(declare-fun lt!605509 () Unit!45641)

(assert (=> b!1376925 (= e!779961 lt!605509)))

(declare-fun lt!605512 () Unit!45641)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93517 (_ BitVec 32) (_ BitVec 32)) Unit!45641)

(assert (=> b!1376925 (= lt!605512 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376925 (= call!65882 (bvadd #b00000000000000000000000000000001 lt!605507))))

(assert (=> b!1376925 (= lt!605509 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605505 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65881 () (_ BitVec 32))

(assert (=> b!1376925 (= call!65881 (bvadd #b00000000000000000000000000000001 lt!605506))))

(declare-fun b!1376926 () Bool)

(declare-fun res!919780 () Bool)

(assert (=> b!1376926 (=> (not res!919780) (not e!779959))))

(assert (=> b!1376926 (= res!919780 (not (validKeyInArray!0 k0!2947)))))

(declare-fun res!919783 () Bool)

(assert (=> start!116848 (=> (not res!919783) (not e!779959))))

(assert (=> start!116848 (= res!919783 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45712 a!4032))))))

(assert (=> start!116848 e!779959))

(assert (=> start!116848 true))

(declare-fun array_inv!34190 (array!93517) Bool)

(assert (=> start!116848 (array_inv!34190 a!4032)))

(declare-fun b!1376927 () Bool)

(declare-fun res!919779 () Bool)

(assert (=> b!1376927 (=> (not res!919779) (not e!779959))))

(assert (=> b!1376927 (= res!919779 (validKeyInArray!0 (select (arr!45162 a!4032) i!1445)))))

(declare-fun b!1376928 () Bool)

(declare-fun res!919781 () Bool)

(assert (=> b!1376928 (=> (not res!919781) (not e!779959))))

(assert (=> b!1376928 (= res!919781 (and (bvslt (size!45712 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45712 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376929 () Bool)

(declare-fun lt!605510 () Unit!45641)

(assert (=> b!1376929 (= e!779961 lt!605510)))

(declare-fun lt!605508 () Unit!45641)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93517 (_ BitVec 32) (_ BitVec 32)) Unit!45641)

(assert (=> b!1376929 (= lt!605508 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376929 (= call!65882 lt!605507)))

(assert (=> b!1376929 (= lt!605510 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605505 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376929 (= call!65881 lt!605506)))

(declare-fun bm!65879 () Bool)

(assert (=> bm!65879 (= call!65881 (arrayCountValidKeys!0 lt!605505 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(assert (= (and start!116848 res!919783) b!1376927))

(assert (= (and b!1376927 res!919779) b!1376926))

(assert (= (and b!1376926 res!919780) b!1376928))

(assert (= (and b!1376928 res!919781) b!1376924))

(assert (= (and b!1376924 res!919782) b!1376923))

(assert (= (and b!1376923 c!128012) b!1376925))

(assert (= (and b!1376923 (not c!128012)) b!1376929))

(assert (= (or b!1376925 b!1376929) bm!65879))

(assert (= (or b!1376925 b!1376929) bm!65878))

(declare-fun m!1261051 () Bool)

(assert (=> b!1376923 m!1261051))

(assert (=> b!1376923 m!1261051))

(declare-fun m!1261053 () Bool)

(assert (=> b!1376923 m!1261053))

(declare-fun m!1261055 () Bool)

(assert (=> start!116848 m!1261055))

(declare-fun m!1261057 () Bool)

(assert (=> b!1376929 m!1261057))

(declare-fun m!1261059 () Bool)

(assert (=> b!1376929 m!1261059))

(declare-fun m!1261061 () Bool)

(assert (=> b!1376926 m!1261061))

(declare-fun m!1261063 () Bool)

(assert (=> b!1376925 m!1261063))

(declare-fun m!1261065 () Bool)

(assert (=> b!1376925 m!1261065))

(declare-fun m!1261067 () Bool)

(assert (=> bm!65879 m!1261067))

(declare-fun m!1261069 () Bool)

(assert (=> b!1376927 m!1261069))

(assert (=> b!1376927 m!1261069))

(declare-fun m!1261071 () Bool)

(assert (=> b!1376927 m!1261071))

(declare-fun m!1261073 () Bool)

(assert (=> bm!65878 m!1261073))

(declare-fun m!1261075 () Bool)

(assert (=> b!1376924 m!1261075))

(declare-fun m!1261077 () Bool)

(assert (=> b!1376924 m!1261077))

(declare-fun m!1261079 () Bool)

(assert (=> b!1376924 m!1261079))

(check-sat (not bm!65879) (not b!1376923) (not b!1376926) (not b!1376925) (not b!1376924) (not start!116848) (not bm!65878) (not b!1376927) (not b!1376929))
(check-sat)
