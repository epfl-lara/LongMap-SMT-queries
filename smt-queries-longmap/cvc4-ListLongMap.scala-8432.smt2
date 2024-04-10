; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102682 () Bool)

(assert start!102682)

(declare-fun res!822418 () Bool)

(declare-fun e!700028 () Bool)

(assert (=> start!102682 (=> (not res!822418) (not e!700028))))

(declare-datatypes ((array!79572 0))(
  ( (array!79573 (arr!38395 (Array (_ BitVec 32) (_ BitVec 64))) (size!38931 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79572)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102682 (= res!822418 (and (bvslt (size!38931 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38931 a!3835))))))

(assert (=> start!102682 e!700028))

(declare-fun array_inv!29243 (array!79572) Bool)

(assert (=> start!102682 (array_inv!29243 a!3835)))

(assert (=> start!102682 true))

(declare-fun b!1234236 () Bool)

(declare-fun res!822416 () Bool)

(assert (=> b!1234236 (=> (not res!822416) (not e!700028))))

(declare-datatypes ((List!27168 0))(
  ( (Nil!27165) (Cons!27164 (h!28373 (_ BitVec 64)) (t!40631 List!27168)) )
))
(declare-fun acc!846 () List!27168)

(declare-fun noDuplicate!1827 (List!27168) Bool)

(assert (=> b!1234236 (= res!822416 (noDuplicate!1827 acc!846))))

(declare-fun b!1234237 () Bool)

(declare-fun res!822417 () Bool)

(assert (=> b!1234237 (=> (not res!822417) (not e!700028))))

(declare-fun contains!7230 (List!27168 (_ BitVec 64)) Bool)

(assert (=> b!1234237 (= res!822417 (not (contains!7230 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234238 () Bool)

(assert (=> b!1234238 (= e!700028 false)))

(declare-fun lt!559814 () Bool)

(assert (=> b!1234238 (= lt!559814 (contains!7230 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!102682 res!822418) b!1234236))

(assert (= (and b!1234236 res!822416) b!1234237))

(assert (= (and b!1234237 res!822417) b!1234238))

(declare-fun m!1138241 () Bool)

(assert (=> start!102682 m!1138241))

(declare-fun m!1138243 () Bool)

(assert (=> b!1234236 m!1138243))

(declare-fun m!1138245 () Bool)

(assert (=> b!1234237 m!1138245))

(declare-fun m!1138247 () Bool)

(assert (=> b!1234238 m!1138247))

(push 1)

(assert (not b!1234238))

(assert (not start!102682))

(assert (not b!1234237))

(assert (not b!1234236))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

