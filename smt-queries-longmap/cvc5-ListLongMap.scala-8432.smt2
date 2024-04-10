; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102678 () Bool)

(assert start!102678)

(declare-fun res!822400 () Bool)

(declare-fun e!700017 () Bool)

(assert (=> start!102678 (=> (not res!822400) (not e!700017))))

(declare-datatypes ((array!79568 0))(
  ( (array!79569 (arr!38393 (Array (_ BitVec 32) (_ BitVec 64))) (size!38929 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79568)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102678 (= res!822400 (and (bvslt (size!38929 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38929 a!3835))))))

(assert (=> start!102678 e!700017))

(declare-fun array_inv!29241 (array!79568) Bool)

(assert (=> start!102678 (array_inv!29241 a!3835)))

(assert (=> start!102678 true))

(declare-fun b!1234218 () Bool)

(declare-fun res!822398 () Bool)

(assert (=> b!1234218 (=> (not res!822398) (not e!700017))))

(declare-datatypes ((List!27166 0))(
  ( (Nil!27163) (Cons!27162 (h!28371 (_ BitVec 64)) (t!40629 List!27166)) )
))
(declare-fun acc!846 () List!27166)

(declare-fun noDuplicate!1825 (List!27166) Bool)

(assert (=> b!1234218 (= res!822398 (noDuplicate!1825 acc!846))))

(declare-fun b!1234219 () Bool)

(declare-fun res!822399 () Bool)

(assert (=> b!1234219 (=> (not res!822399) (not e!700017))))

(declare-fun contains!7228 (List!27166 (_ BitVec 64)) Bool)

(assert (=> b!1234219 (= res!822399 (not (contains!7228 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234220 () Bool)

(assert (=> b!1234220 (= e!700017 false)))

(declare-fun lt!559808 () Bool)

(assert (=> b!1234220 (= lt!559808 (contains!7228 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!102678 res!822400) b!1234218))

(assert (= (and b!1234218 res!822398) b!1234219))

(assert (= (and b!1234219 res!822399) b!1234220))

(declare-fun m!1138225 () Bool)

(assert (=> start!102678 m!1138225))

(declare-fun m!1138227 () Bool)

(assert (=> b!1234218 m!1138227))

(declare-fun m!1138229 () Bool)

(assert (=> b!1234219 m!1138229))

(declare-fun m!1138231 () Bool)

(assert (=> b!1234220 m!1138231))

(push 1)

(assert (not b!1234218))

(assert (not b!1234219))

(assert (not b!1234220))

(assert (not start!102678))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

