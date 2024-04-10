; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102370 () Bool)

(assert start!102370)

(declare-fun b!1231607 () Bool)

(declare-fun res!820024 () Bool)

(declare-fun e!698669 () Bool)

(assert (=> b!1231607 (=> res!820024 e!698669)))

(declare-datatypes ((List!27108 0))(
  ( (Nil!27105) (Cons!27104 (h!28313 (_ BitVec 64)) (t!40571 List!27108)) )
))
(declare-fun contains!7170 (List!27108 (_ BitVec 64)) Bool)

(assert (=> b!1231607 (= res!820024 (contains!7170 Nil!27105 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1231608 () Bool)

(declare-fun res!820021 () Bool)

(assert (=> b!1231608 (=> res!820021 e!698669)))

(assert (=> b!1231608 (= res!820021 (contains!7170 Nil!27105 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1231609 () Bool)

(declare-fun res!820033 () Bool)

(declare-fun e!698670 () Bool)

(assert (=> b!1231609 (=> (not res!820033) (not e!698670))))

(declare-datatypes ((array!79440 0))(
  ( (array!79441 (arr!38335 (Array (_ BitVec 32) (_ BitVec 64))) (size!38871 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79440)

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79440 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1231609 (= res!820033 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1231610 () Bool)

(declare-fun res!820023 () Bool)

(assert (=> b!1231610 (=> (not res!820023) (not e!698670))))

(declare-fun acc!823 () List!27108)

(declare-fun noDuplicate!1767 (List!27108) Bool)

(assert (=> b!1231610 (= res!820023 (noDuplicate!1767 acc!823))))

(declare-fun b!1231611 () Bool)

(declare-fun res!820031 () Bool)

(assert (=> b!1231611 (=> (not res!820031) (not e!698670))))

(assert (=> b!1231611 (= res!820031 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38871 a!3806)) (bvslt from!3184 (size!38871 a!3806))))))

(declare-fun b!1231612 () Bool)

(assert (=> b!1231612 (= e!698669 true)))

(declare-datatypes ((Unit!40776 0))(
  ( (Unit!40777) )
))
(declare-fun lt!559427 () Unit!40776)

(declare-fun noDuplicateSubseq!55 (List!27108 List!27108) Unit!40776)

(assert (=> b!1231612 (= lt!559427 (noDuplicateSubseq!55 Nil!27105 acc!823))))

(declare-fun b!1231613 () Bool)

(declare-fun res!820030 () Bool)

(assert (=> b!1231613 (=> (not res!820030) (not e!698670))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1231613 (= res!820030 (validKeyInArray!0 (select (arr!38335 a!3806) from!3184)))))

(declare-fun b!1231614 () Bool)

(declare-fun res!820025 () Bool)

(assert (=> b!1231614 (=> (not res!820025) (not e!698670))))

(declare-fun arrayNoDuplicates!0 (array!79440 (_ BitVec 32) List!27108) Bool)

(assert (=> b!1231614 (= res!820025 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun res!820029 () Bool)

(assert (=> start!102370 (=> (not res!820029) (not e!698670))))

(assert (=> start!102370 (= res!820029 (bvslt (size!38871 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102370 e!698670))

(declare-fun array_inv!29183 (array!79440) Bool)

(assert (=> start!102370 (array_inv!29183 a!3806)))

(assert (=> start!102370 true))

(declare-fun b!1231615 () Bool)

(declare-fun res!820026 () Bool)

(assert (=> b!1231615 (=> (not res!820026) (not e!698670))))

(assert (=> b!1231615 (= res!820026 (not (contains!7170 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231616 () Bool)

(declare-fun res!820032 () Bool)

(assert (=> b!1231616 (=> (not res!820032) (not e!698670))))

(assert (=> b!1231616 (= res!820032 (not (contains!7170 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231617 () Bool)

(declare-fun res!820028 () Bool)

(assert (=> b!1231617 (=> (not res!820028) (not e!698670))))

(assert (=> b!1231617 (= res!820028 (validKeyInArray!0 k!2913))))

(declare-fun b!1231618 () Bool)

(declare-fun res!820027 () Bool)

(assert (=> b!1231618 (=> res!820027 e!698669)))

(declare-fun subseq!505 (List!27108 List!27108) Bool)

(assert (=> b!1231618 (= res!820027 (not (subseq!505 Nil!27105 acc!823)))))

(declare-fun b!1231619 () Bool)

(assert (=> b!1231619 (= e!698670 (not e!698669))))

(declare-fun res!820022 () Bool)

(assert (=> b!1231619 (=> res!820022 e!698669)))

(assert (=> b!1231619 (= res!820022 (bvsgt from!3184 (size!38871 a!3806)))))

(assert (=> b!1231619 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27104 (select (arr!38335 a!3806) from!3184) acc!823))))

(assert (= (and start!102370 res!820029) b!1231617))

(assert (= (and b!1231617 res!820028) b!1231611))

(assert (= (and b!1231611 res!820031) b!1231610))

(assert (= (and b!1231610 res!820023) b!1231615))

(assert (= (and b!1231615 res!820026) b!1231616))

(assert (= (and b!1231616 res!820032) b!1231609))

(assert (= (and b!1231609 res!820033) b!1231614))

(assert (= (and b!1231614 res!820025) b!1231613))

(assert (= (and b!1231613 res!820030) b!1231619))

(assert (= (and b!1231619 (not res!820022)) b!1231607))

(assert (= (and b!1231607 (not res!820024)) b!1231608))

(assert (= (and b!1231608 (not res!820021)) b!1231618))

(assert (= (and b!1231618 (not res!820027)) b!1231612))

(declare-fun m!1135713 () Bool)

(assert (=> b!1231612 m!1135713))

(declare-fun m!1135715 () Bool)

(assert (=> b!1231616 m!1135715))

(declare-fun m!1135717 () Bool)

(assert (=> b!1231607 m!1135717))

(declare-fun m!1135719 () Bool)

(assert (=> b!1231608 m!1135719))

(declare-fun m!1135721 () Bool)

(assert (=> b!1231609 m!1135721))

(declare-fun m!1135723 () Bool)

(assert (=> b!1231610 m!1135723))

(declare-fun m!1135725 () Bool)

(assert (=> b!1231619 m!1135725))

(declare-fun m!1135727 () Bool)

(assert (=> b!1231619 m!1135727))

(declare-fun m!1135729 () Bool)

(assert (=> b!1231614 m!1135729))

(declare-fun m!1135731 () Bool)

(assert (=> b!1231618 m!1135731))

(declare-fun m!1135733 () Bool)

(assert (=> b!1231617 m!1135733))

(assert (=> b!1231613 m!1135725))

(assert (=> b!1231613 m!1135725))

(declare-fun m!1135735 () Bool)

(assert (=> b!1231613 m!1135735))

(declare-fun m!1135737 () Bool)

(assert (=> b!1231615 m!1135737))

(declare-fun m!1135739 () Bool)

(assert (=> start!102370 m!1135739))

(push 1)

(assert (not b!1231607))

(assert (not b!1231614))

(assert (not b!1231613))

(assert (not b!1231609))

(assert (not b!1231617))

(assert (not b!1231616))

(assert (not b!1231608))

(assert (not start!102370))

(assert (not b!1231612))

(assert (not b!1231610))

(assert (not b!1231615))

(assert (not b!1231618))

(assert (not b!1231619))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

