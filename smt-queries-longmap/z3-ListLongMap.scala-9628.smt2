; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113908 () Bool)

(assert start!113908)

(declare-fun b!1350836 () Bool)

(declare-fun res!896308 () Bool)

(declare-fun e!768391 () Bool)

(assert (=> b!1350836 (=> res!896308 e!768391)))

(declare-datatypes ((List!31534 0))(
  ( (Nil!31531) (Cons!31530 (h!32739 (_ BitVec 64)) (t!46192 List!31534)) )
))
(declare-fun lt!597068 () List!31534)

(declare-fun contains!9243 (List!31534 (_ BitVec 64)) Bool)

(assert (=> b!1350836 (= res!896308 (contains!9243 lt!597068 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350837 () Bool)

(declare-fun res!896301 () Bool)

(declare-fun e!768389 () Bool)

(assert (=> b!1350837 (=> (not res!896301) (not e!768389))))

(declare-fun acc!759 () List!31534)

(assert (=> b!1350837 (= res!896301 (not (contains!9243 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350838 () Bool)

(declare-fun res!896294 () Bool)

(assert (=> b!1350838 (=> (not res!896294) (not e!768389))))

(assert (=> b!1350838 (= res!896294 (not (contains!9243 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350839 () Bool)

(declare-fun res!896307 () Bool)

(assert (=> b!1350839 (=> (not res!896307) (not e!768389))))

(declare-fun noDuplicate!2100 (List!31534) Bool)

(assert (=> b!1350839 (= res!896307 (noDuplicate!2100 acc!759))))

(declare-fun b!1350840 () Bool)

(declare-fun res!896305 () Bool)

(assert (=> b!1350840 (=> res!896305 e!768391)))

(assert (=> b!1350840 (= res!896305 (contains!9243 lt!597068 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350841 () Bool)

(declare-fun res!896302 () Bool)

(assert (=> b!1350841 (=> (not res!896302) (not e!768389))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1350841 (= res!896302 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1350842 () Bool)

(declare-fun res!896296 () Bool)

(assert (=> b!1350842 (=> (not res!896296) (not e!768389))))

(declare-datatypes ((array!92090 0))(
  ( (array!92091 (arr!44493 (Array (_ BitVec 32) (_ BitVec 64))) (size!45043 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92090)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92090 (_ BitVec 32) List!31534) Bool)

(assert (=> b!1350842 (= res!896296 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1350843 () Bool)

(declare-fun res!896304 () Bool)

(assert (=> b!1350843 (=> res!896304 e!768391)))

(declare-fun subseq!663 (List!31534 List!31534) Bool)

(assert (=> b!1350843 (= res!896304 (not (subseq!663 acc!759 lt!597068)))))

(declare-fun b!1350844 () Bool)

(declare-fun res!896297 () Bool)

(assert (=> b!1350844 (=> (not res!896297) (not e!768389))))

(assert (=> b!1350844 (= res!896297 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45043 a!3742)))))

(declare-fun b!1350845 () Bool)

(declare-fun res!896306 () Bool)

(assert (=> b!1350845 (=> (not res!896306) (not e!768389))))

(assert (=> b!1350845 (= res!896306 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31531))))

(declare-fun res!896298 () Bool)

(assert (=> start!113908 (=> (not res!896298) (not e!768389))))

(assert (=> start!113908 (= res!896298 (and (bvslt (size!45043 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45043 a!3742))))))

(assert (=> start!113908 e!768389))

(assert (=> start!113908 true))

(declare-fun array_inv!33521 (array!92090) Bool)

(assert (=> start!113908 (array_inv!33521 a!3742)))

(declare-fun b!1350846 () Bool)

(assert (=> b!1350846 (= e!768389 (not e!768391))))

(declare-fun res!896300 () Bool)

(assert (=> b!1350846 (=> res!896300 e!768391)))

(assert (=> b!1350846 (= res!896300 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!678 (List!31534 (_ BitVec 64)) List!31534)

(assert (=> b!1350846 (= lt!597068 ($colon$colon!678 acc!759 (select (arr!44493 a!3742) from!3120)))))

(assert (=> b!1350846 (subseq!663 acc!759 acc!759)))

(declare-datatypes ((Unit!44240 0))(
  ( (Unit!44241) )
))
(declare-fun lt!597070 () Unit!44240)

(declare-fun lemmaListSubSeqRefl!0 (List!31534) Unit!44240)

(assert (=> b!1350846 (= lt!597070 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1350847 () Bool)

(declare-fun res!896295 () Bool)

(assert (=> b!1350847 (=> res!896295 e!768391)))

(assert (=> b!1350847 (= res!896295 (not (noDuplicate!2100 lt!597068)))))

(declare-fun b!1350848 () Bool)

(declare-fun res!896299 () Bool)

(assert (=> b!1350848 (=> (not res!896299) (not e!768389))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1350848 (= res!896299 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45043 a!3742))))))

(declare-fun b!1350849 () Bool)

(assert (=> b!1350849 (= e!768391 true)))

(declare-fun lt!597067 () Bool)

(assert (=> b!1350849 (= lt!597067 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597068))))

(declare-fun lt!597069 () Unit!44240)

(declare-fun noDuplicateSubseq!114 (List!31534 List!31534) Unit!44240)

(assert (=> b!1350849 (= lt!597069 (noDuplicateSubseq!114 acc!759 lt!597068))))

(declare-fun b!1350850 () Bool)

(declare-fun res!896303 () Bool)

(assert (=> b!1350850 (=> (not res!896303) (not e!768389))))

(assert (=> b!1350850 (= res!896303 (validKeyInArray!0 (select (arr!44493 a!3742) from!3120)))))

(assert (= (and start!113908 res!896298) b!1350839))

(assert (= (and b!1350839 res!896307) b!1350838))

(assert (= (and b!1350838 res!896294) b!1350837))

(assert (= (and b!1350837 res!896301) b!1350845))

(assert (= (and b!1350845 res!896306) b!1350842))

(assert (= (and b!1350842 res!896296) b!1350848))

(assert (= (and b!1350848 res!896299) b!1350841))

(assert (= (and b!1350841 res!896302) b!1350844))

(assert (= (and b!1350844 res!896297) b!1350850))

(assert (= (and b!1350850 res!896303) b!1350846))

(assert (= (and b!1350846 (not res!896300)) b!1350847))

(assert (= (and b!1350847 (not res!896295)) b!1350840))

(assert (= (and b!1350840 (not res!896305)) b!1350836))

(assert (= (and b!1350836 (not res!896308)) b!1350843))

(assert (= (and b!1350843 (not res!896304)) b!1350849))

(declare-fun m!1237981 () Bool)

(assert (=> b!1350842 m!1237981))

(declare-fun m!1237983 () Bool)

(assert (=> b!1350839 m!1237983))

(declare-fun m!1237985 () Bool)

(assert (=> b!1350843 m!1237985))

(declare-fun m!1237987 () Bool)

(assert (=> b!1350846 m!1237987))

(assert (=> b!1350846 m!1237987))

(declare-fun m!1237989 () Bool)

(assert (=> b!1350846 m!1237989))

(declare-fun m!1237991 () Bool)

(assert (=> b!1350846 m!1237991))

(declare-fun m!1237993 () Bool)

(assert (=> b!1350846 m!1237993))

(declare-fun m!1237995 () Bool)

(assert (=> b!1350841 m!1237995))

(assert (=> b!1350850 m!1237987))

(assert (=> b!1350850 m!1237987))

(declare-fun m!1237997 () Bool)

(assert (=> b!1350850 m!1237997))

(declare-fun m!1237999 () Bool)

(assert (=> b!1350845 m!1237999))

(declare-fun m!1238001 () Bool)

(assert (=> b!1350840 m!1238001))

(declare-fun m!1238003 () Bool)

(assert (=> b!1350847 m!1238003))

(declare-fun m!1238005 () Bool)

(assert (=> b!1350849 m!1238005))

(declare-fun m!1238007 () Bool)

(assert (=> b!1350849 m!1238007))

(declare-fun m!1238009 () Bool)

(assert (=> b!1350838 m!1238009))

(declare-fun m!1238011 () Bool)

(assert (=> b!1350836 m!1238011))

(declare-fun m!1238013 () Bool)

(assert (=> start!113908 m!1238013))

(declare-fun m!1238015 () Bool)

(assert (=> b!1350837 m!1238015))

(check-sat (not b!1350839) (not b!1350845) (not b!1350842) (not b!1350841) (not b!1350836) (not b!1350850) (not b!1350838) (not b!1350846) (not start!113908) (not b!1350840) (not b!1350847) (not b!1350849) (not b!1350837) (not b!1350843))
(check-sat)
