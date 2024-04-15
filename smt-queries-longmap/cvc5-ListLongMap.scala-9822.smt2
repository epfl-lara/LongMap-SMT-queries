; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116594 () Bool)

(assert start!116594)

(declare-fun b!1374763 () Bool)

(declare-fun res!917936 () Bool)

(declare-fun e!778813 () Bool)

(assert (=> b!1374763 (=> (not res!917936) (not e!778813))))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374763 (= res!917936 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1374765 () Bool)

(assert (=> b!1374765 (= e!778813 (not true))))

(declare-datatypes ((array!93238 0))(
  ( (array!93239 (arr!45024 (Array (_ BitVec 32) (_ BitVec 64))) (size!45576 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93238)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93238 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374765 (= (arrayCountValidKeys!0 (array!93239 (store (arr!45024 a!4142) i!1457 k!2959) (size!45576 a!4142)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!45328 0))(
  ( (Unit!45329) )
))
(declare-fun lt!603716 () Unit!45328)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93238 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45328)

(assert (=> b!1374765 (= lt!603716 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun res!917935 () Bool)

(assert (=> start!116594 (=> (not res!917935) (not e!778813))))

(assert (=> start!116594 (= res!917935 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45576 a!4142))))))

(assert (=> start!116594 e!778813))

(assert (=> start!116594 true))

(declare-fun array_inv!34257 (array!93238) Bool)

(assert (=> start!116594 (array_inv!34257 a!4142)))

(declare-fun b!1374764 () Bool)

(declare-fun res!917933 () Bool)

(assert (=> b!1374764 (=> (not res!917933) (not e!778813))))

(assert (=> b!1374764 (= res!917933 (bvslt (size!45576 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1374762 () Bool)

(declare-fun res!917934 () Bool)

(assert (=> b!1374762 (=> (not res!917934) (not e!778813))))

(assert (=> b!1374762 (= res!917934 (validKeyInArray!0 (select (arr!45024 a!4142) i!1457)))))

(assert (= (and start!116594 res!917935) b!1374762))

(assert (= (and b!1374762 res!917934) b!1374763))

(assert (= (and b!1374763 res!917936) b!1374764))

(assert (= (and b!1374764 res!917933) b!1374765))

(declare-fun m!1257881 () Bool)

(assert (=> b!1374763 m!1257881))

(declare-fun m!1257883 () Bool)

(assert (=> b!1374765 m!1257883))

(declare-fun m!1257885 () Bool)

(assert (=> b!1374765 m!1257885))

(declare-fun m!1257887 () Bool)

(assert (=> b!1374765 m!1257887))

(declare-fun m!1257889 () Bool)

(assert (=> b!1374765 m!1257889))

(declare-fun m!1257891 () Bool)

(assert (=> start!116594 m!1257891))

(declare-fun m!1257893 () Bool)

(assert (=> b!1374762 m!1257893))

(assert (=> b!1374762 m!1257893))

(declare-fun m!1257895 () Bool)

(assert (=> b!1374762 m!1257895))

(push 1)

(assert (not b!1374765))

(assert (not start!116594))

(assert (not b!1374763))

(assert (not b!1374762))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

