; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116762 () Bool)

(assert start!116762)

(declare-fun b!1376150 () Bool)

(declare-fun res!919049 () Bool)

(declare-fun e!779601 () Bool)

(assert (=> b!1376150 (=> (not res!919049) (not e!779601))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93431 0))(
  ( (array!93432 (arr!45119 (Array (_ BitVec 32) (_ BitVec 64))) (size!45669 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93431)

(assert (=> b!1376150 (= res!919049 (and (bvslt (size!45669 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45669 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376152 () Bool)

(declare-datatypes ((Unit!45603 0))(
  ( (Unit!45604) )
))
(declare-fun e!779602 () Unit!45603)

(declare-fun lt!605192 () Unit!45603)

(assert (=> b!1376152 (= e!779602 lt!605192)))

(declare-fun lt!605191 () Unit!45603)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93431 (_ BitVec 32) (_ BitVec 32)) Unit!45603)

(assert (=> b!1376152 (= lt!605191 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65839 () (_ BitVec 32))

(declare-fun lt!605189 () (_ BitVec 32))

(assert (=> b!1376152 (= call!65839 lt!605189)))

(declare-fun lt!605186 () array!93431)

(assert (=> b!1376152 (= lt!605192 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605186 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65840 () (_ BitVec 32))

(declare-fun lt!605187 () (_ BitVec 32))

(assert (=> b!1376152 (= call!65840 lt!605187)))

(declare-fun bm!65836 () Bool)

(declare-fun arrayCountValidKeys!0 (array!93431 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!65836 (= call!65840 (arrayCountValidKeys!0 lt!605186 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376153 () Bool)

(declare-fun e!779598 () Bool)

(assert (=> b!1376153 (= e!779598 (not true))))

(assert (=> b!1376153 (= (arrayCountValidKeys!0 lt!605186 (bvadd #b00000000000000000000000000000001 i!1445) (size!45669 a!4032)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (size!45669 a!4032)))))

(declare-fun lt!605190 () Unit!45603)

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93431 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45603)

(assert (=> b!1376153 (= lt!605190 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4032 i!1445 k!2947 (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376154 () Bool)

(declare-fun res!919052 () Bool)

(assert (=> b!1376154 (=> (not res!919052) (not e!779601))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376154 (= res!919052 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1376155 () Bool)

(declare-fun lt!605193 () Unit!45603)

(assert (=> b!1376155 (= e!779602 lt!605193)))

(declare-fun lt!605194 () Unit!45603)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93431 (_ BitVec 32) (_ BitVec 32)) Unit!45603)

(assert (=> b!1376155 (= lt!605194 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376155 (= call!65839 (bvadd #b00000000000000000000000000000001 lt!605189))))

(assert (=> b!1376155 (= lt!605193 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605186 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376155 (= call!65840 (bvadd #b00000000000000000000000000000001 lt!605187))))

(declare-fun bm!65837 () Bool)

(assert (=> bm!65837 (= call!65839 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376156 () Bool)

(declare-fun e!779599 () Bool)

(assert (=> b!1376156 (= e!779601 e!779599)))

(declare-fun res!919054 () Bool)

(assert (=> b!1376156 (=> (not res!919054) (not e!779599))))

(assert (=> b!1376156 (= res!919054 (and (= lt!605187 lt!605189) (not (= to!206 (size!45669 a!4032)))))))

(assert (=> b!1376156 (= lt!605189 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376156 (= lt!605187 (arrayCountValidKeys!0 lt!605186 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376156 (= lt!605186 (array!93432 (store (arr!45119 a!4032) i!1445 k!2947) (size!45669 a!4032)))))

(declare-fun b!1376157 () Bool)

(declare-fun res!919050 () Bool)

(assert (=> b!1376157 (=> (not res!919050) (not e!779601))))

(assert (=> b!1376157 (= res!919050 (validKeyInArray!0 (select (arr!45119 a!4032) i!1445)))))

(declare-fun b!1376158 () Bool)

(declare-fun res!919048 () Bool)

(assert (=> b!1376158 (=> (not res!919048) (not e!779598))))

(assert (=> b!1376158 (= res!919048 (= (arrayCountValidKeys!0 lt!605186 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206))))))

(declare-fun b!1376151 () Bool)

(assert (=> b!1376151 (= e!779599 e!779598)))

(declare-fun res!919053 () Bool)

(assert (=> b!1376151 (=> (not res!919053) (not e!779598))))

(assert (=> b!1376151 (= res!919053 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45669 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!605188 () Unit!45603)

(assert (=> b!1376151 (= lt!605188 e!779602)))

(declare-fun c!127991 () Bool)

(assert (=> b!1376151 (= c!127991 (validKeyInArray!0 (select (arr!45119 a!4032) to!206)))))

(declare-fun res!919051 () Bool)

(assert (=> start!116762 (=> (not res!919051) (not e!779601))))

(assert (=> start!116762 (= res!919051 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45669 a!4032))))))

(assert (=> start!116762 e!779601))

(assert (=> start!116762 true))

(declare-fun array_inv!34147 (array!93431) Bool)

(assert (=> start!116762 (array_inv!34147 a!4032)))

(assert (= (and start!116762 res!919051) b!1376157))

(assert (= (and b!1376157 res!919050) b!1376154))

(assert (= (and b!1376154 res!919052) b!1376150))

(assert (= (and b!1376150 res!919049) b!1376156))

(assert (= (and b!1376156 res!919054) b!1376151))

(assert (= (and b!1376151 c!127991) b!1376155))

(assert (= (and b!1376151 (not c!127991)) b!1376152))

(assert (= (or b!1376155 b!1376152) bm!65837))

(assert (= (or b!1376155 b!1376152) bm!65836))

(assert (= (and b!1376151 res!919053) b!1376158))

(assert (= (and b!1376158 res!919048) b!1376153))

(declare-fun m!1260175 () Bool)

(assert (=> bm!65836 m!1260175))

(assert (=> b!1376158 m!1260175))

(declare-fun m!1260177 () Bool)

(assert (=> b!1376158 m!1260177))

(declare-fun m!1260179 () Bool)

(assert (=> b!1376156 m!1260179))

(declare-fun m!1260181 () Bool)

(assert (=> b!1376156 m!1260181))

(declare-fun m!1260183 () Bool)

(assert (=> b!1376156 m!1260183))

(declare-fun m!1260185 () Bool)

(assert (=> b!1376154 m!1260185))

(assert (=> bm!65837 m!1260177))

(declare-fun m!1260187 () Bool)

(assert (=> b!1376155 m!1260187))

(declare-fun m!1260189 () Bool)

(assert (=> b!1376155 m!1260189))

(declare-fun m!1260191 () Bool)

(assert (=> b!1376151 m!1260191))

(assert (=> b!1376151 m!1260191))

(declare-fun m!1260193 () Bool)

(assert (=> b!1376151 m!1260193))

(declare-fun m!1260195 () Bool)

(assert (=> b!1376153 m!1260195))

(declare-fun m!1260197 () Bool)

(assert (=> b!1376153 m!1260197))

(declare-fun m!1260199 () Bool)

(assert (=> b!1376153 m!1260199))

(declare-fun m!1260201 () Bool)

(assert (=> start!116762 m!1260201))

(declare-fun m!1260203 () Bool)

(assert (=> b!1376157 m!1260203))

(assert (=> b!1376157 m!1260203))

(declare-fun m!1260205 () Bool)

(assert (=> b!1376157 m!1260205))

(declare-fun m!1260207 () Bool)

(assert (=> b!1376152 m!1260207))

(declare-fun m!1260209 () Bool)

(assert (=> b!1376152 m!1260209))

(push 1)

(assert (not b!1376153))

(assert (not b!1376151))

(assert (not b!1376158))

(assert (not b!1376157))

(assert (not b!1376155))

(assert (not start!116762))

(assert (not b!1376156))

