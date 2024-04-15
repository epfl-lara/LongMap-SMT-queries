; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102874 () Bool)

(assert start!102874)

(declare-fun b!1236389 () Bool)

(declare-fun res!824409 () Bool)

(declare-fun e!700805 () Bool)

(assert (=> b!1236389 (=> (not res!824409) (not e!700805))))

(declare-datatypes ((List!27303 0))(
  ( (Nil!27300) (Cons!27299 (h!28508 (_ BitVec 64)) (t!40757 List!27303)) )
))
(declare-fun acc!846 () List!27303)

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79642 0))(
  ( (array!79643 (arr!38429 (Array (_ BitVec 32) (_ BitVec 64))) (size!38967 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79642)

(declare-fun arrayNoDuplicates!0 (array!79642 (_ BitVec 32) List!27303) Bool)

(assert (=> b!1236389 (= res!824409 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun res!824407 () Bool)

(assert (=> start!102874 (=> (not res!824407) (not e!700805))))

(assert (=> start!102874 (= res!824407 (and (bvslt (size!38967 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38967 a!3835))))))

(assert (=> start!102874 e!700805))

(declare-fun array_inv!29412 (array!79642) Bool)

(assert (=> start!102874 (array_inv!29412 a!3835)))

(assert (=> start!102874 true))

(declare-fun b!1236390 () Bool)

(declare-fun res!824411 () Bool)

(assert (=> b!1236390 (=> (not res!824411) (not e!700805))))

(declare-fun noDuplicate!1918 (List!27303) Bool)

(assert (=> b!1236390 (= res!824411 (noDuplicate!1918 acc!846))))

(declare-fun b!1236391 () Bool)

(declare-fun res!824408 () Bool)

(assert (=> b!1236391 (=> (not res!824408) (not e!700805))))

(declare-fun contains!7275 (List!27303 (_ BitVec 64)) Bool)

(assert (=> b!1236391 (= res!824408 (not (contains!7275 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236392 () Bool)

(assert (=> b!1236392 (= e!700805 false)))

(declare-fun lt!560621 () Bool)

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1236392 (= lt!560621 (contains!7275 acc!846 k0!2925))))

(declare-fun b!1236393 () Bool)

(declare-fun res!824410 () Bool)

(assert (=> b!1236393 (=> (not res!824410) (not e!700805))))

(assert (=> b!1236393 (= res!824410 (not (contains!7275 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102874 res!824407) b!1236390))

(assert (= (and b!1236390 res!824411) b!1236393))

(assert (= (and b!1236393 res!824410) b!1236391))

(assert (= (and b!1236391 res!824408) b!1236389))

(assert (= (and b!1236389 res!824409) b!1236392))

(declare-fun m!1139763 () Bool)

(assert (=> b!1236391 m!1139763))

(declare-fun m!1139765 () Bool)

(assert (=> b!1236392 m!1139765))

(declare-fun m!1139767 () Bool)

(assert (=> b!1236390 m!1139767))

(declare-fun m!1139769 () Bool)

(assert (=> b!1236393 m!1139769))

(declare-fun m!1139771 () Bool)

(assert (=> b!1236389 m!1139771))

(declare-fun m!1139773 () Bool)

(assert (=> start!102874 m!1139773))

(check-sat (not b!1236391) (not start!102874) (not b!1236393) (not b!1236392) (not b!1236390) (not b!1236389))
(check-sat)
