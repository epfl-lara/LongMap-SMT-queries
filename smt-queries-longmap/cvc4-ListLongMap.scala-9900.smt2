; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117148 () Bool)

(assert start!117148)

(declare-fun b!1378790 () Bool)

(declare-fun res!921324 () Bool)

(declare-fun e!781075 () Bool)

(assert (=> b!1378790 (=> (not res!921324) (not e!781075))))

(declare-datatypes ((array!93765 0))(
  ( (array!93766 (arr!45283 (Array (_ BitVec 32) (_ BitVec 64))) (size!45833 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93765)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378790 (= res!921324 (validKeyInArray!0 (select (arr!45283 a!4094) i!1451)))))

(declare-fun b!1378791 () Bool)

(declare-fun from!3466 () (_ BitVec 32))

(assert (=> b!1378791 (= e!781075 (and (bvsle from!3466 #b00000000000000000000000000000000) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451))))))

(declare-fun b!1378792 () Bool)

(declare-fun res!921326 () Bool)

(assert (=> b!1378792 (=> (not res!921326) (not e!781075))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1378792 (= res!921326 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1378793 () Bool)

(declare-fun res!921325 () Bool)

(assert (=> b!1378793 (=> (not res!921325) (not e!781075))))

(declare-fun arrayCountValidKeys!0 (array!93765 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378793 (= res!921325 (= (arrayCountValidKeys!0 (array!93766 (store (arr!45283 a!4094) i!1451 k!2953) (size!45833 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001)))))

(declare-fun res!921327 () Bool)

(assert (=> start!117148 (=> (not res!921327) (not e!781075))))

(assert (=> start!117148 (= res!921327 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45833 a!4094))))))

(assert (=> start!117148 e!781075))

(assert (=> start!117148 true))

(declare-fun array_inv!34311 (array!93765) Bool)

(assert (=> start!117148 (array_inv!34311 a!4094)))

(declare-fun b!1378794 () Bool)

(declare-fun res!921328 () Bool)

(assert (=> b!1378794 (=> (not res!921328) (not e!781075))))

(assert (=> b!1378794 (= res!921328 (and (bvslt (size!45833 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45833 a!4094)) (bvsge i!1451 from!3466)))))

(assert (= (and start!117148 res!921327) b!1378790))

(assert (= (and b!1378790 res!921324) b!1378792))

(assert (= (and b!1378792 res!921326) b!1378794))

(assert (= (and b!1378794 res!921328) b!1378793))

(assert (= (and b!1378793 res!921325) b!1378791))

(declare-fun m!1263607 () Bool)

(assert (=> b!1378790 m!1263607))

(assert (=> b!1378790 m!1263607))

(declare-fun m!1263609 () Bool)

(assert (=> b!1378790 m!1263609))

(declare-fun m!1263611 () Bool)

(assert (=> b!1378792 m!1263611))

(declare-fun m!1263613 () Bool)

(assert (=> b!1378793 m!1263613))

(declare-fun m!1263615 () Bool)

(assert (=> b!1378793 m!1263615))

(declare-fun m!1263617 () Bool)

(assert (=> b!1378793 m!1263617))

(declare-fun m!1263619 () Bool)

(assert (=> start!117148 m!1263619))

(push 1)

(assert (not start!117148))

(assert (not b!1378790))

(assert (not b!1378793))

(assert (not b!1378792))

(check-sat)

