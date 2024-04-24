; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116828 () Bool)

(assert start!116828)

(declare-fun b!1376137 () Bool)

(declare-fun res!918480 () Bool)

(declare-fun e!779692 () Bool)

(assert (=> b!1376137 (=> (not res!918480) (not e!779692))))

(declare-datatypes ((array!93404 0))(
  ( (array!93405 (arr!45102 (Array (_ BitVec 32) (_ BitVec 64))) (size!45653 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93404)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376137 (= res!918480 (validKeyInArray!0 (select (arr!45102 a!4142) i!1457)))))

(declare-fun b!1376138 () Bool)

(declare-fun res!918483 () Bool)

(assert (=> b!1376138 (=> (not res!918483) (not e!779692))))

(declare-fun k!2959 () (_ BitVec 64))

(assert (=> b!1376138 (= res!918483 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1376140 () Bool)

(assert (=> b!1376140 (= e!779692 (not true))))

(declare-fun arrayCountValidKeys!0 (array!93404 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376140 (= (arrayCountValidKeys!0 (array!93405 (store (arr!45102 a!4142) i!1457 k!2959) (size!45653 a!4142)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!45426 0))(
  ( (Unit!45427) )
))
(declare-fun lt!604380 () Unit!45426)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93404 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45426)

(assert (=> b!1376140 (= lt!604380 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1376139 () Bool)

(declare-fun res!918481 () Bool)

(assert (=> b!1376139 (=> (not res!918481) (not e!779692))))

(assert (=> b!1376139 (= res!918481 (bvslt (size!45653 a!4142) #b01111111111111111111111111111111))))

(declare-fun res!918482 () Bool)

(assert (=> start!116828 (=> (not res!918482) (not e!779692))))

(assert (=> start!116828 (= res!918482 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45653 a!4142))))))

(assert (=> start!116828 e!779692))

(assert (=> start!116828 true))

(declare-fun array_inv!34383 (array!93404) Bool)

(assert (=> start!116828 (array_inv!34383 a!4142)))

(assert (= (and start!116828 res!918482) b!1376137))

(assert (= (and b!1376137 res!918480) b!1376138))

(assert (= (and b!1376138 res!918483) b!1376139))

(assert (= (and b!1376139 res!918481) b!1376140))

(declare-fun m!1260007 () Bool)

(assert (=> b!1376137 m!1260007))

(assert (=> b!1376137 m!1260007))

(declare-fun m!1260009 () Bool)

(assert (=> b!1376137 m!1260009))

(declare-fun m!1260011 () Bool)

(assert (=> b!1376138 m!1260011))

(declare-fun m!1260013 () Bool)

(assert (=> b!1376140 m!1260013))

(declare-fun m!1260015 () Bool)

(assert (=> b!1376140 m!1260015))

(declare-fun m!1260017 () Bool)

(assert (=> b!1376140 m!1260017))

(declare-fun m!1260019 () Bool)

(assert (=> b!1376140 m!1260019))

(declare-fun m!1260021 () Bool)

(assert (=> start!116828 m!1260021))

(push 1)

(assert (not start!116828))

(assert (not b!1376138))

(assert (not b!1376137))

(assert (not b!1376140))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

