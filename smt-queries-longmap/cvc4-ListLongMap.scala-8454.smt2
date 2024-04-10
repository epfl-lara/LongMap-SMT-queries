; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102862 () Bool)

(assert start!102862)

(declare-fun b!1236343 () Bool)

(declare-fun res!824329 () Bool)

(declare-fun e!700796 () Bool)

(assert (=> b!1236343 (=> (not res!824329) (not e!700796))))

(declare-datatypes ((List!27234 0))(
  ( (Nil!27231) (Cons!27230 (h!28439 (_ BitVec 64)) (t!40697 List!27234)) )
))
(declare-fun acc!846 () List!27234)

(declare-fun noDuplicate!1893 (List!27234) Bool)

(assert (=> b!1236343 (= res!824329 (noDuplicate!1893 acc!846))))

(declare-fun res!824325 () Bool)

(assert (=> start!102862 (=> (not res!824325) (not e!700796))))

(declare-datatypes ((array!79707 0))(
  ( (array!79708 (arr!38461 (Array (_ BitVec 32) (_ BitVec 64))) (size!38997 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79707)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102862 (= res!824325 (and (bvslt (size!38997 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38997 a!3835))))))

(assert (=> start!102862 e!700796))

(declare-fun array_inv!29309 (array!79707) Bool)

(assert (=> start!102862 (array_inv!29309 a!3835)))

(assert (=> start!102862 true))

(declare-fun b!1236344 () Bool)

(declare-fun res!824326 () Bool)

(assert (=> b!1236344 (=> (not res!824326) (not e!700796))))

(declare-fun arrayNoDuplicates!0 (array!79707 (_ BitVec 32) List!27234) Bool)

(assert (=> b!1236344 (= res!824326 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1236345 () Bool)

(assert (=> b!1236345 (= e!700796 false)))

(declare-fun lt!560783 () Bool)

(declare-fun k!2925 () (_ BitVec 64))

(declare-fun contains!7296 (List!27234 (_ BitVec 64)) Bool)

(assert (=> b!1236345 (= lt!560783 (contains!7296 acc!846 k!2925))))

(declare-fun b!1236346 () Bool)

(declare-fun res!824328 () Bool)

(assert (=> b!1236346 (=> (not res!824328) (not e!700796))))

(assert (=> b!1236346 (= res!824328 (not (contains!7296 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236347 () Bool)

(declare-fun res!824327 () Bool)

(assert (=> b!1236347 (=> (not res!824327) (not e!700796))))

(assert (=> b!1236347 (= res!824327 (not (contains!7296 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102862 res!824325) b!1236343))

(assert (= (and b!1236343 res!824329) b!1236346))

(assert (= (and b!1236346 res!824328) b!1236347))

(assert (= (and b!1236347 res!824327) b!1236344))

(assert (= (and b!1236344 res!824326) b!1236345))

(declare-fun m!1140175 () Bool)

(assert (=> b!1236345 m!1140175))

(declare-fun m!1140177 () Bool)

(assert (=> b!1236346 m!1140177))

(declare-fun m!1140179 () Bool)

(assert (=> b!1236344 m!1140179))

(declare-fun m!1140181 () Bool)

(assert (=> b!1236347 m!1140181))

(declare-fun m!1140183 () Bool)

(assert (=> start!102862 m!1140183))

(declare-fun m!1140185 () Bool)

(assert (=> b!1236343 m!1140185))

(push 1)

(assert (not start!102862))

(assert (not b!1236347))

(assert (not b!1236346))

(assert (not b!1236343))

(assert (not b!1236344))

(assert (not b!1236345))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

