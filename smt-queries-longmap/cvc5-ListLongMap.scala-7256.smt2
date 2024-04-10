; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92628 () Bool)

(assert start!92628)

(declare-fun res!702188 () Bool)

(declare-fun e!598023 () Bool)

(assert (=> start!92628 (=> (not res!702188) (not e!598023))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66402 0))(
  ( (array!66403 (arr!31939 (Array (_ BitVec 32) (_ BitVec 64))) (size!32475 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66402)

(assert (=> start!92628 (= res!702188 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32475 a!3488)) (bvslt (size!32475 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92628 e!598023))

(assert (=> start!92628 true))

(declare-fun array_inv!24719 (array!66402) Bool)

(assert (=> start!92628 (array_inv!24719 a!3488)))

(declare-fun b!1053098 () Bool)

(assert (=> b!1053098 (= e!598023 false)))

(declare-fun lt!465048 () Bool)

(declare-datatypes ((List!22251 0))(
  ( (Nil!22248) (Cons!22247 (h!23456 (_ BitVec 64)) (t!31558 List!22251)) )
))
(declare-fun arrayNoDuplicates!0 (array!66402 (_ BitVec 32) List!22251) Bool)

(assert (=> b!1053098 (= lt!465048 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22248))))

(assert (= (and start!92628 res!702188) b!1053098))

(declare-fun m!973463 () Bool)

(assert (=> start!92628 m!973463))

(declare-fun m!973465 () Bool)

(assert (=> b!1053098 m!973465))

(push 1)

(assert (not b!1053098))

(assert (not start!92628))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

