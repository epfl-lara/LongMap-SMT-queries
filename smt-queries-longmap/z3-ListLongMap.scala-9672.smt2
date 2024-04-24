; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114394 () Bool)

(assert start!114394)

(declare-fun b!1357585 () Bool)

(declare-fun res!901601 () Bool)

(declare-fun e!770863 () Bool)

(assert (=> b!1357585 (=> (not res!901601) (not e!770863))))

(declare-datatypes ((List!31705 0))(
  ( (Nil!31702) (Cons!31701 (h!32919 (_ BitVec 64)) (t!46355 List!31705)) )
))
(declare-fun acc!759 () List!31705)

(declare-fun contains!9417 (List!31705 (_ BitVec 64)) Bool)

(assert (=> b!1357585 (= res!901601 (not (contains!9417 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357586 () Bool)

(declare-fun res!901594 () Bool)

(assert (=> b!1357586 (=> (not res!901594) (not e!770863))))

(assert (=> b!1357586 (= res!901594 (not (contains!9417 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!901595 () Bool)

(assert (=> start!114394 (=> (not res!901595) (not e!770863))))

(declare-datatypes ((array!92467 0))(
  ( (array!92468 (arr!44677 (Array (_ BitVec 32) (_ BitVec 64))) (size!45228 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92467)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114394 (= res!901595 (and (bvslt (size!45228 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45228 a!3742))))))

(assert (=> start!114394 e!770863))

(assert (=> start!114394 true))

(declare-fun array_inv!33958 (array!92467) Bool)

(assert (=> start!114394 (array_inv!33958 a!3742)))

(declare-fun b!1357587 () Bool)

(declare-fun res!901596 () Bool)

(assert (=> b!1357587 (=> (not res!901596) (not e!770863))))

(declare-fun arrayNoDuplicates!0 (array!92467 (_ BitVec 32) List!31705) Bool)

(assert (=> b!1357587 (= res!901596 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31702))))

(declare-fun b!1357588 () Bool)

(declare-fun res!901599 () Bool)

(assert (=> b!1357588 (=> (not res!901599) (not e!770863))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1357588 (= res!901599 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45228 a!3742))))))

(declare-fun b!1357589 () Bool)

(declare-datatypes ((Unit!44552 0))(
  ( (Unit!44553) )
))
(declare-fun e!770864 () Unit!44552)

(declare-fun Unit!44554 () Unit!44552)

(assert (=> b!1357589 (= e!770864 Unit!44554)))

(declare-fun b!1357590 () Bool)

(declare-fun e!770865 () Bool)

(assert (=> b!1357590 (= e!770865 (not true))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1357590 (arrayNoDuplicates!0 (array!92468 (store (arr!44677 a!3742) i!1404 l!3587) (size!45228 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!599453 () Unit!44552)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92467 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31705) Unit!44552)

(assert (=> b!1357590 (= lt!599453 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1357591 () Bool)

(assert (=> b!1357591 (= e!770863 e!770865)))

(declare-fun res!901592 () Bool)

(assert (=> b!1357591 (=> (not res!901592) (not e!770865))))

(declare-fun lt!599452 () Bool)

(assert (=> b!1357591 (= res!901592 (and (not (= from!3120 i!1404)) (not lt!599452) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!599450 () Unit!44552)

(assert (=> b!1357591 (= lt!599450 e!770864)))

(declare-fun c!127444 () Bool)

(assert (=> b!1357591 (= c!127444 lt!599452)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1357591 (= lt!599452 (validKeyInArray!0 (select (arr!44677 a!3742) from!3120)))))

(declare-fun b!1357592 () Bool)

(declare-fun res!901602 () Bool)

(assert (=> b!1357592 (=> (not res!901602) (not e!770863))))

(assert (=> b!1357592 (= res!901602 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1357593 () Bool)

(declare-fun res!901598 () Bool)

(assert (=> b!1357593 (=> (not res!901598) (not e!770863))))

(assert (=> b!1357593 (= res!901598 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1357594 () Bool)

(declare-fun res!901600 () Bool)

(assert (=> b!1357594 (=> (not res!901600) (not e!770863))))

(declare-fun noDuplicate!2248 (List!31705) Bool)

(assert (=> b!1357594 (= res!901600 (noDuplicate!2248 acc!759))))

(declare-fun b!1357595 () Bool)

(declare-fun res!901597 () Bool)

(assert (=> b!1357595 (=> (not res!901597) (not e!770865))))

(assert (=> b!1357595 (= res!901597 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1357596 () Bool)

(declare-fun lt!599454 () Unit!44552)

(assert (=> b!1357596 (= e!770864 lt!599454)))

(declare-fun lt!599451 () Unit!44552)

(declare-fun lemmaListSubSeqRefl!0 (List!31705) Unit!44552)

(assert (=> b!1357596 (= lt!599451 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!794 (List!31705 List!31705) Bool)

(assert (=> b!1357596 (subseq!794 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92467 List!31705 List!31705 (_ BitVec 32)) Unit!44552)

(declare-fun $colon$colon!808 (List!31705 (_ BitVec 64)) List!31705)

(assert (=> b!1357596 (= lt!599454 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!808 acc!759 (select (arr!44677 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1357596 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1357597 () Bool)

(declare-fun res!901593 () Bool)

(assert (=> b!1357597 (=> (not res!901593) (not e!770863))))

(assert (=> b!1357597 (= res!901593 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45228 a!3742)))))

(assert (= (and start!114394 res!901595) b!1357594))

(assert (= (and b!1357594 res!901600) b!1357586))

(assert (= (and b!1357586 res!901594) b!1357585))

(assert (= (and b!1357585 res!901601) b!1357587))

(assert (= (and b!1357587 res!901596) b!1357592))

(assert (= (and b!1357592 res!901602) b!1357588))

(assert (= (and b!1357588 res!901599) b!1357593))

(assert (= (and b!1357593 res!901598) b!1357597))

(assert (= (and b!1357597 res!901593) b!1357591))

(assert (= (and b!1357591 c!127444) b!1357596))

(assert (= (and b!1357591 (not c!127444)) b!1357589))

(assert (= (and b!1357591 res!901592) b!1357595))

(assert (= (and b!1357595 res!901597) b!1357590))

(declare-fun m!1243897 () Bool)

(assert (=> start!114394 m!1243897))

(declare-fun m!1243899 () Bool)

(assert (=> b!1357587 m!1243899))

(declare-fun m!1243901 () Bool)

(assert (=> b!1357585 m!1243901))

(declare-fun m!1243903 () Bool)

(assert (=> b!1357590 m!1243903))

(declare-fun m!1243905 () Bool)

(assert (=> b!1357590 m!1243905))

(declare-fun m!1243907 () Bool)

(assert (=> b!1357590 m!1243907))

(declare-fun m!1243909 () Bool)

(assert (=> b!1357592 m!1243909))

(declare-fun m!1243911 () Bool)

(assert (=> b!1357586 m!1243911))

(declare-fun m!1243913 () Bool)

(assert (=> b!1357594 m!1243913))

(declare-fun m!1243915 () Bool)

(assert (=> b!1357593 m!1243915))

(declare-fun m!1243917 () Bool)

(assert (=> b!1357595 m!1243917))

(declare-fun m!1243919 () Bool)

(assert (=> b!1357591 m!1243919))

(assert (=> b!1357591 m!1243919))

(declare-fun m!1243921 () Bool)

(assert (=> b!1357591 m!1243921))

(declare-fun m!1243923 () Bool)

(assert (=> b!1357596 m!1243923))

(assert (=> b!1357596 m!1243919))

(declare-fun m!1243925 () Bool)

(assert (=> b!1357596 m!1243925))

(declare-fun m!1243927 () Bool)

(assert (=> b!1357596 m!1243927))

(assert (=> b!1357596 m!1243917))

(assert (=> b!1357596 m!1243919))

(assert (=> b!1357596 m!1243925))

(declare-fun m!1243929 () Bool)

(assert (=> b!1357596 m!1243929))

(check-sat (not b!1357586) (not b!1357594) (not b!1357593) (not b!1357592) (not b!1357585) (not b!1357595) (not b!1357590) (not b!1357587) (not start!114394) (not b!1357591) (not b!1357596))
(check-sat)
