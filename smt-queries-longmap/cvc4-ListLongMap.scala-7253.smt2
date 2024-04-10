; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92584 () Bool)

(assert start!92584)

(declare-fun res!702086 () Bool)

(declare-fun e!597909 () Bool)

(assert (=> start!92584 (=> (not res!702086) (not e!597909))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66385 0))(
  ( (array!66386 (arr!31932 (Array (_ BitVec 32) (_ BitVec 64))) (size!32468 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66385)

(assert (=> start!92584 (= res!702086 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32468 a!3488)) (bvslt (size!32468 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92584 e!597909))

(assert (=> start!92584 true))

(declare-fun array_inv!24712 (array!66385) Bool)

(assert (=> start!92584 (array_inv!24712 a!3488)))

(declare-fun b!1052960 () Bool)

(assert (=> b!1052960 (= e!597909 false)))

(declare-fun lt!465018 () Bool)

(declare-datatypes ((List!22244 0))(
  ( (Nil!22241) (Cons!22240 (h!23449 (_ BitVec 64)) (t!31551 List!22244)) )
))
(declare-fun arrayNoDuplicates!0 (array!66385 (_ BitVec 32) List!22244) Bool)

(assert (=> b!1052960 (= lt!465018 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22241))))

(assert (= (and start!92584 res!702086) b!1052960))

(declare-fun m!973357 () Bool)

(assert (=> start!92584 m!973357))

(declare-fun m!973359 () Bool)

(assert (=> b!1052960 m!973359))

(push 1)

(assert (not start!92584))

(assert (not b!1052960))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

