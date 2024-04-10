; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116516 () Bool)

(assert start!116516)

(declare-fun res!917512 () Bool)

(declare-fun e!778566 () Bool)

(assert (=> start!116516 (=> (not res!917512) (not e!778566))))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((array!93216 0))(
  ( (array!93217 (arr!45014 (Array (_ BitVec 32) (_ BitVec 64))) (size!45564 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93216)

(assert (=> start!116516 (= res!917512 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45564 a!4142))))))

(assert (=> start!116516 e!778566))

(assert (=> start!116516 true))

(declare-fun array_inv!34042 (array!93216) Bool)

(assert (=> start!116516 (array_inv!34042 a!4142)))

(declare-fun b!1374324 () Bool)

(declare-fun e!778565 () Bool)

(assert (=> b!1374324 (= e!778566 (not e!778565))))

(declare-fun res!917511 () Bool)

(assert (=> b!1374324 (=> res!917511 e!778565)))

(assert (=> b!1374324 (= res!917511 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) i!1457)))))

(declare-fun lt!603422 () array!93216)

(declare-fun arrayCountValidKeys!0 (array!93216 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374324 (= (arrayCountValidKeys!0 lt!603422 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(declare-fun k!2959 () (_ BitVec 64))

(assert (=> b!1374324 (= lt!603422 (array!93217 (store (arr!45014 a!4142) i!1457 k!2959) (size!45564 a!4142)))))

(declare-datatypes ((Unit!45429 0))(
  ( (Unit!45430) )
))
(declare-fun lt!603423 () Unit!45429)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93216 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45429)

(assert (=> b!1374324 (= lt!603423 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1374325 () Bool)

(declare-fun res!917510 () Bool)

(assert (=> b!1374325 (=> (not res!917510) (not e!778566))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374325 (= res!917510 (validKeyInArray!0 (select (arr!45014 a!4142) i!1457)))))

(declare-fun b!1374326 () Bool)

(declare-fun res!917509 () Bool)

(assert (=> b!1374326 (=> (not res!917509) (not e!778566))))

(assert (=> b!1374326 (= res!917509 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1374327 () Bool)

(declare-fun res!917508 () Bool)

(assert (=> b!1374327 (=> (not res!917508) (not e!778566))))

(assert (=> b!1374327 (= res!917508 (bvslt (size!45564 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1374328 () Bool)

(assert (=> b!1374328 (= e!778565 true)))

(declare-fun lt!603424 () (_ BitVec 32))

(assert (=> b!1374328 (= lt!603424 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603421 () (_ BitVec 32))

(assert (=> b!1374328 (= lt!603421 (arrayCountValidKeys!0 lt!603422 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (= (and start!116516 res!917512) b!1374325))

(assert (= (and b!1374325 res!917510) b!1374326))

(assert (= (and b!1374326 res!917509) b!1374327))

(assert (= (and b!1374327 res!917508) b!1374324))

(assert (= (and b!1374324 (not res!917511)) b!1374328))

(declare-fun m!1257613 () Bool)

(assert (=> b!1374325 m!1257613))

(assert (=> b!1374325 m!1257613))

(declare-fun m!1257615 () Bool)

(assert (=> b!1374325 m!1257615))

(declare-fun m!1257617 () Bool)

(assert (=> start!116516 m!1257617))

(declare-fun m!1257619 () Bool)

(assert (=> b!1374324 m!1257619))

(declare-fun m!1257621 () Bool)

(assert (=> b!1374324 m!1257621))

(declare-fun m!1257623 () Bool)

(assert (=> b!1374324 m!1257623))

(declare-fun m!1257625 () Bool)

(assert (=> b!1374324 m!1257625))

(declare-fun m!1257627 () Bool)

(assert (=> b!1374328 m!1257627))

(declare-fun m!1257629 () Bool)

(assert (=> b!1374328 m!1257629))

(declare-fun m!1257631 () Bool)

(assert (=> b!1374326 m!1257631))

(push 1)

(assert (not start!116516))

(assert (not b!1374324))

(assert (not b!1374328))

(assert (not b!1374326))

(assert (not b!1374325))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

