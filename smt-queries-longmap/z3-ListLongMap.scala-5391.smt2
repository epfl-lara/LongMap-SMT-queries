; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71924 () Bool)

(assert start!71924)

(declare-fun b!835739 () Bool)

(declare-fun e!466217 () Bool)

(declare-fun e!466215 () Bool)

(assert (=> b!835739 (= e!466217 e!466215)))

(declare-fun res!568636 () Bool)

(assert (=> b!835739 (=> (not res!568636) (not e!466215))))

(declare-datatypes ((array!46823 0))(
  ( (array!46824 (arr!22446 (Array (_ BitVec 32) (_ BitVec 64))) (size!22867 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46823)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!835739 (= res!568636 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22867 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-datatypes ((Unit!28715 0))(
  ( (Unit!28716) )
))
(declare-fun lt!379982 () Unit!28715)

(declare-fun e!466213 () Unit!28715)

(assert (=> b!835739 (= lt!379982 e!466213)))

(declare-fun c!90948 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835739 (= c!90948 (validKeyInArray!0 (select (arr!22446 a!4227) to!390)))))

(declare-fun call!36756 () (_ BitVec 32))

(declare-fun bm!36752 () Bool)

(declare-fun arrayCountValidKeys!0 (array!46823 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36752 (= call!36756 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835740 () Bool)

(declare-fun res!568637 () Bool)

(assert (=> b!835740 (=> (not res!568637) (not e!466215))))

(declare-fun lt!379984 () array!46823)

(assert (=> b!835740 (= res!568637 (= (arrayCountValidKeys!0 lt!379984 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390))))))

(declare-fun b!835741 () Bool)

(declare-fun e!466214 () Bool)

(assert (=> b!835741 (= e!466214 e!466217)))

(declare-fun res!568634 () Bool)

(assert (=> b!835741 (=> (not res!568634) (not e!466217))))

(declare-fun lt!379983 () (_ BitVec 32))

(declare-fun lt!379988 () (_ BitVec 32))

(assert (=> b!835741 (= res!568634 (and (= lt!379988 lt!379983) (not (= to!390 (size!22867 a!4227)))))))

(assert (=> b!835741 (= lt!379983 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835741 (= lt!379988 (arrayCountValidKeys!0 lt!379984 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!835741 (= lt!379984 (array!46824 (store (arr!22446 a!4227) i!1466 k0!2968) (size!22867 a!4227)))))

(declare-fun b!835742 () Bool)

(assert (=> b!835742 (= e!466215 (not true))))

(assert (=> b!835742 (= (arrayCountValidKeys!0 lt!379984 (bvadd #b00000000000000000000000000000001 i!1466) (size!22867 a!4227)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (size!22867 a!4227)))))

(declare-fun lt!379980 () Unit!28715)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!46823 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!28715)

(assert (=> b!835742 (= lt!379980 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4227 i!1466 k0!2968 (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun call!36755 () (_ BitVec 32))

(declare-fun bm!36753 () Bool)

(assert (=> bm!36753 (= call!36755 (arrayCountValidKeys!0 lt!379984 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835743 () Bool)

(declare-fun res!568633 () Bool)

(assert (=> b!835743 (=> (not res!568633) (not e!466214))))

(assert (=> b!835743 (= res!568633 (and (bvslt (size!22867 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22867 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835744 () Bool)

(declare-fun lt!379986 () Unit!28715)

(assert (=> b!835744 (= e!466213 lt!379986)))

(declare-fun lt!379987 () Unit!28715)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46823 (_ BitVec 32) (_ BitVec 32)) Unit!28715)

(assert (=> b!835744 (= lt!379987 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835744 (= call!36756 lt!379983)))

(assert (=> b!835744 (= lt!379986 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379984 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835744 (= call!36755 lt!379988)))

(declare-fun b!835745 () Bool)

(declare-fun res!568635 () Bool)

(assert (=> b!835745 (=> (not res!568635) (not e!466214))))

(assert (=> b!835745 (= res!568635 (not (validKeyInArray!0 (select (arr!22446 a!4227) i!1466))))))

(declare-fun b!835746 () Bool)

(declare-fun res!568639 () Bool)

(assert (=> b!835746 (=> (not res!568639) (not e!466214))))

(assert (=> b!835746 (= res!568639 (validKeyInArray!0 k0!2968))))

(declare-fun res!568638 () Bool)

(assert (=> start!71924 (=> (not res!568638) (not e!466214))))

(assert (=> start!71924 (= res!568638 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22867 a!4227))))))

(assert (=> start!71924 e!466214))

(assert (=> start!71924 true))

(declare-fun array_inv!17958 (array!46823) Bool)

(assert (=> start!71924 (array_inv!17958 a!4227)))

(declare-fun b!835738 () Bool)

(declare-fun lt!379985 () Unit!28715)

(assert (=> b!835738 (= e!466213 lt!379985)))

(declare-fun lt!379981 () Unit!28715)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46823 (_ BitVec 32) (_ BitVec 32)) Unit!28715)

(assert (=> b!835738 (= lt!379981 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835738 (= call!36756 (bvadd #b00000000000000000000000000000001 lt!379983))))

(assert (=> b!835738 (= lt!379985 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379984 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835738 (= call!36755 (bvadd #b00000000000000000000000000000001 lt!379988))))

(assert (= (and start!71924 res!568638) b!835745))

(assert (= (and b!835745 res!568635) b!835746))

(assert (= (and b!835746 res!568639) b!835743))

(assert (= (and b!835743 res!568633) b!835741))

(assert (= (and b!835741 res!568634) b!835739))

(assert (= (and b!835739 c!90948) b!835738))

(assert (= (and b!835739 (not c!90948)) b!835744))

(assert (= (or b!835738 b!835744) bm!36752))

(assert (= (or b!835738 b!835744) bm!36753))

(assert (= (and b!835739 res!568636) b!835740))

(assert (= (and b!835740 res!568637) b!835742))

(declare-fun m!780557 () Bool)

(assert (=> b!835738 m!780557))

(declare-fun m!780559 () Bool)

(assert (=> b!835738 m!780559))

(declare-fun m!780561 () Bool)

(assert (=> b!835742 m!780561))

(declare-fun m!780563 () Bool)

(assert (=> b!835742 m!780563))

(declare-fun m!780565 () Bool)

(assert (=> b!835742 m!780565))

(declare-fun m!780567 () Bool)

(assert (=> b!835746 m!780567))

(declare-fun m!780569 () Bool)

(assert (=> bm!36752 m!780569))

(declare-fun m!780571 () Bool)

(assert (=> start!71924 m!780571))

(declare-fun m!780573 () Bool)

(assert (=> b!835744 m!780573))

(declare-fun m!780575 () Bool)

(assert (=> b!835744 m!780575))

(declare-fun m!780577 () Bool)

(assert (=> bm!36753 m!780577))

(declare-fun m!780579 () Bool)

(assert (=> b!835741 m!780579))

(declare-fun m!780581 () Bool)

(assert (=> b!835741 m!780581))

(declare-fun m!780583 () Bool)

(assert (=> b!835741 m!780583))

(assert (=> b!835740 m!780577))

(assert (=> b!835740 m!780569))

(declare-fun m!780585 () Bool)

(assert (=> b!835739 m!780585))

(assert (=> b!835739 m!780585))

(declare-fun m!780587 () Bool)

(assert (=> b!835739 m!780587))

(declare-fun m!780589 () Bool)

(assert (=> b!835745 m!780589))

(assert (=> b!835745 m!780589))

(declare-fun m!780591 () Bool)

(assert (=> b!835745 m!780591))

(check-sat (not start!71924) (not b!835740) (not b!835745) (not b!835746) (not b!835738) (not b!835739) (not b!835744) (not b!835741) (not b!835742) (not bm!36752) (not bm!36753))
(check-sat)
