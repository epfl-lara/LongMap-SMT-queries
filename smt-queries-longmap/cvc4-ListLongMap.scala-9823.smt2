; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116610 () Bool)

(assert start!116610)

(declare-fun res!918001 () Bool)

(declare-fun e!778864 () Bool)

(assert (=> start!116610 (=> (not res!918001) (not e!778864))))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((array!93295 0))(
  ( (array!93296 (arr!45052 (Array (_ BitVec 32) (_ BitVec 64))) (size!45602 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93295)

(assert (=> start!116610 (= res!918001 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45602 a!4142))))))

(assert (=> start!116610 e!778864))

(assert (=> start!116610 true))

(declare-fun array_inv!34080 (array!93295) Bool)

(assert (=> start!116610 (array_inv!34080 a!4142)))

(declare-fun b!1374870 () Bool)

(declare-fun res!917998 () Bool)

(assert (=> b!1374870 (=> (not res!917998) (not e!778864))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374870 (= res!917998 (validKeyInArray!0 (select (arr!45052 a!4142) i!1457)))))

(declare-fun b!1374873 () Bool)

(assert (=> b!1374873 (= e!778864 (not true))))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93295 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374873 (= (arrayCountValidKeys!0 (array!93296 (store (arr!45052 a!4142) i!1457 k!2959) (size!45602 a!4142)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!45493 0))(
  ( (Unit!45494) )
))
(declare-fun lt!603912 () Unit!45493)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93295 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45493)

(assert (=> b!1374873 (= lt!603912 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1374871 () Bool)

(declare-fun res!917999 () Bool)

(assert (=> b!1374871 (=> (not res!917999) (not e!778864))))

(assert (=> b!1374871 (= res!917999 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1374872 () Bool)

(declare-fun res!918000 () Bool)

(assert (=> b!1374872 (=> (not res!918000) (not e!778864))))

(assert (=> b!1374872 (= res!918000 (bvslt (size!45602 a!4142) #b01111111111111111111111111111111))))

(assert (= (and start!116610 res!918001) b!1374870))

(assert (= (and b!1374870 res!917998) b!1374871))

(assert (= (and b!1374871 res!917999) b!1374872))

(assert (= (and b!1374872 res!918000) b!1374873))

(declare-fun m!1258455 () Bool)

(assert (=> start!116610 m!1258455))

(declare-fun m!1258457 () Bool)

(assert (=> b!1374870 m!1258457))

(assert (=> b!1374870 m!1258457))

(declare-fun m!1258459 () Bool)

(assert (=> b!1374870 m!1258459))

(declare-fun m!1258461 () Bool)

(assert (=> b!1374873 m!1258461))

(declare-fun m!1258463 () Bool)

(assert (=> b!1374873 m!1258463))

(declare-fun m!1258465 () Bool)

(assert (=> b!1374873 m!1258465))

(declare-fun m!1258467 () Bool)

(assert (=> b!1374873 m!1258467))

(declare-fun m!1258469 () Bool)

(assert (=> b!1374871 m!1258469))

(push 1)

(assert (not start!116610))

(assert (not b!1374873))

(assert (not b!1374871))

(assert (not b!1374870))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

