; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71952 () Bool)

(assert start!71952)

(declare-fun b!836088 () Bool)

(declare-fun e!466424 () Bool)

(declare-fun e!466425 () Bool)

(assert (=> b!836088 (= e!466424 e!466425)))

(declare-fun res!568828 () Bool)

(assert (=> b!836088 (=> (not res!568828) (not e!466425))))

(declare-datatypes ((array!46862 0))(
  ( (array!46863 (arr!22465 (Array (_ BitVec 32) (_ BitVec 64))) (size!22886 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46862)

(declare-fun lt!380329 () (_ BitVec 32))

(declare-fun lt!380333 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!836088 (= res!568828 (and (= lt!380329 lt!380333) (not (= to!390 (size!22886 a!4227)))))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46862 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!836088 (= lt!380333 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!380332 () array!46862)

(assert (=> b!836088 (= lt!380329 (arrayCountValidKeys!0 lt!380332 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!836088 (= lt!380332 (array!46863 (store (arr!22465 a!4227) i!1466 k0!2968) (size!22886 a!4227)))))

(declare-fun bm!36802 () Bool)

(declare-fun call!36806 () (_ BitVec 32))

(assert (=> bm!36802 (= call!36806 (arrayCountValidKeys!0 lt!380332 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun res!568827 () Bool)

(assert (=> start!71952 (=> (not res!568827) (not e!466424))))

(assert (=> start!71952 (= res!568827 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22886 a!4227))))))

(assert (=> start!71952 e!466424))

(assert (=> start!71952 true))

(declare-fun array_inv!17912 (array!46862) Bool)

(assert (=> start!71952 (array_inv!17912 a!4227)))

(declare-fun b!836089 () Bool)

(declare-datatypes ((Unit!28775 0))(
  ( (Unit!28776) )
))
(declare-fun e!466423 () Unit!28775)

(declare-fun lt!380330 () Unit!28775)

(assert (=> b!836089 (= e!466423 lt!380330)))

(declare-fun lt!380334 () Unit!28775)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46862 (_ BitVec 32) (_ BitVec 32)) Unit!28775)

(assert (=> b!836089 (= lt!380334 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36805 () (_ BitVec 32))

(assert (=> b!836089 (= call!36805 (bvadd #b00000000000000000000000000000001 lt!380333))))

(assert (=> b!836089 (= lt!380330 (lemmaValidKeyIncreasesNumOfKeys!0 lt!380332 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836089 (= call!36806 (bvadd #b00000000000000000000000000000001 lt!380329))))

(declare-fun bm!36803 () Bool)

(assert (=> bm!36803 (= call!36805 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!836090 () Bool)

(declare-fun e!466421 () Bool)

(assert (=> b!836090 (= e!466421 (not true))))

(assert (=> b!836090 (= (arrayCountValidKeys!0 lt!380332 (bvadd #b00000000000000000000000000000001 i!1466) (size!22886 a!4227)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (size!22886 a!4227)))))

(declare-fun lt!380328 () Unit!28775)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!46862 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!28775)

(assert (=> b!836090 (= lt!380328 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4227 i!1466 k0!2968 (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!836091 () Bool)

(declare-fun res!568823 () Bool)

(assert (=> b!836091 (=> (not res!568823) (not e!466424))))

(assert (=> b!836091 (= res!568823 (and (bvslt (size!22886 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22886 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!836092 () Bool)

(declare-fun res!568825 () Bool)

(assert (=> b!836092 (=> (not res!568825) (not e!466424))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!836092 (= res!568825 (validKeyInArray!0 k0!2968))))

(declare-fun b!836093 () Bool)

(assert (=> b!836093 (= e!466425 e!466421)))

(declare-fun res!568829 () Bool)

(assert (=> b!836093 (=> (not res!568829) (not e!466421))))

(assert (=> b!836093 (= res!568829 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22886 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!380335 () Unit!28775)

(assert (=> b!836093 (= lt!380335 e!466423)))

(declare-fun c!91028 () Bool)

(assert (=> b!836093 (= c!91028 (validKeyInArray!0 (select (arr!22465 a!4227) to!390)))))

(declare-fun b!836094 () Bool)

(declare-fun res!568826 () Bool)

(assert (=> b!836094 (=> (not res!568826) (not e!466421))))

(assert (=> b!836094 (= res!568826 (= (arrayCountValidKeys!0 lt!380332 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390))))))

(declare-fun b!836095 () Bool)

(declare-fun lt!380327 () Unit!28775)

(assert (=> b!836095 (= e!466423 lt!380327)))

(declare-fun lt!380331 () Unit!28775)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46862 (_ BitVec 32) (_ BitVec 32)) Unit!28775)

(assert (=> b!836095 (= lt!380331 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836095 (= call!36805 lt!380333)))

(assert (=> b!836095 (= lt!380327 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!380332 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836095 (= call!36806 lt!380329)))

(declare-fun b!836096 () Bool)

(declare-fun res!568824 () Bool)

(assert (=> b!836096 (=> (not res!568824) (not e!466424))))

(assert (=> b!836096 (= res!568824 (not (validKeyInArray!0 (select (arr!22465 a!4227) i!1466))))))

(assert (= (and start!71952 res!568827) b!836096))

(assert (= (and b!836096 res!568824) b!836092))

(assert (= (and b!836092 res!568825) b!836091))

(assert (= (and b!836091 res!568823) b!836088))

(assert (= (and b!836088 res!568828) b!836093))

(assert (= (and b!836093 c!91028) b!836089))

(assert (= (and b!836093 (not c!91028)) b!836095))

(assert (= (or b!836089 b!836095) bm!36802))

(assert (= (or b!836089 b!836095) bm!36803))

(assert (= (and b!836093 res!568829) b!836094))

(assert (= (and b!836094 res!568826) b!836090))

(declare-fun m!781453 () Bool)

(assert (=> b!836090 m!781453))

(declare-fun m!781455 () Bool)

(assert (=> b!836090 m!781455))

(declare-fun m!781457 () Bool)

(assert (=> b!836090 m!781457))

(declare-fun m!781459 () Bool)

(assert (=> b!836095 m!781459))

(declare-fun m!781461 () Bool)

(assert (=> b!836095 m!781461))

(declare-fun m!781463 () Bool)

(assert (=> b!836088 m!781463))

(declare-fun m!781465 () Bool)

(assert (=> b!836088 m!781465))

(declare-fun m!781467 () Bool)

(assert (=> b!836088 m!781467))

(declare-fun m!781469 () Bool)

(assert (=> bm!36802 m!781469))

(declare-fun m!781471 () Bool)

(assert (=> b!836093 m!781471))

(assert (=> b!836093 m!781471))

(declare-fun m!781473 () Bool)

(assert (=> b!836093 m!781473))

(declare-fun m!781475 () Bool)

(assert (=> b!836089 m!781475))

(declare-fun m!781477 () Bool)

(assert (=> b!836089 m!781477))

(declare-fun m!781479 () Bool)

(assert (=> b!836096 m!781479))

(assert (=> b!836096 m!781479))

(declare-fun m!781481 () Bool)

(assert (=> b!836096 m!781481))

(declare-fun m!781483 () Bool)

(assert (=> bm!36803 m!781483))

(declare-fun m!781485 () Bool)

(assert (=> start!71952 m!781485))

(declare-fun m!781487 () Bool)

(assert (=> b!836092 m!781487))

(assert (=> b!836094 m!781469))

(assert (=> b!836094 m!781483))

(check-sat (not bm!36802) (not start!71952) (not bm!36803) (not b!836096) (not b!836094) (not b!836090) (not b!836088) (not b!836095) (not b!836089) (not b!836092) (not b!836093))
(check-sat)
