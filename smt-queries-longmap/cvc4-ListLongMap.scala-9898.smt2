; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117136 () Bool)

(assert start!117136)

(declare-fun b!1378709 () Bool)

(declare-fun res!921244 () Bool)

(declare-fun e!781039 () Bool)

(assert (=> b!1378709 (=> (not res!921244) (not e!781039))))

(declare-datatypes ((array!93753 0))(
  ( (array!93754 (arr!45277 (Array (_ BitVec 32) (_ BitVec 64))) (size!45827 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93753)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378709 (= res!921244 (validKeyInArray!0 (select (arr!45277 a!4094) i!1451)))))

(declare-fun b!1378710 () Bool)

(declare-fun res!921246 () Bool)

(assert (=> b!1378710 (=> (not res!921246) (not e!781039))))

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93753 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378710 (= res!921246 (= (arrayCountValidKeys!0 (array!93754 (store (arr!45277 a!4094) i!1451 k!2953) (size!45827 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001)))))

(declare-fun b!1378711 () Bool)

(assert (=> b!1378711 (= e!781039 (and (bvsle from!3466 #b00000000000000000000000000000000) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451))))))

(declare-fun res!921245 () Bool)

(assert (=> start!117136 (=> (not res!921245) (not e!781039))))

(assert (=> start!117136 (= res!921245 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45827 a!4094))))))

(assert (=> start!117136 e!781039))

(assert (=> start!117136 true))

(declare-fun array_inv!34305 (array!93753) Bool)

(assert (=> start!117136 (array_inv!34305 a!4094)))

(declare-fun b!1378712 () Bool)

(declare-fun res!921247 () Bool)

(assert (=> b!1378712 (=> (not res!921247) (not e!781039))))

(assert (=> b!1378712 (= res!921247 (and (bvslt (size!45827 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45827 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378713 () Bool)

(declare-fun res!921243 () Bool)

(assert (=> b!1378713 (=> (not res!921243) (not e!781039))))

(assert (=> b!1378713 (= res!921243 (not (validKeyInArray!0 k!2953)))))

(assert (= (and start!117136 res!921245) b!1378709))

(assert (= (and b!1378709 res!921244) b!1378713))

(assert (= (and b!1378713 res!921243) b!1378712))

(assert (= (and b!1378712 res!921247) b!1378710))

(assert (= (and b!1378710 res!921246) b!1378711))

(declare-fun m!1263523 () Bool)

(assert (=> b!1378709 m!1263523))

(assert (=> b!1378709 m!1263523))

(declare-fun m!1263525 () Bool)

(assert (=> b!1378709 m!1263525))

(declare-fun m!1263527 () Bool)

(assert (=> b!1378710 m!1263527))

(declare-fun m!1263529 () Bool)

(assert (=> b!1378710 m!1263529))

(declare-fun m!1263531 () Bool)

(assert (=> b!1378710 m!1263531))

(declare-fun m!1263533 () Bool)

(assert (=> start!117136 m!1263533))

(declare-fun m!1263535 () Bool)

(assert (=> b!1378713 m!1263535))

(push 1)

(assert (not start!117136))

(assert (not b!1378710))

(assert (not b!1378709))

(assert (not b!1378713))

(check-sat)

(pop 1)

(push 1)

(check-sat)

