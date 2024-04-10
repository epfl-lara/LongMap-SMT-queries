; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117060 () Bool)

(assert start!117060)

(declare-fun b!1378101 () Bool)

(declare-fun res!920638 () Bool)

(declare-fun e!780676 () Bool)

(assert (=> b!1378101 (=> (not res!920638) (not e!780676))))

(declare-datatypes ((array!93677 0))(
  ( (array!93678 (arr!45239 (Array (_ BitVec 32) (_ BitVec 64))) (size!45789 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93677)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378101 (= res!920638 (validKeyInArray!0 (select (arr!45239 a!4094) i!1451)))))

(declare-fun b!1378104 () Bool)

(assert (=> b!1378104 (= e!780676 false)))

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lt!606299 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93677 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378104 (= lt!606299 (arrayCountValidKeys!0 (array!93678 (store (arr!45239 a!4094) i!1451 k!2953) (size!45789 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!606300 () (_ BitVec 32))

(assert (=> b!1378104 (= lt!606300 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun res!920635 () Bool)

(assert (=> start!117060 (=> (not res!920635) (not e!780676))))

(assert (=> start!117060 (= res!920635 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45789 a!4094))))))

(assert (=> start!117060 e!780676))

(assert (=> start!117060 true))

(declare-fun array_inv!34267 (array!93677) Bool)

(assert (=> start!117060 (array_inv!34267 a!4094)))

(declare-fun b!1378103 () Bool)

(declare-fun res!920637 () Bool)

(assert (=> b!1378103 (=> (not res!920637) (not e!780676))))

(assert (=> b!1378103 (= res!920637 (and (bvslt (size!45789 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45789 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378102 () Bool)

(declare-fun res!920636 () Bool)

(assert (=> b!1378102 (=> (not res!920636) (not e!780676))))

(assert (=> b!1378102 (= res!920636 (not (validKeyInArray!0 k!2953)))))

(assert (= (and start!117060 res!920635) b!1378101))

(assert (= (and b!1378101 res!920638) b!1378102))

(assert (= (and b!1378102 res!920636) b!1378103))

(assert (= (and b!1378103 res!920637) b!1378104))

(declare-fun m!1262541 () Bool)

(assert (=> b!1378101 m!1262541))

(assert (=> b!1378101 m!1262541))

(declare-fun m!1262543 () Bool)

(assert (=> b!1378101 m!1262543))

(declare-fun m!1262545 () Bool)

(assert (=> b!1378104 m!1262545))

(declare-fun m!1262547 () Bool)

(assert (=> b!1378104 m!1262547))

(declare-fun m!1262549 () Bool)

(assert (=> b!1378104 m!1262549))

(declare-fun m!1262551 () Bool)

(assert (=> start!117060 m!1262551))

(declare-fun m!1262553 () Bool)

(assert (=> b!1378102 m!1262553))

(push 1)

(assert (not b!1378101))

(assert (not b!1378102))

(assert (not start!117060))

(assert (not b!1378104))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

