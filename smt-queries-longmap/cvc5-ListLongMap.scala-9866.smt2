; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116882 () Bool)

(assert start!116882)

(declare-fun b!1377311 () Bool)

(declare-datatypes ((Unit!45675 0))(
  ( (Unit!45676) )
))
(declare-fun e!780184 () Unit!45675)

(declare-fun lt!605920 () Unit!45675)

(assert (=> b!1377311 (= e!780184 lt!605920)))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93551 0))(
  ( (array!93552 (arr!45179 (Array (_ BitVec 32) (_ BitVec 64))) (size!45729 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93551)

(declare-fun lt!605915 () Unit!45675)

(declare-fun to!206 () (_ BitVec 32))

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93551 (_ BitVec 32) (_ BitVec 32)) Unit!45675)

(assert (=> b!1377311 (= lt!605915 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65983 () (_ BitVec 32))

(declare-fun lt!605923 () (_ BitVec 32))

(assert (=> b!1377311 (= call!65983 (bvadd #b00000000000000000000000000000001 lt!605923))))

(declare-fun lt!605922 () array!93551)

(assert (=> b!1377311 (= lt!605920 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605922 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65984 () (_ BitVec 32))

(declare-fun lt!605919 () (_ BitVec 32))

(assert (=> b!1377311 (= call!65984 (bvadd #b00000000000000000000000000000001 lt!605919))))

(declare-fun b!1377312 () Bool)

(declare-fun res!920068 () Bool)

(declare-fun e!780186 () Bool)

(assert (=> b!1377312 (=> (not res!920068) (not e!780186))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377312 (= res!920068 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1377313 () Bool)

(declare-fun e!780187 () Bool)

(assert (=> b!1377313 (= e!780187 (not true))))

(declare-fun arrayCountValidKeys!0 (array!93551 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377313 (= (arrayCountValidKeys!0 lt!605922 (bvadd #b00000000000000000000000000000001 i!1445) (size!45729 a!4032)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (size!45729 a!4032)))))

(declare-fun lt!605921 () Unit!45675)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93551 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45675)

(assert (=> b!1377313 (= lt!605921 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4032 i!1445 k!2947 (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377314 () Bool)

(declare-fun e!780185 () Bool)

(assert (=> b!1377314 (= e!780186 e!780185)))

(declare-fun res!920069 () Bool)

(assert (=> b!1377314 (=> (not res!920069) (not e!780185))))

(assert (=> b!1377314 (= res!920069 (and (= lt!605919 lt!605923) (not (= to!206 (size!45729 a!4032)))))))

(assert (=> b!1377314 (= lt!605923 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377314 (= lt!605919 (arrayCountValidKeys!0 lt!605922 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377314 (= lt!605922 (array!93552 (store (arr!45179 a!4032) i!1445 k!2947) (size!45729 a!4032)))))

(declare-fun b!1377315 () Bool)

(assert (=> b!1377315 (= e!780185 e!780187)))

(declare-fun res!920067 () Bool)

(assert (=> b!1377315 (=> (not res!920067) (not e!780187))))

(assert (=> b!1377315 (= res!920067 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45729 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!605917 () Unit!45675)

(assert (=> b!1377315 (= lt!605917 e!780184)))

(declare-fun c!128063 () Bool)

(assert (=> b!1377315 (= c!128063 (validKeyInArray!0 (select (arr!45179 a!4032) to!206)))))

(declare-fun res!920070 () Bool)

(assert (=> start!116882 (=> (not res!920070) (not e!780186))))

(assert (=> start!116882 (= res!920070 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45729 a!4032))))))

(assert (=> start!116882 e!780186))

(assert (=> start!116882 true))

(declare-fun array_inv!34207 (array!93551) Bool)

(assert (=> start!116882 (array_inv!34207 a!4032)))

(declare-fun bm!65980 () Bool)

(assert (=> bm!65980 (= call!65984 (arrayCountValidKeys!0 (ite c!128063 lt!605922 a!4032) (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377316 () Bool)

(declare-fun res!920065 () Bool)

(assert (=> b!1377316 (=> (not res!920065) (not e!780186))))

(assert (=> b!1377316 (= res!920065 (and (bvslt (size!45729 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45729 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1377317 () Bool)

(declare-fun lt!605918 () Unit!45675)

(assert (=> b!1377317 (= e!780184 lt!605918)))

(declare-fun lt!605916 () Unit!45675)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93551 (_ BitVec 32) (_ BitVec 32)) Unit!45675)

(assert (=> b!1377317 (= lt!605916 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377317 (= call!65984 lt!605923)))

(assert (=> b!1377317 (= lt!605918 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605922 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377317 (= call!65983 lt!605919)))

(declare-fun b!1377318 () Bool)

(declare-fun res!920071 () Bool)

(assert (=> b!1377318 (=> (not res!920071) (not e!780186))))

(assert (=> b!1377318 (= res!920071 (validKeyInArray!0 (select (arr!45179 a!4032) i!1445)))))

(declare-fun bm!65981 () Bool)

(assert (=> bm!65981 (= call!65983 (arrayCountValidKeys!0 (ite c!128063 a!4032 lt!605922) (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377319 () Bool)

(declare-fun res!920066 () Bool)

(assert (=> b!1377319 (=> (not res!920066) (not e!780187))))

(assert (=> b!1377319 (= res!920066 (= (arrayCountValidKeys!0 lt!605922 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206))))))

(assert (= (and start!116882 res!920070) b!1377318))

(assert (= (and b!1377318 res!920071) b!1377312))

(assert (= (and b!1377312 res!920068) b!1377316))

(assert (= (and b!1377316 res!920065) b!1377314))

(assert (= (and b!1377314 res!920069) b!1377315))

(assert (= (and b!1377315 c!128063) b!1377311))

(assert (= (and b!1377315 (not c!128063)) b!1377317))

(assert (= (or b!1377311 b!1377317) bm!65981))

(assert (= (or b!1377311 b!1377317) bm!65980))

(assert (= (and b!1377315 res!920067) b!1377319))

(assert (= (and b!1377319 res!920066) b!1377313))

(declare-fun m!1261561 () Bool)

(assert (=> b!1377313 m!1261561))

(declare-fun m!1261563 () Bool)

(assert (=> b!1377313 m!1261563))

(declare-fun m!1261565 () Bool)

(assert (=> b!1377313 m!1261565))

(declare-fun m!1261567 () Bool)

(assert (=> b!1377312 m!1261567))

(declare-fun m!1261569 () Bool)

(assert (=> bm!65980 m!1261569))

(declare-fun m!1261571 () Bool)

(assert (=> b!1377315 m!1261571))

(assert (=> b!1377315 m!1261571))

(declare-fun m!1261573 () Bool)

(assert (=> b!1377315 m!1261573))

(declare-fun m!1261575 () Bool)

(assert (=> b!1377317 m!1261575))

(declare-fun m!1261577 () Bool)

(assert (=> b!1377317 m!1261577))

(declare-fun m!1261579 () Bool)

(assert (=> start!116882 m!1261579))

(declare-fun m!1261581 () Bool)

(assert (=> b!1377311 m!1261581))

(declare-fun m!1261583 () Bool)

(assert (=> b!1377311 m!1261583))

(declare-fun m!1261585 () Bool)

(assert (=> b!1377319 m!1261585))

(declare-fun m!1261587 () Bool)

(assert (=> b!1377319 m!1261587))

(declare-fun m!1261589 () Bool)

(assert (=> b!1377314 m!1261589))

(declare-fun m!1261591 () Bool)

(assert (=> b!1377314 m!1261591))

(declare-fun m!1261593 () Bool)

(assert (=> b!1377314 m!1261593))

(declare-fun m!1261595 () Bool)

(assert (=> b!1377318 m!1261595))

(assert (=> b!1377318 m!1261595))

(declare-fun m!1261597 () Bool)

(assert (=> b!1377318 m!1261597))

(declare-fun m!1261599 () Bool)

(assert (=> bm!65981 m!1261599))

(push 1)

