; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116720 () Bool)

(assert start!116720)

(declare-fun b!1375473 () Bool)

(declare-fun e!779319 () Bool)

(declare-fun e!779320 () Bool)

(assert (=> b!1375473 (= e!779319 (not e!779320))))

(declare-fun res!917880 () Bool)

(assert (=> b!1375473 (=> res!917880 e!779320)))

(declare-fun i!1457 () (_ BitVec 32))

(assert (=> b!1375473 (= res!917880 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) i!1457)))))

(declare-datatypes ((array!93311 0))(
  ( (array!93312 (arr!45057 (Array (_ BitVec 32) (_ BitVec 64))) (size!45608 (_ BitVec 32))) )
))
(declare-fun lt!603779 () array!93311)

(declare-fun a!4142 () array!93311)

(declare-fun arrayCountValidKeys!0 (array!93311 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375473 (= (arrayCountValidKeys!0 lt!603779 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(declare-fun k!2959 () (_ BitVec 64))

(assert (=> b!1375473 (= lt!603779 (array!93312 (store (arr!45057 a!4142) i!1457 k!2959) (size!45608 a!4142)))))

(declare-datatypes ((Unit!45348 0))(
  ( (Unit!45349) )
))
(declare-fun lt!603778 () Unit!45348)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93311 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45348)

(assert (=> b!1375473 (= lt!603778 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1375474 () Bool)

(declare-fun res!917878 () Bool)

(assert (=> b!1375474 (=> (not res!917878) (not e!779319))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375474 (= res!917878 (not (validKeyInArray!0 k!2959)))))

(declare-fun res!917876 () Bool)

(assert (=> start!116720 (=> (not res!917876) (not e!779319))))

(assert (=> start!116720 (= res!917876 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45608 a!4142))))))

(assert (=> start!116720 e!779319))

(assert (=> start!116720 true))

(declare-fun array_inv!34338 (array!93311) Bool)

(assert (=> start!116720 (array_inv!34338 a!4142)))

(declare-fun b!1375475 () Bool)

(declare-fun res!917877 () Bool)

(assert (=> b!1375475 (=> (not res!917877) (not e!779319))))

(assert (=> b!1375475 (= res!917877 (validKeyInArray!0 (select (arr!45057 a!4142) i!1457)))))

(declare-fun b!1375476 () Bool)

(declare-fun res!917879 () Bool)

(assert (=> b!1375476 (=> (not res!917879) (not e!779319))))

(assert (=> b!1375476 (= res!917879 (bvslt (size!45608 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1375477 () Bool)

(assert (=> b!1375477 (= e!779320 true)))

(declare-fun lt!603780 () (_ BitVec 32))

(assert (=> b!1375477 (= lt!603780 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603777 () (_ BitVec 32))

(assert (=> b!1375477 (= lt!603777 (arrayCountValidKeys!0 lt!603779 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (= (and start!116720 res!917876) b!1375475))

(assert (= (and b!1375475 res!917877) b!1375474))

(assert (= (and b!1375474 res!917878) b!1375476))

(assert (= (and b!1375476 res!917879) b!1375473))

(assert (= (and b!1375473 (not res!917880)) b!1375477))

(declare-fun m!1259009 () Bool)

(assert (=> b!1375473 m!1259009))

(declare-fun m!1259011 () Bool)

(assert (=> b!1375473 m!1259011))

(declare-fun m!1259013 () Bool)

(assert (=> b!1375473 m!1259013))

(declare-fun m!1259015 () Bool)

(assert (=> b!1375473 m!1259015))

(declare-fun m!1259017 () Bool)

(assert (=> b!1375474 m!1259017))

(declare-fun m!1259019 () Bool)

(assert (=> b!1375475 m!1259019))

(assert (=> b!1375475 m!1259019))

(declare-fun m!1259021 () Bool)

(assert (=> b!1375475 m!1259021))

(declare-fun m!1259023 () Bool)

(assert (=> start!116720 m!1259023))

(declare-fun m!1259025 () Bool)

(assert (=> b!1375477 m!1259025))

(declare-fun m!1259027 () Bool)

(assert (=> b!1375477 m!1259027))

(push 1)

(assert (not start!116720))

(assert (not b!1375477))

(assert (not b!1375474))

(assert (not b!1375473))

(assert (not b!1375475))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

