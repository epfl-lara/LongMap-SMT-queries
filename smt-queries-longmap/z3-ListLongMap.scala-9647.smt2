; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114022 () Bool)

(assert start!114022)

(declare-fun b!1353095 () Bool)

(declare-datatypes ((Unit!44391 0))(
  ( (Unit!44392) )
))
(declare-fun e!769016 () Unit!44391)

(declare-fun lt!597753 () Unit!44391)

(assert (=> b!1353095 (= e!769016 lt!597753)))

(declare-fun lt!597754 () Unit!44391)

(declare-datatypes ((List!31591 0))(
  ( (Nil!31588) (Cons!31587 (h!32796 (_ BitVec 64)) (t!46249 List!31591)) )
))
(declare-fun acc!759 () List!31591)

(declare-fun lemmaListSubSeqRefl!0 (List!31591) Unit!44391)

(assert (=> b!1353095 (= lt!597754 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!720 (List!31591 List!31591) Bool)

(assert (=> b!1353095 (subseq!720 acc!759 acc!759)))

(declare-datatypes ((array!92204 0))(
  ( (array!92205 (arr!44550 (Array (_ BitVec 32) (_ BitVec 64))) (size!45100 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92204)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92204 List!31591 List!31591 (_ BitVec 32)) Unit!44391)

(declare-fun $colon$colon!735 (List!31591 (_ BitVec 64)) List!31591)

(assert (=> b!1353095 (= lt!597753 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!735 acc!759 (select (arr!44550 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92204 (_ BitVec 32) List!31591) Bool)

(assert (=> b!1353095 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1353096 () Bool)

(declare-fun e!769018 () Bool)

(declare-fun e!769015 () Bool)

(assert (=> b!1353096 (= e!769018 e!769015)))

(declare-fun res!898336 () Bool)

(assert (=> b!1353096 (=> (not res!898336) (not e!769015))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1353096 (= res!898336 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!597752 () Unit!44391)

(assert (=> b!1353096 (= lt!597752 e!769016)))

(declare-fun c!126824 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1353096 (= c!126824 (validKeyInArray!0 (select (arr!44550 a!3742) from!3120)))))

(declare-fun b!1353097 () Bool)

(declare-fun res!898333 () Bool)

(assert (=> b!1353097 (=> (not res!898333) (not e!769018))))

(assert (=> b!1353097 (= res!898333 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1353098 () Bool)

(assert (=> b!1353098 (= e!769015 (not true))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1353098 (arrayNoDuplicates!0 (array!92205 (store (arr!44550 a!3742) i!1404 l!3587) (size!45100 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!597751 () Unit!44391)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92204 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31591) Unit!44391)

(assert (=> b!1353098 (= lt!597751 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1353099 () Bool)

(declare-fun res!898327 () Bool)

(assert (=> b!1353099 (=> (not res!898327) (not e!769018))))

(assert (=> b!1353099 (= res!898327 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45100 a!3742))))))

(declare-fun b!1353100 () Bool)

(declare-fun res!898329 () Bool)

(assert (=> b!1353100 (=> (not res!898329) (not e!769018))))

(declare-fun contains!9300 (List!31591 (_ BitVec 64)) Bool)

(assert (=> b!1353100 (= res!898329 (not (contains!9300 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!898326 () Bool)

(assert (=> start!114022 (=> (not res!898326) (not e!769018))))

(assert (=> start!114022 (= res!898326 (and (bvslt (size!45100 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45100 a!3742))))))

(assert (=> start!114022 e!769018))

(assert (=> start!114022 true))

(declare-fun array_inv!33578 (array!92204) Bool)

(assert (=> start!114022 (array_inv!33578 a!3742)))

(declare-fun b!1353094 () Bool)

(declare-fun res!898328 () Bool)

(assert (=> b!1353094 (=> (not res!898328) (not e!769015))))

(assert (=> b!1353094 (= res!898328 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1353101 () Bool)

(declare-fun res!898335 () Bool)

(assert (=> b!1353101 (=> (not res!898335) (not e!769018))))

(declare-fun noDuplicate!2157 (List!31591) Bool)

(assert (=> b!1353101 (= res!898335 (noDuplicate!2157 acc!759))))

(declare-fun b!1353102 () Bool)

(declare-fun Unit!44393 () Unit!44391)

(assert (=> b!1353102 (= e!769016 Unit!44393)))

(declare-fun b!1353103 () Bool)

(declare-fun res!898330 () Bool)

(assert (=> b!1353103 (=> (not res!898330) (not e!769018))))

(assert (=> b!1353103 (= res!898330 (not (contains!9300 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353104 () Bool)

(declare-fun res!898334 () Bool)

(assert (=> b!1353104 (=> (not res!898334) (not e!769018))))

(assert (=> b!1353104 (= res!898334 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45100 a!3742)))))

(declare-fun b!1353105 () Bool)

(declare-fun res!898332 () Bool)

(assert (=> b!1353105 (=> (not res!898332) (not e!769018))))

(assert (=> b!1353105 (= res!898332 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1353106 () Bool)

(declare-fun res!898331 () Bool)

(assert (=> b!1353106 (=> (not res!898331) (not e!769018))))

(assert (=> b!1353106 (= res!898331 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31588))))

(assert (= (and start!114022 res!898326) b!1353101))

(assert (= (and b!1353101 res!898335) b!1353103))

(assert (= (and b!1353103 res!898330) b!1353100))

(assert (= (and b!1353100 res!898329) b!1353106))

(assert (= (and b!1353106 res!898331) b!1353097))

(assert (= (and b!1353097 res!898333) b!1353099))

(assert (= (and b!1353099 res!898327) b!1353105))

(assert (= (and b!1353105 res!898332) b!1353104))

(assert (= (and b!1353104 res!898334) b!1353096))

(assert (= (and b!1353096 c!126824) b!1353095))

(assert (= (and b!1353096 (not c!126824)) b!1353102))

(assert (= (and b!1353096 res!898336) b!1353094))

(assert (= (and b!1353094 res!898328) b!1353098))

(declare-fun m!1239797 () Bool)

(assert (=> start!114022 m!1239797))

(declare-fun m!1239799 () Bool)

(assert (=> b!1353105 m!1239799))

(declare-fun m!1239801 () Bool)

(assert (=> b!1353101 m!1239801))

(declare-fun m!1239803 () Bool)

(assert (=> b!1353094 m!1239803))

(declare-fun m!1239805 () Bool)

(assert (=> b!1353097 m!1239805))

(declare-fun m!1239807 () Bool)

(assert (=> b!1353095 m!1239807))

(declare-fun m!1239809 () Bool)

(assert (=> b!1353095 m!1239809))

(declare-fun m!1239811 () Bool)

(assert (=> b!1353095 m!1239811))

(declare-fun m!1239813 () Bool)

(assert (=> b!1353095 m!1239813))

(assert (=> b!1353095 m!1239803))

(assert (=> b!1353095 m!1239809))

(assert (=> b!1353095 m!1239811))

(declare-fun m!1239815 () Bool)

(assert (=> b!1353095 m!1239815))

(assert (=> b!1353096 m!1239809))

(assert (=> b!1353096 m!1239809))

(declare-fun m!1239817 () Bool)

(assert (=> b!1353096 m!1239817))

(declare-fun m!1239819 () Bool)

(assert (=> b!1353100 m!1239819))

(declare-fun m!1239821 () Bool)

(assert (=> b!1353103 m!1239821))

(declare-fun m!1239823 () Bool)

(assert (=> b!1353098 m!1239823))

(declare-fun m!1239825 () Bool)

(assert (=> b!1353098 m!1239825))

(declare-fun m!1239827 () Bool)

(assert (=> b!1353098 m!1239827))

(declare-fun m!1239829 () Bool)

(assert (=> b!1353106 m!1239829))

(check-sat (not b!1353100) (not b!1353094) (not b!1353103) (not b!1353105) (not b!1353095) (not b!1353101) (not b!1353106) (not start!114022) (not b!1353098) (not b!1353097) (not b!1353096))
(check-sat)
