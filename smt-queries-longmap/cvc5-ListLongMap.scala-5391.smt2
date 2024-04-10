; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71944 () Bool)

(assert start!71944)

(declare-fun b!835980 () Bool)

(declare-fun res!568740 () Bool)

(declare-fun e!466365 () Bool)

(assert (=> b!835980 (=> (not res!568740) (not e!466365))))

(declare-datatypes ((array!46854 0))(
  ( (array!46855 (arr!22461 (Array (_ BitVec 32) (_ BitVec 64))) (size!22882 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46854)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!835980 (= res!568740 (and (bvslt (size!22882 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22882 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835981 () Bool)

(declare-fun e!466364 () Bool)

(declare-fun e!466363 () Bool)

(assert (=> b!835981 (= e!466364 e!466363)))

(declare-fun res!568745 () Bool)

(assert (=> b!835981 (=> (not res!568745) (not e!466363))))

(assert (=> b!835981 (= res!568745 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22882 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-datatypes ((Unit!28767 0))(
  ( (Unit!28768) )
))
(declare-fun lt!380225 () Unit!28767)

(declare-fun e!466361 () Unit!28767)

(assert (=> b!835981 (= lt!380225 e!466361)))

(declare-fun c!91016 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835981 (= c!91016 (validKeyInArray!0 (select (arr!22461 a!4227) to!390)))))

(declare-fun res!568742 () Bool)

(assert (=> start!71944 (=> (not res!568742) (not e!466365))))

(assert (=> start!71944 (= res!568742 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22882 a!4227))))))

(assert (=> start!71944 e!466365))

(assert (=> start!71944 true))

(declare-fun array_inv!17908 (array!46854) Bool)

(assert (=> start!71944 (array_inv!17908 a!4227)))

(declare-fun b!835982 () Bool)

(declare-fun lt!380227 () Unit!28767)

(assert (=> b!835982 (= e!466361 lt!380227)))

(declare-fun lt!380222 () Unit!28767)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46854 (_ BitVec 32) (_ BitVec 32)) Unit!28767)

(assert (=> b!835982 (= lt!380222 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36782 () (_ BitVec 32))

(declare-fun lt!380224 () (_ BitVec 32))

(assert (=> b!835982 (= call!36782 lt!380224)))

(declare-fun lt!380223 () array!46854)

(assert (=> b!835982 (= lt!380227 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!380223 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36781 () (_ BitVec 32))

(declare-fun lt!380226 () (_ BitVec 32))

(assert (=> b!835982 (= call!36781 lt!380226)))

(declare-fun b!835983 () Bool)

(assert (=> b!835983 (= e!466363 (not true))))

(declare-fun arrayCountValidKeys!0 (array!46854 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835983 (= (arrayCountValidKeys!0 lt!380223 (bvadd #b00000000000000000000000000000001 i!1466) (size!22882 a!4227)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (size!22882 a!4227)))))

(declare-fun lt!380219 () Unit!28767)

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!46854 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!28767)

(assert (=> b!835983 (= lt!380219 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4227 i!1466 k!2968 (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835984 () Bool)

(declare-fun res!568744 () Bool)

(assert (=> b!835984 (=> (not res!568744) (not e!466365))))

(assert (=> b!835984 (= res!568744 (not (validKeyInArray!0 (select (arr!22461 a!4227) i!1466))))))

(declare-fun bm!36778 () Bool)

(assert (=> bm!36778 (= call!36782 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835985 () Bool)

(declare-fun res!568739 () Bool)

(assert (=> b!835985 (=> (not res!568739) (not e!466363))))

(assert (=> b!835985 (= res!568739 (= (arrayCountValidKeys!0 lt!380223 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390))))))

(declare-fun b!835986 () Bool)

(assert (=> b!835986 (= e!466365 e!466364)))

(declare-fun res!568743 () Bool)

(assert (=> b!835986 (=> (not res!568743) (not e!466364))))

(assert (=> b!835986 (= res!568743 (and (= lt!380226 lt!380224) (not (= to!390 (size!22882 a!4227)))))))

(assert (=> b!835986 (= lt!380224 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835986 (= lt!380226 (arrayCountValidKeys!0 lt!380223 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835986 (= lt!380223 (array!46855 (store (arr!22461 a!4227) i!1466 k!2968) (size!22882 a!4227)))))

(declare-fun b!835987 () Bool)

(declare-fun res!568741 () Bool)

(assert (=> b!835987 (=> (not res!568741) (not e!466365))))

(assert (=> b!835987 (= res!568741 (validKeyInArray!0 k!2968))))

(declare-fun b!835988 () Bool)

(declare-fun lt!380221 () Unit!28767)

(assert (=> b!835988 (= e!466361 lt!380221)))

(declare-fun lt!380220 () Unit!28767)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46854 (_ BitVec 32) (_ BitVec 32)) Unit!28767)

(assert (=> b!835988 (= lt!380220 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835988 (= call!36782 (bvadd #b00000000000000000000000000000001 lt!380224))))

(assert (=> b!835988 (= lt!380221 (lemmaValidKeyIncreasesNumOfKeys!0 lt!380223 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835988 (= call!36781 (bvadd #b00000000000000000000000000000001 lt!380226))))

(declare-fun bm!36779 () Bool)

(assert (=> bm!36779 (= call!36781 (arrayCountValidKeys!0 lt!380223 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(assert (= (and start!71944 res!568742) b!835984))

(assert (= (and b!835984 res!568744) b!835987))

(assert (= (and b!835987 res!568741) b!835980))

(assert (= (and b!835980 res!568740) b!835986))

(assert (= (and b!835986 res!568743) b!835981))

(assert (= (and b!835981 c!91016) b!835988))

(assert (= (and b!835981 (not c!91016)) b!835982))

(assert (= (or b!835988 b!835982) bm!36779))

(assert (= (or b!835988 b!835982) bm!36778))

(assert (= (and b!835981 res!568745) b!835985))

(assert (= (and b!835985 res!568739) b!835983))

(declare-fun m!781309 () Bool)

(assert (=> b!835988 m!781309))

(declare-fun m!781311 () Bool)

(assert (=> b!835988 m!781311))

(declare-fun m!781313 () Bool)

(assert (=> b!835985 m!781313))

(declare-fun m!781315 () Bool)

(assert (=> b!835985 m!781315))

(declare-fun m!781317 () Bool)

(assert (=> b!835982 m!781317))

(declare-fun m!781319 () Bool)

(assert (=> b!835982 m!781319))

(assert (=> bm!36779 m!781313))

(declare-fun m!781321 () Bool)

(assert (=> b!835981 m!781321))

(assert (=> b!835981 m!781321))

(declare-fun m!781323 () Bool)

(assert (=> b!835981 m!781323))

(declare-fun m!781325 () Bool)

(assert (=> b!835983 m!781325))

(declare-fun m!781327 () Bool)

(assert (=> b!835983 m!781327))

(declare-fun m!781329 () Bool)

(assert (=> b!835983 m!781329))

(declare-fun m!781331 () Bool)

(assert (=> b!835986 m!781331))

(declare-fun m!781333 () Bool)

(assert (=> b!835986 m!781333))

(declare-fun m!781335 () Bool)

(assert (=> b!835986 m!781335))

(declare-fun m!781337 () Bool)

(assert (=> start!71944 m!781337))

(declare-fun m!781339 () Bool)

(assert (=> b!835987 m!781339))

(assert (=> bm!36778 m!781315))

(declare-fun m!781341 () Bool)

(assert (=> b!835984 m!781341))

(assert (=> b!835984 m!781341))

(declare-fun m!781343 () Bool)

(assert (=> b!835984 m!781343))

(push 1)

