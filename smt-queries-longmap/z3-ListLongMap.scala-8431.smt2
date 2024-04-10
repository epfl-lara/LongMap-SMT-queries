; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102674 () Bool)

(assert start!102674)

(declare-fun res!822380 () Bool)

(declare-fun e!700004 () Bool)

(assert (=> start!102674 (=> (not res!822380) (not e!700004))))

(declare-datatypes ((array!79564 0))(
  ( (array!79565 (arr!38391 (Array (_ BitVec 32) (_ BitVec 64))) (size!38927 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79564)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102674 (= res!822380 (and (bvslt (size!38927 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38927 a!3835))))))

(assert (=> start!102674 e!700004))

(declare-fun array_inv!29239 (array!79564) Bool)

(assert (=> start!102674 (array_inv!29239 a!3835)))

(assert (=> start!102674 true))

(declare-fun b!1234200 () Bool)

(declare-fun res!822381 () Bool)

(assert (=> b!1234200 (=> (not res!822381) (not e!700004))))

(declare-datatypes ((List!27164 0))(
  ( (Nil!27161) (Cons!27160 (h!28369 (_ BitVec 64)) (t!40627 List!27164)) )
))
(declare-fun acc!846 () List!27164)

(declare-fun noDuplicate!1823 (List!27164) Bool)

(assert (=> b!1234200 (= res!822381 (noDuplicate!1823 acc!846))))

(declare-fun b!1234201 () Bool)

(declare-fun res!822382 () Bool)

(assert (=> b!1234201 (=> (not res!822382) (not e!700004))))

(declare-fun contains!7226 (List!27164 (_ BitVec 64)) Bool)

(assert (=> b!1234201 (= res!822382 (not (contains!7226 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234202 () Bool)

(assert (=> b!1234202 (= e!700004 false)))

(declare-fun lt!559802 () Bool)

(assert (=> b!1234202 (= lt!559802 (contains!7226 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!102674 res!822380) b!1234200))

(assert (= (and b!1234200 res!822381) b!1234201))

(assert (= (and b!1234201 res!822382) b!1234202))

(declare-fun m!1138209 () Bool)

(assert (=> start!102674 m!1138209))

(declare-fun m!1138211 () Bool)

(assert (=> b!1234200 m!1138211))

(declare-fun m!1138213 () Bool)

(assert (=> b!1234201 m!1138213))

(declare-fun m!1138215 () Bool)

(assert (=> b!1234202 m!1138215))

(check-sat (not b!1234201) (not b!1234200) (not b!1234202) (not start!102674))
(check-sat)
