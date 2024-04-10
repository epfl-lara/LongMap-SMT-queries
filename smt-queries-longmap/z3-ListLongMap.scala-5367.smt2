; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71802 () Bool)

(assert start!71802)

(declare-fun b!834517 () Bool)

(declare-fun e!465606 () Bool)

(declare-fun e!465604 () Bool)

(assert (=> b!834517 (= e!465606 e!465604)))

(declare-fun res!567491 () Bool)

(assert (=> b!834517 (=> (not res!567491) (not e!465604))))

(declare-fun lt!379177 () (_ BitVec 32))

(declare-datatypes ((array!46712 0))(
  ( (array!46713 (arr!22390 (Array (_ BitVec 32) (_ BitVec 64))) (size!22811 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46712)

(declare-fun lt!379179 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!834517 (= res!567491 (and (= lt!379179 lt!379177) (not (= to!390 (size!22811 a!4227)))))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46712 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!834517 (= lt!379177 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!379175 () array!46712)

(assert (=> b!834517 (= lt!379179 (arrayCountValidKeys!0 lt!379175 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!834517 (= lt!379175 (array!46713 (store (arr!22390 a!4227) i!1466 k0!2968) (size!22811 a!4227)))))

(declare-fun b!834518 () Bool)

(declare-fun res!567488 () Bool)

(assert (=> b!834518 (=> (not res!567488) (not e!465606))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834518 (= res!567488 (not (validKeyInArray!0 (select (arr!22390 a!4227) i!1466))))))

(declare-fun res!567489 () Bool)

(assert (=> start!71802 (=> (not res!567489) (not e!465606))))

(assert (=> start!71802 (= res!567489 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22811 a!4227))))))

(assert (=> start!71802 e!465606))

(assert (=> start!71802 true))

(declare-fun array_inv!17837 (array!46712) Bool)

(assert (=> start!71802 (array_inv!17837 a!4227)))

(declare-fun b!834519 () Bool)

(declare-fun e!465605 () Bool)

(assert (=> b!834519 (= e!465605 false)))

(declare-fun lt!379180 () (_ BitVec 32))

(assert (=> b!834519 (= lt!379180 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun lt!379176 () (_ BitVec 32))

(assert (=> b!834519 (= lt!379176 (arrayCountValidKeys!0 lt!379175 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834520 () Bool)

(declare-fun res!567487 () Bool)

(assert (=> b!834520 (=> (not res!567487) (not e!465606))))

(assert (=> b!834520 (= res!567487 (validKeyInArray!0 k0!2968))))

(declare-fun bm!36568 () Bool)

(declare-fun call!36572 () (_ BitVec 32))

(assert (=> bm!36568 (= call!36572 (arrayCountValidKeys!0 lt!379175 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834521 () Bool)

(declare-fun res!567490 () Bool)

(assert (=> b!834521 (=> (not res!567490) (not e!465606))))

(assert (=> b!834521 (= res!567490 (and (bvslt (size!22811 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22811 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun bm!36569 () Bool)

(declare-fun call!36571 () (_ BitVec 32))

(assert (=> bm!36569 (= call!36571 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834522 () Bool)

(declare-datatypes ((Unit!28673 0))(
  ( (Unit!28674) )
))
(declare-fun e!465602 () Unit!28673)

(declare-fun lt!379171 () Unit!28673)

(assert (=> b!834522 (= e!465602 lt!379171)))

(declare-fun lt!379178 () Unit!28673)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46712 (_ BitVec 32) (_ BitVec 32)) Unit!28673)

(assert (=> b!834522 (= lt!379178 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834522 (= call!36571 (bvadd #b00000000000000000000000000000001 lt!379177))))

(assert (=> b!834522 (= lt!379171 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379175 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834522 (= call!36572 (bvadd #b00000000000000000000000000000001 lt!379179))))

(declare-fun b!834523 () Bool)

(assert (=> b!834523 (= e!465604 e!465605)))

(declare-fun res!567486 () Bool)

(assert (=> b!834523 (=> (not res!567486) (not e!465605))))

(assert (=> b!834523 (= res!567486 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22811 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!379174 () Unit!28673)

(assert (=> b!834523 (= lt!379174 e!465602)))

(declare-fun c!90911 () Bool)

(assert (=> b!834523 (= c!90911 (validKeyInArray!0 (select (arr!22390 a!4227) to!390)))))

(declare-fun b!834524 () Bool)

(declare-fun lt!379172 () Unit!28673)

(assert (=> b!834524 (= e!465602 lt!379172)))

(declare-fun lt!379173 () Unit!28673)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46712 (_ BitVec 32) (_ BitVec 32)) Unit!28673)

(assert (=> b!834524 (= lt!379173 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834524 (= call!36571 lt!379177)))

(assert (=> b!834524 (= lt!379172 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379175 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834524 (= call!36572 lt!379179)))

(assert (= (and start!71802 res!567489) b!834518))

(assert (= (and b!834518 res!567488) b!834520))

(assert (= (and b!834520 res!567487) b!834521))

(assert (= (and b!834521 res!567490) b!834517))

(assert (= (and b!834517 res!567491) b!834523))

(assert (= (and b!834523 c!90911) b!834522))

(assert (= (and b!834523 (not c!90911)) b!834524))

(assert (= (or b!834522 b!834524) bm!36568))

(assert (= (or b!834522 b!834524) bm!36569))

(assert (= (and b!834523 res!567486) b!834519))

(declare-fun m!779527 () Bool)

(assert (=> b!834519 m!779527))

(declare-fun m!779529 () Bool)

(assert (=> b!834519 m!779529))

(declare-fun m!779531 () Bool)

(assert (=> b!834518 m!779531))

(assert (=> b!834518 m!779531))

(declare-fun m!779533 () Bool)

(assert (=> b!834518 m!779533))

(declare-fun m!779535 () Bool)

(assert (=> b!834523 m!779535))

(assert (=> b!834523 m!779535))

(declare-fun m!779537 () Bool)

(assert (=> b!834523 m!779537))

(declare-fun m!779539 () Bool)

(assert (=> start!71802 m!779539))

(declare-fun m!779541 () Bool)

(assert (=> b!834524 m!779541))

(declare-fun m!779543 () Bool)

(assert (=> b!834524 m!779543))

(declare-fun m!779545 () Bool)

(assert (=> b!834520 m!779545))

(declare-fun m!779547 () Bool)

(assert (=> b!834522 m!779547))

(declare-fun m!779549 () Bool)

(assert (=> b!834522 m!779549))

(assert (=> bm!36569 m!779527))

(declare-fun m!779551 () Bool)

(assert (=> b!834517 m!779551))

(declare-fun m!779553 () Bool)

(assert (=> b!834517 m!779553))

(declare-fun m!779555 () Bool)

(assert (=> b!834517 m!779555))

(assert (=> bm!36568 m!779529))

(check-sat (not b!834524) (not bm!36569) (not b!834522) (not start!71802) (not b!834517) (not b!834520) (not b!834519) (not b!834523) (not b!834518) (not bm!36568))
(check-sat)
