; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92632 () Bool)

(assert start!92632)

(declare-fun res!702194 () Bool)

(declare-fun e!598035 () Bool)

(assert (=> start!92632 (=> (not res!702194) (not e!598035))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66406 0))(
  ( (array!66407 (arr!31941 (Array (_ BitVec 32) (_ BitVec 64))) (size!32477 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66406)

(assert (=> start!92632 (= res!702194 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32477 a!3488)) (bvslt (size!32477 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92632 e!598035))

(assert (=> start!92632 true))

(declare-fun array_inv!24721 (array!66406) Bool)

(assert (=> start!92632 (array_inv!24721 a!3488)))

(declare-fun b!1053104 () Bool)

(assert (=> b!1053104 (= e!598035 false)))

(declare-fun lt!465054 () Bool)

(declare-datatypes ((List!22253 0))(
  ( (Nil!22250) (Cons!22249 (h!23458 (_ BitVec 64)) (t!31560 List!22253)) )
))
(declare-fun arrayNoDuplicates!0 (array!66406 (_ BitVec 32) List!22253) Bool)

(assert (=> b!1053104 (= lt!465054 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22250))))

(assert (= (and start!92632 res!702194) b!1053104))

(declare-fun m!973471 () Bool)

(assert (=> start!92632 m!973471))

(declare-fun m!973473 () Bool)

(assert (=> b!1053104 m!973473))

(push 1)

(assert (not start!92632))

(assert (not b!1053104))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

