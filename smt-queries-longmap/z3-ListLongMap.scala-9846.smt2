; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116758 () Bool)

(assert start!116758)

(declare-fun b!1376089 () Bool)

(declare-fun res!919025 () Bool)

(declare-fun e!779572 () Bool)

(assert (=> b!1376089 (=> (not res!919025) (not e!779572))))

(declare-fun k0!2947 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376089 (= res!919025 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1376090 () Bool)

(declare-fun e!779573 () Bool)

(declare-fun e!779571 () Bool)

(assert (=> b!1376090 (= e!779573 e!779571)))

(declare-fun res!919023 () Bool)

(assert (=> b!1376090 (=> (not res!919023) (not e!779571))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93381 0))(
  ( (array!93382 (arr!45094 (Array (_ BitVec 32) (_ BitVec 64))) (size!45646 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93381)

(assert (=> b!1376090 (= res!919023 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45646 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-datatypes ((Unit!45444 0))(
  ( (Unit!45445) )
))
(declare-fun lt!605004 () Unit!45444)

(declare-fun e!779574 () Unit!45444)

(assert (=> b!1376090 (= lt!605004 e!779574)))

(declare-fun c!127976 () Bool)

(assert (=> b!1376090 (= c!127976 (validKeyInArray!0 (select (arr!45094 a!4032) to!206)))))

(declare-fun b!1376091 () Bool)

(assert (=> b!1376091 (= e!779572 e!779573)))

(declare-fun res!919022 () Bool)

(assert (=> b!1376091 (=> (not res!919022) (not e!779573))))

(declare-fun lt!605009 () (_ BitVec 32))

(declare-fun lt!605010 () (_ BitVec 32))

(assert (=> b!1376091 (= res!919022 (and (= lt!605009 lt!605010) (not (= to!206 (size!45646 a!4032)))))))

(declare-fun arrayCountValidKeys!0 (array!93381 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376091 (= lt!605010 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!605005 () array!93381)

(assert (=> b!1376091 (= lt!605009 (arrayCountValidKeys!0 lt!605005 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376091 (= lt!605005 (array!93382 (store (arr!45094 a!4032) i!1445 k0!2947) (size!45646 a!4032)))))

(declare-fun b!1376092 () Bool)

(assert (=> b!1376092 (= e!779571 (not true))))

(assert (=> b!1376092 (= (arrayCountValidKeys!0 lt!605005 (bvadd #b00000000000000000000000000000001 i!1445) (size!45646 a!4032)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (size!45646 a!4032)))))

(declare-fun lt!605008 () Unit!45444)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93381 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45444)

(assert (=> b!1376092 (= lt!605008 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4032 i!1445 k0!2947 (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376093 () Bool)

(declare-fun lt!605011 () Unit!45444)

(assert (=> b!1376093 (= e!779574 lt!605011)))

(declare-fun lt!605006 () Unit!45444)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93381 (_ BitVec 32) (_ BitVec 32)) Unit!45444)

(assert (=> b!1376093 (= lt!605006 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65822 () (_ BitVec 32))

(assert (=> b!1376093 (= call!65822 (bvadd #b00000000000000000000000000000001 lt!605010))))

(assert (=> b!1376093 (= lt!605011 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605005 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65823 () (_ BitVec 32))

(assert (=> b!1376093 (= call!65823 (bvadd #b00000000000000000000000000000001 lt!605009))))

(declare-fun b!1376094 () Bool)

(declare-fun res!919024 () Bool)

(assert (=> b!1376094 (=> (not res!919024) (not e!779572))))

(assert (=> b!1376094 (= res!919024 (validKeyInArray!0 (select (arr!45094 a!4032) i!1445)))))

(declare-fun res!919028 () Bool)

(assert (=> start!116758 (=> (not res!919028) (not e!779572))))

(assert (=> start!116758 (= res!919028 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45646 a!4032))))))

(assert (=> start!116758 e!779572))

(assert (=> start!116758 true))

(declare-fun array_inv!34327 (array!93381) Bool)

(assert (=> start!116758 (array_inv!34327 a!4032)))

(declare-fun b!1376095 () Bool)

(declare-fun res!919027 () Bool)

(assert (=> b!1376095 (=> (not res!919027) (not e!779571))))

(assert (=> b!1376095 (= res!919027 (= (arrayCountValidKeys!0 lt!605005 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206))))))

(declare-fun b!1376096 () Bool)

(declare-fun res!919026 () Bool)

(assert (=> b!1376096 (=> (not res!919026) (not e!779572))))

(assert (=> b!1376096 (= res!919026 (and (bvslt (size!45646 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45646 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376097 () Bool)

(declare-fun lt!605007 () Unit!45444)

(assert (=> b!1376097 (= e!779574 lt!605007)))

(declare-fun lt!605012 () Unit!45444)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93381 (_ BitVec 32) (_ BitVec 32)) Unit!45444)

(assert (=> b!1376097 (= lt!605012 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376097 (= call!65822 lt!605010)))

(assert (=> b!1376097 (= lt!605007 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605005 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376097 (= call!65823 lt!605009)))

(declare-fun bm!65819 () Bool)

(assert (=> bm!65819 (= call!65823 (arrayCountValidKeys!0 lt!605005 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun bm!65820 () Bool)

(assert (=> bm!65820 (= call!65822 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(assert (= (and start!116758 res!919028) b!1376094))

(assert (= (and b!1376094 res!919024) b!1376089))

(assert (= (and b!1376089 res!919025) b!1376096))

(assert (= (and b!1376096 res!919026) b!1376091))

(assert (= (and b!1376091 res!919022) b!1376090))

(assert (= (and b!1376090 c!127976) b!1376093))

(assert (= (and b!1376090 (not c!127976)) b!1376097))

(assert (= (or b!1376093 b!1376097) bm!65820))

(assert (= (or b!1376093 b!1376097) bm!65819))

(assert (= (and b!1376090 res!919023) b!1376095))

(assert (= (and b!1376095 res!919027) b!1376092))

(declare-fun m!1259681 () Bool)

(assert (=> bm!65819 m!1259681))

(declare-fun m!1259683 () Bool)

(assert (=> b!1376093 m!1259683))

(declare-fun m!1259685 () Bool)

(assert (=> b!1376093 m!1259685))

(declare-fun m!1259687 () Bool)

(assert (=> b!1376094 m!1259687))

(assert (=> b!1376094 m!1259687))

(declare-fun m!1259689 () Bool)

(assert (=> b!1376094 m!1259689))

(declare-fun m!1259691 () Bool)

(assert (=> b!1376092 m!1259691))

(declare-fun m!1259693 () Bool)

(assert (=> b!1376092 m!1259693))

(declare-fun m!1259695 () Bool)

(assert (=> b!1376092 m!1259695))

(declare-fun m!1259697 () Bool)

(assert (=> b!1376090 m!1259697))

(assert (=> b!1376090 m!1259697))

(declare-fun m!1259699 () Bool)

(assert (=> b!1376090 m!1259699))

(declare-fun m!1259701 () Bool)

(assert (=> b!1376089 m!1259701))

(declare-fun m!1259703 () Bool)

(assert (=> bm!65820 m!1259703))

(assert (=> b!1376095 m!1259681))

(assert (=> b!1376095 m!1259703))

(declare-fun m!1259705 () Bool)

(assert (=> start!116758 m!1259705))

(declare-fun m!1259707 () Bool)

(assert (=> b!1376091 m!1259707))

(declare-fun m!1259709 () Bool)

(assert (=> b!1376091 m!1259709))

(declare-fun m!1259711 () Bool)

(assert (=> b!1376091 m!1259711))

(declare-fun m!1259713 () Bool)

(assert (=> b!1376097 m!1259713))

(declare-fun m!1259715 () Bool)

(assert (=> b!1376097 m!1259715))

(check-sat (not b!1376089) (not bm!65820) (not start!116758) (not b!1376097) (not b!1376094) (not b!1376091) (not b!1376092) (not b!1376090) (not b!1376093) (not b!1376095) (not bm!65819))
(check-sat)
