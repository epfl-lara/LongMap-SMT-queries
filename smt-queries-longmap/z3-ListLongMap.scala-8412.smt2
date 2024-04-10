; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102368 () Bool)

(assert start!102368)

(declare-fun b!1231568 () Bool)

(declare-fun res!819987 () Bool)

(declare-fun e!698659 () Bool)

(assert (=> b!1231568 (=> res!819987 e!698659)))

(declare-datatypes ((List!27107 0))(
  ( (Nil!27104) (Cons!27103 (h!28312 (_ BitVec 64)) (t!40570 List!27107)) )
))
(declare-fun contains!7169 (List!27107 (_ BitVec 64)) Bool)

(assert (=> b!1231568 (= res!819987 (contains!7169 Nil!27104 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1231569 () Bool)

(declare-fun res!819990 () Bool)

(assert (=> b!1231569 (=> res!819990 e!698659)))

(assert (=> b!1231569 (= res!819990 (contains!7169 Nil!27104 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1231570 () Bool)

(declare-fun res!819983 () Bool)

(declare-fun e!698660 () Bool)

(assert (=> b!1231570 (=> (not res!819983) (not e!698660))))

(declare-datatypes ((array!79438 0))(
  ( (array!79439 (arr!38334 (Array (_ BitVec 32) (_ BitVec 64))) (size!38870 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79438)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1231570 (= res!819983 (validKeyInArray!0 (select (arr!38334 a!3806) from!3184)))))

(declare-fun b!1231571 () Bool)

(assert (=> b!1231571 (= e!698659 true)))

(declare-datatypes ((Unit!40774 0))(
  ( (Unit!40775) )
))
(declare-fun lt!559424 () Unit!40774)

(declare-fun acc!823 () List!27107)

(declare-fun noDuplicateSubseq!54 (List!27107 List!27107) Unit!40774)

(assert (=> b!1231571 (= lt!559424 (noDuplicateSubseq!54 Nil!27104 acc!823))))

(declare-fun b!1231572 () Bool)

(declare-fun res!819984 () Bool)

(assert (=> b!1231572 (=> (not res!819984) (not e!698660))))

(declare-fun arrayNoDuplicates!0 (array!79438 (_ BitVec 32) List!27107) Bool)

(assert (=> b!1231572 (= res!819984 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1231573 () Bool)

(declare-fun res!819993 () Bool)

(assert (=> b!1231573 (=> (not res!819993) (not e!698660))))

(assert (=> b!1231573 (= res!819993 (not (contains!7169 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231574 () Bool)

(declare-fun res!819991 () Bool)

(assert (=> b!1231574 (=> (not res!819991) (not e!698660))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79438 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1231574 (= res!819991 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1231575 () Bool)

(declare-fun res!819988 () Bool)

(assert (=> b!1231575 (=> (not res!819988) (not e!698660))))

(declare-fun noDuplicate!1766 (List!27107) Bool)

(assert (=> b!1231575 (= res!819988 (noDuplicate!1766 acc!823))))

(declare-fun res!819994 () Bool)

(assert (=> start!102368 (=> (not res!819994) (not e!698660))))

(assert (=> start!102368 (= res!819994 (bvslt (size!38870 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102368 e!698660))

(declare-fun array_inv!29182 (array!79438) Bool)

(assert (=> start!102368 (array_inv!29182 a!3806)))

(assert (=> start!102368 true))

(declare-fun b!1231576 () Bool)

(assert (=> b!1231576 (= e!698660 (not e!698659))))

(declare-fun res!819986 () Bool)

(assert (=> b!1231576 (=> res!819986 e!698659)))

(assert (=> b!1231576 (= res!819986 (bvsgt from!3184 (size!38870 a!3806)))))

(assert (=> b!1231576 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27103 (select (arr!38334 a!3806) from!3184) acc!823))))

(declare-fun b!1231577 () Bool)

(declare-fun res!819992 () Bool)

(assert (=> b!1231577 (=> res!819992 e!698659)))

(declare-fun subseq!504 (List!27107 List!27107) Bool)

(assert (=> b!1231577 (= res!819992 (not (subseq!504 Nil!27104 acc!823)))))

(declare-fun b!1231578 () Bool)

(declare-fun res!819982 () Bool)

(assert (=> b!1231578 (=> (not res!819982) (not e!698660))))

(assert (=> b!1231578 (= res!819982 (validKeyInArray!0 k0!2913))))

(declare-fun b!1231579 () Bool)

(declare-fun res!819989 () Bool)

(assert (=> b!1231579 (=> (not res!819989) (not e!698660))))

(assert (=> b!1231579 (= res!819989 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38870 a!3806)) (bvslt from!3184 (size!38870 a!3806))))))

(declare-fun b!1231580 () Bool)

(declare-fun res!819985 () Bool)

(assert (=> b!1231580 (=> (not res!819985) (not e!698660))))

(assert (=> b!1231580 (= res!819985 (not (contains!7169 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102368 res!819994) b!1231578))

(assert (= (and b!1231578 res!819982) b!1231579))

(assert (= (and b!1231579 res!819989) b!1231575))

(assert (= (and b!1231575 res!819988) b!1231580))

(assert (= (and b!1231580 res!819985) b!1231573))

(assert (= (and b!1231573 res!819993) b!1231574))

(assert (= (and b!1231574 res!819991) b!1231572))

(assert (= (and b!1231572 res!819984) b!1231570))

(assert (= (and b!1231570 res!819983) b!1231576))

(assert (= (and b!1231576 (not res!819986)) b!1231569))

(assert (= (and b!1231569 (not res!819990)) b!1231568))

(assert (= (and b!1231568 (not res!819987)) b!1231577))

(assert (= (and b!1231577 (not res!819992)) b!1231571))

(declare-fun m!1135685 () Bool)

(assert (=> b!1231569 m!1135685))

(declare-fun m!1135687 () Bool)

(assert (=> b!1231572 m!1135687))

(declare-fun m!1135689 () Bool)

(assert (=> b!1231580 m!1135689))

(declare-fun m!1135691 () Bool)

(assert (=> b!1231568 m!1135691))

(declare-fun m!1135693 () Bool)

(assert (=> start!102368 m!1135693))

(declare-fun m!1135695 () Bool)

(assert (=> b!1231571 m!1135695))

(declare-fun m!1135697 () Bool)

(assert (=> b!1231578 m!1135697))

(declare-fun m!1135699 () Bool)

(assert (=> b!1231570 m!1135699))

(assert (=> b!1231570 m!1135699))

(declare-fun m!1135701 () Bool)

(assert (=> b!1231570 m!1135701))

(declare-fun m!1135703 () Bool)

(assert (=> b!1231573 m!1135703))

(declare-fun m!1135705 () Bool)

(assert (=> b!1231575 m!1135705))

(declare-fun m!1135707 () Bool)

(assert (=> b!1231577 m!1135707))

(declare-fun m!1135709 () Bool)

(assert (=> b!1231574 m!1135709))

(assert (=> b!1231576 m!1135699))

(declare-fun m!1135711 () Bool)

(assert (=> b!1231576 m!1135711))

(check-sat (not b!1231578) (not b!1231569) (not b!1231572) (not b!1231568) (not b!1231577) (not b!1231574) (not b!1231575) (not b!1231576) (not b!1231571) (not start!102368) (not b!1231570) (not b!1231580) (not b!1231573))
(check-sat)
