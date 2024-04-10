; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117048 () Bool)

(assert start!117048)

(declare-fun res!920580 () Bool)

(declare-fun e!780640 () Bool)

(assert (=> start!117048 (=> (not res!920580) (not e!780640))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93665 0))(
  ( (array!93666 (arr!45233 (Array (_ BitVec 32) (_ BitVec 64))) (size!45783 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93665)

(assert (=> start!117048 (= res!920580 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45783 a!4094))))))

(assert (=> start!117048 e!780640))

(assert (=> start!117048 true))

(declare-fun array_inv!34261 (array!93665) Bool)

(assert (=> start!117048 (array_inv!34261 a!4094)))

(declare-fun b!1378045 () Bool)

(declare-fun res!920579 () Bool)

(assert (=> b!1378045 (=> (not res!920579) (not e!780640))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378045 (= res!920579 (validKeyInArray!0 (select (arr!45233 a!4094) i!1451)))))

(declare-fun b!1378046 () Bool)

(declare-fun res!920581 () Bool)

(assert (=> b!1378046 (=> (not res!920581) (not e!780640))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1378046 (= res!920581 (not (validKeyInArray!0 k!2953)))))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun b!1378047 () Bool)

(assert (=> b!1378047 (= e!780640 (and (bvslt (size!45783 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45783 a!4094)) (bvsge i!1451 from!3466) (bvsgt from!3466 (bvadd #b00000000000000000000000000000001 i!1451))))))

(assert (= (and start!117048 res!920580) b!1378045))

(assert (= (and b!1378045 res!920579) b!1378046))

(assert (= (and b!1378046 res!920581) b!1378047))

(declare-fun m!1262493 () Bool)

(assert (=> start!117048 m!1262493))

(declare-fun m!1262495 () Bool)

(assert (=> b!1378045 m!1262495))

(assert (=> b!1378045 m!1262495))

(declare-fun m!1262497 () Bool)

(assert (=> b!1378045 m!1262497))

(declare-fun m!1262499 () Bool)

(assert (=> b!1378046 m!1262499))

(push 1)

(assert (not b!1378046))

(assert (not start!117048))

(assert (not b!1378045))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

