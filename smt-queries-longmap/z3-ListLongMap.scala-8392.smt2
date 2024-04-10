; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102134 () Bool)

(assert start!102134)

(declare-fun b!1229182 () Bool)

(declare-fun res!817673 () Bool)

(declare-fun e!697742 () Bool)

(assert (=> b!1229182 (=> (not res!817673) (not e!697742))))

(declare-datatypes ((List!27047 0))(
  ( (Nil!27044) (Cons!27043 (h!28252 (_ BitVec 64)) (t!40510 List!27047)) )
))
(declare-fun acc!823 () List!27047)

(declare-fun contains!7109 (List!27047 (_ BitVec 64)) Bool)

(assert (=> b!1229182 (= res!817673 (not (contains!7109 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229183 () Bool)

(declare-fun e!697740 () Bool)

(assert (=> b!1229183 (= e!697742 (not e!697740))))

(declare-fun res!817676 () Bool)

(assert (=> b!1229183 (=> res!817676 e!697740)))

(declare-fun from!3184 () (_ BitVec 32))

(assert (=> b!1229183 (= res!817676 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(declare-fun lt!559127 () List!27047)

(declare-datatypes ((array!79309 0))(
  ( (array!79310 (arr!38274 (Array (_ BitVec 32) (_ BitVec 64))) (size!38810 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79309)

(assert (=> b!1229183 (= lt!559127 (Cons!27043 (select (arr!38274 a!3806) from!3184) Nil!27044))))

(declare-fun e!697741 () Bool)

(assert (=> b!1229183 e!697741))

(declare-fun res!817674 () Bool)

(assert (=> b!1229183 (=> (not res!817674) (not e!697741))))

(declare-fun arrayNoDuplicates!0 (array!79309 (_ BitVec 32) List!27047) Bool)

(assert (=> b!1229183 (= res!817674 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27044))))

(declare-datatypes ((Unit!40714 0))(
  ( (Unit!40715) )
))
(declare-fun lt!559126 () Unit!40714)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79309 List!27047 List!27047 (_ BitVec 32)) Unit!40714)

(assert (=> b!1229183 (= lt!559126 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27044 from!3184))))

(assert (=> b!1229183 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27043 (select (arr!38274 a!3806) from!3184) acc!823))))

(declare-fun b!1229184 () Bool)

(declare-fun res!817677 () Bool)

(assert (=> b!1229184 (=> (not res!817677) (not e!697742))))

(assert (=> b!1229184 (= res!817677 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38810 a!3806)) (bvslt from!3184 (size!38810 a!3806))))))

(declare-fun b!1229185 () Bool)

(declare-fun res!817672 () Bool)

(assert (=> b!1229185 (=> (not res!817672) (not e!697742))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1229185 (= res!817672 (validKeyInArray!0 (select (arr!38274 a!3806) from!3184)))))

(declare-fun b!1229186 () Bool)

(assert (=> b!1229186 (= e!697740 true)))

(declare-fun lt!559125 () Bool)

(assert (=> b!1229186 (= lt!559125 (contains!7109 lt!559127 (select (arr!38274 a!3806) from!3184)))))

(declare-fun b!1229187 () Bool)

(declare-fun res!817678 () Bool)

(assert (=> b!1229187 (=> (not res!817678) (not e!697742))))

(assert (=> b!1229187 (= res!817678 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1229189 () Bool)

(declare-fun res!817670 () Bool)

(assert (=> b!1229189 (=> (not res!817670) (not e!697742))))

(declare-fun noDuplicate!1706 (List!27047) Bool)

(assert (=> b!1229189 (= res!817670 (noDuplicate!1706 acc!823))))

(declare-fun b!1229190 () Bool)

(declare-fun res!817671 () Bool)

(assert (=> b!1229190 (=> res!817671 e!697740)))

(assert (=> b!1229190 (= res!817671 (contains!7109 lt!559127 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229191 () Bool)

(declare-fun res!817680 () Bool)

(assert (=> b!1229191 (=> (not res!817680) (not e!697742))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79309 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1229191 (= res!817680 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1229192 () Bool)

(declare-fun res!817668 () Bool)

(assert (=> b!1229192 (=> res!817668 e!697740)))

(assert (=> b!1229192 (= res!817668 (not (noDuplicate!1706 lt!559127)))))

(declare-fun b!1229193 () Bool)

(declare-fun res!817675 () Bool)

(assert (=> b!1229193 (=> (not res!817675) (not e!697742))))

(assert (=> b!1229193 (= res!817675 (validKeyInArray!0 k0!2913))))

(declare-fun res!817681 () Bool)

(assert (=> start!102134 (=> (not res!817681) (not e!697742))))

(assert (=> start!102134 (= res!817681 (bvslt (size!38810 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102134 e!697742))

(declare-fun array_inv!29122 (array!79309) Bool)

(assert (=> start!102134 (array_inv!29122 a!3806)))

(assert (=> start!102134 true))

(declare-fun b!1229188 () Bool)

(assert (=> b!1229188 (= e!697741 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27043 (select (arr!38274 a!3806) from!3184) Nil!27044)))))

(declare-fun b!1229194 () Bool)

(declare-fun res!817669 () Bool)

(assert (=> b!1229194 (=> (not res!817669) (not e!697742))))

(assert (=> b!1229194 (= res!817669 (not (contains!7109 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229195 () Bool)

(declare-fun res!817679 () Bool)

(assert (=> b!1229195 (=> res!817679 e!697740)))

(assert (=> b!1229195 (= res!817679 (contains!7109 lt!559127 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!102134 res!817681) b!1229193))

(assert (= (and b!1229193 res!817675) b!1229184))

(assert (= (and b!1229184 res!817677) b!1229189))

(assert (= (and b!1229189 res!817670) b!1229182))

(assert (= (and b!1229182 res!817673) b!1229194))

(assert (= (and b!1229194 res!817669) b!1229191))

(assert (= (and b!1229191 res!817680) b!1229187))

(assert (= (and b!1229187 res!817678) b!1229185))

(assert (= (and b!1229185 res!817672) b!1229183))

(assert (= (and b!1229183 res!817674) b!1229188))

(assert (= (and b!1229183 (not res!817676)) b!1229192))

(assert (= (and b!1229192 (not res!817668)) b!1229190))

(assert (= (and b!1229190 (not res!817671)) b!1229195))

(assert (= (and b!1229195 (not res!817679)) b!1229186))

(declare-fun m!1133789 () Bool)

(assert (=> b!1229190 m!1133789))

(declare-fun m!1133791 () Bool)

(assert (=> b!1229182 m!1133791))

(declare-fun m!1133793 () Bool)

(assert (=> b!1229187 m!1133793))

(declare-fun m!1133795 () Bool)

(assert (=> b!1229186 m!1133795))

(assert (=> b!1229186 m!1133795))

(declare-fun m!1133797 () Bool)

(assert (=> b!1229186 m!1133797))

(declare-fun m!1133799 () Bool)

(assert (=> b!1229191 m!1133799))

(assert (=> b!1229188 m!1133795))

(declare-fun m!1133801 () Bool)

(assert (=> b!1229188 m!1133801))

(declare-fun m!1133803 () Bool)

(assert (=> b!1229192 m!1133803))

(declare-fun m!1133805 () Bool)

(assert (=> b!1229189 m!1133805))

(declare-fun m!1133807 () Bool)

(assert (=> b!1229195 m!1133807))

(declare-fun m!1133809 () Bool)

(assert (=> b!1229194 m!1133809))

(declare-fun m!1133811 () Bool)

(assert (=> b!1229193 m!1133811))

(assert (=> b!1229185 m!1133795))

(assert (=> b!1229185 m!1133795))

(declare-fun m!1133813 () Bool)

(assert (=> b!1229185 m!1133813))

(assert (=> b!1229183 m!1133795))

(declare-fun m!1133815 () Bool)

(assert (=> b!1229183 m!1133815))

(declare-fun m!1133817 () Bool)

(assert (=> b!1229183 m!1133817))

(declare-fun m!1133819 () Bool)

(assert (=> b!1229183 m!1133819))

(declare-fun m!1133821 () Bool)

(assert (=> start!102134 m!1133821))

(check-sat (not b!1229182) (not b!1229185) (not b!1229194) (not b!1229183) (not b!1229193) (not b!1229190) (not b!1229188) (not b!1229195) (not b!1229192) (not start!102134) (not b!1229189) (not b!1229191) (not b!1229187) (not b!1229186))
(check-sat)
