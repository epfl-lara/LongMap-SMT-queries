; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102926 () Bool)

(assert start!102926)

(declare-fun res!822976 () Bool)

(declare-fun e!700910 () Bool)

(assert (=> start!102926 (=> (not res!822976) (not e!700910))))

(declare-datatypes ((array!79614 0))(
  ( (array!79615 (arr!38410 (Array (_ BitVec 32) (_ BitVec 64))) (size!38947 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79614)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102926 (= res!822976 (and (bvslt (size!38947 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38947 a!3835))))))

(assert (=> start!102926 e!700910))

(declare-fun array_inv!29348 (array!79614) Bool)

(assert (=> start!102926 (array_inv!29348 a!3835)))

(assert (=> start!102926 true))

(declare-fun b!1235587 () Bool)

(declare-fun res!822978 () Bool)

(assert (=> b!1235587 (=> (not res!822978) (not e!700910))))

(declare-datatypes ((List!27196 0))(
  ( (Nil!27193) (Cons!27192 (h!28410 (_ BitVec 64)) (t!40651 List!27196)) )
))
(declare-fun acc!846 () List!27196)

(declare-fun noDuplicate!1848 (List!27196) Bool)

(assert (=> b!1235587 (= res!822978 (noDuplicate!1848 acc!846))))

(declare-fun b!1235588 () Bool)

(declare-fun res!822977 () Bool)

(assert (=> b!1235588 (=> (not res!822977) (not e!700910))))

(declare-fun contains!7267 (List!27196 (_ BitVec 64)) Bool)

(assert (=> b!1235588 (= res!822977 (not (contains!7267 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235589 () Bool)

(assert (=> b!1235589 (= e!700910 false)))

(declare-fun lt!560309 () Bool)

(assert (=> b!1235589 (= lt!560309 (contains!7267 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!102926 res!822976) b!1235587))

(assert (= (and b!1235587 res!822978) b!1235588))

(assert (= (and b!1235588 res!822977) b!1235589))

(declare-fun m!1139913 () Bool)

(assert (=> start!102926 m!1139913))

(declare-fun m!1139915 () Bool)

(assert (=> b!1235587 m!1139915))

(declare-fun m!1139917 () Bool)

(assert (=> b!1235588 m!1139917))

(declare-fun m!1139919 () Bool)

(assert (=> b!1235589 m!1139919))

(push 1)

(assert (not b!1235589))

(assert (not b!1235588))

(assert (not start!102926))

(assert (not b!1235587))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

