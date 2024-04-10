; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71928 () Bool)

(assert start!71928)

(declare-fun b!835781 () Bool)

(declare-datatypes ((Unit!28751 0))(
  ( (Unit!28752) )
))
(declare-fun e!466247 () Unit!28751)

(declare-fun lt!380027 () Unit!28751)

(assert (=> b!835781 (= e!466247 lt!380027)))

(declare-datatypes ((array!46838 0))(
  ( (array!46839 (arr!22453 (Array (_ BitVec 32) (_ BitVec 64))) (size!22874 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46838)

(declare-fun lt!380028 () Unit!28751)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46838 (_ BitVec 32) (_ BitVec 32)) Unit!28751)

(assert (=> b!835781 (= lt!380028 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36734 () (_ BitVec 32))

(declare-fun lt!380026 () (_ BitVec 32))

(assert (=> b!835781 (= call!36734 (bvadd #b00000000000000000000000000000001 lt!380026))))

(declare-fun lt!380032 () array!46838)

(assert (=> b!835781 (= lt!380027 (lemmaValidKeyIncreasesNumOfKeys!0 lt!380032 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36733 () (_ BitVec 32))

(declare-fun lt!380031 () (_ BitVec 32))

(assert (=> b!835781 (= call!36733 (bvadd #b00000000000000000000000000000001 lt!380031))))

(declare-fun b!835782 () Bool)

(declare-fun lt!380025 () Unit!28751)

(assert (=> b!835782 (= e!466247 lt!380025)))

(declare-fun lt!380029 () Unit!28751)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46838 (_ BitVec 32) (_ BitVec 32)) Unit!28751)

(assert (=> b!835782 (= lt!380029 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835782 (= call!36734 lt!380026)))

(assert (=> b!835782 (= lt!380025 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!380032 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835782 (= call!36733 lt!380031)))

(declare-fun bm!36730 () Bool)

(declare-fun arrayCountValidKeys!0 (array!46838 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36730 (= call!36734 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835783 () Bool)

(declare-fun res!568590 () Bool)

(declare-fun e!466245 () Bool)

(assert (=> b!835783 (=> (not res!568590) (not e!466245))))

(assert (=> b!835783 (= res!568590 (and (bvslt (size!22874 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22874 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835784 () Bool)

(declare-fun res!568589 () Bool)

(assert (=> b!835784 (=> (not res!568589) (not e!466245))))

(declare-fun k0!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835784 (= res!568589 (validKeyInArray!0 k0!2968))))

(declare-fun res!568592 () Bool)

(assert (=> start!71928 (=> (not res!568592) (not e!466245))))

(assert (=> start!71928 (= res!568592 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22874 a!4227))))))

(assert (=> start!71928 e!466245))

(assert (=> start!71928 true))

(declare-fun array_inv!17900 (array!46838) Bool)

(assert (=> start!71928 (array_inv!17900 a!4227)))

(declare-fun b!835785 () Bool)

(declare-fun res!568588 () Bool)

(assert (=> b!835785 (=> (not res!568588) (not e!466245))))

(assert (=> b!835785 (= res!568588 (not (validKeyInArray!0 (select (arr!22453 a!4227) i!1466))))))

(declare-fun bm!36731 () Bool)

(assert (=> bm!36731 (= call!36733 (arrayCountValidKeys!0 lt!380032 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun e!466246 () Bool)

(declare-fun b!835786 () Bool)

(assert (=> b!835786 (= e!466246 (or (bvslt (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) (size!22874 a!4227)) (bvsle (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!380030 () Unit!28751)

(assert (=> b!835786 (= lt!380030 e!466247)))

(declare-fun c!90992 () Bool)

(assert (=> b!835786 (= c!90992 (validKeyInArray!0 (select (arr!22453 a!4227) to!390)))))

(declare-fun b!835787 () Bool)

(assert (=> b!835787 (= e!466245 e!466246)))

(declare-fun res!568591 () Bool)

(assert (=> b!835787 (=> (not res!568591) (not e!466246))))

(assert (=> b!835787 (= res!568591 (and (= lt!380031 lt!380026) (not (= to!390 (size!22874 a!4227)))))))

(assert (=> b!835787 (= lt!380026 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835787 (= lt!380031 (arrayCountValidKeys!0 lt!380032 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835787 (= lt!380032 (array!46839 (store (arr!22453 a!4227) i!1466 k0!2968) (size!22874 a!4227)))))

(assert (= (and start!71928 res!568592) b!835785))

(assert (= (and b!835785 res!568588) b!835784))

(assert (= (and b!835784 res!568589) b!835783))

(assert (= (and b!835783 res!568590) b!835787))

(assert (= (and b!835787 res!568591) b!835786))

(assert (= (and b!835786 c!90992) b!835781))

(assert (= (and b!835786 (not c!90992)) b!835782))

(assert (= (or b!835781 b!835782) bm!36731))

(assert (= (or b!835781 b!835782) bm!36730))

(declare-fun m!781065 () Bool)

(assert (=> b!835781 m!781065))

(declare-fun m!781067 () Bool)

(assert (=> b!835781 m!781067))

(declare-fun m!781069 () Bool)

(assert (=> b!835782 m!781069))

(declare-fun m!781071 () Bool)

(assert (=> b!835782 m!781071))

(declare-fun m!781073 () Bool)

(assert (=> b!835786 m!781073))

(assert (=> b!835786 m!781073))

(declare-fun m!781075 () Bool)

(assert (=> b!835786 m!781075))

(declare-fun m!781077 () Bool)

(assert (=> bm!36730 m!781077))

(declare-fun m!781079 () Bool)

(assert (=> b!835785 m!781079))

(assert (=> b!835785 m!781079))

(declare-fun m!781081 () Bool)

(assert (=> b!835785 m!781081))

(declare-fun m!781083 () Bool)

(assert (=> bm!36731 m!781083))

(declare-fun m!781085 () Bool)

(assert (=> b!835787 m!781085))

(declare-fun m!781087 () Bool)

(assert (=> b!835787 m!781087))

(declare-fun m!781089 () Bool)

(assert (=> b!835787 m!781089))

(declare-fun m!781091 () Bool)

(assert (=> b!835784 m!781091))

(declare-fun m!781093 () Bool)

(assert (=> start!71928 m!781093))

(check-sat (not bm!36731) (not b!835786) (not bm!36730) (not b!835782) (not start!71928) (not b!835784) (not b!835787) (not b!835781) (not b!835785))
(check-sat)
