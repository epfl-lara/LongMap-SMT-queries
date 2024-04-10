; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92634 () Bool)

(assert start!92634)

(declare-fun res!702197 () Bool)

(declare-fun e!598041 () Bool)

(assert (=> start!92634 (=> (not res!702197) (not e!598041))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66408 0))(
  ( (array!66409 (arr!31942 (Array (_ BitVec 32) (_ BitVec 64))) (size!32478 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66408)

(assert (=> start!92634 (= res!702197 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32478 a!3488)) (bvslt (size!32478 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92634 e!598041))

(assert (=> start!92634 true))

(declare-fun array_inv!24722 (array!66408) Bool)

(assert (=> start!92634 (array_inv!24722 a!3488)))

(declare-fun b!1053107 () Bool)

(assert (=> b!1053107 (= e!598041 false)))

(declare-fun lt!465057 () Bool)

(declare-datatypes ((List!22254 0))(
  ( (Nil!22251) (Cons!22250 (h!23459 (_ BitVec 64)) (t!31561 List!22254)) )
))
(declare-fun arrayNoDuplicates!0 (array!66408 (_ BitVec 32) List!22254) Bool)

(assert (=> b!1053107 (= lt!465057 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22251))))

(assert (= (and start!92634 res!702197) b!1053107))

(declare-fun m!973475 () Bool)

(assert (=> start!92634 m!973475))

(declare-fun m!973477 () Bool)

(assert (=> b!1053107 m!973477))

(push 1)

(assert (not b!1053107))

(assert (not start!92634))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

