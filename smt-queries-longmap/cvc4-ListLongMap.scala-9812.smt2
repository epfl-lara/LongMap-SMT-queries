; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116526 () Bool)

(assert start!116526)

(declare-fun b!1374391 () Bool)

(declare-fun res!917575 () Bool)

(declare-fun e!778602 () Bool)

(assert (=> b!1374391 (=> (not res!917575) (not e!778602))))

(declare-datatypes ((array!93226 0))(
  ( (array!93227 (arr!45019 (Array (_ BitVec 32) (_ BitVec 64))) (size!45569 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93226)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374391 (= res!917575 (validKeyInArray!0 (select (arr!45019 a!4142) i!1457)))))

(declare-fun res!917578 () Bool)

(assert (=> start!116526 (=> (not res!917578) (not e!778602))))

(assert (=> start!116526 (= res!917578 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45569 a!4142))))))

(assert (=> start!116526 e!778602))

(assert (=> start!116526 true))

(declare-fun array_inv!34047 (array!93226) Bool)

(assert (=> start!116526 (array_inv!34047 a!4142)))

(declare-fun b!1374392 () Bool)

(declare-fun res!917576 () Bool)

(assert (=> b!1374392 (=> (not res!917576) (not e!778602))))

(declare-fun k!2959 () (_ BitVec 64))

(assert (=> b!1374392 (= res!917576 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1374393 () Bool)

(declare-fun res!917577 () Bool)

(assert (=> b!1374393 (=> (not res!917577) (not e!778602))))

(assert (=> b!1374393 (= res!917577 (bvslt (size!45569 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1374394 () Bool)

(assert (=> b!1374394 (= e!778602 (not true))))

(declare-fun lt!603474 () array!93226)

(declare-fun arrayCountValidKeys!0 (array!93226 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374394 (= (arrayCountValidKeys!0 lt!603474 (bvadd #b00000000000000000000000000000001 i!1457) (size!45569 a!4142)) (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45569 a!4142)))))

(declare-datatypes ((Unit!45439 0))(
  ( (Unit!45440) )
))
(declare-fun lt!603475 () Unit!45439)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93226 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45439)

(assert (=> b!1374394 (= lt!603475 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374394 (= (arrayCountValidKeys!0 lt!603474 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(assert (=> b!1374394 (= lt!603474 (array!93227 (store (arr!45019 a!4142) i!1457 k!2959) (size!45569 a!4142)))))

(declare-fun lt!603473 () Unit!45439)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93226 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45439)

(assert (=> b!1374394 (= lt!603473 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(assert (= (and start!116526 res!917578) b!1374391))

(assert (= (and b!1374391 res!917575) b!1374392))

(assert (= (and b!1374392 res!917576) b!1374393))

(assert (= (and b!1374393 res!917577) b!1374394))

(declare-fun m!1257717 () Bool)

(assert (=> b!1374391 m!1257717))

(assert (=> b!1374391 m!1257717))

(declare-fun m!1257719 () Bool)

(assert (=> b!1374391 m!1257719))

(declare-fun m!1257721 () Bool)

(assert (=> start!116526 m!1257721))

(declare-fun m!1257723 () Bool)

(assert (=> b!1374392 m!1257723))

(declare-fun m!1257725 () Bool)

(assert (=> b!1374394 m!1257725))

(declare-fun m!1257727 () Bool)

(assert (=> b!1374394 m!1257727))

(declare-fun m!1257729 () Bool)

(assert (=> b!1374394 m!1257729))

(declare-fun m!1257731 () Bool)

(assert (=> b!1374394 m!1257731))

(declare-fun m!1257733 () Bool)

(assert (=> b!1374394 m!1257733))

(declare-fun m!1257735 () Bool)

(assert (=> b!1374394 m!1257735))

(declare-fun m!1257737 () Bool)

(assert (=> b!1374394 m!1257737))

(push 1)

(assert (not b!1374394))

(assert (not b!1374391))

(assert (not b!1374392))

(assert (not start!116526))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

