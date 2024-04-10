; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116878 () Bool)

(assert start!116878)

(declare-fun b!1377257 () Bool)

(declare-fun e!780155 () Bool)

(declare-fun e!780157 () Bool)

(assert (=> b!1377257 (= e!780155 e!780157)))

(declare-fun res!920029 () Bool)

(assert (=> b!1377257 (=> (not res!920029) (not e!780157))))

(declare-fun to!206 () (_ BitVec 32))

(declare-datatypes ((array!93547 0))(
  ( (array!93548 (arr!45177 (Array (_ BitVec 32) (_ BitVec 64))) (size!45727 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93547)

(declare-fun lt!605866 () (_ BitVec 32))

(declare-fun lt!605871 () (_ BitVec 32))

(assert (=> b!1377257 (= res!920029 (and (= lt!605871 lt!605866) (not (= to!206 (size!45727 a!4032)))))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93547 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377257 (= lt!605866 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!605865 () array!93547)

(assert (=> b!1377257 (= lt!605871 (arrayCountValidKeys!0 lt!605865 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1377257 (= lt!605865 (array!93548 (store (arr!45177 a!4032) i!1445 k0!2947) (size!45727 a!4032)))))

(declare-fun res!920024 () Bool)

(assert (=> start!116878 (=> (not res!920024) (not e!780155))))

(assert (=> start!116878 (= res!920024 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45727 a!4032))))))

(assert (=> start!116878 e!780155))

(assert (=> start!116878 true))

(declare-fun array_inv!34205 (array!93547) Bool)

(assert (=> start!116878 (array_inv!34205 a!4032)))

(declare-fun b!1377258 () Bool)

(declare-fun res!920025 () Bool)

(assert (=> b!1377258 (=> (not res!920025) (not e!780155))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377258 (= res!920025 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1377259 () Bool)

(declare-datatypes ((Unit!45671 0))(
  ( (Unit!45672) )
))
(declare-fun e!780156 () Unit!45671)

(declare-fun lt!605868 () Unit!45671)

(assert (=> b!1377259 (= e!780156 lt!605868)))

(declare-fun lt!605867 () Unit!45671)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93547 (_ BitVec 32) (_ BitVec 32)) Unit!45671)

(assert (=> b!1377259 (= lt!605867 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65971 () (_ BitVec 32))

(assert (=> b!1377259 (= call!65971 lt!605866)))

(assert (=> b!1377259 (= lt!605868 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605865 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65972 () (_ BitVec 32))

(assert (=> b!1377259 (= call!65972 lt!605871)))

(declare-fun b!1377260 () Bool)

(declare-fun e!780153 () Bool)

(assert (=> b!1377260 (= e!780153 (bvsge (bvsub (size!45727 a!4032) to!206) (bvsub (bvadd #b00000000000000000000000000000001 (size!45727 a!4032)) to!206)))))

(declare-fun bm!65968 () Bool)

(assert (=> bm!65968 (= call!65971 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377261 () Bool)

(assert (=> b!1377261 (= e!780157 e!780153)))

(declare-fun res!920027 () Bool)

(assert (=> b!1377261 (=> (not res!920027) (not e!780153))))

(assert (=> b!1377261 (= res!920027 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45727 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!605869 () Unit!45671)

(assert (=> b!1377261 (= lt!605869 e!780156)))

(declare-fun c!128057 () Bool)

(assert (=> b!1377261 (= c!128057 (validKeyInArray!0 (select (arr!45177 a!4032) to!206)))))

(declare-fun b!1377262 () Bool)

(declare-fun res!920023 () Bool)

(assert (=> b!1377262 (=> (not res!920023) (not e!780155))))

(assert (=> b!1377262 (= res!920023 (validKeyInArray!0 (select (arr!45177 a!4032) i!1445)))))

(declare-fun bm!65969 () Bool)

(assert (=> bm!65969 (= call!65972 (arrayCountValidKeys!0 lt!605865 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377263 () Bool)

(declare-fun res!920026 () Bool)

(assert (=> b!1377263 (=> (not res!920026) (not e!780155))))

(assert (=> b!1377263 (= res!920026 (and (bvslt (size!45727 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45727 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1377264 () Bool)

(declare-fun lt!605872 () Unit!45671)

(assert (=> b!1377264 (= e!780156 lt!605872)))

(declare-fun lt!605870 () Unit!45671)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93547 (_ BitVec 32) (_ BitVec 32)) Unit!45671)

(assert (=> b!1377264 (= lt!605870 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377264 (= call!65971 (bvadd #b00000000000000000000000000000001 lt!605866))))

(assert (=> b!1377264 (= lt!605872 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605865 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377264 (= call!65972 (bvadd #b00000000000000000000000000000001 lt!605871))))

(declare-fun b!1377265 () Bool)

(declare-fun res!920028 () Bool)

(assert (=> b!1377265 (=> (not res!920028) (not e!780153))))

(assert (=> b!1377265 (= res!920028 (= (arrayCountValidKeys!0 lt!605865 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206))))))

(assert (= (and start!116878 res!920024) b!1377262))

(assert (= (and b!1377262 res!920023) b!1377258))

(assert (= (and b!1377258 res!920025) b!1377263))

(assert (= (and b!1377263 res!920026) b!1377257))

(assert (= (and b!1377257 res!920029) b!1377261))

(assert (= (and b!1377261 c!128057) b!1377264))

(assert (= (and b!1377261 (not c!128057)) b!1377259))

(assert (= (or b!1377264 b!1377259) bm!65969))

(assert (= (or b!1377264 b!1377259) bm!65968))

(assert (= (and b!1377261 res!920027) b!1377265))

(assert (= (and b!1377265 res!920028) b!1377260))

(declare-fun m!1261501 () Bool)

(assert (=> bm!65968 m!1261501))

(declare-fun m!1261503 () Bool)

(assert (=> b!1377259 m!1261503))

(declare-fun m!1261505 () Bool)

(assert (=> b!1377259 m!1261505))

(declare-fun m!1261507 () Bool)

(assert (=> b!1377258 m!1261507))

(declare-fun m!1261509 () Bool)

(assert (=> b!1377257 m!1261509))

(declare-fun m!1261511 () Bool)

(assert (=> b!1377257 m!1261511))

(declare-fun m!1261513 () Bool)

(assert (=> b!1377257 m!1261513))

(declare-fun m!1261515 () Bool)

(assert (=> b!1377264 m!1261515))

(declare-fun m!1261517 () Bool)

(assert (=> b!1377264 m!1261517))

(declare-fun m!1261519 () Bool)

(assert (=> b!1377265 m!1261519))

(assert (=> b!1377265 m!1261501))

(assert (=> bm!65969 m!1261519))

(declare-fun m!1261521 () Bool)

(assert (=> start!116878 m!1261521))

(declare-fun m!1261523 () Bool)

(assert (=> b!1377261 m!1261523))

(assert (=> b!1377261 m!1261523))

(declare-fun m!1261525 () Bool)

(assert (=> b!1377261 m!1261525))

(declare-fun m!1261527 () Bool)

(assert (=> b!1377262 m!1261527))

(assert (=> b!1377262 m!1261527))

(declare-fun m!1261529 () Bool)

(assert (=> b!1377262 m!1261529))

(check-sat (not bm!65968) (not b!1377265) (not b!1377258) (not bm!65969) (not b!1377261) (not b!1377264) (not b!1377257) (not b!1377262) (not b!1377259) (not start!116878))
(check-sat)
