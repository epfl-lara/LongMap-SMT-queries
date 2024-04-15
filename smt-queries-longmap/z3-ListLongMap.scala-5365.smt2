; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71768 () Bool)

(assert start!71768)

(declare-fun b!834107 () Bool)

(declare-fun res!567256 () Bool)

(declare-fun e!465350 () Bool)

(assert (=> b!834107 (=> (not res!567256) (not e!465350))))

(declare-datatypes ((array!46667 0))(
  ( (array!46668 (arr!22368 (Array (_ BitVec 32) (_ BitVec 64))) (size!22789 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46667)

(declare-fun to!390 () (_ BitVec 32))

(declare-fun i!1466 () (_ BitVec 32))

(assert (=> b!834107 (= res!567256 (and (bvslt (size!22789 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22789 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!834108 () Bool)

(declare-fun res!567257 () Bool)

(assert (=> b!834108 (=> (not res!567257) (not e!465350))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834108 (= res!567257 (not (validKeyInArray!0 (select (arr!22368 a!4227) i!1466))))))

(declare-fun call!36504 () (_ BitVec 32))

(declare-fun bm!36500 () Bool)

(declare-fun arrayCountValidKeys!0 (array!46667 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36500 (= call!36504 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834109 () Bool)

(declare-fun res!567255 () Bool)

(assert (=> b!834109 (=> (not res!567255) (not e!465350))))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!834109 (= res!567255 (validKeyInArray!0 k0!2968))))

(declare-fun b!834110 () Bool)

(declare-datatypes ((Unit!28607 0))(
  ( (Unit!28608) )
))
(declare-fun e!465352 () Unit!28607)

(declare-fun lt!378730 () Unit!28607)

(assert (=> b!834110 (= e!465352 lt!378730)))

(declare-fun lt!378723 () Unit!28607)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46667 (_ BitVec 32) (_ BitVec 32)) Unit!28607)

(assert (=> b!834110 (= lt!378723 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!378729 () (_ BitVec 32))

(assert (=> b!834110 (= call!36504 (bvadd #b00000000000000000000000000000001 lt!378729))))

(declare-fun lt!378726 () array!46667)

(assert (=> b!834110 (= lt!378730 (lemmaValidKeyIncreasesNumOfKeys!0 lt!378726 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36503 () (_ BitVec 32))

(declare-fun lt!378724 () (_ BitVec 32))

(assert (=> b!834110 (= call!36503 (bvadd #b00000000000000000000000000000001 lt!378724))))

(declare-fun res!567258 () Bool)

(assert (=> start!71768 (=> (not res!567258) (not e!465350))))

(assert (=> start!71768 (= res!567258 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22789 a!4227))))))

(assert (=> start!71768 e!465350))

(assert (=> start!71768 true))

(declare-fun array_inv!17880 (array!46667) Bool)

(assert (=> start!71768 (array_inv!17880 a!4227)))

(declare-fun bm!36501 () Bool)

(assert (=> bm!36501 (= call!36503 (arrayCountValidKeys!0 lt!378726 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834111 () Bool)

(declare-fun e!465353 () Bool)

(declare-fun e!465351 () Bool)

(assert (=> b!834111 (= e!465353 e!465351)))

(declare-fun res!567254 () Bool)

(assert (=> b!834111 (=> (not res!567254) (not e!465351))))

(assert (=> b!834111 (= res!567254 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22789 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!378727 () Unit!28607)

(assert (=> b!834111 (= lt!378727 e!465352)))

(declare-fun c!90822 () Bool)

(assert (=> b!834111 (= c!90822 (validKeyInArray!0 (select (arr!22368 a!4227) to!390)))))

(declare-fun b!834112 () Bool)

(assert (=> b!834112 (= e!465351 false)))

(declare-fun lt!378728 () (_ BitVec 32))

(assert (=> b!834112 (= lt!378728 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun lt!378722 () (_ BitVec 32))

(assert (=> b!834112 (= lt!378722 (arrayCountValidKeys!0 lt!378726 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834113 () Bool)

(assert (=> b!834113 (= e!465350 e!465353)))

(declare-fun res!567259 () Bool)

(assert (=> b!834113 (=> (not res!567259) (not e!465353))))

(assert (=> b!834113 (= res!567259 (and (= lt!378724 lt!378729) (not (= to!390 (size!22789 a!4227)))))))

(assert (=> b!834113 (= lt!378729 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834113 (= lt!378724 (arrayCountValidKeys!0 lt!378726 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834113 (= lt!378726 (array!46668 (store (arr!22368 a!4227) i!1466 k0!2968) (size!22789 a!4227)))))

(declare-fun b!834114 () Bool)

(declare-fun lt!378731 () Unit!28607)

(assert (=> b!834114 (= e!465352 lt!378731)))

(declare-fun lt!378725 () Unit!28607)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46667 (_ BitVec 32) (_ BitVec 32)) Unit!28607)

(assert (=> b!834114 (= lt!378725 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834114 (= call!36504 lt!378729)))

(assert (=> b!834114 (= lt!378731 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!378726 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834114 (= call!36503 lt!378724)))

(assert (= (and start!71768 res!567258) b!834108))

(assert (= (and b!834108 res!567257) b!834109))

(assert (= (and b!834109 res!567255) b!834107))

(assert (= (and b!834107 res!567256) b!834113))

(assert (= (and b!834113 res!567259) b!834111))

(assert (= (and b!834111 c!90822) b!834110))

(assert (= (and b!834111 (not c!90822)) b!834114))

(assert (= (or b!834110 b!834114) bm!36501))

(assert (= (or b!834110 b!834114) bm!36500))

(assert (= (and b!834111 res!567254) b!834112))

(declare-fun m!778569 () Bool)

(assert (=> b!834111 m!778569))

(assert (=> b!834111 m!778569))

(declare-fun m!778571 () Bool)

(assert (=> b!834111 m!778571))

(declare-fun m!778573 () Bool)

(assert (=> b!834108 m!778573))

(assert (=> b!834108 m!778573))

(declare-fun m!778575 () Bool)

(assert (=> b!834108 m!778575))

(declare-fun m!778577 () Bool)

(assert (=> b!834113 m!778577))

(declare-fun m!778579 () Bool)

(assert (=> b!834113 m!778579))

(declare-fun m!778581 () Bool)

(assert (=> b!834113 m!778581))

(declare-fun m!778583 () Bool)

(assert (=> bm!36501 m!778583))

(declare-fun m!778585 () Bool)

(assert (=> b!834112 m!778585))

(assert (=> b!834112 m!778583))

(assert (=> bm!36500 m!778585))

(declare-fun m!778587 () Bool)

(assert (=> b!834114 m!778587))

(declare-fun m!778589 () Bool)

(assert (=> b!834114 m!778589))

(declare-fun m!778591 () Bool)

(assert (=> b!834110 m!778591))

(declare-fun m!778593 () Bool)

(assert (=> b!834110 m!778593))

(declare-fun m!778595 () Bool)

(assert (=> start!71768 m!778595))

(declare-fun m!778597 () Bool)

(assert (=> b!834109 m!778597))

(check-sat (not b!834110) (not b!834114) (not b!834113) (not b!834112) (not b!834109) (not b!834108) (not bm!36501) (not b!834111) (not bm!36500) (not start!71768))
(check-sat)
