; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117160 () Bool)

(assert start!117160)

(declare-fun b!1378863 () Bool)

(declare-fun res!921398 () Bool)

(declare-fun e!781111 () Bool)

(assert (=> b!1378863 (=> (not res!921398) (not e!781111))))

(declare-datatypes ((array!93777 0))(
  ( (array!93778 (arr!45289 (Array (_ BitVec 32) (_ BitVec 64))) (size!45839 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93777)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378863 (= res!921398 (validKeyInArray!0 (select (arr!45289 a!4094) i!1451)))))

(declare-fun b!1378866 () Bool)

(assert (=> b!1378866 (= e!781111 false)))

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lt!607014 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93777 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378866 (= lt!607014 (arrayCountValidKeys!0 (array!93778 (store (arr!45289 a!4094) i!1451 k!2953) (size!45839 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!607013 () (_ BitVec 32))

(assert (=> b!1378866 (= lt!607013 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun res!921397 () Bool)

(assert (=> start!117160 (=> (not res!921397) (not e!781111))))

(assert (=> start!117160 (= res!921397 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45839 a!4094))))))

(assert (=> start!117160 e!781111))

(assert (=> start!117160 true))

(declare-fun array_inv!34317 (array!93777) Bool)

(assert (=> start!117160 (array_inv!34317 a!4094)))

(declare-fun b!1378865 () Bool)

(declare-fun res!921400 () Bool)

(assert (=> b!1378865 (=> (not res!921400) (not e!781111))))

(assert (=> b!1378865 (= res!921400 (and (bvslt (size!45839 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45839 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378864 () Bool)

(declare-fun res!921399 () Bool)

(assert (=> b!1378864 (=> (not res!921399) (not e!781111))))

(assert (=> b!1378864 (= res!921399 (not (validKeyInArray!0 k!2953)))))

(assert (= (and start!117160 res!921397) b!1378863))

(assert (= (and b!1378863 res!921398) b!1378864))

(assert (= (and b!1378864 res!921399) b!1378865))

(assert (= (and b!1378865 res!921400) b!1378866))

(declare-fun m!1263691 () Bool)

(assert (=> b!1378863 m!1263691))

(assert (=> b!1378863 m!1263691))

(declare-fun m!1263693 () Bool)

(assert (=> b!1378863 m!1263693))

(declare-fun m!1263695 () Bool)

(assert (=> b!1378866 m!1263695))

(declare-fun m!1263697 () Bool)

(assert (=> b!1378866 m!1263697))

(declare-fun m!1263699 () Bool)

(assert (=> b!1378866 m!1263699))

(declare-fun m!1263701 () Bool)

(assert (=> start!117160 m!1263701))

(declare-fun m!1263703 () Bool)

(assert (=> b!1378864 m!1263703))

(push 1)

(assert (not b!1378864))

(assert (not b!1378863))

(assert (not start!117160))

(assert (not b!1378866))

(check-sat)

