; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62476 () Bool)

(assert start!62476)

(declare-fun b!703010 () Bool)

(declare-fun res!466822 () Bool)

(declare-fun e!397564 () Bool)

(assert (=> b!703010 (=> (not res!466822) (not e!397564))))

(declare-datatypes ((List!13275 0))(
  ( (Nil!13272) (Cons!13271 (h!14316 (_ BitVec 64)) (t!19557 List!13275)) )
))
(declare-fun lt!317758 () List!13275)

(declare-datatypes ((array!40155 0))(
  ( (array!40156 (arr!19234 (Array (_ BitVec 32) (_ BitVec 64))) (size!19619 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40155)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!40155 (_ BitVec 32) List!13275) Bool)

(assert (=> b!703010 (= res!466822 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317758))))

(declare-fun b!703011 () Bool)

(declare-fun res!466830 () Bool)

(declare-fun e!397563 () Bool)

(assert (=> b!703011 (=> (not res!466830) (not e!397563))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!703011 (= res!466830 (validKeyInArray!0 (select (arr!19234 a!3591) from!2969)))))

(declare-fun b!703012 () Bool)

(declare-fun res!466848 () Bool)

(assert (=> b!703012 (=> (not res!466848) (not e!397563))))

(declare-fun acc!652 () List!13275)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun contains!3852 (List!13275 (_ BitVec 64)) Bool)

(assert (=> b!703012 (= res!466848 (not (contains!3852 acc!652 k0!2824)))))

(declare-fun b!703013 () Bool)

(declare-fun res!466827 () Bool)

(assert (=> b!703013 (=> (not res!466827) (not e!397563))))

(declare-fun newAcc!49 () List!13275)

