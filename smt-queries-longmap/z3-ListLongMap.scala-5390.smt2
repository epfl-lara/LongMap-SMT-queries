; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71918 () Bool)

(assert start!71918)

(declare-datatypes ((array!46817 0))(
  ( (array!46818 (arr!22443 (Array (_ BitVec 32) (_ BitVec 64))) (size!22864 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46817)

(declare-fun call!36737 () (_ BitVec 32))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun bm!36734 () Bool)

(declare-fun to!390 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46817 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36734 (= call!36737 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835657 () Bool)

(declare-fun res!568572 () Bool)

(declare-fun e!466171 () Bool)

(assert (=> b!835657 (=> (not res!568572) (not e!466171))))

(assert (=> b!835657 (= res!568572 (and (bvslt (size!22864 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22864 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835658 () Bool)

(declare-fun res!568570 () Bool)

(assert (=> b!835658 (=> (not res!568570) (not e!466171))))

(declare-fun k0!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835658 (= res!568570 (validKeyInArray!0 k0!2968))))

(declare-fun b!835660 () Bool)

(declare-fun res!568575 () Bool)

(declare-fun e!466168 () Bool)

(assert (=> b!835660 (=> (not res!568575) (not e!466168))))

(declare-fun lt!379913 () array!46817)

(assert (=> b!835660 (= res!568575 (= (arrayCountValidKeys!0 lt!379913 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390))))))

(declare-fun b!835661 () Bool)

(declare-fun res!568574 () Bool)

(assert (=> b!835661 (=> (not res!568574) (not e!466171))))

(assert (=> b!835661 (= res!568574 (not (validKeyInArray!0 (select (arr!22443 a!4227) i!1466))))))

(declare-fun b!835662 () Bool)

(declare-fun e!466169 () Bool)

(assert (=> b!835662 (= e!466171 e!466169)))

(declare-fun res!568571 () Bool)

(assert (=> b!835662 (=> (not res!568571) (not e!466169))))

(declare-fun lt!379909 () (_ BitVec 32))

(declare-fun lt!379907 () (_ BitVec 32))

(assert (=> b!835662 (= res!568571 (and (= lt!379909 lt!379907) (not (= to!390 (size!22864 a!4227)))))))

(assert (=> b!835662 (= lt!379907 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835662 (= lt!379909 (arrayCountValidKeys!0 lt!379913 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835662 (= lt!379913 (array!46818 (store (arr!22443 a!4227) i!1466 k0!2968) (size!22864 a!4227)))))

(declare-fun bm!36735 () Bool)

(declare-fun call!36738 () (_ BitVec 32))

(assert (=> bm!36735 (= call!36738 (arrayCountValidKeys!0 lt!379913 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835663 () Bool)

(assert (=> b!835663 (= e!466168 (bvsge (bvsub (size!22864 a!4227) to!390) (bvsub (bvadd #b00000000000000000000000000000001 (size!22864 a!4227)) to!390)))))

(declare-fun b!835664 () Bool)

(declare-datatypes ((Unit!28709 0))(
  ( (Unit!28710) )
))
(declare-fun e!466172 () Unit!28709)

(declare-fun lt!379912 () Unit!28709)

(assert (=> b!835664 (= e!466172 lt!379912)))

(declare-fun lt!379910 () Unit!28709)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46817 (_ BitVec 32) (_ BitVec 32)) Unit!28709)

(assert (=> b!835664 (= lt!379910 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835664 (= call!36737 (bvadd #b00000000000000000000000000000001 lt!379907))))

(assert (=> b!835664 (= lt!379912 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379913 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835664 (= call!36738 (bvadd #b00000000000000000000000000000001 lt!379909))))

(declare-fun b!835665 () Bool)

(declare-fun lt!379911 () Unit!28709)

(assert (=> b!835665 (= e!466172 lt!379911)))

(declare-fun lt!379908 () Unit!28709)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46817 (_ BitVec 32) (_ BitVec 32)) Unit!28709)

(assert (=> b!835665 (= lt!379908 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835665 (= call!36737 lt!379907)))

(assert (=> b!835665 (= lt!379911 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379913 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835665 (= call!36738 lt!379909)))

(declare-fun b!835659 () Bool)

(assert (=> b!835659 (= e!466169 e!466168)))

(declare-fun res!568573 () Bool)

(assert (=> b!835659 (=> (not res!568573) (not e!466168))))

(assert (=> b!835659 (= res!568573 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22864 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!379906 () Unit!28709)

(assert (=> b!835659 (= lt!379906 e!466172)))

(declare-fun c!90939 () Bool)

(assert (=> b!835659 (= c!90939 (validKeyInArray!0 (select (arr!22443 a!4227) to!390)))))

(declare-fun res!568576 () Bool)

(assert (=> start!71918 (=> (not res!568576) (not e!466171))))

(assert (=> start!71918 (= res!568576 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22864 a!4227))))))

(assert (=> start!71918 e!466171))

(assert (=> start!71918 true))

(declare-fun array_inv!17955 (array!46817) Bool)

(assert (=> start!71918 (array_inv!17955 a!4227)))

(assert (= (and start!71918 res!568576) b!835661))

(assert (= (and b!835661 res!568574) b!835658))

(assert (= (and b!835658 res!568570) b!835657))

(assert (= (and b!835657 res!568572) b!835662))

(assert (= (and b!835662 res!568571) b!835659))

(assert (= (and b!835659 c!90939) b!835664))

(assert (= (and b!835659 (not c!90939)) b!835665))

(assert (= (or b!835664 b!835665) bm!36735))

(assert (= (or b!835664 b!835665) bm!36734))

(assert (= (and b!835659 res!568573) b!835660))

(assert (= (and b!835660 res!568575) b!835663))

(declare-fun m!780467 () Bool)

(assert (=> b!835659 m!780467))

(assert (=> b!835659 m!780467))

(declare-fun m!780469 () Bool)

(assert (=> b!835659 m!780469))

(declare-fun m!780471 () Bool)

(assert (=> b!835661 m!780471))

(assert (=> b!835661 m!780471))

(declare-fun m!780473 () Bool)

(assert (=> b!835661 m!780473))

(declare-fun m!780475 () Bool)

(assert (=> b!835660 m!780475))

(declare-fun m!780477 () Bool)

(assert (=> b!835660 m!780477))

(assert (=> bm!36735 m!780475))

(declare-fun m!780479 () Bool)

(assert (=> b!835658 m!780479))

(declare-fun m!780481 () Bool)

(assert (=> b!835664 m!780481))

(declare-fun m!780483 () Bool)

(assert (=> b!835664 m!780483))

(declare-fun m!780485 () Bool)

(assert (=> start!71918 m!780485))

(assert (=> bm!36734 m!780477))

(declare-fun m!780487 () Bool)

(assert (=> b!835662 m!780487))

(declare-fun m!780489 () Bool)

(assert (=> b!835662 m!780489))

(declare-fun m!780491 () Bool)

(assert (=> b!835662 m!780491))

(declare-fun m!780493 () Bool)

(assert (=> b!835665 m!780493))

(declare-fun m!780495 () Bool)

(assert (=> b!835665 m!780495))

(check-sat (not b!835661) (not start!71918) (not b!835664) (not b!835665) (not bm!36735) (not b!835662) (not b!835658) (not b!835660) (not b!835659) (not bm!36734))
(check-sat)
