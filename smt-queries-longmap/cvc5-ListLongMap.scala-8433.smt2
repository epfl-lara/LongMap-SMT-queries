; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102684 () Bool)

(assert start!102684)

(declare-fun res!822426 () Bool)

(declare-fun e!700034 () Bool)

(assert (=> start!102684 (=> (not res!822426) (not e!700034))))

(declare-datatypes ((array!79574 0))(
  ( (array!79575 (arr!38396 (Array (_ BitVec 32) (_ BitVec 64))) (size!38932 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79574)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102684 (= res!822426 (and (bvslt (size!38932 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38932 a!3835))))))

(assert (=> start!102684 e!700034))

(declare-fun array_inv!29244 (array!79574) Bool)

(assert (=> start!102684 (array_inv!29244 a!3835)))

(assert (=> start!102684 true))

(declare-fun b!1234245 () Bool)

(declare-fun res!822425 () Bool)

(assert (=> b!1234245 (=> (not res!822425) (not e!700034))))

(declare-datatypes ((List!27169 0))(
  ( (Nil!27166) (Cons!27165 (h!28374 (_ BitVec 64)) (t!40632 List!27169)) )
))
(declare-fun acc!846 () List!27169)

(declare-fun noDuplicate!1828 (List!27169) Bool)

(assert (=> b!1234245 (= res!822425 (noDuplicate!1828 acc!846))))

(declare-fun b!1234246 () Bool)

(declare-fun res!822427 () Bool)

(assert (=> b!1234246 (=> (not res!822427) (not e!700034))))

(declare-fun contains!7231 (List!27169 (_ BitVec 64)) Bool)

(assert (=> b!1234246 (= res!822427 (not (contains!7231 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234247 () Bool)

(assert (=> b!1234247 (= e!700034 false)))

(declare-fun lt!559817 () Bool)

(assert (=> b!1234247 (= lt!559817 (contains!7231 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!102684 res!822426) b!1234245))

(assert (= (and b!1234245 res!822425) b!1234246))

(assert (= (and b!1234246 res!822427) b!1234247))

(declare-fun m!1138249 () Bool)

(assert (=> start!102684 m!1138249))

(declare-fun m!1138251 () Bool)

(assert (=> b!1234245 m!1138251))

(declare-fun m!1138253 () Bool)

(assert (=> b!1234246 m!1138253))

(declare-fun m!1138255 () Bool)

(assert (=> b!1234247 m!1138255))

(push 1)

(assert (not b!1234245))

(assert (not b!1234247))

(assert (not start!102684))

(assert (not b!1234246))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

