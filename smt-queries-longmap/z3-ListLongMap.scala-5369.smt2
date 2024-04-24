; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71978 () Bool)

(assert start!71978)

(declare-fun b!835537 () Bool)

(declare-fun res!567924 () Bool)

(declare-fun e!466257 () Bool)

(assert (=> b!835537 (=> (not res!567924) (not e!466257))))

(declare-datatypes ((array!46725 0))(
  ( (array!46726 (arr!22392 (Array (_ BitVec 32) (_ BitVec 64))) (size!22812 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46725)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835537 (= res!567924 (not (validKeyInArray!0 (select (arr!22392 a!4227) i!1466))))))

(declare-fun bm!36643 () Bool)

(declare-fun to!390 () (_ BitVec 32))

(declare-fun call!36647 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46725 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36643 (= call!36647 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835538 () Bool)

(declare-fun e!466261 () Bool)

(assert (=> b!835538 (= e!466257 e!466261)))

(declare-fun res!567926 () Bool)

(assert (=> b!835538 (=> (not res!567926) (not e!466261))))

(declare-fun lt!379683 () (_ BitVec 32))

(declare-fun lt!379679 () (_ BitVec 32))

(assert (=> b!835538 (= res!567926 (and (= lt!379683 lt!379679) (not (= to!390 (size!22812 a!4227)))))))

(assert (=> b!835538 (= lt!379679 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!379684 () array!46725)

(assert (=> b!835538 (= lt!379683 (arrayCountValidKeys!0 lt!379684 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!835538 (= lt!379684 (array!46726 (store (arr!22392 a!4227) i!1466 k0!2968) (size!22812 a!4227)))))

(declare-fun b!835539 () Bool)

(declare-fun res!567929 () Bool)

(assert (=> b!835539 (=> (not res!567929) (not e!466257))))

(assert (=> b!835539 (= res!567929 (validKeyInArray!0 k0!2968))))

(declare-fun b!835540 () Bool)

(declare-fun res!567928 () Bool)

(assert (=> b!835540 (=> (not res!567928) (not e!466257))))

(assert (=> b!835540 (= res!567928 (and (bvslt (size!22812 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22812 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun res!567927 () Bool)

(assert (=> start!71978 (=> (not res!567927) (not e!466257))))

(assert (=> start!71978 (= res!567927 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22812 a!4227))))))

(assert (=> start!71978 e!466257))

(assert (=> start!71978 true))

(declare-fun array_inv!17878 (array!46725) Bool)

(assert (=> start!71978 (array_inv!17878 a!4227)))

(declare-fun b!835541 () Bool)

(declare-fun res!567925 () Bool)

(declare-fun e!466258 () Bool)

(assert (=> b!835541 (=> (not res!567925) (not e!466258))))

(assert (=> b!835541 (= res!567925 (= (arrayCountValidKeys!0 lt!379684 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390))))))

(declare-fun b!835542 () Bool)

(assert (=> b!835542 (= e!466261 e!466258)))

(declare-fun res!567930 () Bool)

(assert (=> b!835542 (=> (not res!567930) (not e!466258))))

(assert (=> b!835542 (= res!567930 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22812 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-datatypes ((Unit!28696 0))(
  ( (Unit!28697) )
))
(declare-fun lt!379678 () Unit!28696)

(declare-fun e!466259 () Unit!28696)

(assert (=> b!835542 (= lt!379678 e!466259)))

(declare-fun c!91205 () Bool)

(assert (=> b!835542 (= c!91205 (validKeyInArray!0 (select (arr!22392 a!4227) to!390)))))

(declare-fun b!835543 () Bool)

(assert (=> b!835543 (= e!466258 (not (bvsge (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000)))))

(assert (=> b!835543 (= (arrayCountValidKeys!0 lt!379684 (bvadd #b00000000000000000000000000000001 i!1466) (size!22812 a!4227)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (size!22812 a!4227)))))

(declare-fun lt!379685 () Unit!28696)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!46725 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!28696)

(assert (=> b!835543 (= lt!379685 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4227 i!1466 k0!2968 (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835544 () Bool)

(declare-fun lt!379680 () Unit!28696)

(assert (=> b!835544 (= e!466259 lt!379680)))

(declare-fun lt!379682 () Unit!28696)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46725 (_ BitVec 32) (_ BitVec 32)) Unit!28696)

(assert (=> b!835544 (= lt!379682 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835544 (= call!36647 (bvadd #b00000000000000000000000000000001 lt!379679))))

(assert (=> b!835544 (= lt!379680 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379684 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36646 () (_ BitVec 32))

(assert (=> b!835544 (= call!36646 (bvadd #b00000000000000000000000000000001 lt!379683))))

(declare-fun b!835545 () Bool)

(declare-fun lt!379677 () Unit!28696)

(assert (=> b!835545 (= e!466259 lt!379677)))

(declare-fun lt!379681 () Unit!28696)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46725 (_ BitVec 32) (_ BitVec 32)) Unit!28696)

(assert (=> b!835545 (= lt!379681 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835545 (= call!36647 lt!379679)))

(assert (=> b!835545 (= lt!379677 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379684 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835545 (= call!36646 lt!379683)))

(declare-fun bm!36644 () Bool)

(assert (=> bm!36644 (= call!36646 (arrayCountValidKeys!0 lt!379684 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(assert (= (and start!71978 res!567927) b!835537))

(assert (= (and b!835537 res!567924) b!835539))

(assert (= (and b!835539 res!567929) b!835540))

(assert (= (and b!835540 res!567928) b!835538))

(assert (= (and b!835538 res!567926) b!835542))

(assert (= (and b!835542 c!91205) b!835544))

(assert (= (and b!835542 (not c!91205)) b!835545))

(assert (= (or b!835544 b!835545) bm!36644))

(assert (= (or b!835544 b!835545) bm!36643))

(assert (= (and b!835542 res!567930) b!835541))

(assert (= (and b!835541 res!567925) b!835543))

(declare-fun m!780979 () Bool)

(assert (=> bm!36644 m!780979))

(declare-fun m!780981 () Bool)

(assert (=> b!835544 m!780981))

(declare-fun m!780983 () Bool)

(assert (=> b!835544 m!780983))

(declare-fun m!780985 () Bool)

(assert (=> b!835543 m!780985))

(declare-fun m!780987 () Bool)

(assert (=> b!835543 m!780987))

(declare-fun m!780989 () Bool)

(assert (=> b!835543 m!780989))

(declare-fun m!780991 () Bool)

(assert (=> b!835537 m!780991))

(assert (=> b!835537 m!780991))

(declare-fun m!780993 () Bool)

(assert (=> b!835537 m!780993))

(declare-fun m!780995 () Bool)

(assert (=> b!835542 m!780995))

(assert (=> b!835542 m!780995))

(declare-fun m!780997 () Bool)

(assert (=> b!835542 m!780997))

(declare-fun m!780999 () Bool)

(assert (=> b!835545 m!780999))

(declare-fun m!781001 () Bool)

(assert (=> b!835545 m!781001))

(declare-fun m!781003 () Bool)

(assert (=> bm!36643 m!781003))

(declare-fun m!781005 () Bool)

(assert (=> b!835538 m!781005))

(declare-fun m!781007 () Bool)

(assert (=> b!835538 m!781007))

(declare-fun m!781009 () Bool)

(assert (=> b!835538 m!781009))

(assert (=> b!835541 m!780979))

(assert (=> b!835541 m!781003))

(declare-fun m!781011 () Bool)

(assert (=> b!835539 m!781011))

(declare-fun m!781013 () Bool)

(assert (=> start!71978 m!781013))

(check-sat (not b!835538) (not b!835542) (not b!835539) (not b!835541) (not start!71978) (not b!835543) (not b!835544) (not b!835537) (not bm!36644) (not bm!36643) (not b!835545))
(check-sat)
