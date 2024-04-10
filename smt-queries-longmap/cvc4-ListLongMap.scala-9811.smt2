; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116520 () Bool)

(assert start!116520)

(declare-fun b!1374354 () Bool)

(declare-fun res!917541 () Bool)

(declare-fun e!778585 () Bool)

(assert (=> b!1374354 (=> (not res!917541) (not e!778585))))

(declare-datatypes ((array!93220 0))(
  ( (array!93221 (arr!45016 (Array (_ BitVec 32) (_ BitVec 64))) (size!45566 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93220)

(assert (=> b!1374354 (= res!917541 (bvslt (size!45566 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1374355 () Bool)

(declare-fun e!778583 () Bool)

(assert (=> b!1374355 (= e!778585 (not e!778583))))

(declare-fun res!917540 () Bool)

(assert (=> b!1374355 (=> res!917540 e!778583)))

(declare-fun i!1457 () (_ BitVec 32))

(assert (=> b!1374355 (= res!917540 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) i!1457)))))

(declare-fun lt!603447 () array!93220)

(declare-fun arrayCountValidKeys!0 (array!93220 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374355 (= (arrayCountValidKeys!0 lt!603447 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(declare-fun k!2959 () (_ BitVec 64))

(assert (=> b!1374355 (= lt!603447 (array!93221 (store (arr!45016 a!4142) i!1457 k!2959) (size!45566 a!4142)))))

(declare-datatypes ((Unit!45433 0))(
  ( (Unit!45434) )
))
(declare-fun lt!603446 () Unit!45433)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93220 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45433)

(assert (=> b!1374355 (= lt!603446 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1374356 () Bool)

(declare-fun res!917542 () Bool)

(assert (=> b!1374356 (=> (not res!917542) (not e!778585))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374356 (= res!917542 (not (validKeyInArray!0 k!2959)))))

(declare-fun res!917539 () Bool)

(assert (=> start!116520 (=> (not res!917539) (not e!778585))))

(assert (=> start!116520 (= res!917539 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45566 a!4142))))))

(assert (=> start!116520 e!778585))

(assert (=> start!116520 true))

(declare-fun array_inv!34044 (array!93220) Bool)

(assert (=> start!116520 (array_inv!34044 a!4142)))

(declare-fun b!1374357 () Bool)

(declare-fun res!917538 () Bool)

(assert (=> b!1374357 (=> (not res!917538) (not e!778585))))

(assert (=> b!1374357 (= res!917538 (validKeyInArray!0 (select (arr!45016 a!4142) i!1457)))))

(declare-fun b!1374358 () Bool)

(assert (=> b!1374358 (= e!778583 true)))

(declare-fun lt!603445 () (_ BitVec 32))

(assert (=> b!1374358 (= lt!603445 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603448 () (_ BitVec 32))

(assert (=> b!1374358 (= lt!603448 (arrayCountValidKeys!0 lt!603447 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (= (and start!116520 res!917539) b!1374357))

(assert (= (and b!1374357 res!917538) b!1374356))

(assert (= (and b!1374356 res!917542) b!1374354))

(assert (= (and b!1374354 res!917541) b!1374355))

(assert (= (and b!1374355 (not res!917540)) b!1374358))

(declare-fun m!1257653 () Bool)

(assert (=> b!1374356 m!1257653))

(declare-fun m!1257655 () Bool)

(assert (=> b!1374358 m!1257655))

(declare-fun m!1257657 () Bool)

(assert (=> b!1374358 m!1257657))

(declare-fun m!1257659 () Bool)

(assert (=> b!1374357 m!1257659))

(assert (=> b!1374357 m!1257659))

(declare-fun m!1257661 () Bool)

(assert (=> b!1374357 m!1257661))

(declare-fun m!1257663 () Bool)

(assert (=> start!116520 m!1257663))

(declare-fun m!1257665 () Bool)

(assert (=> b!1374355 m!1257665))

(declare-fun m!1257667 () Bool)

(assert (=> b!1374355 m!1257667))

(declare-fun m!1257669 () Bool)

(assert (=> b!1374355 m!1257669))

(declare-fun m!1257671 () Bool)

(assert (=> b!1374355 m!1257671))

(push 1)

(assert (not b!1374355))

(assert (not b!1374356))

(assert (not b!1374357))

(assert (not b!1374358))

(assert (not start!116520))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

