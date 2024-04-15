; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71894 () Bool)

(assert start!71894)

(declare-datatypes ((array!46793 0))(
  ( (array!46794 (arr!22431 (Array (_ BitVec 32) (_ BitVec 64))) (size!22852 (_ BitVec 32))) )
))
(declare-fun lt!379624 () array!46793)

(declare-fun call!36666 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun bm!36662 () Bool)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46793 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36662 (= call!36666 (arrayCountValidKeys!0 lt!379624 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835393 () Bool)

(declare-datatypes ((Unit!28685 0))(
  ( (Unit!28686) )
))
(declare-fun e!466013 () Unit!28685)

(declare-fun lt!379620 () Unit!28685)

(assert (=> b!835393 (= e!466013 lt!379620)))

(declare-fun a!4227 () array!46793)

(declare-fun lt!379618 () Unit!28685)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46793 (_ BitVec 32) (_ BitVec 32)) Unit!28685)

(assert (=> b!835393 (= lt!379618 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36665 () (_ BitVec 32))

(declare-fun lt!379625 () (_ BitVec 32))

(assert (=> b!835393 (= call!36665 (bvadd #b00000000000000000000000000000001 lt!379625))))

(assert (=> b!835393 (= lt!379620 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379624 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!379623 () (_ BitVec 32))

(assert (=> b!835393 (= call!36666 (bvadd #b00000000000000000000000000000001 lt!379623))))

(declare-fun b!835394 () Bool)

(declare-fun res!568381 () Bool)

(declare-fun e!466014 () Bool)

(assert (=> b!835394 (=> (not res!568381) (not e!466014))))

(assert (=> b!835394 (= res!568381 (and (bvslt (size!22852 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22852 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835395 () Bool)

(declare-fun lt!379621 () Unit!28685)

(assert (=> b!835395 (= e!466013 lt!379621)))

(declare-fun lt!379619 () Unit!28685)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46793 (_ BitVec 32) (_ BitVec 32)) Unit!28685)

(assert (=> b!835395 (= lt!379619 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835395 (= call!36665 lt!379625)))

(assert (=> b!835395 (= lt!379621 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379624 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835395 (= call!36666 lt!379623)))

(declare-fun res!568380 () Bool)

(assert (=> start!71894 (=> (not res!568380) (not e!466014))))

(assert (=> start!71894 (= res!568380 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22852 a!4227))))))

(assert (=> start!71894 e!466014))

(assert (=> start!71894 true))

(declare-fun array_inv!17943 (array!46793) Bool)

(assert (=> start!71894 (array_inv!17943 a!4227)))

(declare-fun b!835392 () Bool)

(declare-fun e!466016 () Bool)

(assert (=> b!835392 (= e!466016 false)))

(declare-fun lt!379622 () Unit!28685)

(assert (=> b!835392 (= lt!379622 e!466013)))

(declare-fun c!90903 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835392 (= c!90903 (validKeyInArray!0 (select (arr!22431 a!4227) to!390)))))

(declare-fun b!835396 () Bool)

(declare-fun res!568377 () Bool)

(assert (=> b!835396 (=> (not res!568377) (not e!466014))))

(assert (=> b!835396 (= res!568377 (not (validKeyInArray!0 (select (arr!22431 a!4227) i!1466))))))

(declare-fun b!835397 () Bool)

(declare-fun res!568379 () Bool)

(assert (=> b!835397 (=> (not res!568379) (not e!466014))))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!835397 (= res!568379 (validKeyInArray!0 k0!2968))))

(declare-fun b!835398 () Bool)

(assert (=> b!835398 (= e!466014 e!466016)))

(declare-fun res!568378 () Bool)

(assert (=> b!835398 (=> (not res!568378) (not e!466016))))

(assert (=> b!835398 (= res!568378 (and (= lt!379623 lt!379625) (not (= to!390 (size!22852 a!4227)))))))

(assert (=> b!835398 (= lt!379625 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835398 (= lt!379623 (arrayCountValidKeys!0 lt!379624 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835398 (= lt!379624 (array!46794 (store (arr!22431 a!4227) i!1466 k0!2968) (size!22852 a!4227)))))

(declare-fun bm!36663 () Bool)

(assert (=> bm!36663 (= call!36665 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(assert (= (and start!71894 res!568380) b!835396))

(assert (= (and b!835396 res!568377) b!835397))

(assert (= (and b!835397 res!568379) b!835394))

(assert (= (and b!835394 res!568381) b!835398))

(assert (= (and b!835398 res!568378) b!835392))

(assert (= (and b!835392 c!90903) b!835393))

(assert (= (and b!835392 (not c!90903)) b!835395))

(assert (= (or b!835393 b!835395) bm!36662))

(assert (= (or b!835393 b!835395) bm!36663))

(declare-fun m!780103 () Bool)

(assert (=> bm!36662 m!780103))

(declare-fun m!780105 () Bool)

(assert (=> bm!36663 m!780105))

(declare-fun m!780107 () Bool)

(assert (=> b!835395 m!780107))

(declare-fun m!780109 () Bool)

(assert (=> b!835395 m!780109))

(declare-fun m!780111 () Bool)

(assert (=> start!71894 m!780111))

(declare-fun m!780113 () Bool)

(assert (=> b!835398 m!780113))

(declare-fun m!780115 () Bool)

(assert (=> b!835398 m!780115))

(declare-fun m!780117 () Bool)

(assert (=> b!835398 m!780117))

(declare-fun m!780119 () Bool)

(assert (=> b!835392 m!780119))

(assert (=> b!835392 m!780119))

(declare-fun m!780121 () Bool)

(assert (=> b!835392 m!780121))

(declare-fun m!780123 () Bool)

(assert (=> b!835397 m!780123))

(declare-fun m!780125 () Bool)

(assert (=> b!835396 m!780125))

(assert (=> b!835396 m!780125))

(declare-fun m!780127 () Bool)

(assert (=> b!835396 m!780127))

(declare-fun m!780129 () Bool)

(assert (=> b!835393 m!780129))

(declare-fun m!780131 () Bool)

(assert (=> b!835393 m!780131))

(check-sat (not bm!36663) (not bm!36662) (not b!835398) (not b!835392) (not b!835397) (not b!835396) (not b!835395) (not start!71894) (not b!835393))
(check-sat)
