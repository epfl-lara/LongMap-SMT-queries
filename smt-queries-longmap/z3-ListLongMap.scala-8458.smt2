; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103120 () Bool)

(assert start!103120)

(declare-fun b!1237826 () Bool)

(declare-fun res!825018 () Bool)

(declare-fun e!701720 () Bool)

(assert (=> b!1237826 (=> (not res!825018) (not e!701720))))

(declare-datatypes ((array!79763 0))(
  ( (array!79764 (arr!38483 (Array (_ BitVec 32) (_ BitVec 64))) (size!39020 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79763)

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((List!27269 0))(
  ( (Nil!27266) (Cons!27265 (h!28483 (_ BitVec 64)) (t!40724 List!27269)) )
))
(declare-fun acc!846 () List!27269)

(declare-fun arrayNoDuplicates!0 (array!79763 (_ BitVec 32) List!27269) Bool)

(assert (=> b!1237826 (= res!825018 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1237827 () Bool)

(declare-fun res!825021 () Bool)

(assert (=> b!1237827 (=> (not res!825021) (not e!701720))))

(declare-fun noDuplicate!1921 (List!27269) Bool)

(assert (=> b!1237827 (= res!825021 (noDuplicate!1921 acc!846))))

(declare-fun b!1237828 () Bool)

(assert (=> b!1237828 (= e!701720 false)))

(declare-fun lt!561290 () Bool)

(declare-fun k0!2925 () (_ BitVec 64))

(declare-fun contains!7340 (List!27269 (_ BitVec 64)) Bool)

(assert (=> b!1237828 (= lt!561290 (contains!7340 acc!846 k0!2925))))

(declare-fun res!825019 () Bool)

(assert (=> start!103120 (=> (not res!825019) (not e!701720))))

(assert (=> start!103120 (= res!825019 (and (bvslt (size!39020 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39020 a!3835))))))

(assert (=> start!103120 e!701720))

(declare-fun array_inv!29421 (array!79763) Bool)

(assert (=> start!103120 (array_inv!29421 a!3835)))

(assert (=> start!103120 true))

(declare-fun b!1237829 () Bool)

(declare-fun res!825017 () Bool)

(assert (=> b!1237829 (=> (not res!825017) (not e!701720))))

(assert (=> b!1237829 (= res!825017 (not (contains!7340 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237830 () Bool)

(declare-fun res!825020 () Bool)

(assert (=> b!1237830 (=> (not res!825020) (not e!701720))))

(assert (=> b!1237830 (= res!825020 (not (contains!7340 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!103120 res!825019) b!1237827))

(assert (= (and b!1237827 res!825021) b!1237829))

(assert (= (and b!1237829 res!825017) b!1237830))

(assert (= (and b!1237830 res!825020) b!1237826))

(assert (= (and b!1237826 res!825018) b!1237828))

(declare-fun m!1141943 () Bool)

(assert (=> start!103120 m!1141943))

(declare-fun m!1141945 () Bool)

(assert (=> b!1237828 m!1141945))

(declare-fun m!1141947 () Bool)

(assert (=> b!1237826 m!1141947))

(declare-fun m!1141949 () Bool)

(assert (=> b!1237827 m!1141949))

(declare-fun m!1141951 () Bool)

(assert (=> b!1237830 m!1141951))

(declare-fun m!1141953 () Bool)

(assert (=> b!1237829 m!1141953))

(check-sat (not b!1237827) (not b!1237828) (not b!1237826) (not b!1237829) (not start!103120) (not b!1237830))
(check-sat)
