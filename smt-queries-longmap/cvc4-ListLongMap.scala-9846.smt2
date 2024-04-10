; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116766 () Bool)

(assert start!116766)

(declare-fun res!919095 () Bool)

(declare-fun e!779629 () Bool)

(assert (=> start!116766 (=> (not res!919095) (not e!779629))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93435 0))(
  ( (array!93436 (arr!45121 (Array (_ BitVec 32) (_ BitVec 64))) (size!45671 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93435)

(assert (=> start!116766 (= res!919095 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45671 a!4032))))))

(assert (=> start!116766 e!779629))

(assert (=> start!116766 true))

(declare-fun array_inv!34149 (array!93435) Bool)

(assert (=> start!116766 (array_inv!34149 a!4032)))

(declare-fun b!1376204 () Bool)

(declare-fun e!779630 () Bool)

(assert (=> b!1376204 (= e!779630 (not true))))

(declare-fun lt!605243 () array!93435)

(declare-fun arrayCountValidKeys!0 (array!93435 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376204 (= (arrayCountValidKeys!0 lt!605243 (bvadd #b00000000000000000000000000000001 i!1445) (size!45671 a!4032)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (size!45671 a!4032)))))

(declare-fun to!206 () (_ BitVec 32))

(declare-datatypes ((Unit!45607 0))(
  ( (Unit!45608) )
))
(declare-fun lt!605240 () Unit!45607)

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93435 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45607)

(assert (=> b!1376204 (= lt!605240 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4032 i!1445 k!2947 (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376205 () Bool)

(declare-fun e!779628 () Bool)

(assert (=> b!1376205 (= e!779629 e!779628)))

(declare-fun res!919094 () Bool)

(assert (=> b!1376205 (=> (not res!919094) (not e!779628))))

(declare-fun lt!605246 () (_ BitVec 32))

(declare-fun lt!605245 () (_ BitVec 32))

(assert (=> b!1376205 (= res!919094 (and (= lt!605245 lt!605246) (not (= to!206 (size!45671 a!4032)))))))

(assert (=> b!1376205 (= lt!605246 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376205 (= lt!605245 (arrayCountValidKeys!0 lt!605243 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376205 (= lt!605243 (array!93436 (store (arr!45121 a!4032) i!1445 k!2947) (size!45671 a!4032)))))

(declare-fun bm!65848 () Bool)

(declare-fun call!65851 () (_ BitVec 32))

(assert (=> bm!65848 (= call!65851 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376206 () Bool)

(declare-fun e!779631 () Unit!45607)

(declare-fun lt!605244 () Unit!45607)

(assert (=> b!1376206 (= e!779631 lt!605244)))

(declare-fun lt!605242 () Unit!45607)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93435 (_ BitVec 32) (_ BitVec 32)) Unit!45607)

(assert (=> b!1376206 (= lt!605242 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376206 (= call!65851 (bvadd #b00000000000000000000000000000001 lt!605246))))

(assert (=> b!1376206 (= lt!605244 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605243 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65852 () (_ BitVec 32))

(assert (=> b!1376206 (= call!65852 (bvadd #b00000000000000000000000000000001 lt!605245))))

(declare-fun b!1376207 () Bool)

(declare-fun res!919091 () Bool)

(assert (=> b!1376207 (=> (not res!919091) (not e!779629))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376207 (= res!919091 (validKeyInArray!0 (select (arr!45121 a!4032) i!1445)))))

(declare-fun bm!65849 () Bool)

(assert (=> bm!65849 (= call!65852 (arrayCountValidKeys!0 lt!605243 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376208 () Bool)

(declare-fun lt!605247 () Unit!45607)

(assert (=> b!1376208 (= e!779631 lt!605247)))

(declare-fun lt!605248 () Unit!45607)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93435 (_ BitVec 32) (_ BitVec 32)) Unit!45607)

(assert (=> b!1376208 (= lt!605248 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376208 (= call!65851 lt!605246)))

(assert (=> b!1376208 (= lt!605247 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605243 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376208 (= call!65852 lt!605245)))

(declare-fun b!1376209 () Bool)

(declare-fun res!919092 () Bool)

(assert (=> b!1376209 (=> (not res!919092) (not e!779629))))

(assert (=> b!1376209 (= res!919092 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1376210 () Bool)

(declare-fun res!919093 () Bool)

(assert (=> b!1376210 (=> (not res!919093) (not e!779629))))

(assert (=> b!1376210 (= res!919093 (and (bvslt (size!45671 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45671 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376211 () Bool)

(assert (=> b!1376211 (= e!779628 e!779630)))

(declare-fun res!919096 () Bool)

(assert (=> b!1376211 (=> (not res!919096) (not e!779630))))

(assert (=> b!1376211 (= res!919096 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45671 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!605241 () Unit!45607)

(assert (=> b!1376211 (= lt!605241 e!779631)))

(declare-fun c!127997 () Bool)

(assert (=> b!1376211 (= c!127997 (validKeyInArray!0 (select (arr!45121 a!4032) to!206)))))

(declare-fun b!1376212 () Bool)

(declare-fun res!919090 () Bool)

(assert (=> b!1376212 (=> (not res!919090) (not e!779630))))

(assert (=> b!1376212 (= res!919090 (= (arrayCountValidKeys!0 lt!605243 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206))))))

(assert (= (and start!116766 res!919095) b!1376207))

(assert (= (and b!1376207 res!919091) b!1376209))

(assert (= (and b!1376209 res!919092) b!1376210))

(assert (= (and b!1376210 res!919093) b!1376205))

(assert (= (and b!1376205 res!919094) b!1376211))

(assert (= (and b!1376211 c!127997) b!1376206))

(assert (= (and b!1376211 (not c!127997)) b!1376208))

(assert (= (or b!1376206 b!1376208) bm!65849))

(assert (= (or b!1376206 b!1376208) bm!65848))

(assert (= (and b!1376211 res!919096) b!1376212))

(assert (= (and b!1376212 res!919090) b!1376204))

(declare-fun m!1260247 () Bool)

(assert (=> b!1376205 m!1260247))

(declare-fun m!1260249 () Bool)

(assert (=> b!1376205 m!1260249))

(declare-fun m!1260251 () Bool)

(assert (=> b!1376205 m!1260251))

(declare-fun m!1260253 () Bool)

(assert (=> b!1376209 m!1260253))

(declare-fun m!1260255 () Bool)

(assert (=> b!1376207 m!1260255))

(assert (=> b!1376207 m!1260255))

(declare-fun m!1260257 () Bool)

(assert (=> b!1376207 m!1260257))

(declare-fun m!1260259 () Bool)

(assert (=> bm!65849 m!1260259))

(declare-fun m!1260261 () Bool)

(assert (=> b!1376204 m!1260261))

(declare-fun m!1260263 () Bool)

(assert (=> b!1376204 m!1260263))

(declare-fun m!1260265 () Bool)

(assert (=> b!1376204 m!1260265))

(assert (=> b!1376212 m!1260259))

(declare-fun m!1260267 () Bool)

(assert (=> b!1376212 m!1260267))

(declare-fun m!1260269 () Bool)

(assert (=> b!1376208 m!1260269))

(declare-fun m!1260271 () Bool)

(assert (=> b!1376208 m!1260271))

(assert (=> bm!65848 m!1260267))

(declare-fun m!1260273 () Bool)

(assert (=> start!116766 m!1260273))

(declare-fun m!1260275 () Bool)

(assert (=> b!1376206 m!1260275))

(declare-fun m!1260277 () Bool)

(assert (=> b!1376206 m!1260277))

(declare-fun m!1260279 () Bool)

(assert (=> b!1376211 m!1260279))

(assert (=> b!1376211 m!1260279))

(declare-fun m!1260281 () Bool)

(assert (=> b!1376211 m!1260281))

(push 1)

(assert (not b!1376211))

(assert (not b!1376207))

(assert (not bm!65848))

(assert (not b!1376204))

(assert (not b!1376206))

(assert (not b!1376205))

(assert (not b!1376209))

(assert (not bm!65849))

(assert (not b!1376208))

(assert (not start!116766))

(assert (not b!1376212))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

