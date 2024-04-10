; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102876 () Bool)

(assert start!102876)

(declare-fun res!824439 () Bool)

(declare-fun e!700838 () Bool)

(assert (=> start!102876 (=> (not res!824439) (not e!700838))))

(declare-datatypes ((array!79721 0))(
  ( (array!79722 (arr!38468 (Array (_ BitVec 32) (_ BitVec 64))) (size!39004 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79721)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102876 (= res!824439 (and (bvslt (size!39004 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39004 a!3835))))))

(assert (=> start!102876 e!700838))

(declare-fun array_inv!29316 (array!79721) Bool)

(assert (=> start!102876 (array_inv!29316 a!3835)))

(assert (=> start!102876 true))

(declare-fun b!1236457 () Bool)

(declare-fun res!824440 () Bool)

(assert (=> b!1236457 (=> (not res!824440) (not e!700838))))

(declare-datatypes ((List!27241 0))(
  ( (Nil!27238) (Cons!27237 (h!28446 (_ BitVec 64)) (t!40704 List!27241)) )
))
(declare-fun acc!846 () List!27241)

(declare-fun arrayNoDuplicates!0 (array!79721 (_ BitVec 32) List!27241) Bool)

(assert (=> b!1236457 (= res!824440 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1236458 () Bool)

(declare-fun res!824443 () Bool)

(assert (=> b!1236458 (=> (not res!824443) (not e!700838))))

(declare-fun contains!7303 (List!27241 (_ BitVec 64)) Bool)

(assert (=> b!1236458 (= res!824443 (not (contains!7303 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236459 () Bool)

(assert (=> b!1236459 (= e!700838 false)))

(declare-fun lt!560795 () Bool)

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1236459 (= lt!560795 (contains!7303 acc!846 k!2925))))

(declare-fun b!1236460 () Bool)

(declare-fun res!824442 () Bool)

(assert (=> b!1236460 (=> (not res!824442) (not e!700838))))

(assert (=> b!1236460 (= res!824442 (not (contains!7303 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236461 () Bool)

(declare-fun res!824441 () Bool)

(assert (=> b!1236461 (=> (not res!824441) (not e!700838))))

(declare-fun noDuplicate!1900 (List!27241) Bool)

(assert (=> b!1236461 (= res!824441 (noDuplicate!1900 acc!846))))

(assert (= (and start!102876 res!824439) b!1236461))

(assert (= (and b!1236461 res!824441) b!1236458))

(assert (= (and b!1236458 res!824443) b!1236460))

(assert (= (and b!1236460 res!824442) b!1236457))

(assert (= (and b!1236457 res!824440) b!1236459))

(declare-fun m!1140259 () Bool)

(assert (=> b!1236461 m!1140259))

(declare-fun m!1140261 () Bool)

(assert (=> b!1236457 m!1140261))

(declare-fun m!1140263 () Bool)

(assert (=> b!1236459 m!1140263))

(declare-fun m!1140265 () Bool)

(assert (=> b!1236460 m!1140265))

(declare-fun m!1140267 () Bool)

(assert (=> b!1236458 m!1140267))

(declare-fun m!1140269 () Bool)

(assert (=> start!102876 m!1140269))

(push 1)

(assert (not b!1236457))

(assert (not b!1236459))

(assert (not b!1236461))

(assert (not b!1236460))

(assert (not b!1236458))

(assert (not start!102876))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

