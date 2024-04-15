; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92624 () Bool)

(assert start!92624)

(declare-fun res!702118 () Bool)

(declare-fun e!597926 () Bool)

(assert (=> start!92624 (=> (not res!702118) (not e!597926))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66339 0))(
  ( (array!66340 (arr!31907 (Array (_ BitVec 32) (_ BitVec 64))) (size!32445 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66339)

(assert (=> start!92624 (= res!702118 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32445 a!3488)) (bvslt (size!32445 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92624 e!597926))

(assert (=> start!92624 true))

(declare-fun array_inv!24690 (array!66339) Bool)

(assert (=> start!92624 (array_inv!24690 a!3488)))

(declare-fun b!1052944 () Bool)

(assert (=> b!1052944 (= e!597926 false)))

(declare-fun lt!464845 () Bool)

(declare-datatypes ((List!22278 0))(
  ( (Nil!22275) (Cons!22274 (h!23483 (_ BitVec 64)) (t!31576 List!22278)) )
))
(declare-fun arrayNoDuplicates!0 (array!66339 (_ BitVec 32) List!22278) Bool)

(assert (=> b!1052944 (= lt!464845 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22275))))

(assert (= (and start!92624 res!702118) b!1052944))

(declare-fun m!972843 () Bool)

(assert (=> start!92624 m!972843))

(declare-fun m!972845 () Bool)

(assert (=> b!1052944 m!972845))

(push 1)

(assert (not start!92624))

(assert (not b!1052944))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

