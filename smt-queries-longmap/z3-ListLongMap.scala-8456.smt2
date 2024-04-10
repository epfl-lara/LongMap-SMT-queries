; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102872 () Bool)

(assert start!102872)

(declare-fun b!1236423 () Bool)

(declare-fun res!824408 () Bool)

(declare-fun e!700827 () Bool)

(assert (=> b!1236423 (=> (not res!824408) (not e!700827))))

(declare-datatypes ((List!27239 0))(
  ( (Nil!27236) (Cons!27235 (h!28444 (_ BitVec 64)) (t!40702 List!27239)) )
))
(declare-fun acc!846 () List!27239)

(declare-fun contains!7301 (List!27239 (_ BitVec 64)) Bool)

(assert (=> b!1236423 (= res!824408 (not (contains!7301 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236424 () Bool)

(declare-fun res!824407 () Bool)

(assert (=> b!1236424 (=> (not res!824407) (not e!700827))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1236424 (= res!824407 (contains!7301 acc!846 k0!2925))))

(declare-fun b!1236425 () Bool)

(declare-datatypes ((array!79717 0))(
  ( (array!79718 (arr!38466 (Array (_ BitVec 32) (_ BitVec 64))) (size!39002 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79717)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> b!1236425 (= e!700827 (bvslt (bvsub (size!39002 a!3835) from!3213) #b00000000000000000000000000000000))))

(declare-fun b!1236426 () Bool)

(declare-fun res!824406 () Bool)

(assert (=> b!1236426 (=> (not res!824406) (not e!700827))))

(declare-fun arrayNoDuplicates!0 (array!79717 (_ BitVec 32) List!27239) Bool)

(assert (=> b!1236426 (= res!824406 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1236427 () Bool)

(declare-fun res!824409 () Bool)

(assert (=> b!1236427 (=> (not res!824409) (not e!700827))))

(declare-fun noDuplicate!1898 (List!27239) Bool)

(assert (=> b!1236427 (= res!824409 (noDuplicate!1898 acc!846))))

(declare-fun res!824405 () Bool)

(assert (=> start!102872 (=> (not res!824405) (not e!700827))))

(assert (=> start!102872 (= res!824405 (and (bvslt (size!39002 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39002 a!3835))))))

(assert (=> start!102872 e!700827))

(declare-fun array_inv!29314 (array!79717) Bool)

(assert (=> start!102872 (array_inv!29314 a!3835)))

(assert (=> start!102872 true))

(declare-fun b!1236428 () Bool)

(declare-fun res!824410 () Bool)

(assert (=> b!1236428 (=> (not res!824410) (not e!700827))))

(assert (=> b!1236428 (= res!824410 (not (contains!7301 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102872 res!824405) b!1236427))

(assert (= (and b!1236427 res!824409) b!1236423))

(assert (= (and b!1236423 res!824408) b!1236428))

(assert (= (and b!1236428 res!824410) b!1236426))

(assert (= (and b!1236426 res!824406) b!1236424))

(assert (= (and b!1236424 res!824407) b!1236425))

(declare-fun m!1140235 () Bool)

(assert (=> b!1236424 m!1140235))

(declare-fun m!1140237 () Bool)

(assert (=> b!1236428 m!1140237))

(declare-fun m!1140239 () Bool)

(assert (=> start!102872 m!1140239))

(declare-fun m!1140241 () Bool)

(assert (=> b!1236426 m!1140241))

(declare-fun m!1140243 () Bool)

(assert (=> b!1236423 m!1140243))

(declare-fun m!1140245 () Bool)

(assert (=> b!1236427 m!1140245))

(check-sat (not b!1236424) (not b!1236423) (not start!102872) (not b!1236428) (not b!1236427) (not b!1236426))
(check-sat)
