; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92182 () Bool)

(assert start!92182)

(declare-fun res!697280 () Bool)

(declare-fun e!594426 () Bool)

(assert (=> start!92182 (=> (not res!697280) (not e!594426))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66010 0))(
  ( (array!66011 (arr!31746 (Array (_ BitVec 32) (_ BitVec 64))) (size!32282 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66010)

(assert (=> start!92182 (= res!697280 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32282 a!3488)) (bvslt (size!32282 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92182 e!594426))

(assert (=> start!92182 true))

(declare-fun array_inv!24526 (array!66010) Bool)

(assert (=> start!92182 (array_inv!24526 a!3488)))

(declare-fun b!1048118 () Bool)

(assert (=> b!1048118 (= e!594426 false)))

(declare-fun lt!463119 () Bool)

(declare-datatypes ((List!22058 0))(
  ( (Nil!22055) (Cons!22054 (h!23263 (_ BitVec 64)) (t!31365 List!22058)) )
))
(declare-fun arrayNoDuplicates!0 (array!66010 (_ BitVec 32) List!22058) Bool)

(assert (=> b!1048118 (= lt!463119 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22055))))

(assert (= (and start!92182 res!697280) b!1048118))

(declare-fun m!969151 () Bool)

(assert (=> start!92182 m!969151))

(declare-fun m!969153 () Bool)

(assert (=> b!1048118 m!969153))

(push 1)

(assert (not start!92182))

