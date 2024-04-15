; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92178 () Bool)

(assert start!92178)

(declare-fun res!697210 () Bool)

(declare-fun e!594329 () Bool)

(assert (=> start!92178 (=> (not res!697210) (not e!594329))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!65947 0))(
  ( (array!65948 (arr!31714 (Array (_ BitVec 32) (_ BitVec 64))) (size!32252 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!65947)

(assert (=> start!92178 (= res!697210 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32252 a!3488)) (bvslt (size!32252 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92178 e!594329))

(assert (=> start!92178 true))

(declare-fun array_inv!24497 (array!65947) Bool)

(assert (=> start!92178 (array_inv!24497 a!3488)))

(declare-fun b!1047964 () Bool)

(assert (=> b!1047964 (= e!594329 false)))

(declare-fun lt!462916 () Bool)

(declare-datatypes ((List!22085 0))(
  ( (Nil!22082) (Cons!22081 (h!23290 (_ BitVec 64)) (t!31383 List!22085)) )
))
(declare-fun arrayNoDuplicates!0 (array!65947 (_ BitVec 32) List!22085) Bool)

(assert (=> b!1047964 (= lt!462916 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22082))))

(assert (= (and start!92178 res!697210) b!1047964))

(declare-fun m!968531 () Bool)

(assert (=> start!92178 m!968531))

(declare-fun m!968533 () Bool)

(assert (=> b!1047964 m!968533))

(push 1)

(assert (not start!92178))

(assert (not b!1047964))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

