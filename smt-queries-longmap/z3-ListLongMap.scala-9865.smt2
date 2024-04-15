; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116872 () Bool)

(assert start!116872)

(declare-fun b!1377169 () Bool)

(declare-fun res!919982 () Bool)

(declare-fun e!780114 () Bool)

(assert (=> b!1377169 (=> (not res!919982) (not e!780114))))

(declare-fun k0!2947 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377169 (= res!919982 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1377170 () Bool)

(declare-fun e!780115 () Bool)

(declare-fun e!780111 () Bool)

(assert (=> b!1377170 (= e!780115 e!780111)))

(declare-fun res!919976 () Bool)

(assert (=> b!1377170 (=> (not res!919976) (not e!780111))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93495 0))(
  ( (array!93496 (arr!45151 (Array (_ BitVec 32) (_ BitVec 64))) (size!45703 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93495)

(assert (=> b!1377170 (= res!919976 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45703 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-datatypes ((Unit!45510 0))(
  ( (Unit!45511) )
))
(declare-fun lt!605666 () Unit!45510)

(declare-fun e!780112 () Unit!45510)

(assert (=> b!1377170 (= lt!605666 e!780112)))

(declare-fun c!128039 () Bool)

(assert (=> b!1377170 (= c!128039 (validKeyInArray!0 (select (arr!45151 a!4032) to!206)))))

(declare-fun b!1377171 () Bool)

(declare-fun res!919981 () Bool)

(assert (=> b!1377171 (=> (not res!919981) (not e!780114))))

(assert (=> b!1377171 (= res!919981 (and (bvslt (size!45703 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45703 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1377172 () Bool)

(declare-fun lt!605663 () Unit!45510)

(assert (=> b!1377172 (= e!780112 lt!605663)))

(declare-fun lt!605659 () Unit!45510)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93495 (_ BitVec 32) (_ BitVec 32)) Unit!45510)

(assert (=> b!1377172 (= lt!605659 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65948 () (_ BitVec 32))

(declare-fun lt!605660 () (_ BitVec 32))

(assert (=> b!1377172 (= call!65948 (bvadd #b00000000000000000000000000000001 lt!605660))))

(declare-fun lt!605665 () array!93495)

(assert (=> b!1377172 (= lt!605663 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605665 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65949 () (_ BitVec 32))

(declare-fun lt!605661 () (_ BitVec 32))

(assert (=> b!1377172 (= call!65949 (bvadd #b00000000000000000000000000000001 lt!605661))))

(declare-fun bm!65945 () Bool)

(declare-fun arrayCountValidKeys!0 (array!93495 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!65945 (= call!65948 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377174 () Bool)

(assert (=> b!1377174 (= e!780111 (bvsge (bvsub (size!45703 a!4032) to!206) (bvsub (bvadd #b00000000000000000000000000000001 (size!45703 a!4032)) to!206)))))

(declare-fun b!1377175 () Bool)

(declare-fun res!919978 () Bool)

(assert (=> b!1377175 (=> (not res!919978) (not e!780111))))

(assert (=> b!1377175 (= res!919978 (= (arrayCountValidKeys!0 lt!605665 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206))))))

(declare-fun b!1377176 () Bool)

(declare-fun res!919980 () Bool)

(assert (=> b!1377176 (=> (not res!919980) (not e!780114))))

(assert (=> b!1377176 (= res!919980 (validKeyInArray!0 (select (arr!45151 a!4032) i!1445)))))

(declare-fun res!919977 () Bool)

(assert (=> start!116872 (=> (not res!919977) (not e!780114))))

(assert (=> start!116872 (= res!919977 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45703 a!4032))))))

(assert (=> start!116872 e!780114))

(assert (=> start!116872 true))

(declare-fun array_inv!34384 (array!93495) Bool)

(assert (=> start!116872 (array_inv!34384 a!4032)))

(declare-fun b!1377173 () Bool)

(assert (=> b!1377173 (= e!780114 e!780115)))

(declare-fun res!919979 () Bool)

(assert (=> b!1377173 (=> (not res!919979) (not e!780115))))

(assert (=> b!1377173 (= res!919979 (and (= lt!605661 lt!605660) (not (= to!206 (size!45703 a!4032)))))))

(assert (=> b!1377173 (= lt!605660 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377173 (= lt!605661 (arrayCountValidKeys!0 lt!605665 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377173 (= lt!605665 (array!93496 (store (arr!45151 a!4032) i!1445 k0!2947) (size!45703 a!4032)))))

(declare-fun b!1377177 () Bool)

(declare-fun lt!605664 () Unit!45510)

(assert (=> b!1377177 (= e!780112 lt!605664)))

(declare-fun lt!605662 () Unit!45510)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93495 (_ BitVec 32) (_ BitVec 32)) Unit!45510)

(assert (=> b!1377177 (= lt!605662 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377177 (= call!65948 lt!605660)))

(assert (=> b!1377177 (= lt!605664 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605665 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377177 (= call!65949 lt!605661)))

(declare-fun bm!65946 () Bool)

(assert (=> bm!65946 (= call!65949 (arrayCountValidKeys!0 lt!605665 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(assert (= (and start!116872 res!919977) b!1377176))

(assert (= (and b!1377176 res!919980) b!1377169))

(assert (= (and b!1377169 res!919982) b!1377171))

(assert (= (and b!1377171 res!919981) b!1377173))

(assert (= (and b!1377173 res!919979) b!1377170))

(assert (= (and b!1377170 c!128039) b!1377172))

(assert (= (and b!1377170 (not c!128039)) b!1377177))

(assert (= (or b!1377172 b!1377177) bm!65946))

(assert (= (or b!1377172 b!1377177) bm!65945))

(assert (= (and b!1377170 res!919976) b!1377175))

(assert (= (and b!1377175 res!919978) b!1377174))

(declare-fun m!1260977 () Bool)

(assert (=> b!1377170 m!1260977))

(assert (=> b!1377170 m!1260977))

(declare-fun m!1260979 () Bool)

(assert (=> b!1377170 m!1260979))

(declare-fun m!1260981 () Bool)

(assert (=> bm!65946 m!1260981))

(declare-fun m!1260983 () Bool)

(assert (=> b!1377177 m!1260983))

(declare-fun m!1260985 () Bool)

(assert (=> b!1377177 m!1260985))

(declare-fun m!1260987 () Bool)

(assert (=> b!1377173 m!1260987))

(declare-fun m!1260989 () Bool)

(assert (=> b!1377173 m!1260989))

(declare-fun m!1260991 () Bool)

(assert (=> b!1377173 m!1260991))

(declare-fun m!1260993 () Bool)

(assert (=> b!1377169 m!1260993))

(declare-fun m!1260995 () Bool)

(assert (=> start!116872 m!1260995))

(assert (=> b!1377175 m!1260981))

(declare-fun m!1260997 () Bool)

(assert (=> b!1377175 m!1260997))

(declare-fun m!1260999 () Bool)

(assert (=> b!1377172 m!1260999))

(declare-fun m!1261001 () Bool)

(assert (=> b!1377172 m!1261001))

(declare-fun m!1261003 () Bool)

(assert (=> b!1377176 m!1261003))

(assert (=> b!1377176 m!1261003))

(declare-fun m!1261005 () Bool)

(assert (=> b!1377176 m!1261005))

(assert (=> bm!65945 m!1260997))

(check-sat (not b!1377175) (not b!1377172) (not b!1377176) (not b!1377177) (not b!1377173) (not b!1377169) (not bm!65945) (not bm!65946) (not b!1377170) (not start!116872))
(check-sat)
