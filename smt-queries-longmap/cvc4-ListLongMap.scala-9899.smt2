; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117142 () Bool)

(assert start!117142)

(declare-fun b!1378749 () Bool)

(declare-fun e!781057 () Bool)

(assert (=> b!1378749 (= e!781057 false)))

(declare-datatypes ((array!93759 0))(
  ( (array!93760 (arr!45280 (Array (_ BitVec 32) (_ BitVec 64))) (size!45830 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93759)

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun lt!606977 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93759 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378749 (= lt!606977 (arrayCountValidKeys!0 (array!93760 (store (arr!45280 a!4094) i!1451 k!2953) (size!45830 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!606978 () (_ BitVec 32))

(assert (=> b!1378749 (= lt!606978 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun b!1378747 () Bool)

(declare-fun res!921281 () Bool)

(assert (=> b!1378747 (=> (not res!921281) (not e!781057))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378747 (= res!921281 (not (validKeyInArray!0 k!2953)))))

(declare-fun res!921280 () Bool)

(assert (=> start!117142 (=> (not res!921280) (not e!781057))))

(assert (=> start!117142 (= res!921280 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45830 a!4094))))))

(assert (=> start!117142 e!781057))

(assert (=> start!117142 true))

(declare-fun array_inv!34308 (array!93759) Bool)

(assert (=> start!117142 (array_inv!34308 a!4094)))

(declare-fun b!1378748 () Bool)

(declare-fun res!921283 () Bool)

(assert (=> b!1378748 (=> (not res!921283) (not e!781057))))

(assert (=> b!1378748 (= res!921283 (and (bvslt (size!45830 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45830 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378746 () Bool)

(declare-fun res!921282 () Bool)

(assert (=> b!1378746 (=> (not res!921282) (not e!781057))))

(assert (=> b!1378746 (= res!921282 (validKeyInArray!0 (select (arr!45280 a!4094) i!1451)))))

(assert (= (and start!117142 res!921280) b!1378746))

(assert (= (and b!1378746 res!921282) b!1378747))

(assert (= (and b!1378747 res!921281) b!1378748))

(assert (= (and b!1378748 res!921283) b!1378749))

(declare-fun m!1263565 () Bool)

(assert (=> b!1378749 m!1263565))

(declare-fun m!1263567 () Bool)

(assert (=> b!1378749 m!1263567))

(declare-fun m!1263569 () Bool)

(assert (=> b!1378749 m!1263569))

(declare-fun m!1263571 () Bool)

(assert (=> b!1378747 m!1263571))

(declare-fun m!1263573 () Bool)

(assert (=> start!117142 m!1263573))

(declare-fun m!1263575 () Bool)

(assert (=> b!1378746 m!1263575))

(assert (=> b!1378746 m!1263575))

(declare-fun m!1263577 () Bool)

(assert (=> b!1378746 m!1263577))

(push 1)

(assert (not b!1378746))

(assert (not start!117142))

(assert (not b!1378749))

(assert (not b!1378747))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

