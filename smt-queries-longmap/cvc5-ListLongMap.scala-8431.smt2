; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102674 () Bool)

(assert start!102674)

(declare-fun res!822357 () Bool)

(declare-fun e!699976 () Bool)

(assert (=> start!102674 (=> (not res!822357) (not e!699976))))

(declare-datatypes ((array!79487 0))(
  ( (array!79488 (arr!38353 (Array (_ BitVec 32) (_ BitVec 64))) (size!38891 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79487)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102674 (= res!822357 (and (bvslt (size!38891 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38891 a!3835))))))

(assert (=> start!102674 e!699976))

(declare-fun array_inv!29336 (array!79487) Bool)

(assert (=> start!102674 (array_inv!29336 a!3835)))

(assert (=> start!102674 true))

(declare-fun b!1234141 () Bool)

(declare-fun res!822358 () Bool)

(assert (=> b!1234141 (=> (not res!822358) (not e!699976))))

(declare-datatypes ((List!27227 0))(
  ( (Nil!27224) (Cons!27223 (h!28432 (_ BitVec 64)) (t!40681 List!27227)) )
))
(declare-fun acc!846 () List!27227)

(declare-fun noDuplicate!1842 (List!27227) Bool)

(assert (=> b!1234141 (= res!822358 (noDuplicate!1842 acc!846))))

(declare-fun b!1234142 () Bool)

(declare-fun res!822359 () Bool)

(assert (=> b!1234142 (=> (not res!822359) (not e!699976))))

(declare-fun contains!7199 (List!27227 (_ BitVec 64)) Bool)

(assert (=> b!1234142 (= res!822359 (not (contains!7199 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234143 () Bool)

(assert (=> b!1234143 (= e!699976 false)))

(declare-fun lt!559631 () Bool)

(assert (=> b!1234143 (= lt!559631 (contains!7199 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!102674 res!822357) b!1234141))

(assert (= (and b!1234141 res!822358) b!1234142))

(assert (= (and b!1234142 res!822359) b!1234143))

(declare-fun m!1137721 () Bool)

(assert (=> start!102674 m!1137721))

(declare-fun m!1137723 () Bool)

(assert (=> b!1234141 m!1137723))

(declare-fun m!1137725 () Bool)

(assert (=> b!1234142 m!1137725))

(declare-fun m!1137727 () Bool)

(assert (=> b!1234143 m!1137727))

(push 1)

(assert (not b!1234141))

(assert (not b!1234143))

(assert (not b!1234142))

(assert (not start!102674))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

