; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102870 () Bool)

(assert start!102870)

(declare-fun b!1236406 () Bool)

(declare-fun res!824392 () Bool)

(declare-fun e!700820 () Bool)

(assert (=> b!1236406 (=> (not res!824392) (not e!700820))))

(declare-datatypes ((List!27238 0))(
  ( (Nil!27235) (Cons!27234 (h!28443 (_ BitVec 64)) (t!40701 List!27238)) )
))
(declare-fun acc!846 () List!27238)

(declare-fun contains!7300 (List!27238 (_ BitVec 64)) Bool)

(assert (=> b!1236406 (= res!824392 (not (contains!7300 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236407 () Bool)

(declare-fun res!824388 () Bool)

(assert (=> b!1236407 (=> (not res!824388) (not e!700820))))

(declare-fun noDuplicate!1897 (List!27238) Bool)

(assert (=> b!1236407 (= res!824388 (noDuplicate!1897 acc!846))))

(declare-fun b!1236408 () Bool)

(declare-fun res!824389 () Bool)

(assert (=> b!1236408 (=> (not res!824389) (not e!700820))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1236408 (= res!824389 (contains!7300 acc!846 k!2925))))

(declare-fun b!1236409 () Bool)

(declare-datatypes ((array!79715 0))(
  ( (array!79716 (arr!38465 (Array (_ BitVec 32) (_ BitVec 64))) (size!39001 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79715)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> b!1236409 (= e!700820 (bvslt (bvsub (size!39001 a!3835) from!3213) #b00000000000000000000000000000000))))

(declare-fun b!1236410 () Bool)

(declare-fun res!824390 () Bool)

(assert (=> b!1236410 (=> (not res!824390) (not e!700820))))

(assert (=> b!1236410 (= res!824390 (not (contains!7300 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236405 () Bool)

(declare-fun res!824387 () Bool)

(assert (=> b!1236405 (=> (not res!824387) (not e!700820))))

(declare-fun arrayNoDuplicates!0 (array!79715 (_ BitVec 32) List!27238) Bool)

(assert (=> b!1236405 (= res!824387 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun res!824391 () Bool)

(assert (=> start!102870 (=> (not res!824391) (not e!700820))))

(assert (=> start!102870 (= res!824391 (and (bvslt (size!39001 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39001 a!3835))))))

(assert (=> start!102870 e!700820))

(declare-fun array_inv!29313 (array!79715) Bool)

(assert (=> start!102870 (array_inv!29313 a!3835)))

(assert (=> start!102870 true))

(assert (= (and start!102870 res!824391) b!1236407))

(assert (= (and b!1236407 res!824388) b!1236406))

(assert (= (and b!1236406 res!824392) b!1236410))

(assert (= (and b!1236410 res!824390) b!1236405))

(assert (= (and b!1236405 res!824387) b!1236408))

(assert (= (and b!1236408 res!824389) b!1236409))

(declare-fun m!1140223 () Bool)

(assert (=> b!1236406 m!1140223))

(declare-fun m!1140225 () Bool)

(assert (=> b!1236408 m!1140225))

(declare-fun m!1140227 () Bool)

(assert (=> b!1236405 m!1140227))

(declare-fun m!1140229 () Bool)

(assert (=> b!1236410 m!1140229))

(declare-fun m!1140231 () Bool)

(assert (=> b!1236407 m!1140231))

(declare-fun m!1140233 () Bool)

(assert (=> start!102870 m!1140233))

(push 1)

(assert (not b!1236410))

(assert (not start!102870))

(assert (not b!1236407))

(assert (not b!1236405))

(assert (not b!1236406))

(assert (not b!1236408))

(check-sat)

(pop 1)

(push 1)

(check-sat)

