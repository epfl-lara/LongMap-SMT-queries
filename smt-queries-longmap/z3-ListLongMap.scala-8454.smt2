; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102860 () Bool)

(assert start!102860)

(declare-fun res!824312 () Bool)

(declare-fun e!700790 () Bool)

(assert (=> start!102860 (=> (not res!824312) (not e!700790))))

(declare-datatypes ((array!79705 0))(
  ( (array!79706 (arr!38460 (Array (_ BitVec 32) (_ BitVec 64))) (size!38996 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79705)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102860 (= res!824312 (and (bvslt (size!38996 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38996 a!3835))))))

(assert (=> start!102860 e!700790))

(declare-fun array_inv!29308 (array!79705) Bool)

(assert (=> start!102860 (array_inv!29308 a!3835)))

(assert (=> start!102860 true))

(declare-fun b!1236328 () Bool)

(assert (=> b!1236328 (= e!700790 false)))

(declare-fun lt!560780 () Bool)

(declare-datatypes ((List!27233 0))(
  ( (Nil!27230) (Cons!27229 (h!28438 (_ BitVec 64)) (t!40696 List!27233)) )
))
(declare-fun acc!846 () List!27233)

(declare-fun k0!2925 () (_ BitVec 64))

(declare-fun contains!7295 (List!27233 (_ BitVec 64)) Bool)

(assert (=> b!1236328 (= lt!560780 (contains!7295 acc!846 k0!2925))))

(declare-fun b!1236329 () Bool)

(declare-fun res!824313 () Bool)

(assert (=> b!1236329 (=> (not res!824313) (not e!700790))))

(assert (=> b!1236329 (= res!824313 (not (contains!7295 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236330 () Bool)

(declare-fun res!824310 () Bool)

(assert (=> b!1236330 (=> (not res!824310) (not e!700790))))

(assert (=> b!1236330 (= res!824310 (not (contains!7295 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236331 () Bool)

(declare-fun res!824314 () Bool)

(assert (=> b!1236331 (=> (not res!824314) (not e!700790))))

(declare-fun noDuplicate!1892 (List!27233) Bool)

(assert (=> b!1236331 (= res!824314 (noDuplicate!1892 acc!846))))

(declare-fun b!1236332 () Bool)

(declare-fun res!824311 () Bool)

(assert (=> b!1236332 (=> (not res!824311) (not e!700790))))

(declare-fun arrayNoDuplicates!0 (array!79705 (_ BitVec 32) List!27233) Bool)

(assert (=> b!1236332 (= res!824311 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(assert (= (and start!102860 res!824312) b!1236331))

(assert (= (and b!1236331 res!824314) b!1236329))

(assert (= (and b!1236329 res!824313) b!1236330))

(assert (= (and b!1236330 res!824310) b!1236332))

(assert (= (and b!1236332 res!824311) b!1236328))

(declare-fun m!1140163 () Bool)

(assert (=> b!1236332 m!1140163))

(declare-fun m!1140165 () Bool)

(assert (=> b!1236330 m!1140165))

(declare-fun m!1140167 () Bool)

(assert (=> b!1236331 m!1140167))

(declare-fun m!1140169 () Bool)

(assert (=> b!1236328 m!1140169))

(declare-fun m!1140171 () Bool)

(assert (=> b!1236329 m!1140171))

(declare-fun m!1140173 () Bool)

(assert (=> start!102860 m!1140173))

(check-sat (not b!1236331) (not b!1236332) (not b!1236329) (not b!1236330) (not start!102860) (not b!1236328))
(check-sat)
