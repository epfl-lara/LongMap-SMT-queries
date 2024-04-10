; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102858 () Bool)

(assert start!102858)

(declare-fun res!824298 () Bool)

(declare-fun e!700784 () Bool)

(assert (=> start!102858 (=> (not res!824298) (not e!700784))))

(declare-datatypes ((array!79703 0))(
  ( (array!79704 (arr!38459 (Array (_ BitVec 32) (_ BitVec 64))) (size!38995 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79703)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102858 (= res!824298 (and (bvslt (size!38995 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38995 a!3835))))))

(assert (=> start!102858 e!700784))

(declare-fun array_inv!29307 (array!79703) Bool)

(assert (=> start!102858 (array_inv!29307 a!3835)))

(assert (=> start!102858 true))

(declare-fun b!1236313 () Bool)

(declare-fun res!824296 () Bool)

(assert (=> b!1236313 (=> (not res!824296) (not e!700784))))

(declare-datatypes ((List!27232 0))(
  ( (Nil!27229) (Cons!27228 (h!28437 (_ BitVec 64)) (t!40695 List!27232)) )
))
(declare-fun acc!846 () List!27232)

(declare-fun contains!7294 (List!27232 (_ BitVec 64)) Bool)

(assert (=> b!1236313 (= res!824296 (not (contains!7294 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236314 () Bool)

(declare-fun res!824295 () Bool)

(assert (=> b!1236314 (=> (not res!824295) (not e!700784))))

(declare-fun arrayNoDuplicates!0 (array!79703 (_ BitVec 32) List!27232) Bool)

(assert (=> b!1236314 (= res!824295 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1236315 () Bool)

(declare-fun res!824297 () Bool)

(assert (=> b!1236315 (=> (not res!824297) (not e!700784))))

(declare-fun noDuplicate!1891 (List!27232) Bool)

(assert (=> b!1236315 (= res!824297 (noDuplicate!1891 acc!846))))

(declare-fun b!1236316 () Bool)

(declare-fun res!824299 () Bool)

(assert (=> b!1236316 (=> (not res!824299) (not e!700784))))

(assert (=> b!1236316 (= res!824299 (not (contains!7294 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236317 () Bool)

(assert (=> b!1236317 (= e!700784 false)))

(declare-fun lt!560777 () Bool)

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1236317 (= lt!560777 (contains!7294 acc!846 k!2925))))

(assert (= (and start!102858 res!824298) b!1236315))

(assert (= (and b!1236315 res!824297) b!1236316))

(assert (= (and b!1236316 res!824299) b!1236313))

(assert (= (and b!1236313 res!824296) b!1236314))

(assert (= (and b!1236314 res!824295) b!1236317))

(declare-fun m!1140151 () Bool)

(assert (=> b!1236317 m!1140151))

(declare-fun m!1140153 () Bool)

(assert (=> b!1236315 m!1140153))

(declare-fun m!1140155 () Bool)

(assert (=> start!102858 m!1140155))

(declare-fun m!1140157 () Bool)

(assert (=> b!1236316 m!1140157))

(declare-fun m!1140159 () Bool)

(assert (=> b!1236314 m!1140159))

(declare-fun m!1140161 () Bool)

(assert (=> b!1236313 m!1140161))

(push 1)

(assert (not b!1236317))

(assert (not b!1236313))

(assert (not start!102858))

(assert (not b!1236316))

(assert (not b!1236314))

(assert (not b!1236315))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

