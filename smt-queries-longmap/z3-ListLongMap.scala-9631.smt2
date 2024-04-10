; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113926 () Bool)

(assert start!113926)

(declare-fun b!1351241 () Bool)

(declare-fun res!896704 () Bool)

(declare-fun e!768471 () Bool)

(assert (=> b!1351241 (=> res!896704 e!768471)))

(declare-datatypes ((List!31543 0))(
  ( (Nil!31540) (Cons!31539 (h!32748 (_ BitVec 64)) (t!46201 List!31543)) )
))
(declare-fun acc!759 () List!31543)

(declare-fun lt!597177 () List!31543)

(declare-fun subseq!672 (List!31543 List!31543) Bool)

(assert (=> b!1351241 (= res!896704 (not (subseq!672 acc!759 lt!597177)))))

(declare-fun res!896700 () Bool)

(declare-fun e!768470 () Bool)

(assert (=> start!113926 (=> (not res!896700) (not e!768470))))

(declare-datatypes ((array!92108 0))(
  ( (array!92109 (arr!44502 (Array (_ BitVec 32) (_ BitVec 64))) (size!45052 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92108)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!113926 (= res!896700 (and (bvslt (size!45052 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45052 a!3742))))))

(assert (=> start!113926 e!768470))

(assert (=> start!113926 true))

(declare-fun array_inv!33530 (array!92108) Bool)

(assert (=> start!113926 (array_inv!33530 a!3742)))

(declare-fun b!1351242 () Bool)

(declare-fun res!896702 () Bool)

(assert (=> b!1351242 (=> (not res!896702) (not e!768470))))

(declare-fun arrayNoDuplicates!0 (array!92108 (_ BitVec 32) List!31543) Bool)

(assert (=> b!1351242 (= res!896702 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31540))))

(declare-fun b!1351243 () Bool)

(assert (=> b!1351243 (= e!768470 (not e!768471))))

(declare-fun res!896699 () Bool)

(assert (=> b!1351243 (=> res!896699 e!768471)))

(assert (=> b!1351243 (= res!896699 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!687 (List!31543 (_ BitVec 64)) List!31543)

(assert (=> b!1351243 (= lt!597177 ($colon$colon!687 acc!759 (select (arr!44502 a!3742) from!3120)))))

(assert (=> b!1351243 (subseq!672 acc!759 acc!759)))

(declare-datatypes ((Unit!44258 0))(
  ( (Unit!44259) )
))
(declare-fun lt!597178 () Unit!44258)

(declare-fun lemmaListSubSeqRefl!0 (List!31543) Unit!44258)

(assert (=> b!1351243 (= lt!597178 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1351244 () Bool)

(declare-fun res!896707 () Bool)

(assert (=> b!1351244 (=> (not res!896707) (not e!768470))))

(assert (=> b!1351244 (= res!896707 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45052 a!3742)))))

(declare-fun b!1351245 () Bool)

(declare-fun res!896711 () Bool)

(assert (=> b!1351245 (=> res!896711 e!768471)))

(declare-fun contains!9252 (List!31543 (_ BitVec 64)) Bool)

(assert (=> b!1351245 (= res!896711 (contains!9252 lt!597177 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351246 () Bool)

(declare-fun res!896710 () Bool)

(assert (=> b!1351246 (=> (not res!896710) (not e!768470))))

(assert (=> b!1351246 (= res!896710 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1351247 () Bool)

(declare-fun res!896709 () Bool)

(assert (=> b!1351247 (=> (not res!896709) (not e!768470))))

(assert (=> b!1351247 (= res!896709 (not (contains!9252 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351248 () Bool)

(declare-fun res!896712 () Bool)

(assert (=> b!1351248 (=> (not res!896712) (not e!768470))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1351248 (= res!896712 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45052 a!3742))))))

(declare-fun b!1351249 () Bool)

(declare-fun res!896705 () Bool)

(assert (=> b!1351249 (=> (not res!896705) (not e!768470))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1351249 (= res!896705 (validKeyInArray!0 (select (arr!44502 a!3742) from!3120)))))

(declare-fun b!1351250 () Bool)

(declare-fun res!896701 () Bool)

(assert (=> b!1351250 (=> res!896701 e!768471)))

(assert (=> b!1351250 (= res!896701 (contains!9252 lt!597177 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351251 () Bool)

(declare-fun res!896706 () Bool)

(assert (=> b!1351251 (=> (not res!896706) (not e!768470))))

(assert (=> b!1351251 (= res!896706 (not (contains!9252 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351252 () Bool)

(assert (=> b!1351252 (= e!768471 true)))

(declare-fun lt!597175 () Bool)

(assert (=> b!1351252 (= lt!597175 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597177))))

(declare-fun lt!597176 () Unit!44258)

(declare-fun noDuplicateSubseq!123 (List!31543 List!31543) Unit!44258)

(assert (=> b!1351252 (= lt!597176 (noDuplicateSubseq!123 acc!759 lt!597177))))

(declare-fun b!1351253 () Bool)

(declare-fun res!896713 () Bool)

(assert (=> b!1351253 (=> res!896713 e!768471)))

(declare-fun noDuplicate!2109 (List!31543) Bool)

(assert (=> b!1351253 (= res!896713 (not (noDuplicate!2109 lt!597177)))))

(declare-fun b!1351254 () Bool)

(declare-fun res!896708 () Bool)

(assert (=> b!1351254 (=> (not res!896708) (not e!768470))))

(assert (=> b!1351254 (= res!896708 (noDuplicate!2109 acc!759))))

(declare-fun b!1351255 () Bool)

(declare-fun res!896703 () Bool)

(assert (=> b!1351255 (=> (not res!896703) (not e!768470))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1351255 (= res!896703 (not (validKeyInArray!0 l!3587)))))

(assert (= (and start!113926 res!896700) b!1351254))

(assert (= (and b!1351254 res!896708) b!1351251))

(assert (= (and b!1351251 res!896706) b!1351247))

(assert (= (and b!1351247 res!896709) b!1351242))

(assert (= (and b!1351242 res!896702) b!1351246))

(assert (= (and b!1351246 res!896710) b!1351248))

(assert (= (and b!1351248 res!896712) b!1351255))

(assert (= (and b!1351255 res!896703) b!1351244))

(assert (= (and b!1351244 res!896707) b!1351249))

(assert (= (and b!1351249 res!896705) b!1351243))

(assert (= (and b!1351243 (not res!896699)) b!1351253))

(assert (= (and b!1351253 (not res!896713)) b!1351245))

(assert (= (and b!1351245 (not res!896711)) b!1351250))

(assert (= (and b!1351250 (not res!896701)) b!1351241))

(assert (= (and b!1351241 (not res!896704)) b!1351252))

(declare-fun m!1238305 () Bool)

(assert (=> b!1351249 m!1238305))

(assert (=> b!1351249 m!1238305))

(declare-fun m!1238307 () Bool)

(assert (=> b!1351249 m!1238307))

(declare-fun m!1238309 () Bool)

(assert (=> b!1351252 m!1238309))

(declare-fun m!1238311 () Bool)

(assert (=> b!1351252 m!1238311))

(assert (=> b!1351243 m!1238305))

(assert (=> b!1351243 m!1238305))

(declare-fun m!1238313 () Bool)

(assert (=> b!1351243 m!1238313))

(declare-fun m!1238315 () Bool)

(assert (=> b!1351243 m!1238315))

(declare-fun m!1238317 () Bool)

(assert (=> b!1351243 m!1238317))

(declare-fun m!1238319 () Bool)

(assert (=> b!1351253 m!1238319))

(declare-fun m!1238321 () Bool)

(assert (=> b!1351245 m!1238321))

(declare-fun m!1238323 () Bool)

(assert (=> b!1351255 m!1238323))

(declare-fun m!1238325 () Bool)

(assert (=> b!1351241 m!1238325))

(declare-fun m!1238327 () Bool)

(assert (=> b!1351254 m!1238327))

(declare-fun m!1238329 () Bool)

(assert (=> start!113926 m!1238329))

(declare-fun m!1238331 () Bool)

(assert (=> b!1351247 m!1238331))

(declare-fun m!1238333 () Bool)

(assert (=> b!1351251 m!1238333))

(declare-fun m!1238335 () Bool)

(assert (=> b!1351250 m!1238335))

(declare-fun m!1238337 () Bool)

(assert (=> b!1351242 m!1238337))

(declare-fun m!1238339 () Bool)

(assert (=> b!1351246 m!1238339))

(check-sat (not start!113926) (not b!1351254) (not b!1351251) (not b!1351245) (not b!1351246) (not b!1351255) (not b!1351250) (not b!1351241) (not b!1351247) (not b!1351252) (not b!1351243) (not b!1351242) (not b!1351249) (not b!1351253))
(check-sat)
