; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71996 () Bool)

(assert start!71996)

(declare-datatypes ((array!46743 0))(
  ( (array!46744 (arr!22401 (Array (_ BitVec 32) (_ BitVec 64))) (size!22821 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46743)

(declare-fun call!36700 () (_ BitVec 32))

(declare-fun bm!36697 () Bool)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46743 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36697 (= call!36700 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun res!568113 () Bool)

(declare-fun e!466395 () Bool)

(assert (=> start!71996 (=> (not res!568113) (not e!466395))))

(assert (=> start!71996 (= res!568113 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22821 a!4227))))))

(assert (=> start!71996 e!466395))

(assert (=> start!71996 true))

(declare-fun array_inv!17887 (array!46743) Bool)

(assert (=> start!71996 (array_inv!17887 a!4227)))

(declare-fun b!835780 () Bool)

(declare-datatypes ((Unit!28714 0))(
  ( (Unit!28715) )
))
(declare-fun e!466392 () Unit!28714)

(declare-fun lt!379923 () Unit!28714)

(assert (=> b!835780 (= e!466392 lt!379923)))

(declare-fun lt!379924 () Unit!28714)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46743 (_ BitVec 32) (_ BitVec 32)) Unit!28714)

(assert (=> b!835780 (= lt!379924 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!379925 () (_ BitVec 32))

(assert (=> b!835780 (= call!36700 lt!379925)))

(declare-fun lt!379920 () array!46743)

(assert (=> b!835780 (= lt!379923 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379920 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36701 () (_ BitVec 32))

(declare-fun lt!379922 () (_ BitVec 32))

(assert (=> b!835780 (= call!36701 lt!379922)))

(declare-fun b!835781 () Bool)

(declare-fun res!568119 () Bool)

(assert (=> b!835781 (=> (not res!568119) (not e!466395))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835781 (= res!568119 (not (validKeyInArray!0 (select (arr!22401 a!4227) i!1466))))))

(declare-fun b!835782 () Bool)

(declare-fun res!568114 () Bool)

(declare-fun e!466394 () Bool)

(assert (=> b!835782 (=> (not res!568114) (not e!466394))))

(assert (=> b!835782 (= res!568114 (= (arrayCountValidKeys!0 lt!379920 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390))))))

(declare-fun b!835783 () Bool)

(assert (=> b!835783 (= e!466394 (not true))))

(assert (=> b!835783 (= (arrayCountValidKeys!0 lt!379920 (bvadd #b00000000000000000000000000000001 i!1466) (size!22821 a!4227)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (size!22821 a!4227)))))

(declare-fun lt!379928 () Unit!28714)

(declare-fun k0!2968 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!46743 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!28714)

(assert (=> b!835783 (= lt!379928 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4227 i!1466 k0!2968 (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835784 () Bool)

(declare-fun lt!379927 () Unit!28714)

(assert (=> b!835784 (= e!466392 lt!379927)))

(declare-fun lt!379921 () Unit!28714)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46743 (_ BitVec 32) (_ BitVec 32)) Unit!28714)

(assert (=> b!835784 (= lt!379921 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835784 (= call!36700 (bvadd #b00000000000000000000000000000001 lt!379925))))

(assert (=> b!835784 (= lt!379927 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379920 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835784 (= call!36701 (bvadd #b00000000000000000000000000000001 lt!379922))))

(declare-fun b!835785 () Bool)

(declare-fun res!568115 () Bool)

(assert (=> b!835785 (=> (not res!568115) (not e!466395))))

(assert (=> b!835785 (= res!568115 (validKeyInArray!0 k0!2968))))

(declare-fun b!835786 () Bool)

(declare-fun res!568117 () Bool)

(assert (=> b!835786 (=> (not res!568117) (not e!466395))))

(assert (=> b!835786 (= res!568117 (and (bvslt (size!22821 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22821 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835787 () Bool)

(declare-fun e!466396 () Bool)

(assert (=> b!835787 (= e!466395 e!466396)))

(declare-fun res!568118 () Bool)

(assert (=> b!835787 (=> (not res!568118) (not e!466396))))

(assert (=> b!835787 (= res!568118 (and (= lt!379922 lt!379925) (not (= to!390 (size!22821 a!4227)))))))

(assert (=> b!835787 (= lt!379925 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835787 (= lt!379922 (arrayCountValidKeys!0 lt!379920 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835787 (= lt!379920 (array!46744 (store (arr!22401 a!4227) i!1466 k0!2968) (size!22821 a!4227)))))

(declare-fun bm!36698 () Bool)

(assert (=> bm!36698 (= call!36701 (arrayCountValidKeys!0 lt!379920 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835788 () Bool)

(assert (=> b!835788 (= e!466396 e!466394)))

(declare-fun res!568116 () Bool)

(assert (=> b!835788 (=> (not res!568116) (not e!466394))))

(assert (=> b!835788 (= res!568116 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22821 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!379926 () Unit!28714)

(assert (=> b!835788 (= lt!379926 e!466392)))

(declare-fun c!91232 () Bool)

(assert (=> b!835788 (= c!91232 (validKeyInArray!0 (select (arr!22401 a!4227) to!390)))))

(assert (= (and start!71996 res!568113) b!835781))

(assert (= (and b!835781 res!568119) b!835785))

(assert (= (and b!835785 res!568115) b!835786))

(assert (= (and b!835786 res!568117) b!835787))

(assert (= (and b!835787 res!568118) b!835788))

(assert (= (and b!835788 c!91232) b!835784))

(assert (= (and b!835788 (not c!91232)) b!835780))

(assert (= (or b!835784 b!835780) bm!36697))

(assert (= (or b!835784 b!835780) bm!36698))

(assert (= (and b!835788 res!568116) b!835782))

(assert (= (and b!835782 res!568114) b!835783))

(declare-fun m!781303 () Bool)

(assert (=> b!835788 m!781303))

(assert (=> b!835788 m!781303))

(declare-fun m!781305 () Bool)

(assert (=> b!835788 m!781305))

(declare-fun m!781307 () Bool)

(assert (=> bm!36698 m!781307))

(declare-fun m!781309 () Bool)

(assert (=> b!835785 m!781309))

(declare-fun m!781311 () Bool)

(assert (=> b!835783 m!781311))

(declare-fun m!781313 () Bool)

(assert (=> b!835783 m!781313))

(declare-fun m!781315 () Bool)

(assert (=> b!835783 m!781315))

(declare-fun m!781317 () Bool)

(assert (=> b!835784 m!781317))

(declare-fun m!781319 () Bool)

(assert (=> b!835784 m!781319))

(declare-fun m!781321 () Bool)

(assert (=> bm!36697 m!781321))

(declare-fun m!781323 () Bool)

(assert (=> b!835787 m!781323))

(declare-fun m!781325 () Bool)

(assert (=> b!835787 m!781325))

(declare-fun m!781327 () Bool)

(assert (=> b!835787 m!781327))

(declare-fun m!781329 () Bool)

(assert (=> b!835781 m!781329))

(assert (=> b!835781 m!781329))

(declare-fun m!781331 () Bool)

(assert (=> b!835781 m!781331))

(declare-fun m!781333 () Bool)

(assert (=> start!71996 m!781333))

(assert (=> b!835782 m!781307))

(assert (=> b!835782 m!781321))

(declare-fun m!781335 () Bool)

(assert (=> b!835780 m!781335))

(declare-fun m!781337 () Bool)

(assert (=> b!835780 m!781337))

(check-sat (not b!835787) (not b!835780) (not b!835782) (not b!835781) (not b!835784) (not bm!36698) (not start!71996) (not b!835783) (not b!835788) (not bm!36697) (not b!835785))
(check-sat)
