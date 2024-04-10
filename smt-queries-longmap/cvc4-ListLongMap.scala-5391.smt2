; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71948 () Bool)

(assert start!71948)

(declare-fun b!836034 () Bool)

(declare-datatypes ((Unit!28771 0))(
  ( (Unit!28772) )
))
(declare-fun e!466394 () Unit!28771)

(declare-fun lt!380280 () Unit!28771)

(assert (=> b!836034 (= e!466394 lt!380280)))

(declare-datatypes ((array!46858 0))(
  ( (array!46859 (arr!22463 (Array (_ BitVec 32) (_ BitVec 64))) (size!22884 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46858)

(declare-fun lt!380279 () Unit!28771)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46858 (_ BitVec 32) (_ BitVec 32)) Unit!28771)

(assert (=> b!836034 (= lt!380279 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36793 () (_ BitVec 32))

(declare-fun lt!380277 () (_ BitVec 32))

(assert (=> b!836034 (= call!36793 lt!380277)))

(declare-fun lt!380281 () array!46858)

(assert (=> b!836034 (= lt!380280 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!380281 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36794 () (_ BitVec 32))

(declare-fun lt!380273 () (_ BitVec 32))

(assert (=> b!836034 (= call!36794 lt!380273)))

(declare-fun b!836035 () Bool)

(declare-fun e!466393 () Bool)

(assert (=> b!836035 (= e!466393 (not true))))

(declare-fun arrayCountValidKeys!0 (array!46858 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!836035 (= (arrayCountValidKeys!0 lt!380281 (bvadd #b00000000000000000000000000000001 i!1466) (size!22884 a!4227)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (size!22884 a!4227)))))

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun lt!380278 () Unit!28771)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!46858 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!28771)

(assert (=> b!836035 (= lt!380278 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4227 i!1466 k!2968 (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!836036 () Bool)

(declare-fun res!568781 () Bool)

(assert (=> b!836036 (=> (not res!568781) (not e!466393))))

(assert (=> b!836036 (= res!568781 (= (arrayCountValidKeys!0 lt!380281 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390))))))

(declare-fun b!836037 () Bool)

(declare-fun e!466395 () Bool)

(assert (=> b!836037 (= e!466395 e!466393)))

(declare-fun res!568786 () Bool)

(assert (=> b!836037 (=> (not res!568786) (not e!466393))))

(assert (=> b!836037 (= res!568786 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22884 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!380274 () Unit!28771)

(assert (=> b!836037 (= lt!380274 e!466394)))

(declare-fun c!91022 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!836037 (= c!91022 (validKeyInArray!0 (select (arr!22463 a!4227) to!390)))))

(declare-fun res!568784 () Bool)

(declare-fun e!466391 () Bool)

(assert (=> start!71948 (=> (not res!568784) (not e!466391))))

(assert (=> start!71948 (= res!568784 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22884 a!4227))))))

(assert (=> start!71948 e!466391))

(assert (=> start!71948 true))

(declare-fun array_inv!17910 (array!46858) Bool)

(assert (=> start!71948 (array_inv!17910 a!4227)))

(declare-fun bm!36790 () Bool)

(assert (=> bm!36790 (= call!36793 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!836038 () Bool)

(declare-fun lt!380275 () Unit!28771)

(assert (=> b!836038 (= e!466394 lt!380275)))

(declare-fun lt!380276 () Unit!28771)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46858 (_ BitVec 32) (_ BitVec 32)) Unit!28771)

(assert (=> b!836038 (= lt!380276 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836038 (= call!36793 (bvadd #b00000000000000000000000000000001 lt!380277))))

(assert (=> b!836038 (= lt!380275 (lemmaValidKeyIncreasesNumOfKeys!0 lt!380281 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836038 (= call!36794 (bvadd #b00000000000000000000000000000001 lt!380273))))

(declare-fun bm!36791 () Bool)

(assert (=> bm!36791 (= call!36794 (arrayCountValidKeys!0 lt!380281 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!836039 () Bool)

(declare-fun res!568787 () Bool)

(assert (=> b!836039 (=> (not res!568787) (not e!466391))))

(assert (=> b!836039 (= res!568787 (validKeyInArray!0 k!2968))))

(declare-fun b!836040 () Bool)

(assert (=> b!836040 (= e!466391 e!466395)))

(declare-fun res!568785 () Bool)

(assert (=> b!836040 (=> (not res!568785) (not e!466395))))

(assert (=> b!836040 (= res!568785 (and (= lt!380273 lt!380277) (not (= to!390 (size!22884 a!4227)))))))

(assert (=> b!836040 (= lt!380277 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836040 (= lt!380273 (arrayCountValidKeys!0 lt!380281 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836040 (= lt!380281 (array!46859 (store (arr!22463 a!4227) i!1466 k!2968) (size!22884 a!4227)))))

(declare-fun b!836041 () Bool)

(declare-fun res!568782 () Bool)

(assert (=> b!836041 (=> (not res!568782) (not e!466391))))

(assert (=> b!836041 (= res!568782 (and (bvslt (size!22884 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22884 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!836042 () Bool)

(declare-fun res!568783 () Bool)

(assert (=> b!836042 (=> (not res!568783) (not e!466391))))

(assert (=> b!836042 (= res!568783 (not (validKeyInArray!0 (select (arr!22463 a!4227) i!1466))))))

(assert (= (and start!71948 res!568784) b!836042))

(assert (= (and b!836042 res!568783) b!836039))

(assert (= (and b!836039 res!568787) b!836041))

(assert (= (and b!836041 res!568782) b!836040))

(assert (= (and b!836040 res!568785) b!836037))

(assert (= (and b!836037 c!91022) b!836038))

(assert (= (and b!836037 (not c!91022)) b!836034))

(assert (= (or b!836038 b!836034) bm!36791))

(assert (= (or b!836038 b!836034) bm!36790))

(assert (= (and b!836037 res!568786) b!836036))

(assert (= (and b!836036 res!568781) b!836035))

(declare-fun m!781381 () Bool)

(assert (=> bm!36791 m!781381))

(declare-fun m!781383 () Bool)

(assert (=> b!836042 m!781383))

(assert (=> b!836042 m!781383))

(declare-fun m!781385 () Bool)

(assert (=> b!836042 m!781385))

(declare-fun m!781387 () Bool)

(assert (=> b!836040 m!781387))

(declare-fun m!781389 () Bool)

(assert (=> b!836040 m!781389))

(declare-fun m!781391 () Bool)

(assert (=> b!836040 m!781391))

(declare-fun m!781393 () Bool)

(assert (=> b!836034 m!781393))

(declare-fun m!781395 () Bool)

(assert (=> b!836034 m!781395))

(declare-fun m!781397 () Bool)

(assert (=> bm!36790 m!781397))

(declare-fun m!781399 () Bool)

(assert (=> b!836035 m!781399))

(declare-fun m!781401 () Bool)

(assert (=> b!836035 m!781401))

(declare-fun m!781403 () Bool)

(assert (=> b!836035 m!781403))

(declare-fun m!781405 () Bool)

(assert (=> b!836039 m!781405))

(declare-fun m!781407 () Bool)

(assert (=> b!836038 m!781407))

(declare-fun m!781409 () Bool)

(assert (=> b!836038 m!781409))

(assert (=> b!836036 m!781381))

(assert (=> b!836036 m!781397))

(declare-fun m!781411 () Bool)

(assert (=> b!836037 m!781411))

(assert (=> b!836037 m!781411))

(declare-fun m!781413 () Bool)

(assert (=> b!836037 m!781413))

(declare-fun m!781415 () Bool)

(assert (=> start!71948 m!781415))

(push 1)

(assert (not b!836037))

(assert (not b!836035))

(assert (not b!836034))

(assert (not bm!36791))

(assert (not start!71948))

(assert (not bm!36790))

(assert (not b!836038))

(assert (not b!836039))

(assert (not b!836036))

