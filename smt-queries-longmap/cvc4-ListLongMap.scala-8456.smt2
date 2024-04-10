; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102874 () Bool)

(assert start!102874)

(declare-fun b!1236441 () Bool)

(declare-fun res!824427 () Bool)

(declare-fun e!700832 () Bool)

(assert (=> b!1236441 (=> (not res!824427) (not e!700832))))

(declare-datatypes ((List!27240 0))(
  ( (Nil!27237) (Cons!27236 (h!28445 (_ BitVec 64)) (t!40703 List!27240)) )
))
(declare-fun acc!846 () List!27240)

(declare-fun noDuplicate!1899 (List!27240) Bool)

(assert (=> b!1236441 (= res!824427 (noDuplicate!1899 acc!846))))

(declare-fun b!1236442 () Bool)

(declare-fun res!824424 () Bool)

(assert (=> b!1236442 (=> (not res!824424) (not e!700832))))

(declare-datatypes ((array!79719 0))(
  ( (array!79720 (arr!38467 (Array (_ BitVec 32) (_ BitVec 64))) (size!39003 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79719)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79719 (_ BitVec 32) List!27240) Bool)

(assert (=> b!1236442 (= res!824424 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1236443 () Bool)

(declare-fun res!824423 () Bool)

(assert (=> b!1236443 (=> (not res!824423) (not e!700832))))

(declare-fun contains!7302 (List!27240 (_ BitVec 64)) Bool)

(assert (=> b!1236443 (= res!824423 (not (contains!7302 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!824428 () Bool)

(assert (=> start!102874 (=> (not res!824428) (not e!700832))))

(assert (=> start!102874 (= res!824428 (and (bvslt (size!39003 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39003 a!3835))))))

(assert (=> start!102874 e!700832))

(declare-fun array_inv!29315 (array!79719) Bool)

(assert (=> start!102874 (array_inv!29315 a!3835)))

(assert (=> start!102874 true))

(declare-fun b!1236444 () Bool)

(assert (=> b!1236444 (= e!700832 (bvslt (bvsub (size!39003 a!3835) from!3213) #b00000000000000000000000000000000))))

(declare-fun b!1236445 () Bool)

(declare-fun res!824425 () Bool)

(assert (=> b!1236445 (=> (not res!824425) (not e!700832))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1236445 (= res!824425 (contains!7302 acc!846 k!2925))))

(declare-fun b!1236446 () Bool)

(declare-fun res!824426 () Bool)

(assert (=> b!1236446 (=> (not res!824426) (not e!700832))))

(assert (=> b!1236446 (= res!824426 (not (contains!7302 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102874 res!824428) b!1236441))

(assert (= (and b!1236441 res!824427) b!1236446))

(assert (= (and b!1236446 res!824426) b!1236443))

(assert (= (and b!1236443 res!824423) b!1236442))

(assert (= (and b!1236442 res!824424) b!1236445))

(assert (= (and b!1236445 res!824425) b!1236444))

(declare-fun m!1140247 () Bool)

(assert (=> b!1236443 m!1140247))

(declare-fun m!1140249 () Bool)

(assert (=> b!1236442 m!1140249))

(declare-fun m!1140251 () Bool)

(assert (=> b!1236445 m!1140251))

(declare-fun m!1140253 () Bool)

(assert (=> start!102874 m!1140253))

(declare-fun m!1140255 () Bool)

(assert (=> b!1236441 m!1140255))

(declare-fun m!1140257 () Bool)

(assert (=> b!1236446 m!1140257))

(push 1)

(assert (not b!1236442))

(assert (not b!1236446))

(assert (not start!102874))

(assert (not b!1236443))

(assert (not b!1236441))

(assert (not b!1236445))

(check-sat)

(pop 1)

(push 1)

(check-sat)

