; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116594 () Bool)

(assert start!116594)

(declare-fun res!917905 () Bool)

(declare-fun e!778817 () Bool)

(assert (=> start!116594 (=> (not res!917905) (not e!778817))))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((array!93279 0))(
  ( (array!93280 (arr!45044 (Array (_ BitVec 32) (_ BitVec 64))) (size!45594 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93279)

(assert (=> start!116594 (= res!917905 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45594 a!4142))))))

(assert (=> start!116594 e!778817))

(assert (=> start!116594 true))

(declare-fun array_inv!34072 (array!93279) Bool)

(assert (=> start!116594 (array_inv!34072 a!4142)))

(declare-fun b!1374775 () Bool)

(declare-fun res!917904 () Bool)

(assert (=> b!1374775 (=> (not res!917904) (not e!778817))))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374775 (= res!917904 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1374776 () Bool)

(declare-fun res!917903 () Bool)

(assert (=> b!1374776 (=> (not res!917903) (not e!778817))))

(assert (=> b!1374776 (= res!917903 (bvslt (size!45594 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1374777 () Bool)

(assert (=> b!1374777 (= e!778817 (not true))))

(declare-fun arrayCountValidKeys!0 (array!93279 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374777 (= (arrayCountValidKeys!0 (array!93280 (store (arr!45044 a!4142) i!1457 k!2959) (size!45594 a!4142)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!45477 0))(
  ( (Unit!45478) )
))
(declare-fun lt!603888 () Unit!45477)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93279 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45477)

(assert (=> b!1374777 (= lt!603888 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1374774 () Bool)

(declare-fun res!917902 () Bool)

(assert (=> b!1374774 (=> (not res!917902) (not e!778817))))

(assert (=> b!1374774 (= res!917902 (validKeyInArray!0 (select (arr!45044 a!4142) i!1457)))))

(assert (= (and start!116594 res!917905) b!1374774))

(assert (= (and b!1374774 res!917902) b!1374775))

(assert (= (and b!1374775 res!917904) b!1374776))

(assert (= (and b!1374776 res!917903) b!1374777))

(declare-fun m!1258327 () Bool)

(assert (=> start!116594 m!1258327))

(declare-fun m!1258329 () Bool)

(assert (=> b!1374775 m!1258329))

(declare-fun m!1258331 () Bool)

(assert (=> b!1374777 m!1258331))

(declare-fun m!1258333 () Bool)

(assert (=> b!1374777 m!1258333))

(declare-fun m!1258335 () Bool)

(assert (=> b!1374777 m!1258335))

(declare-fun m!1258337 () Bool)

(assert (=> b!1374777 m!1258337))

(declare-fun m!1258339 () Bool)

(assert (=> b!1374774 m!1258339))

(assert (=> b!1374774 m!1258339))

(declare-fun m!1258341 () Bool)

(assert (=> b!1374774 m!1258341))

(push 1)

(assert (not b!1374777))

(assert (not start!116594))

(assert (not b!1374774))

(assert (not b!1374775))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

