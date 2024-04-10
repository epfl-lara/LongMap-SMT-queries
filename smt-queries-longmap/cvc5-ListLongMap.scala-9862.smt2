; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116858 () Bool)

(assert start!116858)

(declare-fun b!1377028 () Bool)

(declare-datatypes ((Unit!45651 0))(
  ( (Unit!45652) )
))
(declare-fun e!780021 () Unit!45651)

(declare-fun lt!605625 () Unit!45651)

(assert (=> b!1377028 (= e!780021 lt!605625)))

(declare-fun lt!605627 () Unit!45651)

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93527 0))(
  ( (array!93528 (arr!45167 (Array (_ BitVec 32) (_ BitVec 64))) (size!45717 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93527)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93527 (_ BitVec 32) (_ BitVec 32)) Unit!45651)

(assert (=> b!1377028 (= lt!605627 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65912 () (_ BitVec 32))

(declare-fun lt!605630 () (_ BitVec 32))

(assert (=> b!1377028 (= call!65912 lt!605630)))

(declare-fun lt!605631 () array!93527)

(assert (=> b!1377028 (= lt!605625 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605631 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65911 () (_ BitVec 32))

(declare-fun lt!605626 () (_ BitVec 32))

(assert (=> b!1377028 (= call!65911 lt!605626)))

(declare-fun bm!65908 () Bool)

(declare-fun arrayCountValidKeys!0 (array!93527 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!65908 (= call!65911 (arrayCountValidKeys!0 lt!605631 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun bm!65909 () Bool)

(assert (=> bm!65909 (= call!65912 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377029 () Bool)

(declare-fun res!919855 () Bool)

(declare-fun e!780019 () Bool)

(assert (=> b!1377029 (=> (not res!919855) (not e!780019))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377029 (= res!919855 (validKeyInArray!0 (select (arr!45167 a!4032) i!1445)))))

(declare-fun b!1377031 () Bool)

(declare-fun res!919857 () Bool)

(assert (=> b!1377031 (=> (not res!919857) (not e!780019))))

(assert (=> b!1377031 (= res!919857 (and (bvslt (size!45717 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45717 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1377032 () Bool)

(declare-fun e!780020 () Bool)

(assert (=> b!1377032 (= e!780019 e!780020)))

(declare-fun res!919856 () Bool)

(assert (=> b!1377032 (=> (not res!919856) (not e!780020))))

(assert (=> b!1377032 (= res!919856 (and (= lt!605626 lt!605630) (not (= to!206 (size!45717 a!4032)))))))

(assert (=> b!1377032 (= lt!605630 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377032 (= lt!605626 (arrayCountValidKeys!0 lt!605631 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k!2947 () (_ BitVec 64))

(assert (=> b!1377032 (= lt!605631 (array!93528 (store (arr!45167 a!4032) i!1445 k!2947) (size!45717 a!4032)))))

(declare-fun b!1377033 () Bool)

(declare-fun lt!605632 () Unit!45651)

(assert (=> b!1377033 (= e!780021 lt!605632)))

(declare-fun lt!605629 () Unit!45651)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93527 (_ BitVec 32) (_ BitVec 32)) Unit!45651)

(assert (=> b!1377033 (= lt!605629 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377033 (= call!65912 (bvadd #b00000000000000000000000000000001 lt!605630))))

(assert (=> b!1377033 (= lt!605632 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605631 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377033 (= call!65911 (bvadd #b00000000000000000000000000000001 lt!605626))))

(declare-fun b!1377034 () Bool)

(declare-fun res!919854 () Bool)

(assert (=> b!1377034 (=> (not res!919854) (not e!780019))))

(assert (=> b!1377034 (= res!919854 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1377030 () Bool)

(assert (=> b!1377030 (= e!780020 false)))

(declare-fun lt!605628 () Unit!45651)

(assert (=> b!1377030 (= lt!605628 e!780021)))

(declare-fun c!128027 () Bool)

(assert (=> b!1377030 (= c!128027 (validKeyInArray!0 (select (arr!45167 a!4032) to!206)))))

(declare-fun res!919858 () Bool)

(assert (=> start!116858 (=> (not res!919858) (not e!780019))))

(assert (=> start!116858 (= res!919858 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45717 a!4032))))))

(assert (=> start!116858 e!780019))

(assert (=> start!116858 true))

(declare-fun array_inv!34195 (array!93527) Bool)

(assert (=> start!116858 (array_inv!34195 a!4032)))

(assert (= (and start!116858 res!919858) b!1377029))

(assert (= (and b!1377029 res!919855) b!1377034))

(assert (= (and b!1377034 res!919854) b!1377031))

(assert (= (and b!1377031 res!919857) b!1377032))

(assert (= (and b!1377032 res!919856) b!1377030))

(assert (= (and b!1377030 c!128027) b!1377033))

(assert (= (and b!1377030 (not c!128027)) b!1377028))

(assert (= (or b!1377033 b!1377028) bm!65908))

(assert (= (or b!1377033 b!1377028) bm!65909))

(declare-fun m!1261201 () Bool)

(assert (=> b!1377029 m!1261201))

(assert (=> b!1377029 m!1261201))

(declare-fun m!1261203 () Bool)

(assert (=> b!1377029 m!1261203))

(declare-fun m!1261205 () Bool)

(assert (=> b!1377033 m!1261205))

(declare-fun m!1261207 () Bool)

(assert (=> b!1377033 m!1261207))

(declare-fun m!1261209 () Bool)

(assert (=> b!1377030 m!1261209))

(assert (=> b!1377030 m!1261209))

(declare-fun m!1261211 () Bool)

(assert (=> b!1377030 m!1261211))

(declare-fun m!1261213 () Bool)

(assert (=> start!116858 m!1261213))

(declare-fun m!1261215 () Bool)

(assert (=> b!1377034 m!1261215))

(declare-fun m!1261217 () Bool)

(assert (=> b!1377028 m!1261217))

(declare-fun m!1261219 () Bool)

(assert (=> b!1377028 m!1261219))

(declare-fun m!1261221 () Bool)

(assert (=> bm!65908 m!1261221))

(declare-fun m!1261223 () Bool)

(assert (=> bm!65909 m!1261223))

(declare-fun m!1261225 () Bool)

(assert (=> b!1377032 m!1261225))

(declare-fun m!1261227 () Bool)

(assert (=> b!1377032 m!1261227))

(declare-fun m!1261229 () Bool)

(assert (=> b!1377032 m!1261229))

(push 1)

(assert (not b!1377030))

(assert (not b!1377028))

(assert (not b!1377033))

(assert (not bm!65908))

(assert (not b!1377029))

(assert (not bm!65909))

(assert (not b!1377032))

(assert (not b!1377034))

(assert (not start!116858))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

