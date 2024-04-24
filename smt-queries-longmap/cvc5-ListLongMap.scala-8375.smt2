; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102094 () Bool)

(assert start!102094)

(declare-fun b!1228005 () Bool)

(declare-fun res!815874 () Bool)

(declare-fun e!697474 () Bool)

(assert (=> b!1228005 (=> (not res!815874) (not e!697474))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1228005 (= res!815874 (validKeyInArray!0 k!2913))))

(declare-fun b!1228006 () Bool)

(declare-fun res!815875 () Bool)

(assert (=> b!1228006 (=> (not res!815875) (not e!697474))))

(declare-datatypes ((List!27022 0))(
  ( (Nil!27019) (Cons!27018 (h!28236 (_ BitVec 64)) (t!40477 List!27022)) )
))
(declare-fun acc!823 () List!27022)

(declare-fun noDuplicate!1674 (List!27022) Bool)

(assert (=> b!1228006 (= res!815875 (noDuplicate!1674 acc!823))))

(declare-fun b!1228007 () Bool)

(declare-fun res!815876 () Bool)

(assert (=> b!1228007 (=> (not res!815876) (not e!697474))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79233 0))(
  ( (array!79234 (arr!38236 (Array (_ BitVec 32) (_ BitVec 64))) (size!38773 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79233)

(assert (=> b!1228007 (= res!815876 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38773 a!3806)) (bvslt from!3184 (size!38773 a!3806))))))

(declare-fun res!815873 () Bool)

(assert (=> start!102094 (=> (not res!815873) (not e!697474))))

(assert (=> start!102094 (= res!815873 (bvslt (size!38773 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102094 e!697474))

(declare-fun array_inv!29174 (array!79233) Bool)

(assert (=> start!102094 (array_inv!29174 a!3806)))

(assert (=> start!102094 true))

(declare-fun b!1228008 () Bool)

(declare-fun res!815872 () Bool)

(assert (=> b!1228008 (=> (not res!815872) (not e!697474))))

(declare-fun contains!7093 (List!27022 (_ BitVec 64)) Bool)

(assert (=> b!1228008 (= res!815872 (not (contains!7093 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228009 () Bool)

(assert (=> b!1228009 (= e!697474 false)))

(declare-fun lt!559335 () Bool)

(assert (=> b!1228009 (= lt!559335 (contains!7093 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!102094 res!815873) b!1228005))

(assert (= (and b!1228005 res!815874) b!1228007))

(assert (= (and b!1228007 res!815876) b!1228006))

(assert (= (and b!1228006 res!815875) b!1228008))

(assert (= (and b!1228008 res!815872) b!1228009))

(declare-fun m!1133309 () Bool)

(assert (=> b!1228008 m!1133309))

(declare-fun m!1133311 () Bool)

(assert (=> b!1228009 m!1133311))

(declare-fun m!1133313 () Bool)

(assert (=> start!102094 m!1133313))

(declare-fun m!1133315 () Bool)

(assert (=> b!1228006 m!1133315))

(declare-fun m!1133317 () Bool)

(assert (=> b!1228005 m!1133317))

(push 1)

(assert (not b!1228006))

(assert (not start!102094))

(assert (not b!1228008))

(assert (not b!1228005))

(assert (not b!1228009))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

