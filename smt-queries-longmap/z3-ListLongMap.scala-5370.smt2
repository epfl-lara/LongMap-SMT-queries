; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71984 () Bool)

(assert start!71984)

(declare-fun b!835618 () Bool)

(declare-fun res!567991 () Bool)

(declare-fun e!466305 () Bool)

(assert (=> b!835618 (=> (not res!567991) (not e!466305))))

(declare-datatypes ((array!46731 0))(
  ( (array!46732 (arr!22395 (Array (_ BitVec 32) (_ BitVec 64))) (size!22815 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46731)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!835618 (= res!567991 (and (bvslt (size!22815 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22815 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835619 () Bool)

(declare-fun res!567987 () Bool)

(assert (=> b!835619 (=> (not res!567987) (not e!466305))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835619 (= res!567987 (not (validKeyInArray!0 (select (arr!22395 a!4227) i!1466))))))

(declare-fun b!835620 () Bool)

(declare-fun e!466306 () Bool)

(assert (=> b!835620 (= e!466306 (not true))))

(declare-fun lt!379759 () array!46731)

(declare-fun arrayCountValidKeys!0 (array!46731 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835620 (= (arrayCountValidKeys!0 lt!379759 (bvadd #b00000000000000000000000000000001 i!1466) (size!22815 a!4227)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (size!22815 a!4227)))))

(declare-datatypes ((Unit!28702 0))(
  ( (Unit!28703) )
))
(declare-fun lt!379760 () Unit!28702)

(declare-fun k0!2968 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!46731 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!28702)

(assert (=> b!835620 (= lt!379760 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4227 i!1466 k0!2968 (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835621 () Bool)

(declare-fun res!567990 () Bool)

(assert (=> b!835621 (=> (not res!567990) (not e!466305))))

(assert (=> b!835621 (= res!567990 (validKeyInArray!0 k0!2968))))

(declare-fun b!835622 () Bool)

(declare-fun e!466302 () Bool)

(assert (=> b!835622 (= e!466305 e!466302)))

(declare-fun res!567988 () Bool)

(assert (=> b!835622 (=> (not res!567988) (not e!466302))))

(declare-fun lt!379765 () (_ BitVec 32))

(declare-fun lt!379764 () (_ BitVec 32))

(assert (=> b!835622 (= res!567988 (and (= lt!379764 lt!379765) (not (= to!390 (size!22815 a!4227)))))))

(assert (=> b!835622 (= lt!379765 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835622 (= lt!379764 (arrayCountValidKeys!0 lt!379759 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835622 (= lt!379759 (array!46732 (store (arr!22395 a!4227) i!1466 k0!2968) (size!22815 a!4227)))))

(declare-fun call!36665 () (_ BitVec 32))

(declare-fun bm!36661 () Bool)

(assert (=> bm!36661 (= call!36665 (arrayCountValidKeys!0 lt!379759 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun res!567992 () Bool)

(assert (=> start!71984 (=> (not res!567992) (not e!466305))))

(assert (=> start!71984 (= res!567992 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22815 a!4227))))))

(assert (=> start!71984 e!466305))

(assert (=> start!71984 true))

(declare-fun array_inv!17881 (array!46731) Bool)

(assert (=> start!71984 (array_inv!17881 a!4227)))

(declare-fun b!835623 () Bool)

(assert (=> b!835623 (= e!466302 e!466306)))

(declare-fun res!567989 () Bool)

(assert (=> b!835623 (=> (not res!567989) (not e!466306))))

(assert (=> b!835623 (= res!567989 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22815 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!379762 () Unit!28702)

(declare-fun e!466303 () Unit!28702)

(assert (=> b!835623 (= lt!379762 e!466303)))

(declare-fun c!91214 () Bool)

(assert (=> b!835623 (= c!91214 (validKeyInArray!0 (select (arr!22395 a!4227) to!390)))))

(declare-fun b!835624 () Bool)

(declare-fun res!567993 () Bool)

(assert (=> b!835624 (=> (not res!567993) (not e!466306))))

(assert (=> b!835624 (= res!567993 (= (arrayCountValidKeys!0 lt!379759 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390))))))

(declare-fun bm!36662 () Bool)

(declare-fun call!36664 () (_ BitVec 32))

(assert (=> bm!36662 (= call!36664 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835625 () Bool)

(declare-fun lt!379763 () Unit!28702)

(assert (=> b!835625 (= e!466303 lt!379763)))

(declare-fun lt!379761 () Unit!28702)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46731 (_ BitVec 32) (_ BitVec 32)) Unit!28702)

(assert (=> b!835625 (= lt!379761 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835625 (= call!36664 lt!379765)))

(assert (=> b!835625 (= lt!379763 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379759 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835625 (= call!36665 lt!379764)))

(declare-fun b!835626 () Bool)

(declare-fun lt!379766 () Unit!28702)

(assert (=> b!835626 (= e!466303 lt!379766)))

(declare-fun lt!379758 () Unit!28702)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46731 (_ BitVec 32) (_ BitVec 32)) Unit!28702)

(assert (=> b!835626 (= lt!379758 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835626 (= call!36664 (bvadd #b00000000000000000000000000000001 lt!379765))))

(assert (=> b!835626 (= lt!379766 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379759 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835626 (= call!36665 (bvadd #b00000000000000000000000000000001 lt!379764))))

(assert (= (and start!71984 res!567992) b!835619))

(assert (= (and b!835619 res!567987) b!835621))

(assert (= (and b!835621 res!567990) b!835618))

(assert (= (and b!835618 res!567991) b!835622))

(assert (= (and b!835622 res!567988) b!835623))

(assert (= (and b!835623 c!91214) b!835626))

(assert (= (and b!835623 (not c!91214)) b!835625))

(assert (= (or b!835626 b!835625) bm!36661))

(assert (= (or b!835626 b!835625) bm!36662))

(assert (= (and b!835623 res!567989) b!835624))

(assert (= (and b!835624 res!567993) b!835620))

(declare-fun m!781087 () Bool)

(assert (=> start!71984 m!781087))

(declare-fun m!781089 () Bool)

(assert (=> b!835620 m!781089))

(declare-fun m!781091 () Bool)

(assert (=> b!835620 m!781091))

(declare-fun m!781093 () Bool)

(assert (=> b!835620 m!781093))

(declare-fun m!781095 () Bool)

(assert (=> b!835624 m!781095))

(declare-fun m!781097 () Bool)

(assert (=> b!835624 m!781097))

(declare-fun m!781099 () Bool)

(assert (=> b!835625 m!781099))

(declare-fun m!781101 () Bool)

(assert (=> b!835625 m!781101))

(declare-fun m!781103 () Bool)

(assert (=> b!835621 m!781103))

(assert (=> bm!36662 m!781097))

(declare-fun m!781105 () Bool)

(assert (=> b!835622 m!781105))

(declare-fun m!781107 () Bool)

(assert (=> b!835622 m!781107))

(declare-fun m!781109 () Bool)

(assert (=> b!835622 m!781109))

(declare-fun m!781111 () Bool)

(assert (=> b!835626 m!781111))

(declare-fun m!781113 () Bool)

(assert (=> b!835626 m!781113))

(declare-fun m!781115 () Bool)

(assert (=> b!835619 m!781115))

(assert (=> b!835619 m!781115))

(declare-fun m!781117 () Bool)

(assert (=> b!835619 m!781117))

(assert (=> bm!36661 m!781095))

(declare-fun m!781119 () Bool)

(assert (=> b!835623 m!781119))

(assert (=> b!835623 m!781119))

(declare-fun m!781121 () Bool)

(assert (=> b!835623 m!781121))

(check-sat (not bm!36662) (not b!835625) (not start!71984) (not b!835624) (not b!835623) (not b!835626) (not b!835619) (not b!835620) (not b!835622) (not b!835621) (not bm!36661))
(check-sat)
