; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103668 () Bool)

(assert start!103668)

(declare-fun res!828062 () Bool)

(declare-fun e!703795 () Bool)

(assert (=> start!103668 (=> (not res!828062) (not e!703795))))

(declare-datatypes ((array!79948 0))(
  ( (array!79949 (arr!38565 (Array (_ BitVec 32) (_ BitVec 64))) (size!39102 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79948)

(declare-fun from!2953 () (_ BitVec 32))

(declare-fun newFrom!281 () (_ BitVec 32))

(assert (=> start!103668 (= res!828062 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39102 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39102 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103668 e!703795))

(assert (=> start!103668 true))

(declare-fun array_inv!29503 (array!79948) Bool)

(assert (=> start!103668 (array_inv!29503 a!3575)))

(declare-fun b!1241567 () Bool)

(declare-fun res!828063 () Bool)

(assert (=> b!1241567 (=> (not res!828063) (not e!703795))))

(declare-fun k!2808 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79948 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1241567 (= res!828063 (arrayContainsKey!0 a!3575 k!2808 from!2953))))

(declare-fun b!1241568 () Bool)

(assert (=> b!1241568 (= e!703795 (and (bvsle from!2953 newFrom!281) (bvsge newFrom!281 (size!39102 a!3575))))))

(assert (= (and start!103668 res!828062) b!1241567))

(assert (= (and b!1241567 res!828063) b!1241568))

(declare-fun m!1145241 () Bool)

(assert (=> start!103668 m!1145241))

(declare-fun m!1145243 () Bool)

(assert (=> b!1241567 m!1145243))

(push 1)

(assert (not b!1241567))

(assert (not start!103668))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

