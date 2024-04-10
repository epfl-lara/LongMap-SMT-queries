; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71924 () Bool)

(assert start!71924)

(declare-fun b!835739 () Bool)

(declare-fun res!568562 () Bool)

(declare-fun e!466221 () Bool)

(assert (=> b!835739 (=> (not res!568562) (not e!466221))))

(declare-datatypes ((array!46834 0))(
  ( (array!46835 (arr!22451 (Array (_ BitVec 32) (_ BitVec 64))) (size!22872 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46834)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835739 (= res!568562 (not (validKeyInArray!0 (select (arr!22451 a!4227) i!1466))))))

(declare-fun b!835740 () Bool)

(declare-fun res!568559 () Bool)

(assert (=> b!835740 (=> (not res!568559) (not e!466221))))

(declare-fun k!2968 () (_ BitVec 64))

(assert (=> b!835740 (= res!568559 (validKeyInArray!0 k!2968))))

(declare-fun b!835741 () Bool)

(declare-fun res!568561 () Bool)

(assert (=> b!835741 (=> (not res!568561) (not e!466221))))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!835741 (= res!568561 (and (bvslt (size!22872 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22872 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun call!36721 () (_ BitVec 32))

(declare-fun bm!36718 () Bool)

(declare-fun arrayCountValidKeys!0 (array!46834 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36718 (= call!36721 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835742 () Bool)

(declare-datatypes ((Unit!28747 0))(
  ( (Unit!28748) )
))
(declare-fun e!466223 () Unit!28747)

(declare-fun lt!379981 () Unit!28747)

(assert (=> b!835742 (= e!466223 lt!379981)))

(declare-fun lt!379984 () Unit!28747)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46834 (_ BitVec 32) (_ BitVec 32)) Unit!28747)

(assert (=> b!835742 (= lt!379984 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!379982 () (_ BitVec 32))

(assert (=> b!835742 (= call!36721 (bvadd #b00000000000000000000000000000001 lt!379982))))

(declare-fun lt!379978 () array!46834)

(assert (=> b!835742 (= lt!379981 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379978 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36722 () (_ BitVec 32))

(declare-fun lt!379979 () (_ BitVec 32))

(assert (=> b!835742 (= call!36722 (bvadd #b00000000000000000000000000000001 lt!379979))))

(declare-fun b!835744 () Bool)

(declare-fun e!466222 () Bool)

(assert (=> b!835744 (= e!466221 e!466222)))

(declare-fun res!568558 () Bool)

(assert (=> b!835744 (=> (not res!568558) (not e!466222))))

(assert (=> b!835744 (= res!568558 (and (= lt!379979 lt!379982) (not (= to!390 (size!22872 a!4227)))))))

(assert (=> b!835744 (= lt!379982 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835744 (= lt!379979 (arrayCountValidKeys!0 lt!379978 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835744 (= lt!379978 (array!46835 (store (arr!22451 a!4227) i!1466 k!2968) (size!22872 a!4227)))))

(declare-fun bm!36719 () Bool)

(assert (=> bm!36719 (= call!36722 (arrayCountValidKeys!0 lt!379978 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835745 () Bool)

(assert (=> b!835745 (= e!466222 false)))

(declare-fun lt!379977 () Unit!28747)

(assert (=> b!835745 (= lt!379977 e!466223)))

(declare-fun c!90986 () Bool)

(assert (=> b!835745 (= c!90986 (validKeyInArray!0 (select (arr!22451 a!4227) to!390)))))

(declare-fun b!835743 () Bool)

(declare-fun lt!379980 () Unit!28747)

(assert (=> b!835743 (= e!466223 lt!379980)))

(declare-fun lt!379983 () Unit!28747)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46834 (_ BitVec 32) (_ BitVec 32)) Unit!28747)

(assert (=> b!835743 (= lt!379983 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835743 (= call!36721 lt!379982)))

(assert (=> b!835743 (= lt!379980 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379978 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835743 (= call!36722 lt!379979)))

(declare-fun res!568560 () Bool)

(assert (=> start!71924 (=> (not res!568560) (not e!466221))))

(assert (=> start!71924 (= res!568560 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22872 a!4227))))))

(assert (=> start!71924 e!466221))

(assert (=> start!71924 true))

(declare-fun array_inv!17898 (array!46834) Bool)

(assert (=> start!71924 (array_inv!17898 a!4227)))

(assert (= (and start!71924 res!568560) b!835739))

(assert (= (and b!835739 res!568562) b!835740))

(assert (= (and b!835740 res!568559) b!835741))

(assert (= (and b!835741 res!568561) b!835744))

(assert (= (and b!835744 res!568558) b!835745))

(assert (= (and b!835745 c!90986) b!835742))

(assert (= (and b!835745 (not c!90986)) b!835743))

(assert (= (or b!835742 b!835743) bm!36719))

(assert (= (or b!835742 b!835743) bm!36718))

(declare-fun m!781005 () Bool)

(assert (=> b!835739 m!781005))

(assert (=> b!835739 m!781005))

(declare-fun m!781007 () Bool)

(assert (=> b!835739 m!781007))

(declare-fun m!781009 () Bool)

(assert (=> b!835742 m!781009))

(declare-fun m!781011 () Bool)

(assert (=> b!835742 m!781011))

(declare-fun m!781013 () Bool)

(assert (=> start!71924 m!781013))

(declare-fun m!781015 () Bool)

(assert (=> b!835744 m!781015))

(declare-fun m!781017 () Bool)

(assert (=> b!835744 m!781017))

(declare-fun m!781019 () Bool)

(assert (=> b!835744 m!781019))

(declare-fun m!781021 () Bool)

(assert (=> bm!36719 m!781021))

(declare-fun m!781023 () Bool)

(assert (=> b!835743 m!781023))

(declare-fun m!781025 () Bool)

(assert (=> b!835743 m!781025))

(declare-fun m!781027 () Bool)

(assert (=> bm!36718 m!781027))

(declare-fun m!781029 () Bool)

(assert (=> b!835745 m!781029))

(assert (=> b!835745 m!781029))

(declare-fun m!781031 () Bool)

(assert (=> b!835745 m!781031))

(declare-fun m!781033 () Bool)

(assert (=> b!835740 m!781033))

(push 1)

(assert (not bm!36719))

(assert (not b!835739))

(assert (not b!835740))

