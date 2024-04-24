; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103102 () Bool)

(assert start!103102)

(declare-fun b!1237682 () Bool)

(declare-fun res!824873 () Bool)

(declare-fun e!701665 () Bool)

(assert (=> b!1237682 (=> (not res!824873) (not e!701665))))

(declare-datatypes ((array!79745 0))(
  ( (array!79746 (arr!38474 (Array (_ BitVec 32) (_ BitVec 64))) (size!39011 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79745)

(declare-datatypes ((List!27260 0))(
  ( (Nil!27257) (Cons!27256 (h!28474 (_ BitVec 64)) (t!40715 List!27260)) )
))
(declare-fun acc!846 () List!27260)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79745 (_ BitVec 32) List!27260) Bool)

(assert (=> b!1237682 (= res!824873 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun res!824875 () Bool)

(assert (=> start!103102 (=> (not res!824875) (not e!701665))))

(assert (=> start!103102 (= res!824875 (and (bvslt (size!39011 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39011 a!3835))))))

(assert (=> start!103102 e!701665))

(declare-fun array_inv!29412 (array!79745) Bool)

(assert (=> start!103102 (array_inv!29412 a!3835)))

(assert (=> start!103102 true))

(declare-fun b!1237683 () Bool)

(declare-fun res!824877 () Bool)

(assert (=> b!1237683 (=> (not res!824877) (not e!701665))))

(declare-fun noDuplicate!1912 (List!27260) Bool)

(assert (=> b!1237683 (= res!824877 (noDuplicate!1912 acc!846))))

(declare-fun b!1237684 () Bool)

(declare-fun res!824874 () Bool)

(assert (=> b!1237684 (=> (not res!824874) (not e!701665))))

(declare-fun contains!7331 (List!27260 (_ BitVec 64)) Bool)

(assert (=> b!1237684 (= res!824874 (not (contains!7331 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237685 () Bool)

(assert (=> b!1237685 (= e!701665 false)))

(declare-fun lt!561272 () Bool)

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1237685 (= lt!561272 (contains!7331 acc!846 k0!2925))))

(declare-fun b!1237686 () Bool)

(declare-fun res!824876 () Bool)

(assert (=> b!1237686 (=> (not res!824876) (not e!701665))))

(assert (=> b!1237686 (= res!824876 (not (contains!7331 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!103102 res!824875) b!1237683))

(assert (= (and b!1237683 res!824877) b!1237684))

(assert (= (and b!1237684 res!824874) b!1237686))

(assert (= (and b!1237686 res!824876) b!1237682))

(assert (= (and b!1237682 res!824873) b!1237685))

(declare-fun m!1141835 () Bool)

(assert (=> start!103102 m!1141835))

(declare-fun m!1141837 () Bool)

(assert (=> b!1237683 m!1141837))

(declare-fun m!1141839 () Bool)

(assert (=> b!1237685 m!1141839))

(declare-fun m!1141841 () Bool)

(assert (=> b!1237684 m!1141841))

(declare-fun m!1141843 () Bool)

(assert (=> b!1237682 m!1141843))

(declare-fun m!1141845 () Bool)

(assert (=> b!1237686 m!1141845))

(check-sat (not b!1237683) (not start!103102) (not b!1237684) (not b!1237686) (not b!1237685) (not b!1237682))
(check-sat)
