; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114098 () Bool)

(assert start!114098)

(declare-fun b!1354865 () Bool)

(declare-fun e!769551 () Bool)

(declare-fun e!769548 () Bool)

(assert (=> b!1354865 (= e!769551 e!769548)))

(declare-fun res!899917 () Bool)

(assert (=> b!1354865 (=> (not res!899917) (not e!769548))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1354865 (= res!899917 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-datatypes ((List!31682 0))(
  ( (Nil!31679) (Cons!31678 (h!32887 (_ BitVec 64)) (t!46332 List!31682)) )
))
(declare-fun lt!598241 () List!31682)

(declare-fun acc!759 () List!31682)

(declare-datatypes ((array!92229 0))(
  ( (array!92230 (arr!44563 (Array (_ BitVec 32) (_ BitVec 64))) (size!45115 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92229)

(declare-fun $colon$colon!775 (List!31682 (_ BitVec 64)) List!31682)

(assert (=> b!1354865 (= lt!598241 ($colon$colon!775 acc!759 (select (arr!44563 a!3742) from!3120)))))

(declare-fun b!1354866 () Bool)

(declare-fun res!899915 () Bool)

(declare-fun e!769552 () Bool)

(assert (=> b!1354866 (=> (not res!899915) (not e!769552))))

(declare-fun contains!9302 (List!31682 (_ BitVec 64)) Bool)

(assert (=> b!1354866 (= res!899915 (not (contains!9302 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354867 () Bool)

(declare-fun res!899919 () Bool)

(assert (=> b!1354867 (=> (not res!899919) (not e!769552))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1354867 (= res!899919 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45115 a!3742))))))

(declare-fun b!1354868 () Bool)

(declare-fun res!899913 () Bool)

(assert (=> b!1354868 (=> (not res!899913) (not e!769552))))

(declare-fun arrayNoDuplicates!0 (array!92229 (_ BitVec 32) List!31682) Bool)

(assert (=> b!1354868 (= res!899913 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31679))))

(declare-fun b!1354869 () Bool)

(declare-fun res!899923 () Bool)

(assert (=> b!1354869 (=> (not res!899923) (not e!769552))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1354869 (= res!899923 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1354870 () Bool)

(declare-fun res!899922 () Bool)

(assert (=> b!1354870 (=> (not res!899922) (not e!769552))))

(assert (=> b!1354870 (= res!899922 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45115 a!3742)))))

(declare-fun b!1354871 () Bool)

(declare-fun res!899921 () Bool)

(assert (=> b!1354871 (=> (not res!899921) (not e!769552))))

(declare-fun noDuplicate!2217 (List!31682) Bool)

(assert (=> b!1354871 (= res!899921 (noDuplicate!2217 acc!759))))

(declare-fun b!1354872 () Bool)

(declare-fun res!899920 () Bool)

(assert (=> b!1354872 (=> (not res!899920) (not e!769548))))

(assert (=> b!1354872 (= res!899920 (not (contains!9302 lt!598241 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354873 () Bool)

(declare-fun res!899912 () Bool)

(assert (=> b!1354873 (=> (not res!899912) (not e!769548))))

(assert (=> b!1354873 (= res!899912 (noDuplicate!2217 lt!598241))))

(declare-fun b!1354875 () Bool)

(declare-fun res!899918 () Bool)

(assert (=> b!1354875 (=> (not res!899918) (not e!769552))))

(assert (=> b!1354875 (= res!899918 (not (contains!9302 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354876 () Bool)

(assert (=> b!1354876 (= e!769552 e!769551)))

(declare-fun res!899910 () Bool)

(assert (=> b!1354876 (=> (not res!899910) (not e!769551))))

(declare-fun lt!598244 () Bool)

(assert (=> b!1354876 (= res!899910 (and (not (= from!3120 i!1404)) lt!598244))))

(declare-datatypes ((Unit!44346 0))(
  ( (Unit!44347) )
))
(declare-fun lt!598242 () Unit!44346)

(declare-fun e!769550 () Unit!44346)

(assert (=> b!1354876 (= lt!598242 e!769550)))

(declare-fun c!126920 () Bool)

(assert (=> b!1354876 (= c!126920 lt!598244)))

(assert (=> b!1354876 (= lt!598244 (validKeyInArray!0 (select (arr!44563 a!3742) from!3120)))))

(declare-fun b!1354877 () Bool)

(declare-fun res!899924 () Bool)

(assert (=> b!1354877 (=> (not res!899924) (not e!769548))))

(assert (=> b!1354877 (= res!899924 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!598241))))

(declare-fun b!1354878 () Bool)

(declare-fun Unit!44348 () Unit!44346)

(assert (=> b!1354878 (= e!769550 Unit!44348)))

(declare-fun b!1354879 () Bool)

(assert (=> b!1354879 (= e!769548 (not true))))

(assert (=> b!1354879 (arrayNoDuplicates!0 (array!92230 (store (arr!44563 a!3742) i!1404 l!3587) (size!45115 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) lt!598241)))

(declare-fun lt!598246 () Unit!44346)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92229 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31682) Unit!44346)

(assert (=> b!1354879 (= lt!598246 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) lt!598241))))

(declare-fun b!1354880 () Bool)

(declare-fun res!899916 () Bool)

(assert (=> b!1354880 (=> (not res!899916) (not e!769548))))

(assert (=> b!1354880 (= res!899916 (not (contains!9302 lt!598241 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354881 () Bool)

(declare-fun lt!598245 () Unit!44346)

(assert (=> b!1354881 (= e!769550 lt!598245)))

(declare-fun lt!598243 () Unit!44346)

(declare-fun lemmaListSubSeqRefl!0 (List!31682) Unit!44346)

(assert (=> b!1354881 (= lt!598243 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!758 (List!31682 List!31682) Bool)

(assert (=> b!1354881 (subseq!758 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92229 List!31682 List!31682 (_ BitVec 32)) Unit!44346)

(assert (=> b!1354881 (= lt!598245 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!775 acc!759 (select (arr!44563 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1354881 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun res!899911 () Bool)

(assert (=> start!114098 (=> (not res!899911) (not e!769552))))

(assert (=> start!114098 (= res!899911 (and (bvslt (size!45115 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45115 a!3742))))))

(assert (=> start!114098 e!769552))

(assert (=> start!114098 true))

(declare-fun array_inv!33796 (array!92229) Bool)

(assert (=> start!114098 (array_inv!33796 a!3742)))

(declare-fun b!1354874 () Bool)

(declare-fun res!899914 () Bool)

(assert (=> b!1354874 (=> (not res!899914) (not e!769552))))

(assert (=> b!1354874 (= res!899914 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(assert (= (and start!114098 res!899911) b!1354871))

(assert (= (and b!1354871 res!899921) b!1354875))

(assert (= (and b!1354875 res!899918) b!1354866))

(assert (= (and b!1354866 res!899915) b!1354868))

(assert (= (and b!1354868 res!899913) b!1354874))

(assert (= (and b!1354874 res!899914) b!1354867))

(assert (= (and b!1354867 res!899919) b!1354869))

(assert (= (and b!1354869 res!899923) b!1354870))

(assert (= (and b!1354870 res!899922) b!1354876))

(assert (= (and b!1354876 c!126920) b!1354881))

(assert (= (and b!1354876 (not c!126920)) b!1354878))

(assert (= (and b!1354876 res!899910) b!1354865))

(assert (= (and b!1354865 res!899917) b!1354873))

(assert (= (and b!1354873 res!899912) b!1354880))

(assert (= (and b!1354880 res!899916) b!1354872))

(assert (= (and b!1354872 res!899920) b!1354877))

(assert (= (and b!1354877 res!899924) b!1354879))

(declare-fun m!1240699 () Bool)

(assert (=> b!1354880 m!1240699))

(declare-fun m!1240701 () Bool)

(assert (=> b!1354872 m!1240701))

(declare-fun m!1240703 () Bool)

(assert (=> b!1354881 m!1240703))

(declare-fun m!1240705 () Bool)

(assert (=> b!1354881 m!1240705))

(declare-fun m!1240707 () Bool)

(assert (=> b!1354881 m!1240707))

(declare-fun m!1240709 () Bool)

(assert (=> b!1354881 m!1240709))

(declare-fun m!1240711 () Bool)

(assert (=> b!1354881 m!1240711))

(assert (=> b!1354881 m!1240705))

(assert (=> b!1354881 m!1240707))

(declare-fun m!1240713 () Bool)

(assert (=> b!1354881 m!1240713))

(declare-fun m!1240715 () Bool)

(assert (=> b!1354871 m!1240715))

(declare-fun m!1240717 () Bool)

(assert (=> b!1354869 m!1240717))

(declare-fun m!1240719 () Bool)

(assert (=> b!1354866 m!1240719))

(assert (=> b!1354865 m!1240705))

(assert (=> b!1354865 m!1240705))

(assert (=> b!1354865 m!1240707))

(declare-fun m!1240721 () Bool)

(assert (=> b!1354873 m!1240721))

(declare-fun m!1240723 () Bool)

(assert (=> b!1354877 m!1240723))

(assert (=> b!1354876 m!1240705))

(assert (=> b!1354876 m!1240705))

(declare-fun m!1240725 () Bool)

(assert (=> b!1354876 m!1240725))

(declare-fun m!1240727 () Bool)

(assert (=> b!1354875 m!1240727))

(declare-fun m!1240729 () Bool)

(assert (=> b!1354874 m!1240729))

(declare-fun m!1240731 () Bool)

(assert (=> start!114098 m!1240731))

(declare-fun m!1240733 () Bool)

(assert (=> b!1354868 m!1240733))

(declare-fun m!1240735 () Bool)

(assert (=> b!1354879 m!1240735))

(declare-fun m!1240737 () Bool)

(assert (=> b!1354879 m!1240737))

(declare-fun m!1240739 () Bool)

(assert (=> b!1354879 m!1240739))

(check-sat (not b!1354876) (not b!1354880) (not b!1354877) (not b!1354868) (not b!1354872) (not b!1354871) (not b!1354873) (not b!1354881) (not b!1354866) (not b!1354874) (not b!1354879) (not b!1354865) (not start!114098) (not b!1354869) (not b!1354875))
(check-sat)
