; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116504 () Bool)

(assert start!116504)

(declare-fun b!1374234 () Bool)

(declare-fun e!778511 () Bool)

(declare-fun e!778512 () Bool)

(assert (=> b!1374234 (= e!778511 (not e!778512))))

(declare-fun res!917422 () Bool)

(assert (=> b!1374234 (=> res!917422 e!778512)))

(declare-fun i!1457 () (_ BitVec 32))

(assert (=> b!1374234 (= res!917422 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) i!1457)))))

(declare-datatypes ((array!93204 0))(
  ( (array!93205 (arr!45008 (Array (_ BitVec 32) (_ BitVec 64))) (size!45558 (_ BitVec 32))) )
))
(declare-fun lt!603349 () array!93204)

(declare-fun a!4142 () array!93204)

(declare-fun arrayCountValidKeys!0 (array!93204 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374234 (= (arrayCountValidKeys!0 lt!603349 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(declare-fun k!2959 () (_ BitVec 64))

(assert (=> b!1374234 (= lt!603349 (array!93205 (store (arr!45008 a!4142) i!1457 k!2959) (size!45558 a!4142)))))

(declare-datatypes ((Unit!45417 0))(
  ( (Unit!45418) )
))
(declare-fun lt!603350 () Unit!45417)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93204 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45417)

(assert (=> b!1374234 (= lt!603350 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1374235 () Bool)

(declare-fun res!917419 () Bool)

(assert (=> b!1374235 (=> (not res!917419) (not e!778511))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374235 (= res!917419 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1374236 () Bool)

(assert (=> b!1374236 (= e!778512 true)))

(declare-fun lt!603351 () (_ BitVec 32))

(assert (=> b!1374236 (= lt!603351 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603352 () (_ BitVec 32))

(assert (=> b!1374236 (= lt!603352 (arrayCountValidKeys!0 lt!603349 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374237 () Bool)

(declare-fun res!917420 () Bool)

(assert (=> b!1374237 (=> (not res!917420) (not e!778511))))

(assert (=> b!1374237 (= res!917420 (bvslt (size!45558 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1374238 () Bool)

(declare-fun res!917421 () Bool)

(assert (=> b!1374238 (=> (not res!917421) (not e!778511))))

(assert (=> b!1374238 (= res!917421 (validKeyInArray!0 (select (arr!45008 a!4142) i!1457)))))

(declare-fun res!917418 () Bool)

(assert (=> start!116504 (=> (not res!917418) (not e!778511))))

(assert (=> start!116504 (= res!917418 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45558 a!4142))))))

(assert (=> start!116504 e!778511))

(assert (=> start!116504 true))

(declare-fun array_inv!34036 (array!93204) Bool)

(assert (=> start!116504 (array_inv!34036 a!4142)))

(assert (= (and start!116504 res!917418) b!1374238))

(assert (= (and b!1374238 res!917421) b!1374235))

(assert (= (and b!1374235 res!917419) b!1374237))

(assert (= (and b!1374237 res!917420) b!1374234))

(assert (= (and b!1374234 (not res!917422)) b!1374236))

(declare-fun m!1257493 () Bool)

(assert (=> start!116504 m!1257493))

(declare-fun m!1257495 () Bool)

(assert (=> b!1374235 m!1257495))

(declare-fun m!1257497 () Bool)

(assert (=> b!1374234 m!1257497))

(declare-fun m!1257499 () Bool)

(assert (=> b!1374234 m!1257499))

(declare-fun m!1257501 () Bool)

(assert (=> b!1374234 m!1257501))

(declare-fun m!1257503 () Bool)

(assert (=> b!1374234 m!1257503))

(declare-fun m!1257505 () Bool)

(assert (=> b!1374236 m!1257505))

(declare-fun m!1257507 () Bool)

(assert (=> b!1374236 m!1257507))

(declare-fun m!1257509 () Bool)

(assert (=> b!1374238 m!1257509))

(assert (=> b!1374238 m!1257509))

(declare-fun m!1257511 () Bool)

(assert (=> b!1374238 m!1257511))

(push 1)

(assert (not b!1374236))

(assert (not start!116504))

(assert (not b!1374235))

(assert (not b!1374238))

(assert (not b!1374234))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

