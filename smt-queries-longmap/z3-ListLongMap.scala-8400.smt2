; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102182 () Bool)

(assert start!102182)

(declare-fun b!1230134 () Bool)

(declare-fun e!698016 () Bool)

(declare-datatypes ((array!79357 0))(
  ( (array!79358 (arr!38298 (Array (_ BitVec 32) (_ BitVec 64))) (size!38834 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79357)

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((List!27071 0))(
  ( (Nil!27068) (Cons!27067 (h!28276 (_ BitVec 64)) (t!40534 List!27071)) )
))
(declare-fun arrayNoDuplicates!0 (array!79357 (_ BitVec 32) List!27071) Bool)

(assert (=> b!1230134 (= e!698016 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27067 (select (arr!38298 a!3806) from!3184) Nil!27068)))))

(declare-fun b!1230135 () Bool)

(declare-fun res!818626 () Bool)

(declare-fun e!698014 () Bool)

(assert (=> b!1230135 (=> (not res!818626) (not e!698014))))

(declare-fun acc!823 () List!27071)

(declare-fun noDuplicate!1730 (List!27071) Bool)

(assert (=> b!1230135 (= res!818626 (noDuplicate!1730 acc!823))))

(declare-fun b!1230136 () Bool)

(assert (=> b!1230136 (= e!698014 (not true))))

(declare-fun arrayContainsKey!0 (array!79357 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1230136 (not (arrayContainsKey!0 a!3806 (select (arr!38298 a!3806) from!3184) (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-datatypes ((Unit!40762 0))(
  ( (Unit!40763) )
))
(declare-fun lt!559328 () Unit!40762)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79357 (_ BitVec 32) (_ BitVec 64) List!27071) Unit!40762)

(assert (=> b!1230136 (= lt!559328 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (select (arr!38298 a!3806) from!3184) (Cons!27067 (select (arr!38298 a!3806) from!3184) Nil!27068)))))

(assert (=> b!1230136 e!698016))

(declare-fun res!818627 () Bool)

(assert (=> b!1230136 (=> (not res!818627) (not e!698016))))

(assert (=> b!1230136 (= res!818627 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27068))))

(declare-fun lt!559327 () Unit!40762)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79357 List!27071 List!27071 (_ BitVec 32)) Unit!40762)

(assert (=> b!1230136 (= lt!559327 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27068 from!3184))))

(assert (=> b!1230136 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27067 (select (arr!38298 a!3806) from!3184) acc!823))))

(declare-fun b!1230137 () Bool)

(declare-fun res!818620 () Bool)

(assert (=> b!1230137 (=> (not res!818620) (not e!698014))))

(declare-fun contains!7133 (List!27071 (_ BitVec 64)) Bool)

(assert (=> b!1230137 (= res!818620 (not (contains!7133 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!818624 () Bool)

(assert (=> start!102182 (=> (not res!818624) (not e!698014))))

(assert (=> start!102182 (= res!818624 (bvslt (size!38834 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102182 e!698014))

(declare-fun array_inv!29146 (array!79357) Bool)

(assert (=> start!102182 (array_inv!29146 a!3806)))

(assert (=> start!102182 true))

(declare-fun b!1230138 () Bool)

(declare-fun res!818625 () Bool)

(assert (=> b!1230138 (=> (not res!818625) (not e!698014))))

(assert (=> b!1230138 (= res!818625 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38834 a!3806)) (bvslt from!3184 (size!38834 a!3806))))))

(declare-fun b!1230139 () Bool)

(declare-fun res!818628 () Bool)

(assert (=> b!1230139 (=> (not res!818628) (not e!698014))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1230139 (= res!818628 (validKeyInArray!0 k0!2913))))

(declare-fun b!1230140 () Bool)

(declare-fun res!818622 () Bool)

(assert (=> b!1230140 (=> (not res!818622) (not e!698014))))

(assert (=> b!1230140 (= res!818622 (validKeyInArray!0 (select (arr!38298 a!3806) from!3184)))))

(declare-fun b!1230141 () Bool)

(declare-fun res!818629 () Bool)

(assert (=> b!1230141 (=> (not res!818629) (not e!698014))))

(assert (=> b!1230141 (= res!818629 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1230142 () Bool)

(declare-fun res!818621 () Bool)

(assert (=> b!1230142 (=> (not res!818621) (not e!698014))))

(assert (=> b!1230142 (= res!818621 (not (contains!7133 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230143 () Bool)

(declare-fun res!818623 () Bool)

(assert (=> b!1230143 (=> (not res!818623) (not e!698014))))

(assert (=> b!1230143 (= res!818623 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(assert (= (and start!102182 res!818624) b!1230139))

(assert (= (and b!1230139 res!818628) b!1230138))

(assert (= (and b!1230138 res!818625) b!1230135))

(assert (= (and b!1230135 res!818626) b!1230142))

(assert (= (and b!1230142 res!818621) b!1230137))

(assert (= (and b!1230137 res!818620) b!1230141))

(assert (= (and b!1230141 res!818629) b!1230143))

(assert (= (and b!1230143 res!818623) b!1230140))

(assert (= (and b!1230140 res!818622) b!1230136))

(assert (= (and b!1230136 res!818627) b!1230134))

(declare-fun m!1134589 () Bool)

(assert (=> b!1230136 m!1134589))

(declare-fun m!1134591 () Bool)

(assert (=> b!1230136 m!1134591))

(declare-fun m!1134593 () Bool)

(assert (=> b!1230136 m!1134593))

(declare-fun m!1134595 () Bool)

(assert (=> b!1230136 m!1134595))

(assert (=> b!1230136 m!1134593))

(declare-fun m!1134597 () Bool)

(assert (=> b!1230136 m!1134597))

(assert (=> b!1230136 m!1134593))

(declare-fun m!1134599 () Bool)

(assert (=> b!1230136 m!1134599))

(assert (=> b!1230134 m!1134593))

(declare-fun m!1134601 () Bool)

(assert (=> b!1230134 m!1134601))

(declare-fun m!1134603 () Bool)

(assert (=> b!1230142 m!1134603))

(declare-fun m!1134605 () Bool)

(assert (=> b!1230141 m!1134605))

(declare-fun m!1134607 () Bool)

(assert (=> start!102182 m!1134607))

(declare-fun m!1134609 () Bool)

(assert (=> b!1230143 m!1134609))

(declare-fun m!1134611 () Bool)

(assert (=> b!1230135 m!1134611))

(declare-fun m!1134613 () Bool)

(assert (=> b!1230139 m!1134613))

(assert (=> b!1230140 m!1134593))

(assert (=> b!1230140 m!1134593))

(declare-fun m!1134615 () Bool)

(assert (=> b!1230140 m!1134615))

(declare-fun m!1134617 () Bool)

(assert (=> b!1230137 m!1134617))

(check-sat (not b!1230135) (not start!102182) (not b!1230137) (not b!1230139) (not b!1230141) (not b!1230142) (not b!1230140) (not b!1230134) (not b!1230136) (not b!1230143))
(check-sat)
