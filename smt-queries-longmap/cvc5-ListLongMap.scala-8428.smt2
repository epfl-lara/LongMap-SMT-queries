; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102896 () Bool)

(assert start!102896)

(declare-fun b!1235385 () Bool)

(declare-fun res!822777 () Bool)

(declare-fun e!700820 () Bool)

(assert (=> b!1235385 (=> (not res!822777) (not e!700820))))

(declare-datatypes ((List!27181 0))(
  ( (Nil!27178) (Cons!27177 (h!28395 (_ BitVec 64)) (t!40636 List!27181)) )
))
(declare-fun acc!823 () List!27181)

(declare-fun contains!7252 (List!27181 (_ BitVec 64)) Bool)

(assert (=> b!1235385 (= res!822777 (not (contains!7252 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235386 () Bool)

(declare-fun res!822776 () Bool)

(assert (=> b!1235386 (=> (not res!822776) (not e!700820))))

(assert (=> b!1235386 (= res!822776 (not (contains!7252 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235387 () Bool)

(declare-fun res!822775 () Bool)

(assert (=> b!1235387 (=> (not res!822775) (not e!700820))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235387 (= res!822775 (validKeyInArray!0 k!2913))))

(declare-fun b!1235388 () Bool)

(assert (=> b!1235388 (= e!700820 false)))

(declare-datatypes ((array!79584 0))(
  ( (array!79585 (arr!38395 (Array (_ BitVec 32) (_ BitVec 64))) (size!38932 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79584)

(declare-fun lt!560282 () Bool)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79584 (_ BitVec 32) List!27181) Bool)

(assert (=> b!1235388 (= lt!560282 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun res!822778 () Bool)

(assert (=> start!102896 (=> (not res!822778) (not e!700820))))

(assert (=> start!102896 (= res!822778 (bvslt (size!38932 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102896 e!700820))

(declare-fun array_inv!29333 (array!79584) Bool)

(assert (=> start!102896 (array_inv!29333 a!3806)))

(assert (=> start!102896 true))

(declare-fun b!1235389 () Bool)

(declare-fun res!822780 () Bool)

(assert (=> b!1235389 (=> (not res!822780) (not e!700820))))

(declare-fun arrayContainsKey!0 (array!79584 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1235389 (= res!822780 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1235390 () Bool)

(declare-fun res!822774 () Bool)

(assert (=> b!1235390 (=> (not res!822774) (not e!700820))))

(declare-fun noDuplicate!1833 (List!27181) Bool)

(assert (=> b!1235390 (= res!822774 (noDuplicate!1833 acc!823))))

(declare-fun b!1235391 () Bool)

(declare-fun res!822779 () Bool)

(assert (=> b!1235391 (=> (not res!822779) (not e!700820))))

(assert (=> b!1235391 (= res!822779 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38932 a!3806)) (bvslt from!3184 (size!38932 a!3806))))))

(assert (= (and start!102896 res!822778) b!1235387))

(assert (= (and b!1235387 res!822775) b!1235391))

(assert (= (and b!1235391 res!822779) b!1235390))

(assert (= (and b!1235390 res!822774) b!1235386))

(assert (= (and b!1235386 res!822776) b!1235385))

(assert (= (and b!1235385 res!822777) b!1235389))

(assert (= (and b!1235389 res!822780) b!1235388))

(declare-fun m!1139757 () Bool)

(assert (=> b!1235386 m!1139757))

(declare-fun m!1139759 () Bool)

(assert (=> b!1235388 m!1139759))

(declare-fun m!1139761 () Bool)

(assert (=> b!1235390 m!1139761))

(declare-fun m!1139763 () Bool)

(assert (=> b!1235387 m!1139763))

(declare-fun m!1139765 () Bool)

(assert (=> b!1235385 m!1139765))

(declare-fun m!1139767 () Bool)

(assert (=> start!102896 m!1139767))

(declare-fun m!1139769 () Bool)

(assert (=> b!1235389 m!1139769))

(push 1)

(assert (not b!1235389))

(assert (not start!102896))

(assert (not b!1235388))

(assert (not b!1235387))

(assert (not b!1235386))

(assert (not b!1235385))

(assert (not b!1235390))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

