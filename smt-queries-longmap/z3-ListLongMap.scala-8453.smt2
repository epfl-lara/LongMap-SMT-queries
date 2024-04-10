; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102854 () Bool)

(assert start!102854)

(declare-fun b!1236283 () Bool)

(declare-fun res!824268 () Bool)

(declare-fun e!700772 () Bool)

(assert (=> b!1236283 (=> (not res!824268) (not e!700772))))

(declare-datatypes ((array!79699 0))(
  ( (array!79700 (arr!38457 (Array (_ BitVec 32) (_ BitVec 64))) (size!38993 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79699)

(declare-datatypes ((List!27230 0))(
  ( (Nil!27227) (Cons!27226 (h!28435 (_ BitVec 64)) (t!40693 List!27230)) )
))
(declare-fun acc!846 () List!27230)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79699 (_ BitVec 32) List!27230) Bool)

(assert (=> b!1236283 (= res!824268 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1236284 () Bool)

(declare-fun res!824267 () Bool)

(assert (=> b!1236284 (=> (not res!824267) (not e!700772))))

(declare-fun contains!7292 (List!27230 (_ BitVec 64)) Bool)

(assert (=> b!1236284 (= res!824267 (not (contains!7292 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236285 () Bool)

(declare-fun res!824266 () Bool)

(assert (=> b!1236285 (=> (not res!824266) (not e!700772))))

(assert (=> b!1236285 (= res!824266 (not (contains!7292 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236286 () Bool)

(assert (=> b!1236286 (= e!700772 false)))

(declare-fun lt!560771 () Bool)

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1236286 (= lt!560771 (contains!7292 acc!846 k0!2925))))

(declare-fun b!1236287 () Bool)

(declare-fun res!824269 () Bool)

(assert (=> b!1236287 (=> (not res!824269) (not e!700772))))

(declare-fun noDuplicate!1889 (List!27230) Bool)

(assert (=> b!1236287 (= res!824269 (noDuplicate!1889 acc!846))))

(declare-fun res!824265 () Bool)

(assert (=> start!102854 (=> (not res!824265) (not e!700772))))

(assert (=> start!102854 (= res!824265 (and (bvslt (size!38993 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38993 a!3835))))))

(assert (=> start!102854 e!700772))

(declare-fun array_inv!29305 (array!79699) Bool)

(assert (=> start!102854 (array_inv!29305 a!3835)))

(assert (=> start!102854 true))

(assert (= (and start!102854 res!824265) b!1236287))

(assert (= (and b!1236287 res!824269) b!1236285))

(assert (= (and b!1236285 res!824266) b!1236284))

(assert (= (and b!1236284 res!824267) b!1236283))

(assert (= (and b!1236283 res!824268) b!1236286))

(declare-fun m!1140127 () Bool)

(assert (=> b!1236283 m!1140127))

(declare-fun m!1140129 () Bool)

(assert (=> start!102854 m!1140129))

(declare-fun m!1140131 () Bool)

(assert (=> b!1236284 m!1140131))

(declare-fun m!1140133 () Bool)

(assert (=> b!1236285 m!1140133))

(declare-fun m!1140135 () Bool)

(assert (=> b!1236287 m!1140135))

(declare-fun m!1140137 () Bool)

(assert (=> b!1236286 m!1140137))

(check-sat (not b!1236285) (not b!1236283) (not b!1236286) (not start!102854) (not b!1236287) (not b!1236284))
(check-sat)
