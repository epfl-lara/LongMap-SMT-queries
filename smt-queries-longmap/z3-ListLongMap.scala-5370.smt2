; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71798 () Bool)

(assert start!71798)

(declare-fun b!834478 () Bool)

(declare-fun e!465574 () Bool)

(declare-fun e!465576 () Bool)

(assert (=> b!834478 (= e!465574 e!465576)))

(declare-fun res!567536 () Bool)

(assert (=> b!834478 (=> (not res!567536) (not e!465576))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-datatypes ((array!46697 0))(
  ( (array!46698 (arr!22383 (Array (_ BitVec 32) (_ BitVec 64))) (size!22804 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46697)

(assert (=> b!834478 (= res!567536 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22804 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-datatypes ((Unit!28637 0))(
  ( (Unit!28638) )
))
(declare-fun lt!379162 () Unit!28637)

(declare-fun e!465577 () Unit!28637)

(assert (=> b!834478 (= lt!379162 e!465577)))

(declare-fun c!90867 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834478 (= c!90867 (validKeyInArray!0 (select (arr!22383 a!4227) to!390)))))

(declare-fun res!567541 () Bool)

(declare-fun e!465578 () Bool)

(assert (=> start!71798 (=> (not res!567541) (not e!465578))))

(assert (=> start!71798 (= res!567541 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22804 a!4227))))))

(assert (=> start!71798 e!465578))

(assert (=> start!71798 true))

(declare-fun array_inv!17895 (array!46697) Bool)

(assert (=> start!71798 (array_inv!17895 a!4227)))

(declare-fun b!834479 () Bool)

(assert (=> b!834479 (= e!465576 (not true))))

(declare-fun lt!379169 () array!46697)

(declare-fun arrayCountValidKeys!0 (array!46697 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!834479 (= (arrayCountValidKeys!0 lt!379169 (bvadd #b00000000000000000000000000000001 i!1466) (size!22804 a!4227)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (size!22804 a!4227)))))

(declare-fun lt!379161 () Unit!28637)

(declare-fun k0!2968 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!46697 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!28637)

(assert (=> b!834479 (= lt!379161 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4227 i!1466 k0!2968 (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834480 () Bool)

(declare-fun res!567538 () Bool)

(assert (=> b!834480 (=> (not res!567538) (not e!465578))))

(assert (=> b!834480 (= res!567538 (validKeyInArray!0 k0!2968))))

(declare-fun b!834481 () Bool)

(declare-fun res!567540 () Bool)

(assert (=> b!834481 (=> (not res!567540) (not e!465576))))

(assert (=> b!834481 (= res!567540 (= (arrayCountValidKeys!0 lt!379169 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390))))))

(declare-fun b!834482 () Bool)

(declare-fun res!567535 () Bool)

(assert (=> b!834482 (=> (not res!567535) (not e!465578))))

(assert (=> b!834482 (= res!567535 (and (bvslt (size!22804 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22804 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!834483 () Bool)

(declare-fun res!567539 () Bool)

(assert (=> b!834483 (=> (not res!567539) (not e!465578))))

(assert (=> b!834483 (= res!567539 (not (validKeyInArray!0 (select (arr!22383 a!4227) i!1466))))))

(declare-fun call!36594 () (_ BitVec 32))

(declare-fun bm!36590 () Bool)

(assert (=> bm!36590 (= call!36594 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun call!36593 () (_ BitVec 32))

(declare-fun bm!36591 () Bool)

(assert (=> bm!36591 (= call!36593 (arrayCountValidKeys!0 lt!379169 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834484 () Bool)

(assert (=> b!834484 (= e!465578 e!465574)))

(declare-fun res!567537 () Bool)

(assert (=> b!834484 (=> (not res!567537) (not e!465574))))

(declare-fun lt!379164 () (_ BitVec 32))

(declare-fun lt!379165 () (_ BitVec 32))

(assert (=> b!834484 (= res!567537 (and (= lt!379165 lt!379164) (not (= to!390 (size!22804 a!4227)))))))

(assert (=> b!834484 (= lt!379164 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834484 (= lt!379165 (arrayCountValidKeys!0 lt!379169 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834484 (= lt!379169 (array!46698 (store (arr!22383 a!4227) i!1466 k0!2968) (size!22804 a!4227)))))

(declare-fun b!834485 () Bool)

(declare-fun lt!379167 () Unit!28637)

(assert (=> b!834485 (= e!465577 lt!379167)))

(declare-fun lt!379163 () Unit!28637)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46697 (_ BitVec 32) (_ BitVec 32)) Unit!28637)

(assert (=> b!834485 (= lt!379163 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834485 (= call!36594 lt!379164)))

(assert (=> b!834485 (= lt!379167 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379169 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834485 (= call!36593 lt!379165)))

(declare-fun b!834486 () Bool)

(declare-fun lt!379166 () Unit!28637)

(assert (=> b!834486 (= e!465577 lt!379166)))

(declare-fun lt!379168 () Unit!28637)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46697 (_ BitVec 32) (_ BitVec 32)) Unit!28637)

(assert (=> b!834486 (= lt!379168 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834486 (= call!36594 (bvadd #b00000000000000000000000000000001 lt!379164))))

(assert (=> b!834486 (= lt!379166 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379169 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834486 (= call!36593 (bvadd #b00000000000000000000000000000001 lt!379165))))

(assert (= (and start!71798 res!567541) b!834483))

(assert (= (and b!834483 res!567539) b!834480))

(assert (= (and b!834480 res!567538) b!834482))

(assert (= (and b!834482 res!567535) b!834484))

(assert (= (and b!834484 res!567537) b!834478))

(assert (= (and b!834478 c!90867) b!834486))

(assert (= (and b!834478 (not c!90867)) b!834485))

(assert (= (or b!834486 b!834485) bm!36591))

(assert (= (or b!834486 b!834485) bm!36590))

(assert (= (and b!834478 res!567536) b!834481))

(assert (= (and b!834481 res!567540) b!834479))

(declare-fun m!779037 () Bool)

(assert (=> b!834478 m!779037))

(assert (=> b!834478 m!779037))

(declare-fun m!779039 () Bool)

(assert (=> b!834478 m!779039))

(declare-fun m!779041 () Bool)

(assert (=> b!834479 m!779041))

(declare-fun m!779043 () Bool)

(assert (=> b!834479 m!779043))

(declare-fun m!779045 () Bool)

(assert (=> b!834479 m!779045))

(declare-fun m!779047 () Bool)

(assert (=> b!834485 m!779047))

(declare-fun m!779049 () Bool)

(assert (=> b!834485 m!779049))

(declare-fun m!779051 () Bool)

(assert (=> b!834483 m!779051))

(assert (=> b!834483 m!779051))

(declare-fun m!779053 () Bool)

(assert (=> b!834483 m!779053))

(declare-fun m!779055 () Bool)

(assert (=> b!834481 m!779055))

(declare-fun m!779057 () Bool)

(assert (=> b!834481 m!779057))

(declare-fun m!779059 () Bool)

(assert (=> b!834480 m!779059))

(declare-fun m!779061 () Bool)

(assert (=> start!71798 m!779061))

(assert (=> bm!36590 m!779057))

(declare-fun m!779063 () Bool)

(assert (=> b!834486 m!779063))

(declare-fun m!779065 () Bool)

(assert (=> b!834486 m!779065))

(declare-fun m!779067 () Bool)

(assert (=> b!834484 m!779067))

(declare-fun m!779069 () Bool)

(assert (=> b!834484 m!779069))

(declare-fun m!779071 () Bool)

(assert (=> b!834484 m!779071))

(assert (=> bm!36591 m!779055))

(check-sat (not b!834478) (not b!834483) (not b!834485) (not bm!36590) (not b!834481) (not b!834486) (not b!834484) (not b!834479) (not bm!36591) (not start!71798) (not b!834480))
(check-sat)
