; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117054 () Bool)

(assert start!117054)

(declare-fun res!920606 () Bool)

(declare-fun e!780658 () Bool)

(assert (=> start!117054 (=> (not res!920606) (not e!780658))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93671 0))(
  ( (array!93672 (arr!45236 (Array (_ BitVec 32) (_ BitVec 64))) (size!45786 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93671)

(assert (=> start!117054 (= res!920606 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45786 a!4094))))))

(assert (=> start!117054 e!780658))

(assert (=> start!117054 true))

(declare-fun array_inv!34264 (array!93671) Bool)

(assert (=> start!117054 (array_inv!34264 a!4094)))

(declare-fun b!1378072 () Bool)

(declare-fun res!920607 () Bool)

(assert (=> b!1378072 (=> (not res!920607) (not e!780658))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378072 (= res!920607 (validKeyInArray!0 (select (arr!45236 a!4094) i!1451)))))

(declare-fun b!1378073 () Bool)

(declare-fun res!920608 () Bool)

(assert (=> b!1378073 (=> (not res!920608) (not e!780658))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1378073 (= res!920608 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1378074 () Bool)

(declare-fun from!3466 () (_ BitVec 32))

(assert (=> b!1378074 (= e!780658 (and (bvslt (size!45786 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45786 a!4094)) (bvsge i!1451 from!3466) (bvsgt from!3466 (bvadd #b00000000000000000000000000000001 i!1451))))))

(assert (= (and start!117054 res!920606) b!1378072))

(assert (= (and b!1378072 res!920607) b!1378073))

(assert (= (and b!1378073 res!920608) b!1378074))

(declare-fun m!1262517 () Bool)

(assert (=> start!117054 m!1262517))

(declare-fun m!1262519 () Bool)

(assert (=> b!1378072 m!1262519))

(assert (=> b!1378072 m!1262519))

(declare-fun m!1262521 () Bool)

(assert (=> b!1378072 m!1262521))

(declare-fun m!1262523 () Bool)

(assert (=> b!1378073 m!1262523))

(push 1)

(assert (not b!1378072))

(assert (not b!1378073))

(assert (not start!117054))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

