; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102686 () Bool)

(assert start!102686)

(declare-fun res!822436 () Bool)

(declare-fun e!700041 () Bool)

(assert (=> start!102686 (=> (not res!822436) (not e!700041))))

(declare-datatypes ((array!79576 0))(
  ( (array!79577 (arr!38397 (Array (_ BitVec 32) (_ BitVec 64))) (size!38933 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79576)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102686 (= res!822436 (and (bvslt (size!38933 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38933 a!3835))))))

(assert (=> start!102686 e!700041))

(declare-fun array_inv!29245 (array!79576) Bool)

(assert (=> start!102686 (array_inv!29245 a!3835)))

(assert (=> start!102686 true))

(declare-fun b!1234254 () Bool)

(declare-fun res!822435 () Bool)

(assert (=> b!1234254 (=> (not res!822435) (not e!700041))))

(declare-datatypes ((List!27170 0))(
  ( (Nil!27167) (Cons!27166 (h!28375 (_ BitVec 64)) (t!40633 List!27170)) )
))
(declare-fun acc!846 () List!27170)

(declare-fun noDuplicate!1829 (List!27170) Bool)

(assert (=> b!1234254 (= res!822435 (noDuplicate!1829 acc!846))))

(declare-fun b!1234255 () Bool)

(declare-fun res!822434 () Bool)

(assert (=> b!1234255 (=> (not res!822434) (not e!700041))))

(declare-fun contains!7232 (List!27170 (_ BitVec 64)) Bool)

(assert (=> b!1234255 (= res!822434 (not (contains!7232 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234256 () Bool)

(assert (=> b!1234256 (= e!700041 false)))

(declare-fun lt!559820 () Bool)

(assert (=> b!1234256 (= lt!559820 (contains!7232 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!102686 res!822436) b!1234254))

(assert (= (and b!1234254 res!822435) b!1234255))

(assert (= (and b!1234255 res!822434) b!1234256))

(declare-fun m!1138257 () Bool)

(assert (=> start!102686 m!1138257))

(declare-fun m!1138259 () Bool)

(assert (=> b!1234254 m!1138259))

(declare-fun m!1138261 () Bool)

(assert (=> b!1234255 m!1138261))

(declare-fun m!1138263 () Bool)

(assert (=> b!1234256 m!1138263))

(check-sat (not b!1234255) (not b!1234254) (not b!1234256) (not start!102686))
