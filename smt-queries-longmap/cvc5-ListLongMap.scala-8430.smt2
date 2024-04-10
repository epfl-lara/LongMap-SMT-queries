; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102666 () Bool)

(assert start!102666)

(declare-fun res!822340 () Bool)

(declare-fun e!699980 () Bool)

(assert (=> start!102666 (=> (not res!822340) (not e!699980))))

(declare-datatypes ((array!79556 0))(
  ( (array!79557 (arr!38387 (Array (_ BitVec 32) (_ BitVec 64))) (size!38923 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79556)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102666 (= res!822340 (and (bvslt (size!38923 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38923 a!3835))))))

(assert (=> start!102666 e!699980))

(declare-fun array_inv!29235 (array!79556) Bool)

(assert (=> start!102666 (array_inv!29235 a!3835)))

(assert (=> start!102666 true))

(declare-fun b!1234160 () Bool)

(assert (=> b!1234160 (= e!699980 (bvsgt from!3213 (size!38923 a!3835)))))

(declare-fun b!1234159 () Bool)

(declare-fun res!822338 () Bool)

(assert (=> b!1234159 (=> (not res!822338) (not e!699980))))

(declare-datatypes ((List!27160 0))(
  ( (Nil!27157) (Cons!27156 (h!28365 (_ BitVec 64)) (t!40623 List!27160)) )
))
(declare-fun acc!846 () List!27160)

(declare-fun contains!7222 (List!27160 (_ BitVec 64)) Bool)

(assert (=> b!1234159 (= res!822338 (not (contains!7222 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234157 () Bool)

(declare-fun res!822337 () Bool)

(assert (=> b!1234157 (=> (not res!822337) (not e!699980))))

(declare-fun noDuplicate!1819 (List!27160) Bool)

(assert (=> b!1234157 (= res!822337 (noDuplicate!1819 acc!846))))

(declare-fun b!1234158 () Bool)

(declare-fun res!822339 () Bool)

(assert (=> b!1234158 (=> (not res!822339) (not e!699980))))

(assert (=> b!1234158 (= res!822339 (not (contains!7222 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102666 res!822340) b!1234157))

(assert (= (and b!1234157 res!822337) b!1234158))

(assert (= (and b!1234158 res!822339) b!1234159))

(assert (= (and b!1234159 res!822338) b!1234160))

(declare-fun m!1138177 () Bool)

(assert (=> start!102666 m!1138177))

(declare-fun m!1138179 () Bool)

(assert (=> b!1234159 m!1138179))

(declare-fun m!1138181 () Bool)

(assert (=> b!1234157 m!1138181))

(declare-fun m!1138183 () Bool)

(assert (=> b!1234158 m!1138183))

(push 1)

(assert (not b!1234158))

(assert (not b!1234159))

(assert (not b!1234157))

(assert (not start!102666))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

