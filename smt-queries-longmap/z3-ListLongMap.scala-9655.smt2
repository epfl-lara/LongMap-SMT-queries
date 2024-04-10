; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114070 () Bool)

(assert start!114070)

(declare-fun b!1354234 () Bool)

(declare-fun res!899332 () Bool)

(declare-fun e!769375 () Bool)

(assert (=> b!1354234 (=> (not res!899332) (not e!769375))))

(declare-datatypes ((List!31615 0))(
  ( (Nil!31612) (Cons!31611 (h!32820 (_ BitVec 64)) (t!46273 List!31615)) )
))
(declare-fun lt!598178 () List!31615)

(declare-fun contains!9324 (List!31615 (_ BitVec 64)) Bool)

(assert (=> b!1354234 (= res!899332 (not (contains!9324 lt!598178 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354235 () Bool)

(declare-fun res!899324 () Bool)

(declare-fun e!769372 () Bool)

(assert (=> b!1354235 (=> (not res!899324) (not e!769372))))

(declare-fun acc!759 () List!31615)

(assert (=> b!1354235 (= res!899324 (not (contains!9324 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354236 () Bool)

(declare-fun res!899326 () Bool)

(assert (=> b!1354236 (=> (not res!899326) (not e!769375))))

(declare-fun noDuplicate!2181 (List!31615) Bool)

(assert (=> b!1354236 (= res!899326 (noDuplicate!2181 lt!598178))))

(declare-fun b!1354237 () Bool)

(assert (=> b!1354237 (= e!769375 false)))

(declare-fun lt!598179 () Bool)

(declare-datatypes ((array!92252 0))(
  ( (array!92253 (arr!44574 (Array (_ BitVec 32) (_ BitVec 64))) (size!45124 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92252)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92252 (_ BitVec 32) List!31615) Bool)

(assert (=> b!1354237 (= lt!598179 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!598178))))

(declare-fun b!1354238 () Bool)

(declare-fun e!769374 () Bool)

(assert (=> b!1354238 (= e!769374 e!769375)))

(declare-fun res!899330 () Bool)

(assert (=> b!1354238 (=> (not res!899330) (not e!769375))))

(assert (=> b!1354238 (= res!899330 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!759 (List!31615 (_ BitVec 64)) List!31615)

(assert (=> b!1354238 (= lt!598178 ($colon$colon!759 acc!759 (select (arr!44574 a!3742) from!3120)))))

(declare-fun b!1354239 () Bool)

(declare-fun res!899323 () Bool)

(assert (=> b!1354239 (=> (not res!899323) (not e!769372))))

(assert (=> b!1354239 (= res!899323 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31612))))

(declare-fun b!1354240 () Bool)

(declare-fun res!899328 () Bool)

(assert (=> b!1354240 (=> (not res!899328) (not e!769372))))

(assert (=> b!1354240 (= res!899328 (not (contains!9324 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354241 () Bool)

(assert (=> b!1354241 (= e!769372 e!769374)))

(declare-fun res!899327 () Bool)

(assert (=> b!1354241 (=> (not res!899327) (not e!769374))))

(declare-fun lt!598176 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1354241 (= res!899327 (and (not (= from!3120 i!1404)) lt!598176))))

(declare-datatypes ((Unit!44463 0))(
  ( (Unit!44464) )
))
(declare-fun lt!598175 () Unit!44463)

(declare-fun e!769371 () Unit!44463)

(assert (=> b!1354241 (= lt!598175 e!769371)))

(declare-fun c!126896 () Bool)

(assert (=> b!1354241 (= c!126896 lt!598176)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1354241 (= lt!598176 (validKeyInArray!0 (select (arr!44574 a!3742) from!3120)))))

(declare-fun b!1354242 () Bool)

(declare-fun res!899325 () Bool)

(assert (=> b!1354242 (=> (not res!899325) (not e!769372))))

(assert (=> b!1354242 (= res!899325 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1354243 () Bool)

(declare-fun res!899331 () Bool)

(assert (=> b!1354243 (=> (not res!899331) (not e!769372))))

(assert (=> b!1354243 (= res!899331 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45124 a!3742))))))

(declare-fun b!1354244 () Bool)

(declare-fun res!899322 () Bool)

(assert (=> b!1354244 (=> (not res!899322) (not e!769372))))

(assert (=> b!1354244 (= res!899322 (noDuplicate!2181 acc!759))))

(declare-fun b!1354245 () Bool)

(declare-fun res!899335 () Bool)

(assert (=> b!1354245 (=> (not res!899335) (not e!769372))))

(assert (=> b!1354245 (= res!899335 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45124 a!3742)))))

(declare-fun res!899333 () Bool)

(assert (=> start!114070 (=> (not res!899333) (not e!769372))))

(assert (=> start!114070 (= res!899333 (and (bvslt (size!45124 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45124 a!3742))))))

(assert (=> start!114070 e!769372))

(assert (=> start!114070 true))

(declare-fun array_inv!33602 (array!92252) Bool)

(assert (=> start!114070 (array_inv!33602 a!3742)))

(declare-fun b!1354246 () Bool)

(declare-fun lt!598180 () Unit!44463)

(assert (=> b!1354246 (= e!769371 lt!598180)))

(declare-fun lt!598177 () Unit!44463)

(declare-fun lemmaListSubSeqRefl!0 (List!31615) Unit!44463)

(assert (=> b!1354246 (= lt!598177 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!744 (List!31615 List!31615) Bool)

(assert (=> b!1354246 (subseq!744 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92252 List!31615 List!31615 (_ BitVec 32)) Unit!44463)

(assert (=> b!1354246 (= lt!598180 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!759 acc!759 (select (arr!44574 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1354246 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1354247 () Bool)

(declare-fun res!899334 () Bool)

(assert (=> b!1354247 (=> (not res!899334) (not e!769375))))

(assert (=> b!1354247 (= res!899334 (not (contains!9324 lt!598178 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354248 () Bool)

(declare-fun res!899329 () Bool)

(assert (=> b!1354248 (=> (not res!899329) (not e!769372))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1354248 (= res!899329 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1354249 () Bool)

(declare-fun Unit!44465 () Unit!44463)

(assert (=> b!1354249 (= e!769371 Unit!44465)))

(assert (= (and start!114070 res!899333) b!1354244))

(assert (= (and b!1354244 res!899322) b!1354235))

(assert (= (and b!1354235 res!899324) b!1354240))

(assert (= (and b!1354240 res!899328) b!1354239))

(assert (= (and b!1354239 res!899323) b!1354242))

(assert (= (and b!1354242 res!899325) b!1354243))

(assert (= (and b!1354243 res!899331) b!1354248))

(assert (= (and b!1354248 res!899329) b!1354245))

(assert (= (and b!1354245 res!899335) b!1354241))

(assert (= (and b!1354241 c!126896) b!1354246))

(assert (= (and b!1354241 (not c!126896)) b!1354249))

(assert (= (and b!1354241 res!899327) b!1354238))

(assert (= (and b!1354238 res!899330) b!1354236))

(assert (= (and b!1354236 res!899326) b!1354247))

(assert (= (and b!1354247 res!899334) b!1354234))

(assert (= (and b!1354234 res!899332) b!1354237))

(declare-fun m!1240657 () Bool)

(assert (=> b!1354240 m!1240657))

(declare-fun m!1240659 () Bool)

(assert (=> b!1354234 m!1240659))

(declare-fun m!1240661 () Bool)

(assert (=> b!1354235 m!1240661))

(declare-fun m!1240663 () Bool)

(assert (=> b!1354247 m!1240663))

(declare-fun m!1240665 () Bool)

(assert (=> b!1354238 m!1240665))

(assert (=> b!1354238 m!1240665))

(declare-fun m!1240667 () Bool)

(assert (=> b!1354238 m!1240667))

(declare-fun m!1240669 () Bool)

(assert (=> b!1354244 m!1240669))

(assert (=> b!1354241 m!1240665))

(assert (=> b!1354241 m!1240665))

(declare-fun m!1240671 () Bool)

(assert (=> b!1354241 m!1240671))

(declare-fun m!1240673 () Bool)

(assert (=> b!1354246 m!1240673))

(assert (=> b!1354246 m!1240665))

(assert (=> b!1354246 m!1240667))

(declare-fun m!1240675 () Bool)

(assert (=> b!1354246 m!1240675))

(declare-fun m!1240677 () Bool)

(assert (=> b!1354246 m!1240677))

(assert (=> b!1354246 m!1240665))

(assert (=> b!1354246 m!1240667))

(declare-fun m!1240679 () Bool)

(assert (=> b!1354246 m!1240679))

(declare-fun m!1240681 () Bool)

(assert (=> b!1354237 m!1240681))

(declare-fun m!1240683 () Bool)

(assert (=> start!114070 m!1240683))

(declare-fun m!1240685 () Bool)

(assert (=> b!1354248 m!1240685))

(declare-fun m!1240687 () Bool)

(assert (=> b!1354236 m!1240687))

(declare-fun m!1240689 () Bool)

(assert (=> b!1354239 m!1240689))

(declare-fun m!1240691 () Bool)

(assert (=> b!1354242 m!1240691))

(check-sat (not b!1354246) (not b!1354241) (not b!1354239) (not b!1354247) (not b!1354238) (not b!1354234) (not b!1354240) (not b!1354237) (not b!1354235) (not b!1354248) (not start!114070) (not b!1354244) (not b!1354242) (not b!1354236))
(check-sat)
