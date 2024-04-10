; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116598 () Bool)

(assert start!116598)

(declare-fun b!1374801 () Bool)

(declare-fun e!778829 () Bool)

(assert (=> b!1374801 (= e!778829 (not true))))

(declare-datatypes ((array!93283 0))(
  ( (array!93284 (arr!45046 (Array (_ BitVec 32) (_ BitVec 64))) (size!45596 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93283)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93283 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374801 (= (arrayCountValidKeys!0 (array!93284 (store (arr!45046 a!4142) i!1457 k!2959) (size!45596 a!4142)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!45481 0))(
  ( (Unit!45482) )
))
(declare-fun lt!603894 () Unit!45481)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93283 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45481)

(assert (=> b!1374801 (= lt!603894 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1374798 () Bool)

(declare-fun res!917926 () Bool)

(assert (=> b!1374798 (=> (not res!917926) (not e!778829))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374798 (= res!917926 (validKeyInArray!0 (select (arr!45046 a!4142) i!1457)))))

(declare-fun b!1374800 () Bool)

(declare-fun res!917929 () Bool)

(assert (=> b!1374800 (=> (not res!917929) (not e!778829))))

(assert (=> b!1374800 (= res!917929 (bvslt (size!45596 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1374799 () Bool)

(declare-fun res!917928 () Bool)

(assert (=> b!1374799 (=> (not res!917928) (not e!778829))))

(assert (=> b!1374799 (= res!917928 (not (validKeyInArray!0 k!2959)))))

(declare-fun res!917927 () Bool)

(assert (=> start!116598 (=> (not res!917927) (not e!778829))))

(assert (=> start!116598 (= res!917927 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45596 a!4142))))))

(assert (=> start!116598 e!778829))

(assert (=> start!116598 true))

(declare-fun array_inv!34074 (array!93283) Bool)

(assert (=> start!116598 (array_inv!34074 a!4142)))

(assert (= (and start!116598 res!917927) b!1374798))

(assert (= (and b!1374798 res!917926) b!1374799))

(assert (= (and b!1374799 res!917928) b!1374800))

(assert (= (and b!1374800 res!917929) b!1374801))

(declare-fun m!1258359 () Bool)

(assert (=> b!1374801 m!1258359))

(declare-fun m!1258361 () Bool)

(assert (=> b!1374801 m!1258361))

(declare-fun m!1258363 () Bool)

(assert (=> b!1374801 m!1258363))

(declare-fun m!1258365 () Bool)

(assert (=> b!1374801 m!1258365))

(declare-fun m!1258367 () Bool)

(assert (=> b!1374798 m!1258367))

(assert (=> b!1374798 m!1258367))

(declare-fun m!1258369 () Bool)

(assert (=> b!1374798 m!1258369))

(declare-fun m!1258371 () Bool)

(assert (=> b!1374799 m!1258371))

(declare-fun m!1258373 () Bool)

(assert (=> start!116598 m!1258373))

(push 1)

(assert (not b!1374801))

(assert (not start!116598))

(assert (not b!1374798))

(assert (not b!1374799))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

