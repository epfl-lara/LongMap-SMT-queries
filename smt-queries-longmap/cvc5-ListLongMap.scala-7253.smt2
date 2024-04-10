; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92580 () Bool)

(assert start!92580)

(declare-fun res!702080 () Bool)

(declare-fun e!597897 () Bool)

(assert (=> start!92580 (=> (not res!702080) (not e!597897))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66381 0))(
  ( (array!66382 (arr!31930 (Array (_ BitVec 32) (_ BitVec 64))) (size!32466 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66381)

(assert (=> start!92580 (= res!702080 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32466 a!3488)) (bvslt (size!32466 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92580 e!597897))

(assert (=> start!92580 true))

(declare-fun array_inv!24710 (array!66381) Bool)

(assert (=> start!92580 (array_inv!24710 a!3488)))

(declare-fun b!1052954 () Bool)

(assert (=> b!1052954 (= e!597897 false)))

(declare-fun lt!465012 () Bool)

(declare-datatypes ((List!22242 0))(
  ( (Nil!22239) (Cons!22238 (h!23447 (_ BitVec 64)) (t!31549 List!22242)) )
))
(declare-fun arrayNoDuplicates!0 (array!66381 (_ BitVec 32) List!22242) Bool)

(assert (=> b!1052954 (= lt!465012 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22239))))

(assert (= (and start!92580 res!702080) b!1052954))

(declare-fun m!973349 () Bool)

(assert (=> start!92580 m!973349))

(declare-fun m!973351 () Bool)

(assert (=> b!1052954 m!973351))

(push 1)

(assert (not start!92580))

(assert (not b!1052954))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

