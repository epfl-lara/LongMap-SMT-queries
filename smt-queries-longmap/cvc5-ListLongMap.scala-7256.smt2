; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92630 () Bool)

(assert start!92630)

(declare-fun res!702127 () Bool)

(declare-fun e!597944 () Bool)

(assert (=> start!92630 (=> (not res!702127) (not e!597944))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66345 0))(
  ( (array!66346 (arr!31910 (Array (_ BitVec 32) (_ BitVec 64))) (size!32448 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66345)

(assert (=> start!92630 (= res!702127 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32448 a!3488)) (bvslt (size!32448 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92630 e!597944))

(assert (=> start!92630 true))

(declare-fun array_inv!24693 (array!66345) Bool)

(assert (=> start!92630 (array_inv!24693 a!3488)))

(declare-fun b!1052953 () Bool)

(assert (=> b!1052953 (= e!597944 false)))

(declare-fun lt!464854 () Bool)

(declare-datatypes ((List!22281 0))(
  ( (Nil!22278) (Cons!22277 (h!23486 (_ BitVec 64)) (t!31579 List!22281)) )
))
(declare-fun arrayNoDuplicates!0 (array!66345 (_ BitVec 32) List!22281) Bool)

(assert (=> b!1052953 (= lt!464854 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22278))))

(assert (= (and start!92630 res!702127) b!1052953))

(declare-fun m!972855 () Bool)

(assert (=> start!92630 m!972855))

(declare-fun m!972857 () Bool)

(assert (=> b!1052953 m!972857))

(push 1)

(assert (not b!1052953))

(assert (not start!92630))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

