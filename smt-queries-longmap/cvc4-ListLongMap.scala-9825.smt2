; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116622 () Bool)

(assert start!116622)

(declare-fun res!918081 () Bool)

(declare-fun e!778909 () Bool)

(assert (=> start!116622 (=> (not res!918081) (not e!778909))))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((array!93307 0))(
  ( (array!93308 (arr!45058 (Array (_ BitVec 32) (_ BitVec 64))) (size!45608 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93307)

(assert (=> start!116622 (= res!918081 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45608 a!4142))))))

(assert (=> start!116622 e!778909))

(assert (=> start!116622 true))

(declare-fun array_inv!34086 (array!93307) Bool)

(assert (=> start!116622 (array_inv!34086 a!4142)))

(declare-fun b!1374950 () Bool)

(declare-fun res!918082 () Bool)

(assert (=> b!1374950 (=> (not res!918082) (not e!778909))))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374950 (= res!918082 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1374951 () Bool)

(declare-fun res!918079 () Bool)

(assert (=> b!1374951 (=> (not res!918079) (not e!778909))))

(assert (=> b!1374951 (= res!918079 (validKeyInArray!0 (select (arr!45058 a!4142) i!1457)))))

(declare-fun e!778908 () Bool)

(declare-fun b!1374952 () Bool)

(declare-fun lt!603939 () array!93307)

(declare-fun arrayCountValidKeys!0 (array!93307 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374952 (= e!778908 (= (arrayCountValidKeys!0 lt!603939 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)) (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457))))))

(declare-fun b!1374953 () Bool)

(assert (=> b!1374953 (= e!778909 (not e!778908))))

(declare-fun res!918080 () Bool)

(assert (=> b!1374953 (=> res!918080 e!778908)))

(assert (=> b!1374953 (= res!918080 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) i!1457)))))

(assert (=> b!1374953 (= (arrayCountValidKeys!0 lt!603939 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(assert (=> b!1374953 (= lt!603939 (array!93308 (store (arr!45058 a!4142) i!1457 k!2959) (size!45608 a!4142)))))

(declare-datatypes ((Unit!45505 0))(
  ( (Unit!45506) )
))
(declare-fun lt!603938 () Unit!45505)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93307 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45505)

(assert (=> b!1374953 (= lt!603938 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1374954 () Bool)

(declare-fun res!918078 () Bool)

(assert (=> b!1374954 (=> (not res!918078) (not e!778909))))

(assert (=> b!1374954 (= res!918078 (bvslt (size!45608 a!4142) #b01111111111111111111111111111111))))

(assert (= (and start!116622 res!918081) b!1374951))

(assert (= (and b!1374951 res!918079) b!1374950))

(assert (= (and b!1374950 res!918082) b!1374954))

(assert (= (and b!1374954 res!918078) b!1374953))

(assert (= (and b!1374953 (not res!918080)) b!1374952))

(declare-fun m!1258559 () Bool)

(assert (=> b!1374950 m!1258559))

(declare-fun m!1258561 () Bool)

(assert (=> b!1374952 m!1258561))

(declare-fun m!1258563 () Bool)

(assert (=> b!1374952 m!1258563))

(declare-fun m!1258565 () Bool)

(assert (=> start!116622 m!1258565))

(declare-fun m!1258567 () Bool)

(assert (=> b!1374953 m!1258567))

(declare-fun m!1258569 () Bool)

(assert (=> b!1374953 m!1258569))

(declare-fun m!1258571 () Bool)

(assert (=> b!1374953 m!1258571))

(declare-fun m!1258573 () Bool)

(assert (=> b!1374953 m!1258573))

(declare-fun m!1258575 () Bool)

(assert (=> b!1374951 m!1258575))

(assert (=> b!1374951 m!1258575))

(declare-fun m!1258577 () Bool)

(assert (=> b!1374951 m!1258577))

(push 1)

(assert (not b!1374953))

(assert (not start!116622))

(assert (not b!1374952))

(assert (not b!1374951))

(assert (not b!1374950))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

