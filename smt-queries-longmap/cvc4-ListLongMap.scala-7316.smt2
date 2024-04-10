; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93520 () Bool)

(assert start!93520)

(declare-fun res!707395 () Bool)

(declare-fun e!602469 () Bool)

(assert (=> start!93520 (=> (not res!707395) (not e!602469))))

(declare-fun from!2850 () (_ BitVec 32))

(declare-datatypes ((array!66810 0))(
  ( (array!66811 (arr!32121 (Array (_ BitVec 32) (_ BitVec 64))) (size!32657 (_ BitVec 32))) )
))
(declare-fun a!3475 () array!66810)

(assert (=> start!93520 (= res!707395 (and (bvsge from!2850 #b00000000000000000000000000000000) (bvslt from!2850 (size!32657 a!3475)) (bvslt (size!32657 a!3475) #b01111111111111111111111111111111)))))

(assert (=> start!93520 e!602469))

(assert (=> start!93520 true))

(declare-fun array_inv!24901 (array!66810) Bool)

(assert (=> start!93520 (array_inv!24901 a!3475)))

(declare-fun b!1058821 () Bool)

(declare-fun res!707396 () Bool)

(assert (=> b!1058821 (=> (not res!707396) (not e!602469))))

(declare-fun k!2741 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66810 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058821 (= res!707396 (arrayContainsKey!0 a!3475 k!2741 from!2850))))

(declare-fun b!1058822 () Bool)

(assert (=> b!1058822 (= e!602469 (and (not (= (select (arr!32121 a!3475) from!2850) k!2741)) (bvsge (bvsub (size!32657 a!3475) (bvadd #b00000000000000000000000000000001 from!2850)) (bvsub (size!32657 a!3475) from!2850))))))

(assert (= (and start!93520 res!707395) b!1058821))

(assert (= (and b!1058821 res!707396) b!1058822))

(declare-fun m!978459 () Bool)

(assert (=> start!93520 m!978459))

(declare-fun m!978461 () Bool)

(assert (=> b!1058821 m!978461))

(declare-fun m!978463 () Bool)

(assert (=> b!1058822 m!978463))

(push 1)

(assert (not start!93520))

(assert (not b!1058821))

(check-sat)

(pop 1)

(push 1)

(check-sat)

