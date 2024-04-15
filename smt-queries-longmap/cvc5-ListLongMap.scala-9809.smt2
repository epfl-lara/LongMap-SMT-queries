; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116498 () Bool)

(assert start!116498)

(declare-fun b!1374192 () Bool)

(declare-fun res!917421 () Bool)

(declare-fun e!778496 () Bool)

(assert (=> b!1374192 (=> (not res!917421) (not e!778496))))

(declare-datatypes ((array!93157 0))(
  ( (array!93158 (arr!44985 (Array (_ BitVec 32) (_ BitVec 64))) (size!45537 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93157)

(assert (=> b!1374192 (= res!917421 (bvslt (size!45537 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1374193 () Bool)

(declare-fun e!778497 () Bool)

(assert (=> b!1374193 (= e!778497 true)))

(declare-fun lt!603187 () (_ BitVec 32))

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93157 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374193 (= lt!603187 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603186 () (_ BitVec 32))

(declare-fun lt!603189 () array!93157)

(assert (=> b!1374193 (= lt!603186 (arrayCountValidKeys!0 lt!603189 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374194 () Bool)

(declare-fun res!917422 () Bool)

(assert (=> b!1374194 (=> (not res!917422) (not e!778496))))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374194 (= res!917422 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1374196 () Bool)

(assert (=> b!1374196 (= e!778496 (not e!778497))))

(declare-fun res!917423 () Bool)

(assert (=> b!1374196 (=> res!917423 e!778497)))

(assert (=> b!1374196 (= res!917423 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) i!1457)))))

(assert (=> b!1374196 (= (arrayCountValidKeys!0 lt!603189 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(assert (=> b!1374196 (= lt!603189 (array!93158 (store (arr!44985 a!4142) i!1457 k!2959) (size!45537 a!4142)))))

(declare-datatypes ((Unit!45262 0))(
  ( (Unit!45263) )
))
(declare-fun lt!603188 () Unit!45262)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93157 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45262)

(assert (=> b!1374196 (= lt!603188 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun res!917419 () Bool)

(assert (=> start!116498 (=> (not res!917419) (not e!778496))))

(assert (=> start!116498 (= res!917419 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45537 a!4142))))))

(assert (=> start!116498 e!778496))

(assert (=> start!116498 true))

(declare-fun array_inv!34218 (array!93157) Bool)

(assert (=> start!116498 (array_inv!34218 a!4142)))

(declare-fun b!1374195 () Bool)

(declare-fun res!917420 () Bool)

(assert (=> b!1374195 (=> (not res!917420) (not e!778496))))

(assert (=> b!1374195 (= res!917420 (validKeyInArray!0 (select (arr!44985 a!4142) i!1457)))))

(assert (= (and start!116498 res!917419) b!1374195))

(assert (= (and b!1374195 res!917420) b!1374194))

(assert (= (and b!1374194 res!917422) b!1374192))

(assert (= (and b!1374192 res!917421) b!1374196))

(assert (= (and b!1374196 (not res!917423)) b!1374193))

(declare-fun m!1257007 () Bool)

(assert (=> b!1374196 m!1257007))

(declare-fun m!1257009 () Bool)

(assert (=> b!1374196 m!1257009))

(declare-fun m!1257011 () Bool)

(assert (=> b!1374196 m!1257011))

(declare-fun m!1257013 () Bool)

(assert (=> b!1374196 m!1257013))

(declare-fun m!1257015 () Bool)

(assert (=> b!1374195 m!1257015))

(assert (=> b!1374195 m!1257015))

(declare-fun m!1257017 () Bool)

(assert (=> b!1374195 m!1257017))

(declare-fun m!1257019 () Bool)

(assert (=> b!1374193 m!1257019))

(declare-fun m!1257021 () Bool)

(assert (=> b!1374193 m!1257021))

(declare-fun m!1257023 () Bool)

(assert (=> start!116498 m!1257023))

(declare-fun m!1257025 () Bool)

(assert (=> b!1374194 m!1257025))

(push 1)

(assert (not b!1374196))

(assert (not b!1374194))

(assert (not start!116498))

(assert (not b!1374195))

(assert (not b!1374193))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

