; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71942 () Bool)

(assert start!71942)

(declare-fun b!835953 () Bool)

(declare-fun e!466346 () Bool)

(declare-fun e!466348 () Bool)

(assert (=> b!835953 (= e!466346 e!466348)))

(declare-fun res!568718 () Bool)

(assert (=> b!835953 (=> (not res!568718) (not e!466348))))

(declare-datatypes ((array!46852 0))(
  ( (array!46853 (arr!22460 (Array (_ BitVec 32) (_ BitVec 64))) (size!22881 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46852)

(declare-fun lt!380198 () (_ BitVec 32))

(declare-fun lt!380195 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!835953 (= res!568718 (and (= lt!380198 lt!380195) (not (= to!390 (size!22881 a!4227)))))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46852 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835953 (= lt!380195 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!380194 () array!46852)

(assert (=> b!835953 (= lt!380198 (arrayCountValidKeys!0 lt!380194 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k!2968 () (_ BitVec 64))

(assert (=> b!835953 (= lt!380194 (array!46853 (store (arr!22460 a!4227) i!1466 k!2968) (size!22881 a!4227)))))

(declare-fun b!835954 () Bool)

(declare-datatypes ((Unit!28765 0))(
  ( (Unit!28766) )
))
(declare-fun e!466349 () Unit!28765)

(declare-fun lt!380199 () Unit!28765)

(assert (=> b!835954 (= e!466349 lt!380199)))

(declare-fun lt!380197 () Unit!28765)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46852 (_ BitVec 32) (_ BitVec 32)) Unit!28765)

(assert (=> b!835954 (= lt!380197 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36776 () (_ BitVec 32))

(assert (=> b!835954 (= call!36776 lt!380195)))

(assert (=> b!835954 (= lt!380199 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!380194 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36775 () (_ BitVec 32))

(assert (=> b!835954 (= call!36775 lt!380198)))

(declare-fun res!568724 () Bool)

(assert (=> start!71942 (=> (not res!568724) (not e!466346))))

(assert (=> start!71942 (= res!568724 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22881 a!4227))))))

(assert (=> start!71942 e!466346))

(assert (=> start!71942 true))

(declare-fun array_inv!17907 (array!46852) Bool)

(assert (=> start!71942 (array_inv!17907 a!4227)))

(declare-fun b!835955 () Bool)

(declare-fun lt!380196 () Unit!28765)

(assert (=> b!835955 (= e!466349 lt!380196)))

(declare-fun lt!380193 () Unit!28765)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46852 (_ BitVec 32) (_ BitVec 32)) Unit!28765)

(assert (=> b!835955 (= lt!380193 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835955 (= call!36776 (bvadd #b00000000000000000000000000000001 lt!380195))))

(assert (=> b!835955 (= lt!380196 (lemmaValidKeyIncreasesNumOfKeys!0 lt!380194 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835955 (= call!36775 (bvadd #b00000000000000000000000000000001 lt!380198))))

(declare-fun b!835956 () Bool)

(declare-fun res!568722 () Bool)

(assert (=> b!835956 (=> (not res!568722) (not e!466346))))

(assert (=> b!835956 (= res!568722 (and (bvslt (size!22881 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22881 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835957 () Bool)

(declare-fun res!568720 () Bool)

(assert (=> b!835957 (=> (not res!568720) (not e!466346))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835957 (= res!568720 (validKeyInArray!0 k!2968))))

(declare-fun b!835958 () Bool)

(declare-fun res!568723 () Bool)

(assert (=> b!835958 (=> (not res!568723) (not e!466346))))

(assert (=> b!835958 (= res!568723 (not (validKeyInArray!0 (select (arr!22460 a!4227) i!1466))))))

(declare-fun b!835959 () Bool)

(declare-fun e!466347 () Bool)

(assert (=> b!835959 (= e!466347 (bvsge (bvsub (size!22881 a!4227) to!390) (bvsub (bvadd #b00000000000000000000000000000001 (size!22881 a!4227)) to!390)))))

(declare-fun bm!36772 () Bool)

(assert (=> bm!36772 (= call!36776 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835960 () Bool)

(assert (=> b!835960 (= e!466348 e!466347)))

(declare-fun res!568721 () Bool)

(assert (=> b!835960 (=> (not res!568721) (not e!466347))))

(assert (=> b!835960 (= res!568721 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22881 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!380200 () Unit!28765)

(assert (=> b!835960 (= lt!380200 e!466349)))

(declare-fun c!91013 () Bool)

(assert (=> b!835960 (= c!91013 (validKeyInArray!0 (select (arr!22460 a!4227) to!390)))))

(declare-fun bm!36773 () Bool)

(assert (=> bm!36773 (= call!36775 (arrayCountValidKeys!0 lt!380194 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835961 () Bool)

(declare-fun res!568719 () Bool)

(assert (=> b!835961 (=> (not res!568719) (not e!466347))))

(assert (=> b!835961 (= res!568719 (= (arrayCountValidKeys!0 lt!380194 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390))))))

(assert (= (and start!71942 res!568724) b!835958))

(assert (= (and b!835958 res!568723) b!835957))

(assert (= (and b!835957 res!568720) b!835956))

(assert (= (and b!835956 res!568722) b!835953))

(assert (= (and b!835953 res!568718) b!835960))

(assert (= (and b!835960 c!91013) b!835955))

(assert (= (and b!835960 (not c!91013)) b!835954))

(assert (= (or b!835955 b!835954) bm!36773))

(assert (= (or b!835955 b!835954) bm!36772))

(assert (= (and b!835960 res!568721) b!835961))

(assert (= (and b!835961 res!568719) b!835959))

(declare-fun m!781279 () Bool)

(assert (=> bm!36772 m!781279))

(declare-fun m!781281 () Bool)

(assert (=> b!835955 m!781281))

(declare-fun m!781283 () Bool)

(assert (=> b!835955 m!781283))

(declare-fun m!781285 () Bool)

(assert (=> b!835961 m!781285))

(assert (=> b!835961 m!781279))

(declare-fun m!781287 () Bool)

(assert (=> b!835957 m!781287))

(declare-fun m!781289 () Bool)

(assert (=> b!835953 m!781289))

(declare-fun m!781291 () Bool)

(assert (=> b!835953 m!781291))

(declare-fun m!781293 () Bool)

(assert (=> b!835953 m!781293))

(declare-fun m!781295 () Bool)

(assert (=> b!835958 m!781295))

(assert (=> b!835958 m!781295))

(declare-fun m!781297 () Bool)

(assert (=> b!835958 m!781297))

(declare-fun m!781299 () Bool)

(assert (=> start!71942 m!781299))

(declare-fun m!781301 () Bool)

(assert (=> b!835954 m!781301))

(declare-fun m!781303 () Bool)

(assert (=> b!835954 m!781303))

(declare-fun m!781305 () Bool)

(assert (=> b!835960 m!781305))

(assert (=> b!835960 m!781305))

(declare-fun m!781307 () Bool)

(assert (=> b!835960 m!781307))

(assert (=> bm!36773 m!781285))

(push 1)

(assert (not b!835957))

(assert (not b!835958))

(assert (not b!835955))

(assert (not bm!36772))

(assert (not b!835961))

(assert (not b!835954))

(assert (not start!71942))

(assert (not b!835953))

(assert (not b!835960))

(assert (not bm!36773))

(check-sat)

(pop 1)

(push 1)

(check-sat)

