; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92806 () Bool)

(assert start!92806)

(declare-fun res!702542 () Bool)

(declare-fun e!598716 () Bool)

(assert (=> start!92806 (=> (not res!702542) (not e!598716))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66422 0))(
  ( (array!66423 (arr!31944 (Array (_ BitVec 32) (_ BitVec 64))) (size!32481 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66422)

(assert (=> start!92806 (= res!702542 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32481 a!3488)) (bvslt (size!32481 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92806 e!598716))

(assert (=> start!92806 true))

(declare-fun array_inv!24726 (array!66422) Bool)

(assert (=> start!92806 (array_inv!24726 a!3488)))

(declare-fun b!1054221 () Bool)

(assert (=> b!1054221 (= e!598716 false)))

(declare-fun lt!465524 () Bool)

(declare-datatypes ((List!22226 0))(
  ( (Nil!22223) (Cons!22222 (h!23440 (_ BitVec 64)) (t!31525 List!22226)) )
))
(declare-fun arrayNoDuplicates!0 (array!66422 (_ BitVec 32) List!22226) Bool)

(assert (=> b!1054221 (= lt!465524 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22223))))

(assert (= (and start!92806 res!702542) b!1054221))

(declare-fun m!974977 () Bool)

(assert (=> start!92806 m!974977))

(declare-fun m!974979 () Bool)

(assert (=> b!1054221 m!974979))

(push 1)

(assert (not b!1054221))

(assert (not start!92806))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

