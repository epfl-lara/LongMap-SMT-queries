; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71762 () Bool)

(assert start!71762)

(declare-fun b!834035 () Bool)

(declare-fun e!465307 () Bool)

(declare-fun e!465306 () Bool)

(assert (=> b!834035 (= e!465307 e!465306)))

(declare-fun res!567205 () Bool)

(assert (=> b!834035 (=> (not res!567205) (not e!465306))))

(declare-datatypes ((array!46661 0))(
  ( (array!46662 (arr!22365 (Array (_ BitVec 32) (_ BitVec 64))) (size!22786 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46661)

(declare-fun lt!378637 () (_ BitVec 32))

(declare-fun lt!378634 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!834035 (= res!567205 (and (= lt!378637 lt!378634) (not (= to!390 (size!22786 a!4227)))))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46661 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!834035 (= lt!378634 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!378640 () array!46661)

(assert (=> b!834035 (= lt!378637 (arrayCountValidKeys!0 lt!378640 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!834035 (= lt!378640 (array!46662 (store (arr!22365 a!4227) i!1466 k0!2968) (size!22786 a!4227)))))

(declare-fun b!834036 () Bool)

(declare-datatypes ((Unit!28601 0))(
  ( (Unit!28602) )
))
(declare-fun e!465305 () Unit!28601)

(declare-fun lt!378641 () Unit!28601)

(assert (=> b!834036 (= e!465305 lt!378641)))

(declare-fun lt!378636 () Unit!28601)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46661 (_ BitVec 32) (_ BitVec 32)) Unit!28601)

(assert (=> b!834036 (= lt!378636 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36486 () (_ BitVec 32))

(assert (=> b!834036 (= call!36486 (bvadd #b00000000000000000000000000000001 lt!378634))))

(assert (=> b!834036 (= lt!378641 (lemmaValidKeyIncreasesNumOfKeys!0 lt!378640 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36485 () (_ BitVec 32))

(assert (=> b!834036 (= call!36485 (bvadd #b00000000000000000000000000000001 lt!378637))))

(declare-fun b!834037 () Bool)

(declare-fun e!465308 () Bool)

(assert (=> b!834037 (= e!465306 e!465308)))

(declare-fun res!567203 () Bool)

(assert (=> b!834037 (=> (not res!567203) (not e!465308))))

(assert (=> b!834037 (= res!567203 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22786 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!378632 () Unit!28601)

(assert (=> b!834037 (= lt!378632 e!465305)))

(declare-fun c!90813 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834037 (= c!90813 (validKeyInArray!0 (select (arr!22365 a!4227) to!390)))))

(declare-fun res!567200 () Bool)

(assert (=> start!71762 (=> (not res!567200) (not e!465307))))

(assert (=> start!71762 (= res!567200 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22786 a!4227))))))

(assert (=> start!71762 e!465307))

(assert (=> start!71762 true))

(declare-fun array_inv!17877 (array!46661) Bool)

(assert (=> start!71762 (array_inv!17877 a!4227)))

(declare-fun b!834038 () Bool)

(assert (=> b!834038 (= e!465308 false)))

(declare-fun lt!378638 () (_ BitVec 32))

(assert (=> b!834038 (= lt!378638 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun lt!378633 () (_ BitVec 32))

(assert (=> b!834038 (= lt!378633 (arrayCountValidKeys!0 lt!378640 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834039 () Bool)

(declare-fun lt!378639 () Unit!28601)

(assert (=> b!834039 (= e!465305 lt!378639)))

(declare-fun lt!378635 () Unit!28601)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46661 (_ BitVec 32) (_ BitVec 32)) Unit!28601)

(assert (=> b!834039 (= lt!378635 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834039 (= call!36486 lt!378634)))

(assert (=> b!834039 (= lt!378639 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!378640 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834039 (= call!36485 lt!378637)))

(declare-fun bm!36482 () Bool)

(assert (=> bm!36482 (= call!36485 (arrayCountValidKeys!0 lt!378640 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834040 () Bool)

(declare-fun res!567202 () Bool)

(assert (=> b!834040 (=> (not res!567202) (not e!465307))))

(assert (=> b!834040 (= res!567202 (not (validKeyInArray!0 (select (arr!22365 a!4227) i!1466))))))

(declare-fun b!834041 () Bool)

(declare-fun res!567201 () Bool)

(assert (=> b!834041 (=> (not res!567201) (not e!465307))))

(assert (=> b!834041 (= res!567201 (validKeyInArray!0 k0!2968))))

(declare-fun b!834042 () Bool)

(declare-fun res!567204 () Bool)

(assert (=> b!834042 (=> (not res!567204) (not e!465307))))

(assert (=> b!834042 (= res!567204 (and (bvslt (size!22786 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22786 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun bm!36483 () Bool)

(assert (=> bm!36483 (= call!36486 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(assert (= (and start!71762 res!567200) b!834040))

(assert (= (and b!834040 res!567202) b!834041))

(assert (= (and b!834041 res!567201) b!834042))

(assert (= (and b!834042 res!567204) b!834035))

(assert (= (and b!834035 res!567205) b!834037))

(assert (= (and b!834037 c!90813) b!834036))

(assert (= (and b!834037 (not c!90813)) b!834039))

(assert (= (or b!834036 b!834039) bm!36482))

(assert (= (or b!834036 b!834039) bm!36483))

(assert (= (and b!834037 res!567203) b!834038))

(declare-fun m!778479 () Bool)

(assert (=> b!834041 m!778479))

(declare-fun m!778481 () Bool)

(assert (=> bm!36482 m!778481))

(declare-fun m!778483 () Bool)

(assert (=> b!834039 m!778483))

(declare-fun m!778485 () Bool)

(assert (=> b!834039 m!778485))

(declare-fun m!778487 () Bool)

(assert (=> b!834037 m!778487))

(assert (=> b!834037 m!778487))

(declare-fun m!778489 () Bool)

(assert (=> b!834037 m!778489))

(declare-fun m!778491 () Bool)

(assert (=> b!834035 m!778491))

(declare-fun m!778493 () Bool)

(assert (=> b!834035 m!778493))

(declare-fun m!778495 () Bool)

(assert (=> b!834035 m!778495))

(declare-fun m!778497 () Bool)

(assert (=> bm!36483 m!778497))

(declare-fun m!778499 () Bool)

(assert (=> b!834036 m!778499))

(declare-fun m!778501 () Bool)

(assert (=> b!834036 m!778501))

(declare-fun m!778503 () Bool)

(assert (=> start!71762 m!778503))

(assert (=> b!834038 m!778497))

(assert (=> b!834038 m!778481))

(declare-fun m!778505 () Bool)

(assert (=> b!834040 m!778505))

(assert (=> b!834040 m!778505))

(declare-fun m!778507 () Bool)

(assert (=> b!834040 m!778507))

(check-sat (not bm!36482) (not b!834038) (not b!834037) (not b!834035) (not b!834040) (not b!834039) (not b!834041) (not b!834036) (not start!71762) (not bm!36483))
(check-sat)
