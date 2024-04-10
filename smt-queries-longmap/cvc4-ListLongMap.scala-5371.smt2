; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71828 () Bool)

(assert start!71828)

(declare-fun b!834855 () Bool)

(declare-fun e!465798 () Bool)

(declare-fun e!465799 () Bool)

(assert (=> b!834855 (= e!465798 e!465799)))

(declare-fun res!567750 () Bool)

(assert (=> b!834855 (=> (not res!567750) (not e!465799))))

(declare-datatypes ((array!46738 0))(
  ( (array!46739 (arr!22403 (Array (_ BitVec 32) (_ BitVec 64))) (size!22824 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46738)

(declare-fun lt!379540 () (_ BitVec 32))

(declare-fun lt!379537 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!834855 (= res!567750 (and (= lt!379537 lt!379540) (not (= to!390 (size!22824 a!4227)))))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46738 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!834855 (= lt!379540 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!379541 () array!46738)

(assert (=> b!834855 (= lt!379537 (arrayCountValidKeys!0 lt!379541 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k!2968 () (_ BitVec 64))

(assert (=> b!834855 (= lt!379541 (array!46739 (store (arr!22403 a!4227) i!1466 k!2968) (size!22824 a!4227)))))

(declare-fun b!834856 () Bool)

(declare-fun res!567746 () Bool)

(assert (=> b!834856 (=> (not res!567746) (not e!465798))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834856 (= res!567746 (validKeyInArray!0 k!2968))))

(declare-fun b!834857 () Bool)

(declare-fun res!567749 () Bool)

(assert (=> b!834857 (=> (not res!567749) (not e!465798))))

(assert (=> b!834857 (= res!567749 (not (validKeyInArray!0 (select (arr!22403 a!4227) i!1466))))))

(declare-fun bm!36646 () Bool)

(declare-fun call!36650 () (_ BitVec 32))

(assert (=> bm!36646 (= call!36650 (arrayCountValidKeys!0 lt!379541 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834858 () Bool)

(declare-fun e!465801 () Bool)

(assert (=> b!834858 (= e!465799 e!465801)))

(declare-fun res!567752 () Bool)

(assert (=> b!834858 (=> (not res!567752) (not e!465801))))

(assert (=> b!834858 (= res!567752 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22824 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-datatypes ((Unit!28699 0))(
  ( (Unit!28700) )
))
(declare-fun lt!379535 () Unit!28699)

(declare-fun e!465800 () Unit!28699)

(assert (=> b!834858 (= lt!379535 e!465800)))

(declare-fun c!90950 () Bool)

(assert (=> b!834858 (= c!90950 (validKeyInArray!0 (select (arr!22403 a!4227) to!390)))))

(declare-fun bm!36647 () Bool)

(declare-fun call!36649 () (_ BitVec 32))

(assert (=> bm!36647 (= call!36649 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834859 () Bool)

(declare-fun res!567751 () Bool)

(assert (=> b!834859 (=> (not res!567751) (not e!465798))))

(assert (=> b!834859 (= res!567751 (and (bvslt (size!22824 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22824 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!834860 () Bool)

(declare-fun lt!379539 () Unit!28699)

(assert (=> b!834860 (= e!465800 lt!379539)))

(declare-fun lt!379536 () Unit!28699)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46738 (_ BitVec 32) (_ BitVec 32)) Unit!28699)

(assert (=> b!834860 (= lt!379536 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834860 (= call!36649 (bvadd #b00000000000000000000000000000001 lt!379540))))

(assert (=> b!834860 (= lt!379539 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379541 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834860 (= call!36650 (bvadd #b00000000000000000000000000000001 lt!379537))))

(declare-fun b!834861 () Bool)

(declare-fun lt!379543 () Unit!28699)

(assert (=> b!834861 (= e!465800 lt!379543)))

(declare-fun lt!379538 () Unit!28699)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46738 (_ BitVec 32) (_ BitVec 32)) Unit!28699)

(assert (=> b!834861 (= lt!379538 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834861 (= call!36649 lt!379540)))

(assert (=> b!834861 (= lt!379543 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379541 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834861 (= call!36650 lt!379537)))

(declare-fun b!834863 () Bool)

(assert (=> b!834863 (= e!465801 (not (bvsge (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000)))))

(assert (=> b!834863 (= (arrayCountValidKeys!0 lt!379541 (bvadd #b00000000000000000000000000000001 i!1466) (size!22824 a!4227)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (size!22824 a!4227)))))

(declare-fun lt!379542 () Unit!28699)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!46738 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!28699)

(assert (=> b!834863 (= lt!379542 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4227 i!1466 k!2968 (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun res!567747 () Bool)

(assert (=> start!71828 (=> (not res!567747) (not e!465798))))

(assert (=> start!71828 (= res!567747 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22824 a!4227))))))

(assert (=> start!71828 e!465798))

(assert (=> start!71828 true))

(declare-fun array_inv!17850 (array!46738) Bool)

(assert (=> start!71828 (array_inv!17850 a!4227)))

(declare-fun b!834862 () Bool)

(declare-fun res!567748 () Bool)

(assert (=> b!834862 (=> (not res!567748) (not e!465801))))

(assert (=> b!834862 (= res!567748 (= (arrayCountValidKeys!0 lt!379541 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390))))))

(assert (= (and start!71828 res!567747) b!834857))

(assert (= (and b!834857 res!567749) b!834856))

(assert (= (and b!834856 res!567746) b!834859))

(assert (= (and b!834859 res!567751) b!834855))

(assert (= (and b!834855 res!567750) b!834858))

(assert (= (and b!834858 c!90950) b!834860))

(assert (= (and b!834858 (not c!90950)) b!834861))

(assert (= (or b!834860 b!834861) bm!36646))

(assert (= (or b!834860 b!834861) bm!36647))

(assert (= (and b!834858 res!567752) b!834862))

(assert (= (and b!834862 res!567748) b!834863))

(declare-fun m!779969 () Bool)

(assert (=> b!834857 m!779969))

(assert (=> b!834857 m!779969))

(declare-fun m!779971 () Bool)

(assert (=> b!834857 m!779971))

(declare-fun m!779973 () Bool)

(assert (=> b!834861 m!779973))

(declare-fun m!779975 () Bool)

(assert (=> b!834861 m!779975))

(declare-fun m!779977 () Bool)

(assert (=> b!834860 m!779977))

(declare-fun m!779979 () Bool)

(assert (=> b!834860 m!779979))

(declare-fun m!779981 () Bool)

(assert (=> b!834856 m!779981))

(declare-fun m!779983 () Bool)

(assert (=> bm!36647 m!779983))

(declare-fun m!779985 () Bool)

(assert (=> b!834863 m!779985))

(declare-fun m!779987 () Bool)

(assert (=> b!834863 m!779987))

(declare-fun m!779989 () Bool)

(assert (=> b!834863 m!779989))

(declare-fun m!779991 () Bool)

(assert (=> b!834855 m!779991))

(declare-fun m!779993 () Bool)

(assert (=> b!834855 m!779993))

(declare-fun m!779995 () Bool)

(assert (=> b!834855 m!779995))

(declare-fun m!779997 () Bool)

(assert (=> bm!36646 m!779997))

(declare-fun m!779999 () Bool)

(assert (=> start!71828 m!779999))

(assert (=> b!834862 m!779997))

(assert (=> b!834862 m!779983))

(declare-fun m!780001 () Bool)

(assert (=> b!834858 m!780001))

(assert (=> b!834858 m!780001))

(declare-fun m!780003 () Bool)

(assert (=> b!834858 m!780003))

(push 1)

