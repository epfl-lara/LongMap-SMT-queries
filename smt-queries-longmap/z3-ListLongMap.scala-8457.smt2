; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103114 () Bool)

(assert start!103114)

(declare-fun b!1237781 () Bool)

(declare-fun res!824974 () Bool)

(declare-fun e!701701 () Bool)

(assert (=> b!1237781 (=> (not res!824974) (not e!701701))))

(declare-datatypes ((List!27266 0))(
  ( (Nil!27263) (Cons!27262 (h!28480 (_ BitVec 64)) (t!40721 List!27266)) )
))
(declare-fun acc!846 () List!27266)

(declare-fun noDuplicate!1918 (List!27266) Bool)

(assert (=> b!1237781 (= res!824974 (noDuplicate!1918 acc!846))))

(declare-fun b!1237782 () Bool)

(declare-fun res!824975 () Bool)

(assert (=> b!1237782 (=> (not res!824975) (not e!701701))))

(declare-fun contains!7337 (List!27266 (_ BitVec 64)) Bool)

(assert (=> b!1237782 (= res!824975 (not (contains!7337 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237783 () Bool)

(declare-fun res!824976 () Bool)

(assert (=> b!1237783 (=> (not res!824976) (not e!701701))))

(declare-datatypes ((array!79757 0))(
  ( (array!79758 (arr!38480 (Array (_ BitVec 32) (_ BitVec 64))) (size!39017 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79757)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79757 (_ BitVec 32) List!27266) Bool)

(assert (=> b!1237783 (= res!824976 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun res!824973 () Bool)

(assert (=> start!103114 (=> (not res!824973) (not e!701701))))

(assert (=> start!103114 (= res!824973 (and (bvslt (size!39017 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39017 a!3835))))))

(assert (=> start!103114 e!701701))

(declare-fun array_inv!29418 (array!79757) Bool)

(assert (=> start!103114 (array_inv!29418 a!3835)))

(assert (=> start!103114 true))

(declare-fun b!1237784 () Bool)

(assert (=> b!1237784 (= e!701701 false)))

(declare-fun lt!561281 () Bool)

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1237784 (= lt!561281 (contains!7337 acc!846 k0!2925))))

(declare-fun b!1237785 () Bool)

(declare-fun res!824972 () Bool)

(assert (=> b!1237785 (=> (not res!824972) (not e!701701))))

(assert (=> b!1237785 (= res!824972 (not (contains!7337 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!103114 res!824973) b!1237781))

(assert (= (and b!1237781 res!824974) b!1237782))

(assert (= (and b!1237782 res!824975) b!1237785))

(assert (= (and b!1237785 res!824972) b!1237783))

(assert (= (and b!1237783 res!824976) b!1237784))

(declare-fun m!1141907 () Bool)

(assert (=> b!1237783 m!1141907))

(declare-fun m!1141909 () Bool)

(assert (=> b!1237782 m!1141909))

(declare-fun m!1141911 () Bool)

(assert (=> b!1237784 m!1141911))

(declare-fun m!1141913 () Bool)

(assert (=> b!1237781 m!1141913))

(declare-fun m!1141915 () Bool)

(assert (=> b!1237785 m!1141915))

(declare-fun m!1141917 () Bool)

(assert (=> start!103114 m!1141917))

(check-sat (not start!103114) (not b!1237784) (not b!1237782) (not b!1237785) (not b!1237783) (not b!1237781))
(check-sat)
