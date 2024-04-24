; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114376 () Bool)

(assert start!114376)

(declare-fun b!1357241 () Bool)

(declare-fun res!901310 () Bool)

(declare-fun e!770755 () Bool)

(assert (=> b!1357241 (=> (not res!901310) (not e!770755))))

(declare-datatypes ((array!92449 0))(
  ( (array!92450 (arr!44668 (Array (_ BitVec 32) (_ BitVec 64))) (size!45219 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92449)

(declare-datatypes ((List!31696 0))(
  ( (Nil!31693) (Cons!31692 (h!32910 (_ BitVec 64)) (t!46346 List!31696)) )
))
(declare-fun arrayNoDuplicates!0 (array!92449 (_ BitVec 32) List!31696) Bool)

(assert (=> b!1357241 (= res!901310 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31693))))

(declare-fun b!1357243 () Bool)

(declare-fun res!901308 () Bool)

(assert (=> b!1357243 (=> (not res!901308) (not e!770755))))

(declare-fun acc!759 () List!31696)

(declare-fun contains!9408 (List!31696 (_ BitVec 64)) Bool)

(assert (=> b!1357243 (= res!901308 (not (contains!9408 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357244 () Bool)

(declare-datatypes ((Unit!44525 0))(
  ( (Unit!44526) )
))
(declare-fun e!770757 () Unit!44525)

(declare-fun lt!599316 () Unit!44525)

(assert (=> b!1357244 (= e!770757 lt!599316)))

(declare-fun lt!599317 () Unit!44525)

(declare-fun lemmaListSubSeqRefl!0 (List!31696) Unit!44525)

(assert (=> b!1357244 (= lt!599317 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!785 (List!31696 List!31696) Bool)

(assert (=> b!1357244 (subseq!785 acc!759 acc!759)))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92449 List!31696 List!31696 (_ BitVec 32)) Unit!44525)

(declare-fun $colon$colon!799 (List!31696 (_ BitVec 64)) List!31696)

(assert (=> b!1357244 (= lt!599316 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!799 acc!759 (select (arr!44668 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1357244 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1357245 () Bool)

(declare-fun e!770758 () Bool)

(assert (=> b!1357245 (= e!770755 e!770758)))

(declare-fun res!901307 () Bool)

(assert (=> b!1357245 (=> (not res!901307) (not e!770758))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-fun lt!599315 () Bool)

(assert (=> b!1357245 (= res!901307 (and (not (= from!3120 i!1404)) (not lt!599315) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!599318 () Unit!44525)

(assert (=> b!1357245 (= lt!599318 e!770757)))

(declare-fun c!127417 () Bool)

(assert (=> b!1357245 (= c!127417 lt!599315)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1357245 (= lt!599315 (validKeyInArray!0 (select (arr!44668 a!3742) from!3120)))))

(declare-fun b!1357246 () Bool)

(declare-fun res!901306 () Bool)

(assert (=> b!1357246 (=> (not res!901306) (not e!770755))))

(assert (=> b!1357246 (= res!901306 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45219 a!3742))))))

(declare-fun b!1357247 () Bool)

(declare-fun res!901304 () Bool)

(assert (=> b!1357247 (=> (not res!901304) (not e!770755))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1357247 (= res!901304 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1357248 () Bool)

(declare-fun res!901305 () Bool)

(assert (=> b!1357248 (=> (not res!901305) (not e!770755))))

(assert (=> b!1357248 (= res!901305 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45219 a!3742)))))

(declare-fun b!1357249 () Bool)

(declare-fun res!901303 () Bool)

(assert (=> b!1357249 (=> (not res!901303) (not e!770755))))

(assert (=> b!1357249 (= res!901303 (not (contains!9408 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357250 () Bool)

(declare-fun Unit!44527 () Unit!44525)

(assert (=> b!1357250 (= e!770757 Unit!44527)))

(declare-fun b!1357251 () Bool)

(declare-fun res!901309 () Bool)

(assert (=> b!1357251 (=> (not res!901309) (not e!770755))))

(assert (=> b!1357251 (= res!901309 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1357252 () Bool)

(assert (=> b!1357252 (= e!770758 false)))

(declare-fun lt!599319 () Bool)

(assert (=> b!1357252 (= lt!599319 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1357242 () Bool)

(declare-fun res!901311 () Bool)

(assert (=> b!1357242 (=> (not res!901311) (not e!770755))))

(declare-fun noDuplicate!2239 (List!31696) Bool)

(assert (=> b!1357242 (= res!901311 (noDuplicate!2239 acc!759))))

(declare-fun res!901302 () Bool)

(assert (=> start!114376 (=> (not res!901302) (not e!770755))))

(assert (=> start!114376 (= res!901302 (and (bvslt (size!45219 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45219 a!3742))))))

(assert (=> start!114376 e!770755))

(assert (=> start!114376 true))

(declare-fun array_inv!33949 (array!92449) Bool)

(assert (=> start!114376 (array_inv!33949 a!3742)))

(assert (= (and start!114376 res!901302) b!1357242))

(assert (= (and b!1357242 res!901311) b!1357243))

(assert (= (and b!1357243 res!901308) b!1357249))

(assert (= (and b!1357249 res!901303) b!1357241))

(assert (= (and b!1357241 res!901310) b!1357251))

(assert (= (and b!1357251 res!901309) b!1357246))

(assert (= (and b!1357246 res!901306) b!1357247))

(assert (= (and b!1357247 res!901304) b!1357248))

(assert (= (and b!1357248 res!901305) b!1357245))

(assert (= (and b!1357245 c!127417) b!1357244))

(assert (= (and b!1357245 (not c!127417)) b!1357250))

(assert (= (and b!1357245 res!901307) b!1357252))

(declare-fun m!1243609 () Bool)

(assert (=> b!1357244 m!1243609))

(declare-fun m!1243611 () Bool)

(assert (=> b!1357244 m!1243611))

(declare-fun m!1243613 () Bool)

(assert (=> b!1357244 m!1243613))

(declare-fun m!1243615 () Bool)

(assert (=> b!1357244 m!1243615))

(declare-fun m!1243617 () Bool)

(assert (=> b!1357244 m!1243617))

(assert (=> b!1357244 m!1243611))

(assert (=> b!1357244 m!1243613))

(declare-fun m!1243619 () Bool)

(assert (=> b!1357244 m!1243619))

(declare-fun m!1243621 () Bool)

(assert (=> start!114376 m!1243621))

(declare-fun m!1243623 () Bool)

(assert (=> b!1357247 m!1243623))

(declare-fun m!1243625 () Bool)

(assert (=> b!1357241 m!1243625))

(declare-fun m!1243627 () Bool)

(assert (=> b!1357249 m!1243627))

(assert (=> b!1357245 m!1243611))

(assert (=> b!1357245 m!1243611))

(declare-fun m!1243629 () Bool)

(assert (=> b!1357245 m!1243629))

(declare-fun m!1243631 () Bool)

(assert (=> b!1357242 m!1243631))

(declare-fun m!1243633 () Bool)

(assert (=> b!1357243 m!1243633))

(declare-fun m!1243635 () Bool)

(assert (=> b!1357251 m!1243635))

(assert (=> b!1357252 m!1243617))

(check-sat (not b!1357251) (not b!1357245) (not start!114376) (not b!1357242) (not b!1357249) (not b!1357252) (not b!1357243) (not b!1357244) (not b!1357241) (not b!1357247))
(check-sat)
