; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115450 () Bool)

(assert start!115450)

(declare-fun b!1365323 () Bool)

(declare-fun e!774184 () Bool)

(declare-fun e!774186 () Bool)

(assert (=> b!1365323 (= e!774184 e!774186)))

(declare-fun res!908901 () Bool)

(assert (=> b!1365323 (=> (not res!908901) (not e!774186))))

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> b!1365323 (= res!908901 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-datatypes ((array!92771 0))(
  ( (array!92772 (arr!44814 (Array (_ BitVec 32) (_ BitVec 64))) (size!45364 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92771)

(declare-datatypes ((List!31882 0))(
  ( (Nil!31879) (Cons!31878 (h!33087 (_ BitVec 64)) (t!46576 List!31882)) )
))
(declare-fun newAcc!98 () List!31882)

(declare-fun lt!601254 () List!31882)

(assert (=> b!1365323 (= lt!601254 (Cons!31878 (select (arr!44814 a!3861) from!3239) newAcc!98))))

(declare-fun lt!601255 () List!31882)

(declare-fun acc!866 () List!31882)

(assert (=> b!1365323 (= lt!601255 (Cons!31878 (select (arr!44814 a!3861) from!3239) acc!866))))

(declare-fun b!1365324 () Bool)

(declare-fun res!908905 () Bool)

(assert (=> b!1365324 (=> (not res!908905) (not e!774184))))

(declare-fun contains!9564 (List!31882 (_ BitVec 64)) Bool)

(assert (=> b!1365324 (= res!908905 (not (contains!9564 acc!866 (select (arr!44814 a!3861) from!3239))))))

(declare-fun b!1365325 () Bool)

(declare-fun res!908904 () Bool)

(assert (=> b!1365325 (=> (not res!908904) (not e!774186))))

(declare-fun subseq!966 (List!31882 List!31882) Bool)

(assert (=> b!1365325 (= res!908904 (subseq!966 lt!601254 lt!601255))))

(declare-fun b!1365326 () Bool)

(declare-fun res!908899 () Bool)

(assert (=> b!1365326 (=> (not res!908899) (not e!774186))))

(assert (=> b!1365326 (= res!908899 (not (contains!9564 lt!601255 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365327 () Bool)

(declare-fun res!908909 () Bool)

(assert (=> b!1365327 (=> (not res!908909) (not e!774186))))

(assert (=> b!1365327 (= res!908909 (not (contains!9564 lt!601255 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365328 () Bool)

(declare-fun res!908912 () Bool)

(declare-fun e!774187 () Bool)

(assert (=> b!1365328 (=> (not res!908912) (not e!774187))))

(assert (=> b!1365328 (= res!908912 (not (contains!9564 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365329 () Bool)

(declare-fun res!908913 () Bool)

(assert (=> b!1365329 (=> (not res!908913) (not e!774187))))

(assert (=> b!1365329 (= res!908913 (not (contains!9564 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365331 () Bool)

(declare-fun res!908907 () Bool)

(assert (=> b!1365331 (=> (not res!908907) (not e!774184))))

(assert (=> b!1365331 (= res!908907 (bvslt from!3239 (size!45364 a!3861)))))

(declare-fun b!1365332 () Bool)

(declare-fun res!908914 () Bool)

(assert (=> b!1365332 (=> (not res!908914) (not e!774184))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1365332 (= res!908914 (validKeyInArray!0 (select (arr!44814 a!3861) from!3239)))))

(declare-fun b!1365333 () Bool)

(declare-fun res!908898 () Bool)

(assert (=> b!1365333 (=> (not res!908898) (not e!774186))))

(assert (=> b!1365333 (= res!908898 (not (contains!9564 lt!601254 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365334 () Bool)

(declare-fun res!908903 () Bool)

(assert (=> b!1365334 (=> (not res!908903) (not e!774187))))

(assert (=> b!1365334 (= res!908903 (not (contains!9564 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365335 () Bool)

(declare-fun res!908910 () Bool)

(assert (=> b!1365335 (=> (not res!908910) (not e!774186))))

(assert (=> b!1365335 (= res!908910 (not (contains!9564 lt!601254 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365336 () Bool)

(assert (=> b!1365336 (= e!774186 false)))

(declare-fun lt!601257 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92771 (_ BitVec 32) List!31882) Bool)

(assert (=> b!1365336 (= lt!601257 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601255))))

(declare-datatypes ((Unit!45065 0))(
  ( (Unit!45066) )
))
(declare-fun lt!601256 () Unit!45065)

(declare-fun noDuplicateSubseq!153 (List!31882 List!31882) Unit!45065)

(assert (=> b!1365336 (= lt!601256 (noDuplicateSubseq!153 lt!601254 lt!601255))))

(declare-fun b!1365337 () Bool)

(assert (=> b!1365337 (= e!774187 e!774184)))

(declare-fun res!908897 () Bool)

(assert (=> b!1365337 (=> (not res!908897) (not e!774184))))

(assert (=> b!1365337 (= res!908897 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-fun lt!601258 () Unit!45065)

(assert (=> b!1365337 (= lt!601258 (noDuplicateSubseq!153 newAcc!98 acc!866))))

(declare-fun b!1365338 () Bool)

(declare-fun res!908900 () Bool)

(assert (=> b!1365338 (=> (not res!908900) (not e!774187))))

(assert (=> b!1365338 (= res!908900 (not (contains!9564 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365339 () Bool)

(declare-fun res!908902 () Bool)

(assert (=> b!1365339 (=> (not res!908902) (not e!774187))))

(assert (=> b!1365339 (= res!908902 (subseq!966 newAcc!98 acc!866))))

(declare-fun b!1365340 () Bool)

(declare-fun res!908911 () Bool)

(assert (=> b!1365340 (=> (not res!908911) (not e!774187))))

(declare-fun noDuplicate!2421 (List!31882) Bool)

(assert (=> b!1365340 (= res!908911 (noDuplicate!2421 acc!866))))

(declare-fun b!1365330 () Bool)

(declare-fun res!908906 () Bool)

(assert (=> b!1365330 (=> (not res!908906) (not e!774186))))

(assert (=> b!1365330 (= res!908906 (noDuplicate!2421 lt!601255))))

(declare-fun res!908908 () Bool)

(assert (=> start!115450 (=> (not res!908908) (not e!774187))))

(assert (=> start!115450 (= res!908908 (and (bvslt (size!45364 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45364 a!3861))))))

(assert (=> start!115450 e!774187))

(declare-fun array_inv!33842 (array!92771) Bool)

(assert (=> start!115450 (array_inv!33842 a!3861)))

(assert (=> start!115450 true))

(assert (= (and start!115450 res!908908) b!1365340))

(assert (= (and b!1365340 res!908911) b!1365328))

(assert (= (and b!1365328 res!908912) b!1365329))

(assert (= (and b!1365329 res!908913) b!1365338))

(assert (= (and b!1365338 res!908900) b!1365334))

(assert (= (and b!1365334 res!908903) b!1365339))

(assert (= (and b!1365339 res!908902) b!1365337))

(assert (= (and b!1365337 res!908897) b!1365331))

(assert (= (and b!1365331 res!908907) b!1365332))

(assert (= (and b!1365332 res!908914) b!1365324))

(assert (= (and b!1365324 res!908905) b!1365323))

(assert (= (and b!1365323 res!908901) b!1365330))

(assert (= (and b!1365330 res!908906) b!1365327))

(assert (= (and b!1365327 res!908909) b!1365326))

(assert (= (and b!1365326 res!908899) b!1365335))

(assert (= (and b!1365335 res!908910) b!1365333))

(assert (= (and b!1365333 res!908898) b!1365325))

(assert (= (and b!1365325 res!908904) b!1365336))

(declare-fun m!1249901 () Bool)

(assert (=> b!1365335 m!1249901))

(declare-fun m!1249903 () Bool)

(assert (=> b!1365333 m!1249903))

(declare-fun m!1249905 () Bool)

(assert (=> b!1365324 m!1249905))

(assert (=> b!1365324 m!1249905))

(declare-fun m!1249907 () Bool)

(assert (=> b!1365324 m!1249907))

(declare-fun m!1249909 () Bool)

(assert (=> b!1365336 m!1249909))

(declare-fun m!1249911 () Bool)

(assert (=> b!1365336 m!1249911))

(declare-fun m!1249913 () Bool)

(assert (=> b!1365325 m!1249913))

(declare-fun m!1249915 () Bool)

(assert (=> b!1365326 m!1249915))

(declare-fun m!1249917 () Bool)

(assert (=> b!1365340 m!1249917))

(declare-fun m!1249919 () Bool)

(assert (=> b!1365339 m!1249919))

(declare-fun m!1249921 () Bool)

(assert (=> b!1365328 m!1249921))

(assert (=> b!1365323 m!1249905))

(declare-fun m!1249923 () Bool)

(assert (=> b!1365327 m!1249923))

(declare-fun m!1249925 () Bool)

(assert (=> b!1365338 m!1249925))

(declare-fun m!1249927 () Bool)

(assert (=> start!115450 m!1249927))

(declare-fun m!1249929 () Bool)

(assert (=> b!1365334 m!1249929))

(declare-fun m!1249931 () Bool)

(assert (=> b!1365337 m!1249931))

(declare-fun m!1249933 () Bool)

(assert (=> b!1365337 m!1249933))

(declare-fun m!1249935 () Bool)

(assert (=> b!1365329 m!1249935))

(declare-fun m!1249937 () Bool)

(assert (=> b!1365330 m!1249937))

(assert (=> b!1365332 m!1249905))

(assert (=> b!1365332 m!1249905))

(declare-fun m!1249939 () Bool)

(assert (=> b!1365332 m!1249939))

(check-sat (not b!1365340) (not b!1365334) (not b!1365339) (not b!1365338) (not b!1365328) (not b!1365330) (not b!1365324) (not b!1365335) (not b!1365336) (not start!115450) (not b!1365329) (not b!1365333) (not b!1365325) (not b!1365327) (not b!1365337) (not b!1365326) (not b!1365332))
(check-sat)
