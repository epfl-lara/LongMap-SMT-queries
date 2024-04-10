; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116606 () Bool)

(assert start!116606)

(declare-fun b!1374847 () Bool)

(declare-fun res!917975 () Bool)

(declare-fun e!778853 () Bool)

(assert (=> b!1374847 (=> (not res!917975) (not e!778853))))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374847 (= res!917975 (not (validKeyInArray!0 k!2959)))))

(declare-fun res!917974 () Bool)

(assert (=> start!116606 (=> (not res!917974) (not e!778853))))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((array!93291 0))(
  ( (array!93292 (arr!45050 (Array (_ BitVec 32) (_ BitVec 64))) (size!45600 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93291)

(assert (=> start!116606 (= res!917974 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45600 a!4142))))))

(assert (=> start!116606 e!778853))

(assert (=> start!116606 true))

(declare-fun array_inv!34078 (array!93291) Bool)

(assert (=> start!116606 (array_inv!34078 a!4142)))

(declare-fun b!1374848 () Bool)

(declare-fun res!917977 () Bool)

(assert (=> b!1374848 (=> (not res!917977) (not e!778853))))

(assert (=> b!1374848 (= res!917977 (bvslt (size!45600 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1374846 () Bool)

(declare-fun res!917976 () Bool)

(assert (=> b!1374846 (=> (not res!917976) (not e!778853))))

(assert (=> b!1374846 (= res!917976 (validKeyInArray!0 (select (arr!45050 a!4142) i!1457)))))

(declare-fun b!1374849 () Bool)

(assert (=> b!1374849 (= e!778853 (not true))))

(declare-fun arrayCountValidKeys!0 (array!93291 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374849 (= (arrayCountValidKeys!0 (array!93292 (store (arr!45050 a!4142) i!1457 k!2959) (size!45600 a!4142)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!45489 0))(
  ( (Unit!45490) )
))
(declare-fun lt!603906 () Unit!45489)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93291 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45489)

(assert (=> b!1374849 (= lt!603906 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(assert (= (and start!116606 res!917974) b!1374846))

(assert (= (and b!1374846 res!917976) b!1374847))

(assert (= (and b!1374847 res!917975) b!1374848))

(assert (= (and b!1374848 res!917977) b!1374849))

(declare-fun m!1258423 () Bool)

(assert (=> b!1374847 m!1258423))

(declare-fun m!1258425 () Bool)

(assert (=> start!116606 m!1258425))

(declare-fun m!1258427 () Bool)

(assert (=> b!1374846 m!1258427))

(assert (=> b!1374846 m!1258427))

(declare-fun m!1258429 () Bool)

(assert (=> b!1374846 m!1258429))

(declare-fun m!1258431 () Bool)

(assert (=> b!1374849 m!1258431))

(declare-fun m!1258433 () Bool)

(assert (=> b!1374849 m!1258433))

(declare-fun m!1258435 () Bool)

(assert (=> b!1374849 m!1258435))

(declare-fun m!1258437 () Bool)

(assert (=> b!1374849 m!1258437))

(push 1)

(assert (not b!1374847))

(assert (not b!1374846))

(assert (not start!116606))

(assert (not b!1374849))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

