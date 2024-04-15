; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116478 () Bool)

(assert start!116478)

(declare-fun b!1374042 () Bool)

(declare-fun e!778407 () Bool)

(assert (=> b!1374042 (= e!778407 true)))

(declare-fun lt!603067 () (_ BitVec 32))

(declare-datatypes ((array!93137 0))(
  ( (array!93138 (arr!44975 (Array (_ BitVec 32) (_ BitVec 64))) (size!45527 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93137)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93137 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374042 (= lt!603067 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603069 () (_ BitVec 32))

(declare-fun lt!603068 () array!93137)

(assert (=> b!1374042 (= lt!603069 (arrayCountValidKeys!0 lt!603068 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun res!917273 () Bool)

(declare-fun e!778405 () Bool)

(assert (=> start!116478 (=> (not res!917273) (not e!778405))))

(assert (=> start!116478 (= res!917273 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45527 a!4142))))))

(assert (=> start!116478 e!778405))

(assert (=> start!116478 true))

(declare-fun array_inv!34208 (array!93137) Bool)

(assert (=> start!116478 (array_inv!34208 a!4142)))

(declare-fun b!1374043 () Bool)

(declare-fun res!917270 () Bool)

(assert (=> b!1374043 (=> (not res!917270) (not e!778405))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374043 (= res!917270 (validKeyInArray!0 (select (arr!44975 a!4142) i!1457)))))

(declare-fun b!1374044 () Bool)

(assert (=> b!1374044 (= e!778405 (not e!778407))))

(declare-fun res!917272 () Bool)

(assert (=> b!1374044 (=> res!917272 e!778407)))

(assert (=> b!1374044 (= res!917272 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) i!1457)))))

(assert (=> b!1374044 (= (arrayCountValidKeys!0 lt!603068 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(declare-fun k!2959 () (_ BitVec 64))

(assert (=> b!1374044 (= lt!603068 (array!93138 (store (arr!44975 a!4142) i!1457 k!2959) (size!45527 a!4142)))))

(declare-datatypes ((Unit!45242 0))(
  ( (Unit!45243) )
))
(declare-fun lt!603066 () Unit!45242)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93137 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45242)

(assert (=> b!1374044 (= lt!603066 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1374045 () Bool)

(declare-fun res!917271 () Bool)

(assert (=> b!1374045 (=> (not res!917271) (not e!778405))))

(assert (=> b!1374045 (= res!917271 (bvslt (size!45527 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1374046 () Bool)

(declare-fun res!917269 () Bool)

(assert (=> b!1374046 (=> (not res!917269) (not e!778405))))

(assert (=> b!1374046 (= res!917269 (not (validKeyInArray!0 k!2959)))))

(assert (= (and start!116478 res!917273) b!1374043))

(assert (= (and b!1374043 res!917270) b!1374046))

(assert (= (and b!1374046 res!917269) b!1374045))

(assert (= (and b!1374045 res!917271) b!1374044))

(assert (= (and b!1374044 (not res!917272)) b!1374042))

(declare-fun m!1256807 () Bool)

(assert (=> b!1374042 m!1256807))

(declare-fun m!1256809 () Bool)

(assert (=> b!1374042 m!1256809))

(declare-fun m!1256811 () Bool)

(assert (=> b!1374046 m!1256811))

(declare-fun m!1256813 () Bool)

(assert (=> b!1374044 m!1256813))

(declare-fun m!1256815 () Bool)

(assert (=> b!1374044 m!1256815))

(declare-fun m!1256817 () Bool)

(assert (=> b!1374044 m!1256817))

(declare-fun m!1256819 () Bool)

(assert (=> b!1374044 m!1256819))

(declare-fun m!1256821 () Bool)

(assert (=> b!1374043 m!1256821))

(assert (=> b!1374043 m!1256821))

(declare-fun m!1256823 () Bool)

(assert (=> b!1374043 m!1256823))

(declare-fun m!1256825 () Bool)

(assert (=> start!116478 m!1256825))

(push 1)

(assert (not b!1374046))

(assert (not b!1374044))

(assert (not b!1374043))

(assert (not b!1374042))

(assert (not start!116478))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

