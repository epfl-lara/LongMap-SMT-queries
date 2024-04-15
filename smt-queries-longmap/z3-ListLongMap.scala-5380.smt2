; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71858 () Bool)

(assert start!71858)

(declare-fun b!835030 () Bool)

(declare-fun e!465832 () Bool)

(declare-fun e!465831 () Bool)

(assert (=> b!835030 (= e!465832 e!465831)))

(declare-fun res!568038 () Bool)

(assert (=> b!835030 (=> (not res!568038) (not e!465831))))

(declare-datatypes ((array!46757 0))(
  ( (array!46758 (arr!22413 (Array (_ BitVec 32) (_ BitVec 64))) (size!22834 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46757)

(declare-fun lt!379429 () (_ BitVec 32))

(declare-fun lt!379428 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!835030 (= res!568038 (and (= lt!379428 lt!379429) (not (= to!390 (size!22834 a!4227)))))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46757 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835030 (= lt!379429 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!835030 (= lt!379428 (arrayCountValidKeys!0 (array!46758 (store (arr!22413 a!4227) i!1466 k0!2968) (size!22834 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!835031 () Bool)

(declare-fun res!568040 () Bool)

(assert (=> b!835031 (=> (not res!568040) (not e!465831))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835031 (= res!568040 (validKeyInArray!0 (select (arr!22413 a!4227) to!390)))))

(declare-fun b!835032 () Bool)

(assert (=> b!835032 (= e!465831 (not true))))

(assert (=> b!835032 (= (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (bvadd #b00000000000000000000000000000001 lt!379429))))

(declare-datatypes ((Unit!28655 0))(
  ( (Unit!28656) )
))
(declare-fun lt!379430 () Unit!28655)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46757 (_ BitVec 32) (_ BitVec 32)) Unit!28655)

(assert (=> b!835032 (= lt!379430 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun res!568042 () Bool)

(assert (=> start!71858 (=> (not res!568042) (not e!465832))))

(assert (=> start!71858 (= res!568042 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22834 a!4227))))))

(assert (=> start!71858 e!465832))

(assert (=> start!71858 true))

(declare-fun array_inv!17925 (array!46757) Bool)

(assert (=> start!71858 (array_inv!17925 a!4227)))

(declare-fun b!835033 () Bool)

(declare-fun res!568039 () Bool)

(assert (=> b!835033 (=> (not res!568039) (not e!465832))))

(assert (=> b!835033 (= res!568039 (and (bvslt (size!22834 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22834 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835034 () Bool)

(declare-fun res!568037 () Bool)

(assert (=> b!835034 (=> (not res!568037) (not e!465832))))

(assert (=> b!835034 (= res!568037 (validKeyInArray!0 k0!2968))))

(declare-fun b!835035 () Bool)

(declare-fun res!568041 () Bool)

(assert (=> b!835035 (=> (not res!568041) (not e!465832))))

(assert (=> b!835035 (= res!568041 (not (validKeyInArray!0 (select (arr!22413 a!4227) i!1466))))))

(assert (= (and start!71858 res!568042) b!835035))

(assert (= (and b!835035 res!568041) b!835034))

(assert (= (and b!835034 res!568037) b!835033))

(assert (= (and b!835033 res!568039) b!835030))

(assert (= (and b!835030 res!568038) b!835031))

(assert (= (and b!835031 res!568040) b!835032))

(declare-fun m!779671 () Bool)

(assert (=> b!835032 m!779671))

(declare-fun m!779673 () Bool)

(assert (=> b!835032 m!779673))

(declare-fun m!779675 () Bool)

(assert (=> b!835035 m!779675))

(assert (=> b!835035 m!779675))

(declare-fun m!779677 () Bool)

(assert (=> b!835035 m!779677))

(declare-fun m!779679 () Bool)

(assert (=> b!835030 m!779679))

(declare-fun m!779681 () Bool)

(assert (=> b!835030 m!779681))

(declare-fun m!779683 () Bool)

(assert (=> b!835030 m!779683))

(declare-fun m!779685 () Bool)

(assert (=> b!835031 m!779685))

(assert (=> b!835031 m!779685))

(declare-fun m!779687 () Bool)

(assert (=> b!835031 m!779687))

(declare-fun m!779689 () Bool)

(assert (=> start!71858 m!779689))

(declare-fun m!779691 () Bool)

(assert (=> b!835034 m!779691))

(check-sat (not b!835030) (not b!835035) (not b!835031) (not start!71858) (not b!835034) (not b!835032))
(check-sat)
