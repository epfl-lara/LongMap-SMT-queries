; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92578 () Bool)

(assert start!92578)

(declare-fun b!1052947 () Bool)

(declare-fun res!702074 () Bool)

(declare-fun e!597892 () Bool)

(assert (=> b!1052947 (=> (not res!702074) (not e!597892))))

(declare-datatypes ((array!66379 0))(
  ( (array!66380 (arr!31929 (Array (_ BitVec 32) (_ BitVec 64))) (size!32465 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66379)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1052947 (= res!702074 (= (select (arr!31929 a!3488) i!1381) k!2747))))

(declare-fun b!1052948 () Bool)

(declare-fun res!702073 () Bool)

(assert (=> b!1052948 (=> (not res!702073) (not e!597892))))

(declare-datatypes ((List!22241 0))(
  ( (Nil!22238) (Cons!22237 (h!23446 (_ BitVec 64)) (t!31548 List!22241)) )
))
(declare-fun arrayNoDuplicates!0 (array!66379 (_ BitVec 32) List!22241) Bool)

(assert (=> b!1052948 (= res!702073 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22238))))

(declare-fun b!1052949 () Bool)

(assert (=> b!1052949 (= e!597892 (bvsge #b00000000000000000000000000000000 (size!32465 a!3488)))))

(declare-fun res!702075 () Bool)

(assert (=> start!92578 (=> (not res!702075) (not e!597892))))

(assert (=> start!92578 (= res!702075 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32465 a!3488)) (bvslt (size!32465 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92578 e!597892))

(assert (=> start!92578 true))

(declare-fun array_inv!24709 (array!66379) Bool)

(assert (=> start!92578 (array_inv!24709 a!3488)))

(declare-fun b!1052950 () Bool)

(declare-fun res!702076 () Bool)

(assert (=> b!1052950 (=> (not res!702076) (not e!597892))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052950 (= res!702076 (validKeyInArray!0 k!2747))))

(declare-fun b!1052951 () Bool)

(declare-fun res!702077 () Bool)

(assert (=> b!1052951 (=> (not res!702077) (not e!597892))))

(declare-fun arrayContainsKey!0 (array!66379 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052951 (= res!702077 (not (arrayContainsKey!0 (array!66380 (store (arr!31929 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32465 a!3488)) k!2747 #b00000000000000000000000000000000)))))

(assert (= (and start!92578 res!702075) b!1052948))

(assert (= (and b!1052948 res!702073) b!1052950))

(assert (= (and b!1052950 res!702076) b!1052947))

(assert (= (and b!1052947 res!702074) b!1052951))

(assert (= (and b!1052951 res!702077) b!1052949))

(declare-fun m!973337 () Bool)

(assert (=> b!1052947 m!973337))

(declare-fun m!973339 () Bool)

(assert (=> b!1052948 m!973339))

(declare-fun m!973341 () Bool)

(assert (=> b!1052951 m!973341))

(declare-fun m!973343 () Bool)

(assert (=> b!1052951 m!973343))

(declare-fun m!973345 () Bool)

(assert (=> b!1052950 m!973345))

(declare-fun m!973347 () Bool)

(assert (=> start!92578 m!973347))

(push 1)

(assert (not b!1052948))

(assert (not start!92578))

(assert (not b!1052951))

(assert (not b!1052950))

(check-sat)

(pop 1)

(push 1)

(check-sat)

