; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71908 () Bool)

(assert start!71908)

(declare-datatypes ((array!46807 0))(
  ( (array!46808 (arr!22438 (Array (_ BitVec 32) (_ BitVec 64))) (size!22859 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46807)

(declare-fun bm!36704 () Bool)

(declare-fun call!36707 () (_ BitVec 32))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46807 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36704 (= call!36707 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835539 () Bool)

(declare-fun res!568483 () Bool)

(declare-fun e!466098 () Bool)

(assert (=> b!835539 (=> (not res!568483) (not e!466098))))

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835539 (= res!568483 (validKeyInArray!0 k!2968))))

(declare-fun b!835540 () Bool)

(declare-fun res!568485 () Bool)

(assert (=> b!835540 (=> (not res!568485) (not e!466098))))

(assert (=> b!835540 (= res!568485 (and (bvslt (size!22859 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22859 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835541 () Bool)

(declare-fun e!466100 () Bool)

(assert (=> b!835541 (= e!466098 e!466100)))

(declare-fun res!568482 () Bool)

(assert (=> b!835541 (=> (not res!568482) (not e!466100))))

(declare-fun lt!379786 () (_ BitVec 32))

(declare-fun lt!379790 () (_ BitVec 32))

(assert (=> b!835541 (= res!568482 (and (= lt!379790 lt!379786) (not (= to!390 (size!22859 a!4227)))))))

(assert (=> b!835541 (= lt!379786 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!379788 () array!46807)

(assert (=> b!835541 (= lt!379790 (arrayCountValidKeys!0 lt!379788 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835541 (= lt!379788 (array!46808 (store (arr!22438 a!4227) i!1466 k!2968) (size!22859 a!4227)))))

(declare-fun b!835542 () Bool)

(declare-datatypes ((Unit!28699 0))(
  ( (Unit!28700) )
))
(declare-fun e!466099 () Unit!28699)

(declare-fun lt!379793 () Unit!28699)

(assert (=> b!835542 (= e!466099 lt!379793)))

(declare-fun lt!379791 () Unit!28699)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46807 (_ BitVec 32) (_ BitVec 32)) Unit!28699)

(assert (=> b!835542 (= lt!379791 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835542 (= call!36707 (bvadd #b00000000000000000000000000000001 lt!379786))))

(assert (=> b!835542 (= lt!379793 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379788 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36708 () (_ BitVec 32))

(assert (=> b!835542 (= call!36708 (bvadd #b00000000000000000000000000000001 lt!379790))))

(declare-fun res!568484 () Bool)

(assert (=> start!71908 (=> (not res!568484) (not e!466098))))

(assert (=> start!71908 (= res!568484 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22859 a!4227))))))

(assert (=> start!71908 e!466098))

(assert (=> start!71908 true))

(declare-fun array_inv!17950 (array!46807) Bool)

(assert (=> start!71908 (array_inv!17950 a!4227)))

(declare-fun b!835543 () Bool)

(declare-fun lt!379787 () Unit!28699)

(assert (=> b!835543 (= e!466099 lt!379787)))

(declare-fun lt!379789 () Unit!28699)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46807 (_ BitVec 32) (_ BitVec 32)) Unit!28699)

(assert (=> b!835543 (= lt!379789 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835543 (= call!36707 lt!379786)))

(assert (=> b!835543 (= lt!379787 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379788 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835543 (= call!36708 lt!379790)))

(declare-fun bm!36705 () Bool)

(assert (=> bm!36705 (= call!36708 (arrayCountValidKeys!0 lt!379788 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835544 () Bool)

(assert (=> b!835544 (= e!466100 (or (bvslt (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) (size!22859 a!4227)) (bvsle (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!379792 () Unit!28699)

(assert (=> b!835544 (= lt!379792 e!466099)))

(declare-fun c!90924 () Bool)

(assert (=> b!835544 (= c!90924 (validKeyInArray!0 (select (arr!22438 a!4227) to!390)))))

(declare-fun b!835545 () Bool)

(declare-fun res!568486 () Bool)

(assert (=> b!835545 (=> (not res!568486) (not e!466098))))

(assert (=> b!835545 (= res!568486 (not (validKeyInArray!0 (select (arr!22438 a!4227) i!1466))))))

(assert (= (and start!71908 res!568484) b!835545))

(assert (= (and b!835545 res!568486) b!835539))

(assert (= (and b!835539 res!568483) b!835540))

(assert (= (and b!835540 res!568485) b!835541))

(assert (= (and b!835541 res!568482) b!835544))

(assert (= (and b!835544 c!90924) b!835542))

(assert (= (and b!835544 (not c!90924)) b!835543))

(assert (= (or b!835542 b!835543) bm!36705))

(assert (= (or b!835542 b!835543) bm!36704))

(declare-fun m!780313 () Bool)

(assert (=> b!835539 m!780313))

(declare-fun m!780315 () Bool)

(assert (=> bm!36704 m!780315))

(declare-fun m!780317 () Bool)

(assert (=> b!835545 m!780317))

(assert (=> b!835545 m!780317))

(declare-fun m!780319 () Bool)

(assert (=> b!835545 m!780319))

(declare-fun m!780321 () Bool)

(assert (=> b!835544 m!780321))

(assert (=> b!835544 m!780321))

(declare-fun m!780323 () Bool)

(assert (=> b!835544 m!780323))

(declare-fun m!780325 () Bool)

(assert (=> b!835542 m!780325))

(declare-fun m!780327 () Bool)

(assert (=> b!835542 m!780327))

(declare-fun m!780329 () Bool)

(assert (=> bm!36705 m!780329))

(declare-fun m!780331 () Bool)

(assert (=> b!835543 m!780331))

(declare-fun m!780333 () Bool)

(assert (=> b!835543 m!780333))

(declare-fun m!780335 () Bool)

(assert (=> start!71908 m!780335))

(declare-fun m!780337 () Bool)

(assert (=> b!835541 m!780337))

(declare-fun m!780339 () Bool)

(assert (=> b!835541 m!780339))

(declare-fun m!780341 () Bool)

(assert (=> b!835541 m!780341))

(push 1)

(assert (not b!835539))

(assert (not b!835543))

(assert (not b!835542))

(assert (not b!835544))

(assert (not start!71908))

(assert (not bm!36704))

(assert (not b!835541))

(assert (not bm!36705))

(assert (not b!835545))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

