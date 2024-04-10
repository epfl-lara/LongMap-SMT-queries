; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102676 () Bool)

(assert start!102676)

(declare-fun res!822391 () Bool)

(declare-fun e!700010 () Bool)

(assert (=> start!102676 (=> (not res!822391) (not e!700010))))

(declare-datatypes ((array!79566 0))(
  ( (array!79567 (arr!38392 (Array (_ BitVec 32) (_ BitVec 64))) (size!38928 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79566)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102676 (= res!822391 (and (bvslt (size!38928 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38928 a!3835))))))

(assert (=> start!102676 e!700010))

(declare-fun array_inv!29240 (array!79566) Bool)

(assert (=> start!102676 (array_inv!29240 a!3835)))

(assert (=> start!102676 true))

(declare-fun b!1234209 () Bool)

(declare-fun res!822389 () Bool)

(assert (=> b!1234209 (=> (not res!822389) (not e!700010))))

(declare-datatypes ((List!27165 0))(
  ( (Nil!27162) (Cons!27161 (h!28370 (_ BitVec 64)) (t!40628 List!27165)) )
))
(declare-fun acc!846 () List!27165)

(declare-fun noDuplicate!1824 (List!27165) Bool)

(assert (=> b!1234209 (= res!822389 (noDuplicate!1824 acc!846))))

(declare-fun b!1234210 () Bool)

(declare-fun res!822390 () Bool)

(assert (=> b!1234210 (=> (not res!822390) (not e!700010))))

(declare-fun contains!7227 (List!27165 (_ BitVec 64)) Bool)

(assert (=> b!1234210 (= res!822390 (not (contains!7227 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234211 () Bool)

(assert (=> b!1234211 (= e!700010 false)))

(declare-fun lt!559805 () Bool)

(assert (=> b!1234211 (= lt!559805 (contains!7227 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!102676 res!822391) b!1234209))

(assert (= (and b!1234209 res!822389) b!1234210))

(assert (= (and b!1234210 res!822390) b!1234211))

(declare-fun m!1138217 () Bool)

(assert (=> start!102676 m!1138217))

(declare-fun m!1138219 () Bool)

(assert (=> b!1234209 m!1138219))

(declare-fun m!1138221 () Bool)

(assert (=> b!1234210 m!1138221))

(declare-fun m!1138223 () Bool)

(assert (=> b!1234211 m!1138223))

(push 1)

(assert (not b!1234209))

(assert (not b!1234210))

(assert (not b!1234211))

(assert (not start!102676))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

