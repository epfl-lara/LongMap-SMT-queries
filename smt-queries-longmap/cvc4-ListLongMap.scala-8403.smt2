; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102440 () Bool)

(assert start!102440)

(declare-fun b!1231690 () Bool)

(declare-fun e!698948 () Bool)

(assert (=> b!1231690 (= e!698948 false)))

(declare-datatypes ((array!79411 0))(
  ( (array!79412 (arr!38319 (Array (_ BitVec 32) (_ BitVec 64))) (size!38856 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79411)

(declare-datatypes ((List!27105 0))(
  ( (Nil!27102) (Cons!27101 (h!28319 (_ BitVec 64)) (t!40560 List!27105)) )
))
(declare-fun acc!823 () List!27105)

(declare-fun lt!559854 () Bool)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79411 (_ BitVec 32) List!27105) Bool)

(assert (=> b!1231690 (= lt!559854 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1231691 () Bool)

(declare-fun res!819386 () Bool)

(assert (=> b!1231691 (=> (not res!819386) (not e!698948))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1231691 (= res!819386 (validKeyInArray!0 k!2913))))

(declare-fun b!1231692 () Bool)

(declare-fun res!819384 () Bool)

(assert (=> b!1231692 (=> (not res!819384) (not e!698948))))

(declare-fun contains!7176 (List!27105 (_ BitVec 64)) Bool)

(assert (=> b!1231692 (= res!819384 (not (contains!7176 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231693 () Bool)

(declare-fun res!819389 () Bool)

(assert (=> b!1231693 (=> (not res!819389) (not e!698948))))

(assert (=> b!1231693 (= res!819389 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38856 a!3806)) (bvslt from!3184 (size!38856 a!3806))))))

(declare-fun b!1231694 () Bool)

(declare-fun res!819383 () Bool)

(assert (=> b!1231694 (=> (not res!819383) (not e!698948))))

(declare-fun noDuplicate!1757 (List!27105) Bool)

(assert (=> b!1231694 (= res!819383 (noDuplicate!1757 acc!823))))

(declare-fun b!1231695 () Bool)

(declare-fun res!819385 () Bool)

(assert (=> b!1231695 (=> (not res!819385) (not e!698948))))

(assert (=> b!1231695 (= res!819385 (not (contains!7176 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!819387 () Bool)

(assert (=> start!102440 (=> (not res!819387) (not e!698948))))

(assert (=> start!102440 (= res!819387 (bvslt (size!38856 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102440 e!698948))

(declare-fun array_inv!29257 (array!79411) Bool)

(assert (=> start!102440 (array_inv!29257 a!3806)))

(assert (=> start!102440 true))

(declare-fun b!1231696 () Bool)

(declare-fun res!819388 () Bool)

(assert (=> b!1231696 (=> (not res!819388) (not e!698948))))

(declare-fun arrayContainsKey!0 (array!79411 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1231696 (= res!819388 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(assert (= (and start!102440 res!819387) b!1231691))

(assert (= (and b!1231691 res!819386) b!1231693))

(assert (= (and b!1231693 res!819389) b!1231694))

(assert (= (and b!1231694 res!819383) b!1231695))

(assert (= (and b!1231695 res!819385) b!1231692))

(assert (= (and b!1231692 res!819384) b!1231696))

(assert (= (and b!1231696 res!819388) b!1231690))

(declare-fun m!1136453 () Bool)

(assert (=> b!1231695 m!1136453))

(declare-fun m!1136455 () Bool)

(assert (=> b!1231690 m!1136455))

(declare-fun m!1136457 () Bool)

(assert (=> b!1231692 m!1136457))

(declare-fun m!1136459 () Bool)

(assert (=> start!102440 m!1136459))

(declare-fun m!1136461 () Bool)

(assert (=> b!1231696 m!1136461))

(declare-fun m!1136463 () Bool)

(assert (=> b!1231694 m!1136463))

(declare-fun m!1136465 () Bool)

(assert (=> b!1231691 m!1136465))

(push 1)

(assert (not b!1231691))

(assert (not b!1231694))

(assert (not b!1231696))

(assert (not b!1231695))

(assert (not b!1231690))

(assert (not b!1231692))

(assert (not start!102440))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

