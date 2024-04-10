; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71950 () Bool)

(assert start!71950)

(declare-fun b!836061 () Bool)

(declare-fun e!466407 () Bool)

(declare-fun e!466410 () Bool)

(assert (=> b!836061 (= e!466407 e!466410)))

(declare-fun res!568807 () Bool)

(assert (=> b!836061 (=> (not res!568807) (not e!466410))))

(declare-datatypes ((array!46860 0))(
  ( (array!46861 (arr!22464 (Array (_ BitVec 32) (_ BitVec 64))) (size!22885 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46860)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!836061 (= res!568807 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22885 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-datatypes ((Unit!28773 0))(
  ( (Unit!28774) )
))
(declare-fun lt!380308 () Unit!28773)

(declare-fun e!466406 () Unit!28773)

(assert (=> b!836061 (= lt!380308 e!466406)))

(declare-fun c!91025 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!836061 (= c!91025 (validKeyInArray!0 (select (arr!22464 a!4227) to!390)))))

(declare-fun res!568808 () Bool)

(declare-fun e!466409 () Bool)

(assert (=> start!71950 (=> (not res!568808) (not e!466409))))

(assert (=> start!71950 (= res!568808 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22885 a!4227))))))

(assert (=> start!71950 e!466409))

(assert (=> start!71950 true))

(declare-fun array_inv!17911 (array!46860) Bool)

(assert (=> start!71950 (array_inv!17911 a!4227)))

(declare-fun b!836062 () Bool)

(assert (=> b!836062 (= e!466410 (not true))))

(declare-fun lt!380304 () array!46860)

(declare-fun arrayCountValidKeys!0 (array!46860 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!836062 (= (arrayCountValidKeys!0 lt!380304 (bvadd #b00000000000000000000000000000001 i!1466) (size!22885 a!4227)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (size!22885 a!4227)))))

(declare-fun lt!380303 () Unit!28773)

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!46860 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!28773)

(assert (=> b!836062 (= lt!380303 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4227 i!1466 k!2968 (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!836063 () Bool)

(declare-fun lt!380305 () Unit!28773)

(assert (=> b!836063 (= e!466406 lt!380305)))

(declare-fun lt!380302 () Unit!28773)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46860 (_ BitVec 32) (_ BitVec 32)) Unit!28773)

(assert (=> b!836063 (= lt!380302 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36800 () (_ BitVec 32))

(declare-fun lt!380306 () (_ BitVec 32))

(assert (=> b!836063 (= call!36800 lt!380306)))

(assert (=> b!836063 (= lt!380305 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!380304 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36799 () (_ BitVec 32))

(declare-fun lt!380307 () (_ BitVec 32))

(assert (=> b!836063 (= call!36799 lt!380307)))

(declare-fun bm!36796 () Bool)

(assert (=> bm!36796 (= call!36799 (arrayCountValidKeys!0 lt!380304 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun bm!36797 () Bool)

(assert (=> bm!36797 (= call!36800 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!836064 () Bool)

(declare-fun res!568802 () Bool)

(assert (=> b!836064 (=> (not res!568802) (not e!466409))))

(assert (=> b!836064 (= res!568802 (and (bvslt (size!22885 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22885 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!836065 () Bool)

(assert (=> b!836065 (= e!466409 e!466407)))

(declare-fun res!568805 () Bool)

(assert (=> b!836065 (=> (not res!568805) (not e!466407))))

(assert (=> b!836065 (= res!568805 (and (= lt!380307 lt!380306) (not (= to!390 (size!22885 a!4227)))))))

(assert (=> b!836065 (= lt!380306 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836065 (= lt!380307 (arrayCountValidKeys!0 lt!380304 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836065 (= lt!380304 (array!46861 (store (arr!22464 a!4227) i!1466 k!2968) (size!22885 a!4227)))))

(declare-fun b!836066 () Bool)

(declare-fun res!568806 () Bool)

(assert (=> b!836066 (=> (not res!568806) (not e!466409))))

(assert (=> b!836066 (= res!568806 (validKeyInArray!0 k!2968))))

(declare-fun b!836067 () Bool)

(declare-fun lt!380301 () Unit!28773)

(assert (=> b!836067 (= e!466406 lt!380301)))

(declare-fun lt!380300 () Unit!28773)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46860 (_ BitVec 32) (_ BitVec 32)) Unit!28773)

(assert (=> b!836067 (= lt!380300 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836067 (= call!36800 (bvadd #b00000000000000000000000000000001 lt!380306))))

(assert (=> b!836067 (= lt!380301 (lemmaValidKeyIncreasesNumOfKeys!0 lt!380304 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836067 (= call!36799 (bvadd #b00000000000000000000000000000001 lt!380307))))

(declare-fun b!836068 () Bool)

(declare-fun res!568803 () Bool)

(assert (=> b!836068 (=> (not res!568803) (not e!466410))))

(assert (=> b!836068 (= res!568803 (= (arrayCountValidKeys!0 lt!380304 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390))))))

(declare-fun b!836069 () Bool)

(declare-fun res!568804 () Bool)

(assert (=> b!836069 (=> (not res!568804) (not e!466409))))

(assert (=> b!836069 (= res!568804 (not (validKeyInArray!0 (select (arr!22464 a!4227) i!1466))))))

(assert (= (and start!71950 res!568808) b!836069))

(assert (= (and b!836069 res!568804) b!836066))

(assert (= (and b!836066 res!568806) b!836064))

(assert (= (and b!836064 res!568802) b!836065))

(assert (= (and b!836065 res!568805) b!836061))

(assert (= (and b!836061 c!91025) b!836067))

(assert (= (and b!836061 (not c!91025)) b!836063))

(assert (= (or b!836067 b!836063) bm!36796))

(assert (= (or b!836067 b!836063) bm!36797))

(assert (= (and b!836061 res!568807) b!836068))

(assert (= (and b!836068 res!568803) b!836062))

(declare-fun m!781417 () Bool)

(assert (=> bm!36797 m!781417))

(declare-fun m!781419 () Bool)

(assert (=> start!71950 m!781419))

(declare-fun m!781421 () Bool)

(assert (=> b!836068 m!781421))

(assert (=> b!836068 m!781417))

(declare-fun m!781423 () Bool)

(assert (=> b!836069 m!781423))

(assert (=> b!836069 m!781423))

(declare-fun m!781425 () Bool)

(assert (=> b!836069 m!781425))

(declare-fun m!781427 () Bool)

(assert (=> b!836066 m!781427))

(declare-fun m!781429 () Bool)

(assert (=> b!836067 m!781429))

(declare-fun m!781431 () Bool)

(assert (=> b!836067 m!781431))

(assert (=> bm!36796 m!781421))

(declare-fun m!781433 () Bool)

(assert (=> b!836061 m!781433))

(assert (=> b!836061 m!781433))

(declare-fun m!781435 () Bool)

(assert (=> b!836061 m!781435))

(declare-fun m!781437 () Bool)

(assert (=> b!836063 m!781437))

(declare-fun m!781439 () Bool)

(assert (=> b!836063 m!781439))

(declare-fun m!781441 () Bool)

(assert (=> b!836062 m!781441))

(declare-fun m!781443 () Bool)

(assert (=> b!836062 m!781443))

(declare-fun m!781445 () Bool)

(assert (=> b!836062 m!781445))

(declare-fun m!781447 () Bool)

(assert (=> b!836065 m!781447))

(declare-fun m!781449 () Bool)

(assert (=> b!836065 m!781449))

(declare-fun m!781451 () Bool)

(assert (=> b!836065 m!781451))

(push 1)

