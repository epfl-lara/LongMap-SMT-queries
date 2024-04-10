; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113986 () Bool)

(assert start!113986)

(declare-fun b!1352414 () Bool)

(declare-datatypes ((Unit!44337 0))(
  ( (Unit!44338) )
))
(declare-fun e!768802 () Unit!44337)

(declare-fun Unit!44339 () Unit!44337)

(assert (=> b!1352414 (= e!768802 Unit!44339)))

(declare-fun res!897754 () Bool)

(declare-fun e!768799 () Bool)

(assert (=> start!113986 (=> (not res!897754) (not e!768799))))

(declare-datatypes ((array!92168 0))(
  ( (array!92169 (arr!44532 (Array (_ BitVec 32) (_ BitVec 64))) (size!45082 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92168)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!113986 (= res!897754 (and (bvslt (size!45082 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45082 a!3742))))))

(assert (=> start!113986 e!768799))

(assert (=> start!113986 true))

(declare-fun array_inv!33560 (array!92168) Bool)

(assert (=> start!113986 (array_inv!33560 a!3742)))

(declare-fun b!1352415 () Bool)

(declare-fun res!897762 () Bool)

(assert (=> b!1352415 (=> (not res!897762) (not e!768799))))

(assert (=> b!1352415 (= res!897762 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45082 a!3742)))))

(declare-fun b!1352416 () Bool)

(declare-fun res!897763 () Bool)

(assert (=> b!1352416 (=> (not res!897763) (not e!768799))))

(declare-datatypes ((List!31573 0))(
  ( (Nil!31570) (Cons!31569 (h!32778 (_ BitVec 64)) (t!46231 List!31573)) )
))
(declare-fun acc!759 () List!31573)

(declare-fun arrayNoDuplicates!0 (array!92168 (_ BitVec 32) List!31573) Bool)

(assert (=> b!1352416 (= res!897763 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1352417 () Bool)

(declare-fun res!897757 () Bool)

(assert (=> b!1352417 (=> (not res!897757) (not e!768799))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1352417 (= res!897757 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45082 a!3742))))))

(declare-fun b!1352418 () Bool)

(declare-fun res!897761 () Bool)

(assert (=> b!1352418 (=> (not res!897761) (not e!768799))))

(assert (=> b!1352418 (= res!897761 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31570))))

(declare-fun b!1352419 () Bool)

(declare-fun e!768800 () Bool)

(assert (=> b!1352419 (= e!768800 false)))

(declare-fun lt!597538 () Bool)

(assert (=> b!1352419 (= lt!597538 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1352420 () Bool)

(assert (=> b!1352420 (= e!768799 e!768800)))

(declare-fun res!897755 () Bool)

(assert (=> b!1352420 (=> (not res!897755) (not e!768800))))

(assert (=> b!1352420 (= res!897755 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!597537 () Unit!44337)

(assert (=> b!1352420 (= lt!597537 e!768802)))

(declare-fun c!126770 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1352420 (= c!126770 (validKeyInArray!0 (select (arr!44532 a!3742) from!3120)))))

(declare-fun b!1352421 () Bool)

(declare-fun res!897758 () Bool)

(assert (=> b!1352421 (=> (not res!897758) (not e!768799))))

(declare-fun contains!9282 (List!31573 (_ BitVec 64)) Bool)

(assert (=> b!1352421 (= res!897758 (not (contains!9282 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352422 () Bool)

(declare-fun lt!597535 () Unit!44337)

(assert (=> b!1352422 (= e!768802 lt!597535)))

(declare-fun lt!597536 () Unit!44337)

(declare-fun lemmaListSubSeqRefl!0 (List!31573) Unit!44337)

(assert (=> b!1352422 (= lt!597536 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!702 (List!31573 List!31573) Bool)

(assert (=> b!1352422 (subseq!702 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92168 List!31573 List!31573 (_ BitVec 32)) Unit!44337)

(declare-fun $colon$colon!717 (List!31573 (_ BitVec 64)) List!31573)

(assert (=> b!1352422 (= lt!597535 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!717 acc!759 (select (arr!44532 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1352422 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1352423 () Bool)

(declare-fun res!897759 () Bool)

(assert (=> b!1352423 (=> (not res!897759) (not e!768799))))

(assert (=> b!1352423 (= res!897759 (not (contains!9282 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352424 () Bool)

(declare-fun res!897756 () Bool)

(assert (=> b!1352424 (=> (not res!897756) (not e!768799))))

(declare-fun noDuplicate!2139 (List!31573) Bool)

(assert (=> b!1352424 (= res!897756 (noDuplicate!2139 acc!759))))

(declare-fun b!1352425 () Bool)

(declare-fun res!897760 () Bool)

(assert (=> b!1352425 (=> (not res!897760) (not e!768799))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1352425 (= res!897760 (not (validKeyInArray!0 l!3587)))))

(assert (= (and start!113986 res!897754) b!1352424))

(assert (= (and b!1352424 res!897756) b!1352423))

(assert (= (and b!1352423 res!897759) b!1352421))

(assert (= (and b!1352421 res!897758) b!1352418))

(assert (= (and b!1352418 res!897761) b!1352416))

(assert (= (and b!1352416 res!897763) b!1352417))

(assert (= (and b!1352417 res!897757) b!1352425))

(assert (= (and b!1352425 res!897760) b!1352415))

(assert (= (and b!1352415 res!897762) b!1352420))

(assert (= (and b!1352420 c!126770) b!1352422))

(assert (= (and b!1352420 (not c!126770)) b!1352414))

(assert (= (and b!1352420 res!897755) b!1352419))

(declare-fun m!1239233 () Bool)

(assert (=> b!1352424 m!1239233))

(declare-fun m!1239235 () Bool)

(assert (=> b!1352421 m!1239235))

(declare-fun m!1239237 () Bool)

(assert (=> b!1352416 m!1239237))

(declare-fun m!1239239 () Bool)

(assert (=> b!1352422 m!1239239))

(declare-fun m!1239241 () Bool)

(assert (=> b!1352422 m!1239241))

(declare-fun m!1239243 () Bool)

(assert (=> b!1352422 m!1239243))

(declare-fun m!1239245 () Bool)

(assert (=> b!1352422 m!1239245))

(declare-fun m!1239247 () Bool)

(assert (=> b!1352422 m!1239247))

(assert (=> b!1352422 m!1239241))

(assert (=> b!1352422 m!1239243))

(declare-fun m!1239249 () Bool)

(assert (=> b!1352422 m!1239249))

(assert (=> b!1352420 m!1239241))

(assert (=> b!1352420 m!1239241))

(declare-fun m!1239251 () Bool)

(assert (=> b!1352420 m!1239251))

(declare-fun m!1239253 () Bool)

(assert (=> start!113986 m!1239253))

(assert (=> b!1352419 m!1239247))

(declare-fun m!1239255 () Bool)

(assert (=> b!1352423 m!1239255))

(declare-fun m!1239257 () Bool)

(assert (=> b!1352425 m!1239257))

(declare-fun m!1239259 () Bool)

(assert (=> b!1352418 m!1239259))

(check-sat (not b!1352418) (not b!1352416) (not start!113986) (not b!1352424) (not b!1352422) (not b!1352420) (not b!1352421) (not b!1352419) (not b!1352425) (not b!1352423))
(check-sat)
