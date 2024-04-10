; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92626 () Bool)

(assert start!92626)

(declare-fun res!702185 () Bool)

(declare-fun e!598017 () Bool)

(assert (=> start!92626 (=> (not res!702185) (not e!598017))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66400 0))(
  ( (array!66401 (arr!31938 (Array (_ BitVec 32) (_ BitVec 64))) (size!32474 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66400)

(assert (=> start!92626 (= res!702185 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32474 a!3488)) (bvslt (size!32474 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92626 e!598017))

(assert (=> start!92626 true))

(declare-fun array_inv!24718 (array!66400) Bool)

(assert (=> start!92626 (array_inv!24718 a!3488)))

(declare-fun b!1053095 () Bool)

(assert (=> b!1053095 (= e!598017 false)))

(declare-fun lt!465045 () Bool)

(declare-datatypes ((List!22250 0))(
  ( (Nil!22247) (Cons!22246 (h!23455 (_ BitVec 64)) (t!31557 List!22250)) )
))
(declare-fun arrayNoDuplicates!0 (array!66400 (_ BitVec 32) List!22250) Bool)

(assert (=> b!1053095 (= lt!465045 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22247))))

(assert (= (and start!92626 res!702185) b!1053095))

(declare-fun m!973459 () Bool)

(assert (=> start!92626 m!973459))

(declare-fun m!973461 () Bool)

(assert (=> b!1053095 m!973461))

(push 1)

(assert (not b!1053095))

