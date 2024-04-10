; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92194 () Bool)

(assert start!92194)

(declare-fun res!697316 () Bool)

(declare-fun e!594462 () Bool)

(assert (=> start!92194 (=> (not res!697316) (not e!594462))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66022 0))(
  ( (array!66023 (arr!31752 (Array (_ BitVec 32) (_ BitVec 64))) (size!32288 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66022)

(assert (=> start!92194 (= res!697316 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32288 a!3488)) (bvslt (size!32288 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92194 e!594462))

(assert (=> start!92194 true))

(declare-fun array_inv!24532 (array!66022) Bool)

(assert (=> start!92194 (array_inv!24532 a!3488)))

(declare-fun b!1048154 () Bool)

(assert (=> b!1048154 (= e!594462 false)))

(declare-fun lt!463128 () Bool)

(declare-datatypes ((List!22064 0))(
  ( (Nil!22061) (Cons!22060 (h!23269 (_ BitVec 64)) (t!31371 List!22064)) )
))
(declare-fun arrayNoDuplicates!0 (array!66022 (_ BitVec 32) List!22064) Bool)

(assert (=> b!1048154 (= lt!463128 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22061))))

(assert (= (and start!92194 res!697316) b!1048154))

(declare-fun m!969187 () Bool)

(assert (=> start!92194 m!969187))

(declare-fun m!969189 () Bool)

(assert (=> b!1048154 m!969189))

(push 1)

(assert (not b!1048154))

(assert (not start!92194))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

