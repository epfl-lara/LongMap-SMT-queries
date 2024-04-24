; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103108 () Bool)

(assert start!103108)

(declare-fun b!1237729 () Bool)

(declare-fun res!824924 () Bool)

(declare-fun e!701684 () Bool)

(assert (=> b!1237729 (=> (not res!824924) (not e!701684))))

(declare-datatypes ((List!27263 0))(
  ( (Nil!27260) (Cons!27259 (h!28477 (_ BitVec 64)) (t!40718 List!27263)) )
))
(declare-fun acc!846 () List!27263)

(declare-fun contains!7334 (List!27263 (_ BitVec 64)) Bool)

(assert (=> b!1237729 (= res!824924 (not (contains!7334 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!824922 () Bool)

(assert (=> start!103108 (=> (not res!824922) (not e!701684))))

(declare-datatypes ((array!79751 0))(
  ( (array!79752 (arr!38477 (Array (_ BitVec 32) (_ BitVec 64))) (size!39014 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79751)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!103108 (= res!824922 (and (bvslt (size!39014 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39014 a!3835))))))

(assert (=> start!103108 e!701684))

(declare-fun array_inv!29415 (array!79751) Bool)

(assert (=> start!103108 (array_inv!29415 a!3835)))

(assert (=> start!103108 true))

(declare-fun b!1237730 () Bool)

(declare-fun res!824920 () Bool)

(assert (=> b!1237730 (=> (not res!824920) (not e!701684))))

(assert (=> b!1237730 (= res!824920 (not (contains!7334 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237731 () Bool)

(declare-fun res!824923 () Bool)

(assert (=> b!1237731 (=> (not res!824923) (not e!701684))))

(declare-fun arrayNoDuplicates!0 (array!79751 (_ BitVec 32) List!27263) Bool)

(assert (=> b!1237731 (= res!824923 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1237732 () Bool)

(declare-fun res!824925 () Bool)

(assert (=> b!1237732 (=> (not res!824925) (not e!701684))))

(declare-fun noDuplicate!1915 (List!27263) Bool)

(assert (=> b!1237732 (= res!824925 (noDuplicate!1915 acc!846))))

(declare-fun b!1237733 () Bool)

(assert (=> b!1237733 (= e!701684 (bvslt (bvsub (size!39014 a!3835) from!3213) #b00000000000000000000000000000000))))

(declare-fun b!1237734 () Bool)

(declare-fun res!824921 () Bool)

(assert (=> b!1237734 (=> (not res!824921) (not e!701684))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1237734 (= res!824921 (contains!7334 acc!846 k0!2925))))

(assert (= (and start!103108 res!824922) b!1237732))

(assert (= (and b!1237732 res!824925) b!1237729))

(assert (= (and b!1237729 res!824924) b!1237730))

(assert (= (and b!1237730 res!824920) b!1237731))

(assert (= (and b!1237731 res!824923) b!1237734))

(assert (= (and b!1237734 res!824921) b!1237733))

(declare-fun m!1141871 () Bool)

(assert (=> b!1237731 m!1141871))

(declare-fun m!1141873 () Bool)

(assert (=> b!1237729 m!1141873))

(declare-fun m!1141875 () Bool)

(assert (=> b!1237730 m!1141875))

(declare-fun m!1141877 () Bool)

(assert (=> b!1237732 m!1141877))

(declare-fun m!1141879 () Bool)

(assert (=> b!1237734 m!1141879))

(declare-fun m!1141881 () Bool)

(assert (=> start!103108 m!1141881))

(check-sat (not b!1237732) (not b!1237731) (not b!1237734) (not b!1237729) (not start!103108) (not b!1237730))
(check-sat)
