; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71926 () Bool)

(assert start!71926)

(declare-fun b!835760 () Bool)

(declare-fun e!466234 () Bool)

(declare-fun e!466233 () Bool)

(assert (=> b!835760 (= e!466234 e!466233)))

(declare-fun res!568576 () Bool)

(assert (=> b!835760 (=> (not res!568576) (not e!466233))))

(declare-fun lt!380006 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-datatypes ((array!46836 0))(
  ( (array!46837 (arr!22452 (Array (_ BitVec 32) (_ BitVec 64))) (size!22873 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46836)

(declare-fun lt!380008 () (_ BitVec 32))

(assert (=> b!835760 (= res!568576 (and (= lt!380006 lt!380008) (not (= to!390 (size!22873 a!4227)))))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46836 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835760 (= lt!380008 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!380007 () array!46836)

(assert (=> b!835760 (= lt!380006 (arrayCountValidKeys!0 lt!380007 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k!2968 () (_ BitVec 64))

(assert (=> b!835760 (= lt!380007 (array!46837 (store (arr!22452 a!4227) i!1466 k!2968) (size!22873 a!4227)))))

(declare-fun b!835761 () Bool)

(declare-fun res!568575 () Bool)

(assert (=> b!835761 (=> (not res!568575) (not e!466234))))

(assert (=> b!835761 (= res!568575 (and (bvslt (size!22873 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22873 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835762 () Bool)

(assert (=> b!835762 (= e!466233 (or (bvslt (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) (size!22873 a!4227)) (bvsle (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-datatypes ((Unit!28749 0))(
  ( (Unit!28750) )
))
(declare-fun lt!380003 () Unit!28749)

(declare-fun e!466235 () Unit!28749)

(assert (=> b!835762 (= lt!380003 e!466235)))

(declare-fun c!90989 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835762 (= c!90989 (validKeyInArray!0 (select (arr!22452 a!4227) to!390)))))

(declare-fun bm!36724 () Bool)

(declare-fun call!36728 () (_ BitVec 32))

(assert (=> bm!36724 (= call!36728 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun res!568577 () Bool)

(assert (=> start!71926 (=> (not res!568577) (not e!466234))))

(assert (=> start!71926 (= res!568577 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22873 a!4227))))))

(assert (=> start!71926 e!466234))

(assert (=> start!71926 true))

(declare-fun array_inv!17899 (array!46836) Bool)

(assert (=> start!71926 (array_inv!17899 a!4227)))

(declare-fun b!835763 () Bool)

(declare-fun res!568574 () Bool)

(assert (=> b!835763 (=> (not res!568574) (not e!466234))))

(assert (=> b!835763 (= res!568574 (validKeyInArray!0 k!2968))))

(declare-fun bm!36725 () Bool)

(declare-fun call!36727 () (_ BitVec 32))

(assert (=> bm!36725 (= call!36727 (arrayCountValidKeys!0 lt!380007 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835764 () Bool)

(declare-fun res!568573 () Bool)

(assert (=> b!835764 (=> (not res!568573) (not e!466234))))

(assert (=> b!835764 (= res!568573 (not (validKeyInArray!0 (select (arr!22452 a!4227) i!1466))))))

(declare-fun b!835765 () Bool)

(declare-fun lt!380001 () Unit!28749)

(assert (=> b!835765 (= e!466235 lt!380001)))

(declare-fun lt!380002 () Unit!28749)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46836 (_ BitVec 32) (_ BitVec 32)) Unit!28749)

(assert (=> b!835765 (= lt!380002 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835765 (= call!36728 lt!380008)))

(assert (=> b!835765 (= lt!380001 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!380007 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835765 (= call!36727 lt!380006)))

(declare-fun b!835766 () Bool)

(declare-fun lt!380005 () Unit!28749)

(assert (=> b!835766 (= e!466235 lt!380005)))

(declare-fun lt!380004 () Unit!28749)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46836 (_ BitVec 32) (_ BitVec 32)) Unit!28749)

(assert (=> b!835766 (= lt!380004 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835766 (= call!36728 (bvadd #b00000000000000000000000000000001 lt!380008))))

(assert (=> b!835766 (= lt!380005 (lemmaValidKeyIncreasesNumOfKeys!0 lt!380007 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835766 (= call!36727 (bvadd #b00000000000000000000000000000001 lt!380006))))

(assert (= (and start!71926 res!568577) b!835764))

(assert (= (and b!835764 res!568573) b!835763))

(assert (= (and b!835763 res!568574) b!835761))

(assert (= (and b!835761 res!568575) b!835760))

(assert (= (and b!835760 res!568576) b!835762))

(assert (= (and b!835762 c!90989) b!835766))

(assert (= (and b!835762 (not c!90989)) b!835765))

(assert (= (or b!835766 b!835765) bm!36725))

(assert (= (or b!835766 b!835765) bm!36724))

(declare-fun m!781035 () Bool)

(assert (=> start!71926 m!781035))

(declare-fun m!781037 () Bool)

(assert (=> bm!36724 m!781037))

(declare-fun m!781039 () Bool)

(assert (=> b!835764 m!781039))

(assert (=> b!835764 m!781039))

(declare-fun m!781041 () Bool)

(assert (=> b!835764 m!781041))

(declare-fun m!781043 () Bool)

(assert (=> b!835765 m!781043))

(declare-fun m!781045 () Bool)

(assert (=> b!835765 m!781045))

(declare-fun m!781047 () Bool)

(assert (=> b!835766 m!781047))

(declare-fun m!781049 () Bool)

(assert (=> b!835766 m!781049))

(declare-fun m!781051 () Bool)

(assert (=> bm!36725 m!781051))

(declare-fun m!781053 () Bool)

(assert (=> b!835760 m!781053))

(declare-fun m!781055 () Bool)

(assert (=> b!835760 m!781055))

(declare-fun m!781057 () Bool)

(assert (=> b!835760 m!781057))

(declare-fun m!781059 () Bool)

(assert (=> b!835762 m!781059))

(assert (=> b!835762 m!781059))

(declare-fun m!781061 () Bool)

(assert (=> b!835762 m!781061))

(declare-fun m!781063 () Bool)

(assert (=> b!835763 m!781063))

(push 1)

(assert (not bm!36724))

(assert (not b!835764))

(assert (not b!835760))

(assert (not b!835763))

(assert (not bm!36725))

(assert (not start!71926))

(assert (not b!835765))

(assert (not b!835762))

(assert (not b!835766))

(check-sat)

(pop 1)

(push 1)

(check-sat)

