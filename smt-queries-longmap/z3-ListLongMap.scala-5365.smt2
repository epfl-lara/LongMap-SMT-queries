; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71954 () Bool)

(assert start!71954)

(declare-datatypes ((array!46701 0))(
  ( (array!46702 (arr!22380 (Array (_ BitVec 32) (_ BitVec 64))) (size!22800 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46701)

(declare-fun call!36575 () (_ BitVec 32))

(declare-fun c!91169 () Bool)

(declare-fun lt!379319 () array!46701)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun bm!36571 () Bool)

(declare-fun arrayCountValidKeys!0 (array!46701 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36571 (= call!36575 (arrayCountValidKeys!0 (ite c!91169 a!4227 lt!379319) (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835247 () Bool)

(declare-fun e!466081 () Bool)

(declare-fun e!466077 () Bool)

(assert (=> b!835247 (= e!466081 e!466077)))

(declare-fun res!567708 () Bool)

(assert (=> b!835247 (=> (not res!567708) (not e!466077))))

(assert (=> b!835247 (= res!567708 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22800 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-datatypes ((Unit!28672 0))(
  ( (Unit!28673) )
))
(declare-fun lt!379322 () Unit!28672)

(declare-fun e!466080 () Unit!28672)

(assert (=> b!835247 (= lt!379322 e!466080)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835247 (= c!91169 (validKeyInArray!0 (select (arr!22380 a!4227) to!390)))))

(declare-fun b!835248 () Bool)

(declare-fun lt!379324 () Unit!28672)

(assert (=> b!835248 (= e!466080 lt!379324)))

(declare-fun lt!379325 () Unit!28672)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46701 (_ BitVec 32) (_ BitVec 32)) Unit!28672)

(assert (=> b!835248 (= lt!379325 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!379328 () (_ BitVec 32))

(assert (=> b!835248 (= call!36575 (bvadd #b00000000000000000000000000000001 lt!379328))))

(assert (=> b!835248 (= lt!379324 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379319 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36574 () (_ BitVec 32))

(declare-fun lt!379320 () (_ BitVec 32))

(assert (=> b!835248 (= call!36574 (bvadd #b00000000000000000000000000000001 lt!379320))))

(declare-fun b!835249 () Bool)

(declare-fun lt!379327 () Unit!28672)

(assert (=> b!835249 (= e!466080 lt!379327)))

(declare-fun lt!379326 () Unit!28672)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46701 (_ BitVec 32) (_ BitVec 32)) Unit!28672)

(assert (=> b!835249 (= lt!379326 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835249 (= call!36574 lt!379328)))

(assert (=> b!835249 (= lt!379327 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379319 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835249 (= call!36575 lt!379320)))

(declare-fun b!835250 () Bool)

(assert (=> b!835250 (= e!466077 false)))

(declare-fun lt!379323 () (_ BitVec 32))

(assert (=> b!835250 (= lt!379323 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun lt!379321 () (_ BitVec 32))

(assert (=> b!835250 (= lt!379321 (arrayCountValidKeys!0 lt!379319 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun bm!36572 () Bool)

(assert (=> bm!36572 (= call!36574 (arrayCountValidKeys!0 (ite c!91169 lt!379319 a!4227) (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835251 () Bool)

(declare-fun res!567707 () Bool)

(declare-fun e!466078 () Bool)

(assert (=> b!835251 (=> (not res!567707) (not e!466078))))

(assert (=> b!835251 (= res!567707 (not (validKeyInArray!0 (select (arr!22380 a!4227) i!1466))))))

(declare-fun b!835252 () Bool)

(declare-fun res!567711 () Bool)

(assert (=> b!835252 (=> (not res!567711) (not e!466078))))

(assert (=> b!835252 (= res!567711 (and (bvslt (size!22800 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22800 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835253 () Bool)

(declare-fun res!567709 () Bool)

(assert (=> b!835253 (=> (not res!567709) (not e!466078))))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!835253 (= res!567709 (validKeyInArray!0 k0!2968))))

(declare-fun b!835254 () Bool)

(assert (=> b!835254 (= e!466078 e!466081)))

(declare-fun res!567706 () Bool)

(assert (=> b!835254 (=> (not res!567706) (not e!466081))))

(assert (=> b!835254 (= res!567706 (and (= lt!379320 lt!379328) (not (= to!390 (size!22800 a!4227)))))))

(assert (=> b!835254 (= lt!379328 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835254 (= lt!379320 (arrayCountValidKeys!0 lt!379319 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835254 (= lt!379319 (array!46702 (store (arr!22380 a!4227) i!1466 k0!2968) (size!22800 a!4227)))))

(declare-fun res!567710 () Bool)

(assert (=> start!71954 (=> (not res!567710) (not e!466078))))

(assert (=> start!71954 (= res!567710 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22800 a!4227))))))

(assert (=> start!71954 e!466078))

(assert (=> start!71954 true))

(declare-fun array_inv!17866 (array!46701) Bool)

(assert (=> start!71954 (array_inv!17866 a!4227)))

(assert (= (and start!71954 res!567710) b!835251))

(assert (= (and b!835251 res!567707) b!835253))

(assert (= (and b!835253 res!567709) b!835252))

(assert (= (and b!835252 res!567711) b!835254))

(assert (= (and b!835254 res!567706) b!835247))

(assert (= (and b!835247 c!91169) b!835248))

(assert (= (and b!835247 (not c!91169)) b!835249))

(assert (= (or b!835248 b!835249) bm!36572))

(assert (= (or b!835248 b!835249) bm!36571))

(assert (= (and b!835247 res!567708) b!835250))

(declare-fun m!780607 () Bool)

(assert (=> bm!36572 m!780607))

(declare-fun m!780609 () Bool)

(assert (=> b!835248 m!780609))

(declare-fun m!780611 () Bool)

(assert (=> b!835248 m!780611))

(declare-fun m!780613 () Bool)

(assert (=> b!835249 m!780613))

(declare-fun m!780615 () Bool)

(assert (=> b!835249 m!780615))

(declare-fun m!780617 () Bool)

(assert (=> b!835247 m!780617))

(assert (=> b!835247 m!780617))

(declare-fun m!780619 () Bool)

(assert (=> b!835247 m!780619))

(declare-fun m!780621 () Bool)

(assert (=> bm!36571 m!780621))

(declare-fun m!780623 () Bool)

(assert (=> b!835250 m!780623))

(declare-fun m!780625 () Bool)

(assert (=> b!835250 m!780625))

(declare-fun m!780627 () Bool)

(assert (=> b!835253 m!780627))

(declare-fun m!780629 () Bool)

(assert (=> b!835251 m!780629))

(assert (=> b!835251 m!780629))

(declare-fun m!780631 () Bool)

(assert (=> b!835251 m!780631))

(declare-fun m!780633 () Bool)

(assert (=> start!71954 m!780633))

(declare-fun m!780635 () Bool)

(assert (=> b!835254 m!780635))

(declare-fun m!780637 () Bool)

(assert (=> b!835254 m!780637))

(declare-fun m!780639 () Bool)

(assert (=> b!835254 m!780639))

(check-sat (not b!835251) (not b!835248) (not b!835254) (not bm!36571) (not b!835249) (not b!835253) (not start!71954) (not b!835250) (not b!835247) (not bm!36572))
(check-sat)
