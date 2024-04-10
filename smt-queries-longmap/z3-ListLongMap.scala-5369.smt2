; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71814 () Bool)

(assert start!71814)

(declare-fun bm!36604 () Bool)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun call!36608 () (_ BitVec 32))

(declare-datatypes ((array!46724 0))(
  ( (array!46725 (arr!22396 (Array (_ BitVec 32) (_ BitVec 64))) (size!22817 (_ BitVec 32))) )
))
(declare-fun lt!379348 () array!46724)

(declare-fun to!390 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46724 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36604 (= call!36608 (arrayCountValidKeys!0 lt!379348 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834666 () Bool)

(declare-fun res!567599 () Bool)

(declare-fun e!465694 () Bool)

(assert (=> b!834666 (=> (not res!567599) (not e!465694))))

(declare-fun a!4227 () array!46724)

(assert (=> b!834666 (= res!567599 (= (arrayCountValidKeys!0 lt!379348 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390))))))

(declare-fun b!834667 () Bool)

(declare-fun e!465693 () Bool)

(assert (=> b!834667 (= e!465693 e!465694)))

(declare-fun res!567602 () Bool)

(assert (=> b!834667 (=> (not res!567602) (not e!465694))))

(assert (=> b!834667 (= res!567602 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22817 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-datatypes ((Unit!28685 0))(
  ( (Unit!28686) )
))
(declare-fun lt!379351 () Unit!28685)

(declare-fun e!465696 () Unit!28685)

(assert (=> b!834667 (= lt!379351 e!465696)))

(declare-fun c!90929 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834667 (= c!90929 (validKeyInArray!0 (select (arr!22396 a!4227) to!390)))))

(declare-fun b!834668 () Bool)

(assert (=> b!834668 (= e!465694 (not (bvsge (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000)))))

(assert (=> b!834668 (= (arrayCountValidKeys!0 lt!379348 (bvadd #b00000000000000000000000000000001 i!1466) (size!22817 a!4227)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (size!22817 a!4227)))))

(declare-fun lt!379353 () Unit!28685)

(declare-fun k0!2968 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!46724 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!28685)

(assert (=> b!834668 (= lt!379353 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4227 i!1466 k0!2968 (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834669 () Bool)

(declare-fun lt!379349 () Unit!28685)

(assert (=> b!834669 (= e!465696 lt!379349)))

(declare-fun lt!379347 () Unit!28685)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46724 (_ BitVec 32) (_ BitVec 32)) Unit!28685)

(assert (=> b!834669 (= lt!379347 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36607 () (_ BitVec 32))

(declare-fun lt!379346 () (_ BitVec 32))

(assert (=> b!834669 (= call!36607 (bvadd #b00000000000000000000000000000001 lt!379346))))

(assert (=> b!834669 (= lt!379349 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379348 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!379352 () (_ BitVec 32))

(assert (=> b!834669 (= call!36608 (bvadd #b00000000000000000000000000000001 lt!379352))))

(declare-fun b!834670 () Bool)

(declare-fun res!567600 () Bool)

(declare-fun e!465695 () Bool)

(assert (=> b!834670 (=> (not res!567600) (not e!465695))))

(assert (=> b!834670 (= res!567600 (validKeyInArray!0 k0!2968))))

(declare-fun b!834671 () Bool)

(declare-fun lt!379350 () Unit!28685)

(assert (=> b!834671 (= e!465696 lt!379350)))

(declare-fun lt!379354 () Unit!28685)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46724 (_ BitVec 32) (_ BitVec 32)) Unit!28685)

(assert (=> b!834671 (= lt!379354 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834671 (= call!36607 lt!379346)))

(assert (=> b!834671 (= lt!379350 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379348 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834671 (= call!36608 lt!379352)))

(declare-fun b!834672 () Bool)

(declare-fun res!567601 () Bool)

(assert (=> b!834672 (=> (not res!567601) (not e!465695))))

(assert (=> b!834672 (= res!567601 (not (validKeyInArray!0 (select (arr!22396 a!4227) i!1466))))))

(declare-fun bm!36605 () Bool)

(assert (=> bm!36605 (= call!36607 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun res!567605 () Bool)

(assert (=> start!71814 (=> (not res!567605) (not e!465695))))

(assert (=> start!71814 (= res!567605 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22817 a!4227))))))

(assert (=> start!71814 e!465695))

(assert (=> start!71814 true))

(declare-fun array_inv!17843 (array!46724) Bool)

(assert (=> start!71814 (array_inv!17843 a!4227)))

(declare-fun b!834673 () Bool)

(declare-fun res!567604 () Bool)

(assert (=> b!834673 (=> (not res!567604) (not e!465695))))

(assert (=> b!834673 (= res!567604 (and (bvslt (size!22817 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22817 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!834674 () Bool)

(assert (=> b!834674 (= e!465695 e!465693)))

(declare-fun res!567603 () Bool)

(assert (=> b!834674 (=> (not res!567603) (not e!465693))))

(assert (=> b!834674 (= res!567603 (and (= lt!379352 lt!379346) (not (= to!390 (size!22817 a!4227)))))))

(assert (=> b!834674 (= lt!379346 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834674 (= lt!379352 (arrayCountValidKeys!0 lt!379348 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834674 (= lt!379348 (array!46725 (store (arr!22396 a!4227) i!1466 k0!2968) (size!22817 a!4227)))))

(assert (= (and start!71814 res!567605) b!834672))

(assert (= (and b!834672 res!567601) b!834670))

(assert (= (and b!834670 res!567600) b!834673))

(assert (= (and b!834673 res!567604) b!834674))

(assert (= (and b!834674 res!567603) b!834667))

(assert (= (and b!834667 c!90929) b!834669))

(assert (= (and b!834667 (not c!90929)) b!834671))

(assert (= (or b!834669 b!834671) bm!36604))

(assert (= (or b!834669 b!834671) bm!36605))

(assert (= (and b!834667 res!567602) b!834666))

(assert (= (and b!834666 res!567599) b!834668))

(declare-fun m!779717 () Bool)

(assert (=> start!71814 m!779717))

(declare-fun m!779719 () Bool)

(assert (=> bm!36604 m!779719))

(declare-fun m!779721 () Bool)

(assert (=> b!834669 m!779721))

(declare-fun m!779723 () Bool)

(assert (=> b!834669 m!779723))

(declare-fun m!779725 () Bool)

(assert (=> b!834667 m!779725))

(assert (=> b!834667 m!779725))

(declare-fun m!779727 () Bool)

(assert (=> b!834667 m!779727))

(declare-fun m!779729 () Bool)

(assert (=> b!834671 m!779729))

(declare-fun m!779731 () Bool)

(assert (=> b!834671 m!779731))

(assert (=> b!834666 m!779719))

(declare-fun m!779733 () Bool)

(assert (=> b!834666 m!779733))

(declare-fun m!779735 () Bool)

(assert (=> b!834668 m!779735))

(declare-fun m!779737 () Bool)

(assert (=> b!834668 m!779737))

(declare-fun m!779739 () Bool)

(assert (=> b!834668 m!779739))

(declare-fun m!779741 () Bool)

(assert (=> b!834672 m!779741))

(assert (=> b!834672 m!779741))

(declare-fun m!779743 () Bool)

(assert (=> b!834672 m!779743))

(declare-fun m!779745 () Bool)

(assert (=> b!834674 m!779745))

(declare-fun m!779747 () Bool)

(assert (=> b!834674 m!779747))

(declare-fun m!779749 () Bool)

(assert (=> b!834674 m!779749))

(assert (=> bm!36605 m!779733))

(declare-fun m!779751 () Bool)

(assert (=> b!834670 m!779751))

(check-sat (not bm!36605) (not b!834666) (not b!834667) (not start!71814) (not b!834672) (not b!834671) (not b!834670) (not b!834674) (not b!834668) (not bm!36604) (not b!834669))
(check-sat)
