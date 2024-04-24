; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116750 () Bool)

(assert start!116750)

(declare-fun b!1375692 () Bool)

(declare-fun res!918094 () Bool)

(declare-fun e!779445 () Bool)

(assert (=> b!1375692 (=> (not res!918094) (not e!779445))))

(declare-datatypes ((array!93341 0))(
  ( (array!93342 (arr!45072 (Array (_ BitVec 32) (_ BitVec 64))) (size!45623 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93341)

(assert (=> b!1375692 (= res!918094 (bvslt (size!45623 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1375693 () Bool)

(assert (=> b!1375693 (= e!779445 (not true))))

(declare-fun lt!603951 () array!93341)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93341 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375693 (= (arrayCountValidKeys!0 lt!603951 (bvadd #b00000000000000000000000000000001 i!1457) (size!45623 a!4142)) (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45623 a!4142)))))

(declare-datatypes ((Unit!45378 0))(
  ( (Unit!45379) )
))
(declare-fun lt!603949 () Unit!45378)

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93341 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45378)

(assert (=> b!1375693 (= lt!603949 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375693 (= (arrayCountValidKeys!0 lt!603951 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(assert (=> b!1375693 (= lt!603951 (array!93342 (store (arr!45072 a!4142) i!1457 k!2959) (size!45623 a!4142)))))

(declare-fun lt!603950 () Unit!45378)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93341 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45378)

(assert (=> b!1375693 (= lt!603950 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1375691 () Bool)

(declare-fun res!918095 () Bool)

(assert (=> b!1375691 (=> (not res!918095) (not e!779445))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375691 (= res!918095 (not (validKeyInArray!0 k!2959)))))

(declare-fun res!918093 () Bool)

(assert (=> start!116750 (=> (not res!918093) (not e!779445))))

(assert (=> start!116750 (= res!918093 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45623 a!4142))))))

(assert (=> start!116750 e!779445))

(assert (=> start!116750 true))

(declare-fun array_inv!34353 (array!93341) Bool)

(assert (=> start!116750 (array_inv!34353 a!4142)))

(declare-fun b!1375690 () Bool)

(declare-fun res!918096 () Bool)

(assert (=> b!1375690 (=> (not res!918096) (not e!779445))))

(assert (=> b!1375690 (= res!918096 (validKeyInArray!0 (select (arr!45072 a!4142) i!1457)))))

(assert (= (and start!116750 res!918093) b!1375690))

(assert (= (and b!1375690 res!918096) b!1375691))

(assert (= (and b!1375691 res!918095) b!1375692))

(assert (= (and b!1375692 res!918094) b!1375693))

(declare-fun m!1259313 () Bool)

(assert (=> b!1375693 m!1259313))

(declare-fun m!1259315 () Bool)

(assert (=> b!1375693 m!1259315))

(declare-fun m!1259317 () Bool)

(assert (=> b!1375693 m!1259317))

(declare-fun m!1259319 () Bool)

(assert (=> b!1375693 m!1259319))

(declare-fun m!1259321 () Bool)

(assert (=> b!1375693 m!1259321))

(declare-fun m!1259323 () Bool)

(assert (=> b!1375693 m!1259323))

(declare-fun m!1259325 () Bool)

(assert (=> b!1375693 m!1259325))

(declare-fun m!1259327 () Bool)

(assert (=> b!1375691 m!1259327))

(declare-fun m!1259329 () Bool)

(assert (=> start!116750 m!1259329))

(declare-fun m!1259331 () Bool)

(assert (=> b!1375690 m!1259331))

(assert (=> b!1375690 m!1259331))

(declare-fun m!1259333 () Bool)

(assert (=> b!1375690 m!1259333))

(push 1)

(assert (not b!1375690))

(assert (not b!1375691))

(assert (not start!116750))

(assert (not b!1375693))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

