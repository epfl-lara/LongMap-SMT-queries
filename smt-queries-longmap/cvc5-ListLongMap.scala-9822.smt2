; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116600 () Bool)

(assert start!116600)

(declare-fun b!1374811 () Bool)

(declare-fun res!917940 () Bool)

(declare-fun e!778835 () Bool)

(assert (=> b!1374811 (=> (not res!917940) (not e!778835))))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374811 (= res!917940 (not (validKeyInArray!0 k!2959)))))

(declare-fun res!917939 () Bool)

(assert (=> start!116600 (=> (not res!917939) (not e!778835))))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((array!93285 0))(
  ( (array!93286 (arr!45047 (Array (_ BitVec 32) (_ BitVec 64))) (size!45597 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93285)

(assert (=> start!116600 (= res!917939 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45597 a!4142))))))

(assert (=> start!116600 e!778835))

(assert (=> start!116600 true))

(declare-fun array_inv!34075 (array!93285) Bool)

(assert (=> start!116600 (array_inv!34075 a!4142)))

(declare-fun b!1374810 () Bool)

(declare-fun res!917938 () Bool)

(assert (=> b!1374810 (=> (not res!917938) (not e!778835))))

(assert (=> b!1374810 (= res!917938 (validKeyInArray!0 (select (arr!45047 a!4142) i!1457)))))

(declare-fun b!1374813 () Bool)

(assert (=> b!1374813 (= e!778835 (not true))))

(declare-fun arrayCountValidKeys!0 (array!93285 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374813 (= (arrayCountValidKeys!0 (array!93286 (store (arr!45047 a!4142) i!1457 k!2959) (size!45597 a!4142)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!45483 0))(
  ( (Unit!45484) )
))
(declare-fun lt!603897 () Unit!45483)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93285 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45483)

(assert (=> b!1374813 (= lt!603897 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1374812 () Bool)

(declare-fun res!917941 () Bool)

(assert (=> b!1374812 (=> (not res!917941) (not e!778835))))

(assert (=> b!1374812 (= res!917941 (bvslt (size!45597 a!4142) #b01111111111111111111111111111111))))

(assert (= (and start!116600 res!917939) b!1374810))

(assert (= (and b!1374810 res!917938) b!1374811))

(assert (= (and b!1374811 res!917940) b!1374812))

(assert (= (and b!1374812 res!917941) b!1374813))

(declare-fun m!1258375 () Bool)

(assert (=> b!1374811 m!1258375))

(declare-fun m!1258377 () Bool)

(assert (=> start!116600 m!1258377))

(declare-fun m!1258379 () Bool)

(assert (=> b!1374810 m!1258379))

(assert (=> b!1374810 m!1258379))

(declare-fun m!1258381 () Bool)

(assert (=> b!1374810 m!1258381))

(declare-fun m!1258383 () Bool)

(assert (=> b!1374813 m!1258383))

(declare-fun m!1258385 () Bool)

(assert (=> b!1374813 m!1258385))

(declare-fun m!1258387 () Bool)

(assert (=> b!1374813 m!1258387))

(declare-fun m!1258389 () Bool)

(assert (=> b!1374813 m!1258389))

(push 1)

(assert (not b!1374810))

(assert (not b!1374813))

(assert (not start!116600))

(assert (not b!1374811))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

