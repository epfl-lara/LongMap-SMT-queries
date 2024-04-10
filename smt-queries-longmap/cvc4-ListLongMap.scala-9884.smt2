; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117052 () Bool)

(assert start!117052)

(declare-fun res!920599 () Bool)

(declare-fun e!780653 () Bool)

(assert (=> start!117052 (=> (not res!920599) (not e!780653))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93669 0))(
  ( (array!93670 (arr!45235 (Array (_ BitVec 32) (_ BitVec 64))) (size!45785 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93669)

(assert (=> start!117052 (= res!920599 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45785 a!4094))))))

(assert (=> start!117052 e!780653))

(assert (=> start!117052 true))

(declare-fun array_inv!34263 (array!93669) Bool)

(assert (=> start!117052 (array_inv!34263 a!4094)))

(declare-fun b!1378063 () Bool)

(declare-fun res!920598 () Bool)

(assert (=> b!1378063 (=> (not res!920598) (not e!780653))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378063 (= res!920598 (validKeyInArray!0 (select (arr!45235 a!4094) i!1451)))))

(declare-fun b!1378064 () Bool)

(declare-fun res!920597 () Bool)

(assert (=> b!1378064 (=> (not res!920597) (not e!780653))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1378064 (= res!920597 (not (validKeyInArray!0 k!2953)))))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun b!1378065 () Bool)

(assert (=> b!1378065 (= e!780653 (and (bvslt (size!45785 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45785 a!4094)) (bvsge i!1451 from!3466) (bvsgt from!3466 (bvadd #b00000000000000000000000000000001 i!1451))))))

(assert (= (and start!117052 res!920599) b!1378063))

(assert (= (and b!1378063 res!920598) b!1378064))

(assert (= (and b!1378064 res!920597) b!1378065))

(declare-fun m!1262509 () Bool)

(assert (=> start!117052 m!1262509))

(declare-fun m!1262511 () Bool)

(assert (=> b!1378063 m!1262511))

(assert (=> b!1378063 m!1262511))

(declare-fun m!1262513 () Bool)

(assert (=> b!1378063 m!1262513))

(declare-fun m!1262515 () Bool)

(assert (=> b!1378064 m!1262515))

(push 1)

(assert (not start!117052))

(assert (not b!1378064))

(assert (not b!1378063))

(check-sat)

(pop 1)

(push 1)

(check-sat)

