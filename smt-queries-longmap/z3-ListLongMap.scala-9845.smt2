; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116758 () Bool)

(assert start!116758)

(declare-fun b!1376096 () Bool)

(declare-fun e!779568 () Bool)

(declare-fun e!779571 () Bool)

(assert (=> b!1376096 (= e!779568 e!779571)))

(declare-fun res!919008 () Bool)

(assert (=> b!1376096 (=> (not res!919008) (not e!779571))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun lt!605136 () (_ BitVec 32))

(declare-datatypes ((array!93427 0))(
  ( (array!93428 (arr!45117 (Array (_ BitVec 32) (_ BitVec 64))) (size!45667 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93427)

(declare-fun lt!605138 () (_ BitVec 32))

(assert (=> b!1376096 (= res!919008 (and (= lt!605136 lt!605138) (not (= to!206 (size!45667 a!4032)))))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93427 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376096 (= lt!605138 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!605137 () array!93427)

(assert (=> b!1376096 (= lt!605136 (arrayCountValidKeys!0 lt!605137 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1376096 (= lt!605137 (array!93428 (store (arr!45117 a!4032) i!1445 k0!2947) (size!45667 a!4032)))))

(declare-fun b!1376097 () Bool)

(declare-fun res!919007 () Bool)

(declare-fun e!779569 () Bool)

(assert (=> b!1376097 (=> (not res!919007) (not e!779569))))

(assert (=> b!1376097 (= res!919007 (= (arrayCountValidKeys!0 lt!605137 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206))))))

(declare-fun b!1376098 () Bool)

(declare-fun res!919009 () Bool)

(assert (=> b!1376098 (=> (not res!919009) (not e!779568))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376098 (= res!919009 (validKeyInArray!0 (select (arr!45117 a!4032) i!1445)))))

(declare-fun bm!65824 () Bool)

(declare-fun call!65828 () (_ BitVec 32))

(assert (=> bm!65824 (= call!65828 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376099 () Bool)

(declare-datatypes ((Unit!45599 0))(
  ( (Unit!45600) )
))
(declare-fun e!779572 () Unit!45599)

(declare-fun lt!605139 () Unit!45599)

(assert (=> b!1376099 (= e!779572 lt!605139)))

(declare-fun lt!605140 () Unit!45599)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93427 (_ BitVec 32) (_ BitVec 32)) Unit!45599)

(assert (=> b!1376099 (= lt!605140 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376099 (= call!65828 (bvadd #b00000000000000000000000000000001 lt!605138))))

(assert (=> b!1376099 (= lt!605139 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605137 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65827 () (_ BitVec 32))

(assert (=> b!1376099 (= call!65827 (bvadd #b00000000000000000000000000000001 lt!605136))))

(declare-fun res!919011 () Bool)

(assert (=> start!116758 (=> (not res!919011) (not e!779568))))

(assert (=> start!116758 (= res!919011 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45667 a!4032))))))

(assert (=> start!116758 e!779568))

(assert (=> start!116758 true))

(declare-fun array_inv!34145 (array!93427) Bool)

(assert (=> start!116758 (array_inv!34145 a!4032)))

(declare-fun bm!65825 () Bool)

(assert (=> bm!65825 (= call!65827 (arrayCountValidKeys!0 lt!605137 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376100 () Bool)

(declare-fun res!919006 () Bool)

(assert (=> b!1376100 (=> (not res!919006) (not e!779568))))

(assert (=> b!1376100 (= res!919006 (and (bvslt (size!45667 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45667 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376101 () Bool)

(declare-fun lt!605133 () Unit!45599)

(assert (=> b!1376101 (= e!779572 lt!605133)))

(declare-fun lt!605135 () Unit!45599)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93427 (_ BitVec 32) (_ BitVec 32)) Unit!45599)

(assert (=> b!1376101 (= lt!605135 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376101 (= call!65828 lt!605138)))

(assert (=> b!1376101 (= lt!605133 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605137 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376101 (= call!65827 lt!605136)))

(declare-fun b!1376102 () Bool)

(declare-fun res!919012 () Bool)

(assert (=> b!1376102 (=> (not res!919012) (not e!779568))))

(assert (=> b!1376102 (= res!919012 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1376103 () Bool)

(assert (=> b!1376103 (= e!779569 (not (bvsge (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000)))))

(assert (=> b!1376103 (= (arrayCountValidKeys!0 lt!605137 (bvadd #b00000000000000000000000000000001 i!1445) (size!45667 a!4032)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (size!45667 a!4032)))))

(declare-fun lt!605134 () Unit!45599)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93427 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45599)

(assert (=> b!1376103 (= lt!605134 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4032 i!1445 k0!2947 (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376104 () Bool)

(assert (=> b!1376104 (= e!779571 e!779569)))

(declare-fun res!919010 () Bool)

(assert (=> b!1376104 (=> (not res!919010) (not e!779569))))

(assert (=> b!1376104 (= res!919010 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45667 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!605132 () Unit!45599)

(assert (=> b!1376104 (= lt!605132 e!779572)))

(declare-fun c!127985 () Bool)

(assert (=> b!1376104 (= c!127985 (validKeyInArray!0 (select (arr!45117 a!4032) to!206)))))

(assert (= (and start!116758 res!919011) b!1376098))

(assert (= (and b!1376098 res!919009) b!1376102))

(assert (= (and b!1376102 res!919012) b!1376100))

(assert (= (and b!1376100 res!919006) b!1376096))

(assert (= (and b!1376096 res!919008) b!1376104))

(assert (= (and b!1376104 c!127985) b!1376099))

(assert (= (and b!1376104 (not c!127985)) b!1376101))

(assert (= (or b!1376099 b!1376101) bm!65824))

(assert (= (or b!1376099 b!1376101) bm!65825))

(assert (= (and b!1376104 res!919010) b!1376097))

(assert (= (and b!1376097 res!919007) b!1376103))

(declare-fun m!1260103 () Bool)

(assert (=> b!1376097 m!1260103))

(declare-fun m!1260105 () Bool)

(assert (=> b!1376097 m!1260105))

(declare-fun m!1260107 () Bool)

(assert (=> b!1376103 m!1260107))

(declare-fun m!1260109 () Bool)

(assert (=> b!1376103 m!1260109))

(declare-fun m!1260111 () Bool)

(assert (=> b!1376103 m!1260111))

(declare-fun m!1260113 () Bool)

(assert (=> b!1376098 m!1260113))

(assert (=> b!1376098 m!1260113))

(declare-fun m!1260115 () Bool)

(assert (=> b!1376098 m!1260115))

(assert (=> bm!65824 m!1260105))

(declare-fun m!1260117 () Bool)

(assert (=> b!1376096 m!1260117))

(declare-fun m!1260119 () Bool)

(assert (=> b!1376096 m!1260119))

(declare-fun m!1260121 () Bool)

(assert (=> b!1376096 m!1260121))

(declare-fun m!1260123 () Bool)

(assert (=> b!1376101 m!1260123))

(declare-fun m!1260125 () Bool)

(assert (=> b!1376101 m!1260125))

(declare-fun m!1260127 () Bool)

(assert (=> start!116758 m!1260127))

(declare-fun m!1260129 () Bool)

(assert (=> b!1376102 m!1260129))

(declare-fun m!1260131 () Bool)

(assert (=> b!1376104 m!1260131))

(assert (=> b!1376104 m!1260131))

(declare-fun m!1260133 () Bool)

(assert (=> b!1376104 m!1260133))

(assert (=> bm!65825 m!1260103))

(declare-fun m!1260135 () Bool)

(assert (=> b!1376099 m!1260135))

(declare-fun m!1260137 () Bool)

(assert (=> b!1376099 m!1260137))

(check-sat (not bm!65825) (not b!1376104) (not b!1376096) (not b!1376098) (not b!1376102) (not bm!65824) (not b!1376097) (not start!116758) (not b!1376103) (not b!1376101) (not b!1376099))
(check-sat)
