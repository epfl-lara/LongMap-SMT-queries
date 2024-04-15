; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102682 () Bool)

(assert start!102682)

(declare-fun res!822394 () Bool)

(declare-fun e!700001 () Bool)

(assert (=> start!102682 (=> (not res!822394) (not e!700001))))

(declare-datatypes ((array!79495 0))(
  ( (array!79496 (arr!38357 (Array (_ BitVec 32) (_ BitVec 64))) (size!38895 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79495)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102682 (= res!822394 (and (bvslt (size!38895 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38895 a!3835))))))

(assert (=> start!102682 e!700001))

(declare-fun array_inv!29340 (array!79495) Bool)

(assert (=> start!102682 (array_inv!29340 a!3835)))

(assert (=> start!102682 true))

(declare-fun b!1234177 () Bool)

(declare-fun res!822395 () Bool)

(assert (=> b!1234177 (=> (not res!822395) (not e!700001))))

(declare-datatypes ((List!27231 0))(
  ( (Nil!27228) (Cons!27227 (h!28436 (_ BitVec 64)) (t!40685 List!27231)) )
))
(declare-fun acc!846 () List!27231)

(declare-fun noDuplicate!1846 (List!27231) Bool)

(assert (=> b!1234177 (= res!822395 (noDuplicate!1846 acc!846))))

(declare-fun b!1234178 () Bool)

(declare-fun res!822393 () Bool)

(assert (=> b!1234178 (=> (not res!822393) (not e!700001))))

(declare-fun contains!7203 (List!27231 (_ BitVec 64)) Bool)

(assert (=> b!1234178 (= res!822393 (not (contains!7203 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234179 () Bool)

(assert (=> b!1234179 (= e!700001 false)))

(declare-fun lt!559643 () Bool)

(assert (=> b!1234179 (= lt!559643 (contains!7203 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!102682 res!822394) b!1234177))

(assert (= (and b!1234177 res!822395) b!1234178))

(assert (= (and b!1234178 res!822393) b!1234179))

(declare-fun m!1137753 () Bool)

(assert (=> start!102682 m!1137753))

(declare-fun m!1137755 () Bool)

(assert (=> b!1234177 m!1137755))

(declare-fun m!1137757 () Bool)

(assert (=> b!1234178 m!1137757))

(declare-fun m!1137759 () Bool)

(assert (=> b!1234179 m!1137759))

(check-sat (not b!1234178) (not b!1234177) (not b!1234179) (not start!102682))
(check-sat)
