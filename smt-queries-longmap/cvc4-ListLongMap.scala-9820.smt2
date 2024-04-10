; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116592 () Bool)

(assert start!116592)

(declare-fun b!1374762 () Bool)

(declare-fun res!917892 () Bool)

(declare-fun e!778811 () Bool)

(assert (=> b!1374762 (=> (not res!917892) (not e!778811))))

(declare-datatypes ((array!93277 0))(
  ( (array!93278 (arr!45043 (Array (_ BitVec 32) (_ BitVec 64))) (size!45593 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93277)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374762 (= res!917892 (validKeyInArray!0 (select (arr!45043 a!4142) i!1457)))))

(declare-fun b!1374765 () Bool)

(assert (=> b!1374765 (= e!778811 (not true))))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93277 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374765 (= (arrayCountValidKeys!0 (array!93278 (store (arr!45043 a!4142) i!1457 k!2959) (size!45593 a!4142)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!45475 0))(
  ( (Unit!45476) )
))
(declare-fun lt!603885 () Unit!45475)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93277 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45475)

(assert (=> b!1374765 (= lt!603885 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1374764 () Bool)

(declare-fun res!917891 () Bool)

(assert (=> b!1374764 (=> (not res!917891) (not e!778811))))

(assert (=> b!1374764 (= res!917891 (bvslt (size!45593 a!4142) #b01111111111111111111111111111111))))

(declare-fun res!917893 () Bool)

(assert (=> start!116592 (=> (not res!917893) (not e!778811))))

(assert (=> start!116592 (= res!917893 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45593 a!4142))))))

(assert (=> start!116592 e!778811))

(assert (=> start!116592 true))

(declare-fun array_inv!34071 (array!93277) Bool)

(assert (=> start!116592 (array_inv!34071 a!4142)))

(declare-fun b!1374763 () Bool)

(declare-fun res!917890 () Bool)

(assert (=> b!1374763 (=> (not res!917890) (not e!778811))))

(assert (=> b!1374763 (= res!917890 (not (validKeyInArray!0 k!2959)))))

(assert (= (and start!116592 res!917893) b!1374762))

(assert (= (and b!1374762 res!917892) b!1374763))

(assert (= (and b!1374763 res!917890) b!1374764))

(assert (= (and b!1374764 res!917891) b!1374765))

(declare-fun m!1258311 () Bool)

(assert (=> b!1374762 m!1258311))

(assert (=> b!1374762 m!1258311))

(declare-fun m!1258313 () Bool)

(assert (=> b!1374762 m!1258313))

(declare-fun m!1258315 () Bool)

(assert (=> b!1374765 m!1258315))

(declare-fun m!1258317 () Bool)

(assert (=> b!1374765 m!1258317))

(declare-fun m!1258319 () Bool)

(assert (=> b!1374765 m!1258319))

(declare-fun m!1258321 () Bool)

(assert (=> b!1374765 m!1258321))

(declare-fun m!1258323 () Bool)

(assert (=> start!116592 m!1258323))

(declare-fun m!1258325 () Bool)

(assert (=> b!1374763 m!1258325))

(push 1)

(assert (not b!1374765))

(assert (not start!116592))

(assert (not b!1374763))

(assert (not b!1374762))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

