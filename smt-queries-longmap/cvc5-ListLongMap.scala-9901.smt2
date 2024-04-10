; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117150 () Bool)

(assert start!117150)

(declare-fun res!921339 () Bool)

(declare-fun e!781081 () Bool)

(assert (=> start!117150 (=> (not res!921339) (not e!781081))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93767 0))(
  ( (array!93768 (arr!45284 (Array (_ BitVec 32) (_ BitVec 64))) (size!45834 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93767)

(assert (=> start!117150 (= res!921339 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45834 a!4094))))))

(assert (=> start!117150 e!781081))

(assert (=> start!117150 true))

(declare-fun array_inv!34312 (array!93767) Bool)

(assert (=> start!117150 (array_inv!34312 a!4094)))

(declare-fun b!1378803 () Bool)

(declare-fun res!921340 () Bool)

(assert (=> b!1378803 (=> (not res!921340) (not e!781081))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378803 (= res!921340 (validKeyInArray!0 (select (arr!45284 a!4094) i!1451)))))

(declare-fun b!1378804 () Bool)

(declare-fun res!921337 () Bool)

(assert (=> b!1378804 (=> (not res!921337) (not e!781081))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1378804 (= res!921337 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1378806 () Bool)

(assert (=> b!1378806 (= e!781081 false)))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lt!606983 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93767 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378806 (= lt!606983 (arrayCountValidKeys!0 (array!93768 (store (arr!45284 a!4094) i!1451 k!2953) (size!45834 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!606984 () (_ BitVec 32))

(assert (=> b!1378806 (= lt!606984 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun b!1378805 () Bool)

(declare-fun res!921338 () Bool)

(assert (=> b!1378805 (=> (not res!921338) (not e!781081))))

(assert (=> b!1378805 (= res!921338 (and (bvslt (size!45834 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45834 a!4094)) (bvsge i!1451 from!3466)))))

(assert (= (and start!117150 res!921339) b!1378803))

(assert (= (and b!1378803 res!921340) b!1378804))

(assert (= (and b!1378804 res!921337) b!1378805))

(assert (= (and b!1378805 res!921338) b!1378806))

(declare-fun m!1263621 () Bool)

(assert (=> start!117150 m!1263621))

(declare-fun m!1263623 () Bool)

(assert (=> b!1378803 m!1263623))

(assert (=> b!1378803 m!1263623))

(declare-fun m!1263625 () Bool)

(assert (=> b!1378803 m!1263625))

(declare-fun m!1263627 () Bool)

(assert (=> b!1378804 m!1263627))

(declare-fun m!1263629 () Bool)

(assert (=> b!1378806 m!1263629))

(declare-fun m!1263631 () Bool)

(assert (=> b!1378806 m!1263631))

(declare-fun m!1263633 () Bool)

(assert (=> b!1378806 m!1263633))

(push 1)

(assert (not b!1378804))

(assert (not b!1378803))

(assert (not start!117150))

(assert (not b!1378806))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