(assert (=> b!703013 (= res!466827 (not (contains!3852 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!466847 () Bool)

(assert (=> start!62476 (=> (not res!466847) (not e!397563))))

(assert (=> start!62476 (= res!466847 (and (bvslt (size!19619 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19619 a!3591))))))

(assert (=> start!62476 e!397563))

(assert (=> start!62476 true))

(declare-fun array_inv!15030 (array!40155) Bool)

(assert (=> start!62476 (array_inv!15030 a!3591)))

(declare-fun b!703014 () Bool)

(declare-fun res!466844 () Bool)

(assert (=> b!703014 (=> (not res!466844) (not e!397563))))

(assert (=> b!703014 (= res!466844 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!703015 () Bool)

(declare-fun res!466828 () Bool)

(assert (=> b!703015 (=> (not res!466828) (not e!397564))))

(declare-fun arrayContainsKey!0 (array!40155 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!703015 (= res!466828 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!703016 () Bool)

(declare-fun res!466823 () Bool)

(assert (=> b!703016 (=> (not res!466823) (not e!397563))))

(assert (=> b!703016 (= res!466823 (contains!3852 newAcc!49 k0!2824))))

(declare-fun b!703017 () Bool)

(declare-fun res!466829 () Bool)

(assert (=> b!703017 (=> (not res!466829) (not e!397564))))

(declare-fun lt!317759 () List!13275)

(declare-fun noDuplicate!1099 (List!13275) Bool)

(assert (=> b!703017 (= res!466829 (noDuplicate!1099 lt!317759))))

(declare-fun b!703018 () Bool)

(declare-fun res!466846 () Bool)

(assert (=> b!703018 (=> (not res!466846) (not e!397564))))

(assert (=> b!703018 (= res!466846 (not (contains!3852 lt!317758 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703019 () Bool)

(declare-fun res!466843 () Bool)

(assert (=> b!703019 (=> (not res!466843) (not e!397563))))

(assert (=> b!703019 (= res!466843 (noDuplicate!1099 newAcc!49))))

(declare-fun b!703020 () Bool)

(declare-fun res!466824 () Bool)

(assert (=> b!703020 (=> (not res!466824) (not e!397564))))

(declare-fun -!262 (List!13275 (_ BitVec 64)) List!13275)

(assert (=> b!703020 (= res!466824 (= (-!262 lt!317759 k0!2824) lt!317758))))

(declare-fun b!703021 () Bool)

(declare-fun res!466841 () Bool)

(assert (=> b!703021 (=> (not res!466841) (not e!397563))))

(assert (=> b!703021 (= res!466841 (not (contains!3852 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703022 () Bool)

(declare-fun res!466833 () Bool)

(assert (=> b!703022 (=> (not res!466833) (not e!397564))))

(assert (=> b!703022 (= res!466833 (noDuplicate!1099 lt!317758))))

(declare-fun b!703023 () Bool)

(declare-fun res!466825 () Bool)

(assert (=> b!703023 (=> (not res!466825) (not e!397564))))

(assert (=> b!703023 (= res!466825 (not (contains!3852 lt!317758 k0!2824)))))

(declare-fun b!703024 () Bool)

(declare-fun res!466820 () Bool)

(assert (=> b!703024 (=> (not res!466820) (not e!397564))))

(declare-fun subseq!297 (List!13275 List!13275) Bool)

(assert (=> b!703024 (= res!466820 (subseq!297 lt!317758 lt!317759))))

(declare-fun b!703025 () Bool)

(declare-fun res!466835 () Bool)

(assert (=> b!703025 (=> (not res!466835) (not e!397563))))

(assert (=> b!703025 (= res!466835 (not (contains!3852 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703026 () Bool)

(declare-fun res!466832 () Bool)

(assert (=> b!703026 (=> (not res!466832) (not e!397563))))

(assert (=> b!703026 (= res!466832 (noDuplicate!1099 acc!652))))

(declare-fun b!703027 () Bool)

(assert (=> b!703027 (= e!397563 e!397564)))

(declare-fun res!466842 () Bool)

(assert (=> b!703027 (=> (not res!466842) (not e!397564))))

(assert (=> b!703027 (= res!466842 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!495 (List!13275 (_ BitVec 64)) List!13275)

(assert (=> b!703027 (= lt!317759 ($colon$colon!495 newAcc!49 (select (arr!19234 a!3591) from!2969)))))

(assert (=> b!703027 (= lt!317758 ($colon$colon!495 acc!652 (select (arr!19234 a!3591) from!2969)))))

(declare-fun b!703028 () Bool)

(declare-fun res!466840 () Bool)

(assert (=> b!703028 (=> (not res!466840) (not e!397564))))

(assert (=> b!703028 (= res!466840 (not (contains!3852 lt!317759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703029 () Bool)

(declare-fun res!466826 () Bool)

(assert (=> b!703029 (=> (not res!466826) (not e!397563))))

(assert (=> b!703029 (= res!466826 (not (contains!3852 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703030 () Bool)

(assert (=> b!703030 (= e!397564 (not true))))

(assert (=> b!703030 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317759)))

(declare-datatypes ((Unit!24602 0))(
  ( (Unit!24603) )
))
(declare-fun lt!317760 () Unit!24602)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40155 (_ BitVec 64) (_ BitVec 32) List!13275 List!13275) Unit!24602)

(assert (=> b!703030 (= lt!317760 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969) lt!317758 lt!317759))))

(declare-fun b!703031 () Bool)

(declare-fun res!466834 () Bool)

(assert (=> b!703031 (=> (not res!466834) (not e!397564))))

(assert (=> b!703031 (= res!466834 (contains!3852 lt!317759 k0!2824))))

(declare-fun b!703032 () Bool)

(declare-fun res!466839 () Bool)

(assert (=> b!703032 (=> (not res!466839) (not e!397563))))

(assert (=> b!703032 (= res!466839 (= (-!262 newAcc!49 k0!2824) acc!652))))

(declare-fun b!703033 () Bool)

(declare-fun res!466838 () Bool)

(assert (=> b!703033 (=> (not res!466838) (not e!397563))))

(assert (=> b!703033 (= res!466838 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!703034 () Bool)

(declare-fun res!466845 () Bool)

(assert (=> b!703034 (=> (not res!466845) (not e!397563))))

(assert (=> b!703034 (= res!466845 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19619 a!3591)))))

(declare-fun b!703035 () Bool)

(declare-fun res!466837 () Bool)

(assert (=> b!703035 (=> (not res!466837) (not e!397563))))

(assert (=> b!703035 (= res!466837 (subseq!297 acc!652 newAcc!49))))

(declare-fun b!703036 () Bool)

(declare-fun res!466836 () Bool)

(assert (=> b!703036 (=> (not res!466836) (not e!397564))))

(assert (=> b!703036 (= res!466836 (not (contains!3852 lt!317758 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703037 () Bool)

(declare-fun res!466831 () Bool)

(assert (=> b!703037 (=> (not res!466831) (not e!397563))))

(assert (=> b!703037 (= res!466831 (validKeyInArray!0 k0!2824))))

(declare-fun b!703038 () Bool)

(declare-fun res!466821 () Bool)

(assert (=> b!703038 (=> (not res!466821) (not e!397564))))

(assert (=> b!703038 (= res!466821 (not (contains!3852 lt!317759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62476 res!466847) b!703026))

(assert (= (and b!703026 res!466832) b!703019))

(assert (= (and b!703019 res!466843) b!703021))

(assert (= (and b!703021 res!466841) b!703025))

(assert (= (and b!703025 res!466835) b!703033))

(assert (= (and b!703033 res!466838) b!703012))

(assert (= (and b!703012 res!466848) b!703037))

(assert (= (and b!703037 res!466831) b!703014))

(assert (= (and b!703014 res!466844) b!703035))

(assert (= (and b!703035 res!466837) b!703016))

(assert (= (and b!703016 res!466823) b!703032))

(assert (= (and b!703032 res!466839) b!703029))

(assert (= (and b!703029 res!466826) b!703013))

(assert (= (and b!703013 res!466827) b!703034))

(assert (= (and b!703034 res!466845) b!703011))

(assert (= (and b!703011 res!466830) b!703027))

(assert (= (and b!703027 res!466842) b!703022))

(assert (= (and b!703022 res!466833) b!703017))

(assert (= (and b!703017 res!466829) b!703036))

(assert (= (and b!703036 res!466836) b!703018))

(assert (= (and b!703018 res!466846) b!703015))

(assert (= (and b!703015 res!466828) b!703023))

(assert (= (and b!703023 res!466825) b!703010))

(assert (= (and b!703010 res!466822) b!703024))

(assert (= (and b!703024 res!466820) b!703031))

(assert (= (and b!703031 res!466834) b!703020))

(assert (= (and b!703020 res!466824) b!703038))

(assert (= (and b!703038 res!466821) b!703028))

(assert (= (and b!703028 res!466840) b!703030))

(declare-fun m!661955 () Bool)

(assert (=> b!703016 m!661955))

(declare-fun m!661957 () Bool)

(assert (=> b!703027 m!661957))

(assert (=> b!703027 m!661957))

(declare-fun m!661959 () Bool)

(assert (=> b!703027 m!661959))

(assert (=> b!703027 m!661957))

(declare-fun m!661961 () Bool)

(assert (=> b!703027 m!661961))

(declare-fun m!661963 () Bool)

(assert (=> b!703038 m!661963))

(declare-fun m!661965 () Bool)

(assert (=> b!703014 m!661965))

(declare-fun m!661967 () Bool)

(assert (=> b!703021 m!661967))

(declare-fun m!661969 () Bool)

(assert (=> b!703019 m!661969))

(declare-fun m!661971 () Bool)

(assert (=> b!703030 m!661971))

(declare-fun m!661973 () Bool)

(assert (=> b!703030 m!661973))

(declare-fun m!661975 () Bool)

(assert (=> b!703015 m!661975))

(declare-fun m!661977 () Bool)

(assert (=> b!703025 m!661977))

(declare-fun m!661979 () Bool)

(assert (=> b!703035 m!661979))

(declare-fun m!661981 () Bool)

(assert (=> b!703017 m!661981))

(declare-fun m!661983 () Bool)

(assert (=> b!703036 m!661983))

(declare-fun m!661985 () Bool)

(assert (=> b!703023 m!661985))

(declare-fun m!661987 () Bool)

(assert (=> b!703031 m!661987))

(declare-fun m!661989 () Bool)

(assert (=> b!703020 m!661989))

(declare-fun m!661991 () Bool)

(assert (=> b!703012 m!661991))

(declare-fun m!661993 () Bool)

(assert (=> b!703037 m!661993))

(declare-fun m!661995 () Bool)

(assert (=> b!703018 m!661995))

(declare-fun m!661997 () Bool)

(assert (=> b!703028 m!661997))

(declare-fun m!661999 () Bool)

(assert (=> b!703032 m!661999))

(assert (=> b!703011 m!661957))

(assert (=> b!703011 m!661957))

(declare-fun m!662001 () Bool)

(assert (=> b!703011 m!662001))

(declare-fun m!662003 () Bool)

(assert (=> start!62476 m!662003))

(declare-fun m!662005 () Bool)

(assert (=> b!703029 m!662005))

(declare-fun m!662007 () Bool)

(assert (=> b!703033 m!662007))

(declare-fun m!662009 () Bool)

(assert (=> b!703010 m!662009))

(declare-fun m!662011 () Bool)

(assert (=> b!703022 m!662011))

(declare-fun m!662013 () Bool)

(assert (=> b!703024 m!662013))

(declare-fun m!662015 () Bool)

(assert (=> b!703013 m!662015))

(declare-fun m!662017 () Bool)

(assert (=> b!703026 m!662017))

(check-sat (not b!703020) (not b!703027) (not b!703015) (not b!703026) (not b!703012) (not b!703019) (not b!703025) (not b!703023) (not b!703032) (not b!703016) (not b!703014) (not b!703029) (not b!703011) (not b!703031) (not b!703010) (not start!62476) (not b!703037) (not b!703013) (not b!703021) (not b!703028) (not b!703030) (not b!703018) (not b!703033) (not b!703017) (not b!703022) (not b!703024) (not b!703036) (not b!703038) (not b!703035))
(check-sat)
