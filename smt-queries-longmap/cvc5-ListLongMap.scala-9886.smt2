; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117060 () Bool)

(assert start!117060)

(declare-fun res!920635 () Bool)

(declare-fun e!780657 () Bool)

(assert (=> start!117060 (=> (not res!920635) (not e!780657))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93631 0))(
  ( (array!93632 (arr!45216 (Array (_ BitVec 32) (_ BitVec 64))) (size!45768 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93631)

(assert (=> start!117060 (= res!920635 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45768 a!4094))))))

(assert (=> start!117060 e!780657))

(assert (=> start!117060 true))

(declare-fun array_inv!34449 (array!93631) Bool)

(assert (=> start!117060 (array_inv!34449 a!4094)))

(declare-fun b!1378058 () Bool)

(declare-fun res!920636 () Bool)

(assert (=> b!1378058 (=> (not res!920636) (not e!780657))))

(declare-fun from!3466 () (_ BitVec 32))

(assert (=> b!1378058 (= res!920636 (and (bvslt (size!45768 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45768 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378059 () Bool)

(assert (=> b!1378059 (= e!780657 false)))

(declare-fun lt!606128 () (_ BitVec 32))

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93631 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378059 (= lt!606128 (arrayCountValidKeys!0 (array!93632 (store (arr!45216 a!4094) i!1451 k!2953) (size!45768 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!606127 () (_ BitVec 32))

(assert (=> b!1378059 (= lt!606127 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun b!1378056 () Bool)

(declare-fun res!920634 () Bool)

(assert (=> b!1378056 (=> (not res!920634) (not e!780657))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378056 (= res!920634 (validKeyInArray!0 (select (arr!45216 a!4094) i!1451)))))

(declare-fun b!1378057 () Bool)

(declare-fun res!920633 () Bool)

(assert (=> b!1378057 (=> (not res!920633) (not e!780657))))

(assert (=> b!1378057 (= res!920633 (not (validKeyInArray!0 k!2953)))))

(assert (= (and start!117060 res!920635) b!1378056))

(assert (= (and b!1378056 res!920634) b!1378057))

(assert (= (and b!1378057 res!920633) b!1378058))

(assert (= (and b!1378058 res!920636) b!1378059))

(declare-fun m!1262065 () Bool)

(assert (=> start!117060 m!1262065))

(declare-fun m!1262067 () Bool)

(assert (=> b!1378059 m!1262067))

(declare-fun m!1262069 () Bool)

(assert (=> b!1378059 m!1262069))

(declare-fun m!1262071 () Bool)

(assert (=> b!1378059 m!1262071))

(declare-fun m!1262073 () Bool)

(assert (=> b!1378056 m!1262073))

(assert (=> b!1378056 m!1262073))

(declare-fun m!1262075 () Bool)

(assert (=> b!1378056 m!1262075))

(declare-fun m!1262077 () Bool)

(assert (=> b!1378057 m!1262077))

(push 1)

(assert (not b!1378059))

(assert (not b!1378057))

(assert (not b!1378056))

(assert (not start!117060))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

