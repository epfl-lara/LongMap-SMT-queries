; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102680 () Bool)

(assert start!102680)

(declare-fun res!822408 () Bool)

(declare-fun e!700023 () Bool)

(assert (=> start!102680 (=> (not res!822408) (not e!700023))))

(declare-datatypes ((array!79570 0))(
  ( (array!79571 (arr!38394 (Array (_ BitVec 32) (_ BitVec 64))) (size!38930 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79570)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102680 (= res!822408 (and (bvslt (size!38930 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38930 a!3835))))))

(assert (=> start!102680 e!700023))

(declare-fun array_inv!29242 (array!79570) Bool)

(assert (=> start!102680 (array_inv!29242 a!3835)))

(assert (=> start!102680 true))

(declare-fun b!1234227 () Bool)

(declare-fun res!822409 () Bool)

(assert (=> b!1234227 (=> (not res!822409) (not e!700023))))

(declare-datatypes ((List!27167 0))(
  ( (Nil!27164) (Cons!27163 (h!28372 (_ BitVec 64)) (t!40630 List!27167)) )
))
(declare-fun acc!846 () List!27167)

(declare-fun noDuplicate!1826 (List!27167) Bool)

(assert (=> b!1234227 (= res!822409 (noDuplicate!1826 acc!846))))

(declare-fun b!1234228 () Bool)

(declare-fun res!822407 () Bool)

(assert (=> b!1234228 (=> (not res!822407) (not e!700023))))

(declare-fun contains!7229 (List!27167 (_ BitVec 64)) Bool)

(assert (=> b!1234228 (= res!822407 (not (contains!7229 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234229 () Bool)

(assert (=> b!1234229 (= e!700023 false)))

(declare-fun lt!559811 () Bool)

(assert (=> b!1234229 (= lt!559811 (contains!7229 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!102680 res!822408) b!1234227))

(assert (= (and b!1234227 res!822409) b!1234228))

(assert (= (and b!1234228 res!822407) b!1234229))

(declare-fun m!1138233 () Bool)

(assert (=> start!102680 m!1138233))

(declare-fun m!1138235 () Bool)

(assert (=> b!1234227 m!1138235))

(declare-fun m!1138237 () Bool)

(assert (=> b!1234228 m!1138237))

(declare-fun m!1138239 () Bool)

(assert (=> b!1234229 m!1138239))

(check-sat (not b!1234229) (not b!1234227) (not start!102680) (not b!1234228))
(check-sat)
