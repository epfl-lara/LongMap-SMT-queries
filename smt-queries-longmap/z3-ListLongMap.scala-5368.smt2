; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71972 () Bool)

(assert start!71972)

(declare-fun b!835463 () Bool)

(declare-fun res!567870 () Bool)

(declare-fun e!466213 () Bool)

(assert (=> b!835463 (=> (not res!567870) (not e!466213))))

(declare-fun k0!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835463 (= res!567870 (validKeyInArray!0 k0!2968))))

(declare-fun b!835464 () Bool)

(declare-fun e!466215 () Bool)

(assert (=> b!835464 (= e!466215 false)))

(declare-datatypes ((array!46719 0))(
  ( (array!46720 (arr!22389 (Array (_ BitVec 32) (_ BitVec 64))) (size!22809 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46719)

(declare-fun lt!379594 () (_ BitVec 32))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46719 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835464 (= lt!379594 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun lt!379595 () array!46719)

(declare-fun lt!379596 () (_ BitVec 32))

(assert (=> b!835464 (= lt!379596 (arrayCountValidKeys!0 lt!379595 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835465 () Bool)

(declare-fun res!567872 () Bool)

(assert (=> b!835465 (=> (not res!567872) (not e!466213))))

(assert (=> b!835465 (= res!567872 (not (validKeyInArray!0 (select (arr!22389 a!4227) i!1466))))))

(declare-fun b!835466 () Bool)

(declare-datatypes ((Unit!28690 0))(
  ( (Unit!28691) )
))
(declare-fun e!466212 () Unit!28690)

(declare-fun lt!379592 () Unit!28690)

(assert (=> b!835466 (= e!466212 lt!379592)))

(declare-fun lt!379589 () Unit!28690)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46719 (_ BitVec 32) (_ BitVec 32)) Unit!28690)

(assert (=> b!835466 (= lt!379589 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36629 () (_ BitVec 32))

(declare-fun lt!379598 () (_ BitVec 32))

(assert (=> b!835466 (= call!36629 lt!379598)))

(assert (=> b!835466 (= lt!379592 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379595 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36628 () (_ BitVec 32))

(declare-fun lt!379590 () (_ BitVec 32))

(assert (=> b!835466 (= call!36628 lt!379590)))

(declare-fun b!835467 () Bool)

(declare-fun res!567868 () Bool)

(assert (=> b!835467 (=> (not res!567868) (not e!466213))))

(assert (=> b!835467 (= res!567868 (and (bvslt (size!22809 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22809 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835468 () Bool)

(declare-fun e!466216 () Bool)

(assert (=> b!835468 (= e!466216 e!466215)))

(declare-fun res!567873 () Bool)

(assert (=> b!835468 (=> (not res!567873) (not e!466215))))

(assert (=> b!835468 (= res!567873 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22809 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!379591 () Unit!28690)

(assert (=> b!835468 (= lt!379591 e!466212)))

(declare-fun c!91196 () Bool)

(assert (=> b!835468 (= c!91196 (validKeyInArray!0 (select (arr!22389 a!4227) to!390)))))

(declare-fun bm!36625 () Bool)

(assert (=> bm!36625 (= call!36629 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun bm!36626 () Bool)

(assert (=> bm!36626 (= call!36628 (arrayCountValidKeys!0 lt!379595 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835470 () Bool)

(declare-fun lt!379593 () Unit!28690)

(assert (=> b!835470 (= e!466212 lt!379593)))

(declare-fun lt!379597 () Unit!28690)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46719 (_ BitVec 32) (_ BitVec 32)) Unit!28690)

(assert (=> b!835470 (= lt!379597 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835470 (= call!36629 (bvadd #b00000000000000000000000000000001 lt!379598))))

(assert (=> b!835470 (= lt!379593 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379595 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835470 (= call!36628 (bvadd #b00000000000000000000000000000001 lt!379590))))

(declare-fun res!567869 () Bool)

(assert (=> start!71972 (=> (not res!567869) (not e!466213))))

(assert (=> start!71972 (= res!567869 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22809 a!4227))))))

(assert (=> start!71972 e!466213))

(assert (=> start!71972 true))

(declare-fun array_inv!17875 (array!46719) Bool)

(assert (=> start!71972 (array_inv!17875 a!4227)))

(declare-fun b!835469 () Bool)

(assert (=> b!835469 (= e!466213 e!466216)))

(declare-fun res!567871 () Bool)

(assert (=> b!835469 (=> (not res!567871) (not e!466216))))

(assert (=> b!835469 (= res!567871 (and (= lt!379590 lt!379598) (not (= to!390 (size!22809 a!4227)))))))

(assert (=> b!835469 (= lt!379598 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835469 (= lt!379590 (arrayCountValidKeys!0 lt!379595 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835469 (= lt!379595 (array!46720 (store (arr!22389 a!4227) i!1466 k0!2968) (size!22809 a!4227)))))

(assert (= (and start!71972 res!567869) b!835465))

(assert (= (and b!835465 res!567872) b!835463))

(assert (= (and b!835463 res!567870) b!835467))

(assert (= (and b!835467 res!567868) b!835469))

(assert (= (and b!835469 res!567871) b!835468))

(assert (= (and b!835468 c!91196) b!835470))

(assert (= (and b!835468 (not c!91196)) b!835466))

(assert (= (or b!835470 b!835466) bm!36626))

(assert (= (or b!835470 b!835466) bm!36625))

(assert (= (and b!835468 res!567873) b!835464))

(declare-fun m!780889 () Bool)

(assert (=> bm!36626 m!780889))

(declare-fun m!780891 () Bool)

(assert (=> b!835464 m!780891))

(assert (=> b!835464 m!780889))

(declare-fun m!780893 () Bool)

(assert (=> b!835465 m!780893))

(assert (=> b!835465 m!780893))

(declare-fun m!780895 () Bool)

(assert (=> b!835465 m!780895))

(declare-fun m!780897 () Bool)

(assert (=> start!71972 m!780897))

(declare-fun m!780899 () Bool)

(assert (=> b!835466 m!780899))

(declare-fun m!780901 () Bool)

(assert (=> b!835466 m!780901))

(declare-fun m!780903 () Bool)

(assert (=> b!835463 m!780903))

(assert (=> bm!36625 m!780891))

(declare-fun m!780905 () Bool)

(assert (=> b!835469 m!780905))

(declare-fun m!780907 () Bool)

(assert (=> b!835469 m!780907))

(declare-fun m!780909 () Bool)

(assert (=> b!835469 m!780909))

(declare-fun m!780911 () Bool)

(assert (=> b!835470 m!780911))

(declare-fun m!780913 () Bool)

(assert (=> b!835470 m!780913))

(declare-fun m!780915 () Bool)

(assert (=> b!835468 m!780915))

(assert (=> b!835468 m!780915))

(declare-fun m!780917 () Bool)

(assert (=> b!835468 m!780917))

(check-sat (not start!71972) (not b!835468) (not b!835464) (not b!835463) (not b!835470) (not b!835466) (not b!835465) (not bm!36625) (not b!835469) (not bm!36626))
(check-sat)
