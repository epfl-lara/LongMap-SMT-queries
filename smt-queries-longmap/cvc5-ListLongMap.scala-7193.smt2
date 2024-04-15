; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92192 () Bool)

(assert start!92192)

(declare-fun res!697249 () Bool)

(declare-fun e!594371 () Bool)

(assert (=> start!92192 (=> (not res!697249) (not e!594371))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!65961 0))(
  ( (array!65962 (arr!31721 (Array (_ BitVec 32) (_ BitVec 64))) (size!32259 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!65961)

(assert (=> start!92192 (= res!697249 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32259 a!3488)) (bvslt (size!32259 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92192 e!594371))

(assert (=> start!92192 true))

(declare-fun array_inv!24504 (array!65961) Bool)

(assert (=> start!92192 (array_inv!24504 a!3488)))

(declare-fun b!1048003 () Bool)

(assert (=> b!1048003 (= e!594371 false)))

(declare-fun lt!462928 () Bool)

(declare-datatypes ((List!22092 0))(
  ( (Nil!22089) (Cons!22088 (h!23297 (_ BitVec 64)) (t!31390 List!22092)) )
))
(declare-fun arrayNoDuplicates!0 (array!65961 (_ BitVec 32) List!22092) Bool)

(assert (=> b!1048003 (= lt!462928 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22089))))

(assert (= (and start!92192 res!697249) b!1048003))

(declare-fun m!968571 () Bool)

(assert (=> start!92192 m!968571))

(declare-fun m!968573 () Bool)

(assert (=> b!1048003 m!968573))

(push 1)

(assert (not b!1048003))

(assert (not start!92192))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

