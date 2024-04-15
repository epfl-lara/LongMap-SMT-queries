; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117150 () Bool)

(assert start!117150)

(declare-fun b!1378761 () Bool)

(declare-fun e!781062 () Bool)

(assert (=> b!1378761 (= e!781062 false)))

(declare-datatypes ((array!93721 0))(
  ( (array!93722 (arr!45261 (Array (_ BitVec 32) (_ BitVec 64))) (size!45813 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93721)

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun lt!606812 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93721 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378761 (= lt!606812 (arrayCountValidKeys!0 (array!93722 (store (arr!45261 a!4094) i!1451 k!2953) (size!45813 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!606811 () (_ BitVec 32))

(assert (=> b!1378761 (= lt!606811 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun b!1378759 () Bool)

(declare-fun res!921336 () Bool)

(assert (=> b!1378759 (=> (not res!921336) (not e!781062))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378759 (= res!921336 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1378760 () Bool)

(declare-fun res!921338 () Bool)

(assert (=> b!1378760 (=> (not res!921338) (not e!781062))))

(assert (=> b!1378760 (= res!921338 (and (bvslt (size!45813 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45813 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun res!921337 () Bool)

(assert (=> start!117150 (=> (not res!921337) (not e!781062))))

(assert (=> start!117150 (= res!921337 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45813 a!4094))))))

(assert (=> start!117150 e!781062))

(assert (=> start!117150 true))

(declare-fun array_inv!34494 (array!93721) Bool)

(assert (=> start!117150 (array_inv!34494 a!4094)))

(declare-fun b!1378758 () Bool)

(declare-fun res!921335 () Bool)

(assert (=> b!1378758 (=> (not res!921335) (not e!781062))))

(assert (=> b!1378758 (= res!921335 (validKeyInArray!0 (select (arr!45261 a!4094) i!1451)))))

(assert (= (and start!117150 res!921337) b!1378758))

(assert (= (and b!1378758 res!921335) b!1378759))

(assert (= (and b!1378759 res!921336) b!1378760))

(assert (= (and b!1378760 res!921338) b!1378761))

(declare-fun m!1263145 () Bool)

(assert (=> b!1378761 m!1263145))

(declare-fun m!1263147 () Bool)

(assert (=> b!1378761 m!1263147))

(declare-fun m!1263149 () Bool)

(assert (=> b!1378761 m!1263149))

(declare-fun m!1263151 () Bool)

(assert (=> b!1378759 m!1263151))

(declare-fun m!1263153 () Bool)

(assert (=> start!117150 m!1263153))

(declare-fun m!1263155 () Bool)

(assert (=> b!1378758 m!1263155))

(assert (=> b!1378758 m!1263155))

(declare-fun m!1263157 () Bool)

(assert (=> b!1378758 m!1263157))

(push 1)

(assert (not b!1378759))

(assert (not b!1378758))

(assert (not start!117150))

(assert (not b!1378761))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

