; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116552 () Bool)

(assert start!116552)

(declare-fun res!917791 () Bool)

(declare-fun e!778713 () Bool)

(assert (=> start!116552 (=> (not res!917791) (not e!778713))))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((array!93211 0))(
  ( (array!93212 (arr!45012 (Array (_ BitVec 32) (_ BitVec 64))) (size!45564 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93211)

(assert (=> start!116552 (= res!917791 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45564 a!4142))))))

(assert (=> start!116552 e!778713))

(assert (=> start!116552 true))

(declare-fun array_inv!34245 (array!93211) Bool)

(assert (=> start!116552 (array_inv!34245 a!4142)))

(declare-fun b!1374563 () Bool)

(declare-fun res!917792 () Bool)

(assert (=> b!1374563 (=> (not res!917792) (not e!778713))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374563 (= res!917792 (validKeyInArray!0 (select (arr!45012 a!4142) i!1457)))))

(declare-fun b!1374564 () Bool)

(declare-fun res!917790 () Bool)

(assert (=> b!1374564 (=> (not res!917790) (not e!778713))))

(declare-fun k!2959 () (_ BitVec 64))

(assert (=> b!1374564 (= res!917790 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1374565 () Bool)

(assert (=> b!1374565 (= e!778713 (and (bvslt (size!45564 a!4142) #b01111111111111111111111111111111) (bvsgt i!1457 (size!45564 a!4142))))))

(assert (= (and start!116552 res!917791) b!1374563))

(assert (= (and b!1374563 res!917792) b!1374564))

(assert (= (and b!1374564 res!917790) b!1374565))

(declare-fun m!1257667 () Bool)

(assert (=> start!116552 m!1257667))

(declare-fun m!1257669 () Bool)

(assert (=> b!1374563 m!1257669))

(assert (=> b!1374563 m!1257669))

(declare-fun m!1257671 () Bool)

(assert (=> b!1374563 m!1257671))

(declare-fun m!1257673 () Bool)

(assert (=> b!1374564 m!1257673))

(push 1)

(assert (not b!1374563))

(assert (not start!116552))

(assert (not b!1374564))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

