; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116504 () Bool)

(assert start!116504)

(declare-fun b!1374237 () Bool)

(declare-fun e!778523 () Bool)

(assert (=> b!1374237 (= e!778523 true)))

(declare-fun lt!603222 () (_ BitVec 32))

(declare-datatypes ((array!93163 0))(
  ( (array!93164 (arr!44988 (Array (_ BitVec 32) (_ BitVec 64))) (size!45540 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93163)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93163 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374237 (= lt!603222 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603224 () (_ BitVec 32))

(declare-fun lt!603225 () array!93163)

(assert (=> b!1374237 (= lt!603224 (arrayCountValidKeys!0 lt!603225 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374238 () Bool)

(declare-fun e!778524 () Bool)

(assert (=> b!1374238 (= e!778524 (not e!778523))))

(declare-fun res!917466 () Bool)

(assert (=> b!1374238 (=> res!917466 e!778523)))

(assert (=> b!1374238 (= res!917466 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) i!1457)))))

(assert (=> b!1374238 (= (arrayCountValidKeys!0 lt!603225 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(declare-fun k!2959 () (_ BitVec 64))

(assert (=> b!1374238 (= lt!603225 (array!93164 (store (arr!44988 a!4142) i!1457 k!2959) (size!45540 a!4142)))))

(declare-datatypes ((Unit!45268 0))(
  ( (Unit!45269) )
))
(declare-fun lt!603223 () Unit!45268)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93163 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45268)

(assert (=> b!1374238 (= lt!603223 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1374239 () Bool)

(declare-fun res!917467 () Bool)

(assert (=> b!1374239 (=> (not res!917467) (not e!778524))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374239 (= res!917467 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1374240 () Bool)

(declare-fun res!917465 () Bool)

(assert (=> b!1374240 (=> (not res!917465) (not e!778524))))

(assert (=> b!1374240 (= res!917465 (validKeyInArray!0 (select (arr!44988 a!4142) i!1457)))))

(declare-fun res!917468 () Bool)

(assert (=> start!116504 (=> (not res!917468) (not e!778524))))

(assert (=> start!116504 (= res!917468 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45540 a!4142))))))

(assert (=> start!116504 e!778524))

(assert (=> start!116504 true))

(declare-fun array_inv!34221 (array!93163) Bool)

(assert (=> start!116504 (array_inv!34221 a!4142)))

(declare-fun b!1374241 () Bool)

(declare-fun res!917464 () Bool)

(assert (=> b!1374241 (=> (not res!917464) (not e!778524))))

(assert (=> b!1374241 (= res!917464 (bvslt (size!45540 a!4142) #b01111111111111111111111111111111))))

(assert (= (and start!116504 res!917468) b!1374240))

(assert (= (and b!1374240 res!917465) b!1374239))

(assert (= (and b!1374239 res!917467) b!1374241))

(assert (= (and b!1374241 res!917464) b!1374238))

(assert (= (and b!1374238 (not res!917466)) b!1374237))

(declare-fun m!1257067 () Bool)

(assert (=> b!1374238 m!1257067))

(declare-fun m!1257069 () Bool)

(assert (=> b!1374238 m!1257069))

(declare-fun m!1257071 () Bool)

(assert (=> b!1374238 m!1257071))

(declare-fun m!1257073 () Bool)

(assert (=> b!1374238 m!1257073))

(declare-fun m!1257075 () Bool)

(assert (=> b!1374237 m!1257075))

(declare-fun m!1257077 () Bool)

(assert (=> b!1374237 m!1257077))

(declare-fun m!1257079 () Bool)

(assert (=> start!116504 m!1257079))

(declare-fun m!1257081 () Bool)

(assert (=> b!1374239 m!1257081))

(declare-fun m!1257083 () Bool)

(assert (=> b!1374240 m!1257083))

(assert (=> b!1374240 m!1257083))

(declare-fun m!1257085 () Bool)

(assert (=> b!1374240 m!1257085))

(push 1)

(assert (not start!116504))

(assert (not b!1374240))

(assert (not b!1374239))

(assert (not b!1374238))

(assert (not b!1374237))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

