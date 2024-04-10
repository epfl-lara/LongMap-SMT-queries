; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102670 () Bool)

(assert start!102670)

(declare-fun res!822361 () Bool)

(declare-fun e!699992 () Bool)

(assert (=> start!102670 (=> (not res!822361) (not e!699992))))

(declare-datatypes ((array!79560 0))(
  ( (array!79561 (arr!38389 (Array (_ BitVec 32) (_ BitVec 64))) (size!38925 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79560)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102670 (= res!822361 (and (bvslt (size!38925 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38925 a!3835))))))

(assert (=> start!102670 e!699992))

(declare-fun array_inv!29237 (array!79560) Bool)

(assert (=> start!102670 (array_inv!29237 a!3835)))

(assert (=> start!102670 true))

(declare-fun b!1234183 () Bool)

(declare-fun res!822363 () Bool)

(assert (=> b!1234183 (=> (not res!822363) (not e!699992))))

(declare-datatypes ((List!27162 0))(
  ( (Nil!27159) (Cons!27158 (h!28367 (_ BitVec 64)) (t!40625 List!27162)) )
))
(declare-fun acc!846 () List!27162)

(declare-fun contains!7224 (List!27162 (_ BitVec 64)) Bool)

(assert (=> b!1234183 (= res!822363 (not (contains!7224 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234184 () Bool)

(assert (=> b!1234184 (= e!699992 (bvsgt from!3213 (size!38925 a!3835)))))

(declare-fun b!1234182 () Bool)

(declare-fun res!822362 () Bool)

(assert (=> b!1234182 (=> (not res!822362) (not e!699992))))

(assert (=> b!1234182 (= res!822362 (not (contains!7224 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234181 () Bool)

(declare-fun res!822364 () Bool)

(assert (=> b!1234181 (=> (not res!822364) (not e!699992))))

(declare-fun noDuplicate!1821 (List!27162) Bool)

(assert (=> b!1234181 (= res!822364 (noDuplicate!1821 acc!846))))

(assert (= (and start!102670 res!822361) b!1234181))

(assert (= (and b!1234181 res!822364) b!1234182))

(assert (= (and b!1234182 res!822362) b!1234183))

(assert (= (and b!1234183 res!822363) b!1234184))

(declare-fun m!1138193 () Bool)

(assert (=> start!102670 m!1138193))

(declare-fun m!1138195 () Bool)

(assert (=> b!1234183 m!1138195))

(declare-fun m!1138197 () Bool)

(assert (=> b!1234182 m!1138197))

(declare-fun m!1138199 () Bool)

(assert (=> b!1234181 m!1138199))

(push 1)

(assert (not b!1234181))

(assert (not start!102670))

(assert (not b!1234182))

(assert (not b!1234183))

(check-sat)

(pop 1)

(push 1)

(check-sat)

