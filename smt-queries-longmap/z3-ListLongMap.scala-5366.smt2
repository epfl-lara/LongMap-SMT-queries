; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71796 () Bool)

(assert start!71796)

(declare-fun b!834445 () Bool)

(declare-fun e!465561 () Bool)

(declare-fun e!465557 () Bool)

(assert (=> b!834445 (= e!465561 e!465557)))

(declare-fun res!567432 () Bool)

(assert (=> b!834445 (=> (not res!567432) (not e!465557))))

(declare-datatypes ((array!46706 0))(
  ( (array!46707 (arr!22387 (Array (_ BitVec 32) (_ BitVec 64))) (size!22808 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46706)

(declare-fun lt!379081 () (_ BitVec 32))

(declare-fun lt!379086 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!834445 (= res!567432 (and (= lt!379081 lt!379086) (not (= to!390 (size!22808 a!4227)))))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46706 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!834445 (= lt!379086 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!379090 () array!46706)

(assert (=> b!834445 (= lt!379081 (arrayCountValidKeys!0 lt!379090 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!834445 (= lt!379090 (array!46707 (store (arr!22387 a!4227) i!1466 k0!2968) (size!22808 a!4227)))))

(declare-fun call!36554 () (_ BitVec 32))

(declare-fun bm!36550 () Bool)

(assert (=> bm!36550 (= call!36554 (arrayCountValidKeys!0 lt!379090 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun call!36553 () (_ BitVec 32))

(declare-fun bm!36551 () Bool)

(assert (=> bm!36551 (= call!36553 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun res!567437 () Bool)

(assert (=> start!71796 (=> (not res!567437) (not e!465561))))

(assert (=> start!71796 (= res!567437 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22808 a!4227))))))

(assert (=> start!71796 e!465561))

(assert (=> start!71796 true))

(declare-fun array_inv!17834 (array!46706) Bool)

(assert (=> start!71796 (array_inv!17834 a!4227)))

(declare-fun b!834446 () Bool)

(declare-fun res!567435 () Bool)

(assert (=> b!834446 (=> (not res!567435) (not e!465561))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834446 (= res!567435 (not (validKeyInArray!0 (select (arr!22387 a!4227) i!1466))))))

(declare-fun b!834447 () Bool)

(declare-datatypes ((Unit!28667 0))(
  ( (Unit!28668) )
))
(declare-fun e!465558 () Unit!28667)

(declare-fun lt!379082 () Unit!28667)

(assert (=> b!834447 (= e!465558 lt!379082)))

(declare-fun lt!379089 () Unit!28667)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46706 (_ BitVec 32) (_ BitVec 32)) Unit!28667)

(assert (=> b!834447 (= lt!379089 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834447 (= call!36553 lt!379086)))

(assert (=> b!834447 (= lt!379082 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379090 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834447 (= call!36554 lt!379081)))

(declare-fun b!834448 () Bool)

(declare-fun res!567436 () Bool)

(assert (=> b!834448 (=> (not res!567436) (not e!465561))))

(assert (=> b!834448 (= res!567436 (and (bvslt (size!22808 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22808 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!834449 () Bool)

(declare-fun res!567434 () Bool)

(assert (=> b!834449 (=> (not res!567434) (not e!465561))))

(assert (=> b!834449 (= res!567434 (validKeyInArray!0 k0!2968))))

(declare-fun b!834450 () Bool)

(declare-fun lt!379087 () Unit!28667)

(assert (=> b!834450 (= e!465558 lt!379087)))

(declare-fun lt!379084 () Unit!28667)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46706 (_ BitVec 32) (_ BitVec 32)) Unit!28667)

(assert (=> b!834450 (= lt!379084 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834450 (= call!36553 (bvadd #b00000000000000000000000000000001 lt!379086))))

(assert (=> b!834450 (= lt!379087 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379090 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834450 (= call!36554 (bvadd #b00000000000000000000000000000001 lt!379081))))

(declare-fun b!834451 () Bool)

(declare-fun e!465560 () Bool)

(assert (=> b!834451 (= e!465557 e!465560)))

(declare-fun res!567433 () Bool)

(assert (=> b!834451 (=> (not res!567433) (not e!465560))))

(assert (=> b!834451 (= res!567433 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22808 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!379088 () Unit!28667)

(assert (=> b!834451 (= lt!379088 e!465558)))

(declare-fun c!90902 () Bool)

(assert (=> b!834451 (= c!90902 (validKeyInArray!0 (select (arr!22387 a!4227) to!390)))))

(declare-fun b!834452 () Bool)

(assert (=> b!834452 (= e!465560 false)))

(declare-fun lt!379085 () (_ BitVec 32))

(assert (=> b!834452 (= lt!379085 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun lt!379083 () (_ BitVec 32))

(assert (=> b!834452 (= lt!379083 (arrayCountValidKeys!0 lt!379090 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(assert (= (and start!71796 res!567437) b!834446))

(assert (= (and b!834446 res!567435) b!834449))

(assert (= (and b!834449 res!567434) b!834448))

(assert (= (and b!834448 res!567436) b!834445))

(assert (= (and b!834445 res!567432) b!834451))

(assert (= (and b!834451 c!90902) b!834450))

(assert (= (and b!834451 (not c!90902)) b!834447))

(assert (= (or b!834450 b!834447) bm!36550))

(assert (= (or b!834450 b!834447) bm!36551))

(assert (= (and b!834451 res!567433) b!834452))

(declare-fun m!779437 () Bool)

(assert (=> bm!36551 m!779437))

(declare-fun m!779439 () Bool)

(assert (=> b!834446 m!779439))

(assert (=> b!834446 m!779439))

(declare-fun m!779441 () Bool)

(assert (=> b!834446 m!779441))

(declare-fun m!779443 () Bool)

(assert (=> b!834447 m!779443))

(declare-fun m!779445 () Bool)

(assert (=> b!834447 m!779445))

(declare-fun m!779447 () Bool)

(assert (=> b!834449 m!779447))

(declare-fun m!779449 () Bool)

(assert (=> b!834450 m!779449))

(declare-fun m!779451 () Bool)

(assert (=> b!834450 m!779451))

(declare-fun m!779453 () Bool)

(assert (=> b!834445 m!779453))

(declare-fun m!779455 () Bool)

(assert (=> b!834445 m!779455))

(declare-fun m!779457 () Bool)

(assert (=> b!834445 m!779457))

(assert (=> b!834452 m!779437))

(declare-fun m!779459 () Bool)

(assert (=> b!834452 m!779459))

(assert (=> bm!36550 m!779459))

(declare-fun m!779461 () Bool)

(assert (=> start!71796 m!779461))

(declare-fun m!779463 () Bool)

(assert (=> b!834451 m!779463))

(assert (=> b!834451 m!779463))

(declare-fun m!779465 () Bool)

(assert (=> b!834451 m!779465))

(check-sat (not b!834446) (not b!834452) (not b!834450) (not b!834449) (not bm!36551) (not b!834447) (not start!71796) (not b!834451) (not b!834445) (not bm!36550))
(check-sat)
