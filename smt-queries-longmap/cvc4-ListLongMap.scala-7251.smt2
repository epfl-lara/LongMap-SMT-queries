; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92572 () Bool)

(assert start!92572)

(declare-fun res!702032 () Bool)

(declare-fun e!597873 () Bool)

(assert (=> start!92572 (=> (not res!702032) (not e!597873))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66373 0))(
  ( (array!66374 (arr!31926 (Array (_ BitVec 32) (_ BitVec 64))) (size!32462 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66373)

(assert (=> start!92572 (= res!702032 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32462 a!3488)) (bvslt (size!32462 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92572 e!597873))

(assert (=> start!92572 true))

(declare-fun array_inv!24706 (array!66373) Bool)

(assert (=> start!92572 (array_inv!24706 a!3488)))

(declare-fun b!1052906 () Bool)

(assert (=> b!1052906 (= e!597873 false)))

(declare-fun lt!465009 () Bool)

(declare-datatypes ((List!22238 0))(
  ( (Nil!22235) (Cons!22234 (h!23443 (_ BitVec 64)) (t!31545 List!22238)) )
))
(declare-fun arrayNoDuplicates!0 (array!66373 (_ BitVec 32) List!22238) Bool)

(assert (=> b!1052906 (= lt!465009 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22235))))

(assert (= (and start!92572 res!702032) b!1052906))

(declare-fun m!973309 () Bool)

(assert (=> start!92572 m!973309))

(declare-fun m!973311 () Bool)

(assert (=> b!1052906 m!973311))

(push 1)

(assert (not start!92572))

(assert (not b!1052906))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

