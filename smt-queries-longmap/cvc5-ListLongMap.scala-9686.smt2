; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114354 () Bool)

(assert start!114354)

(declare-fun b!1357728 () Bool)

(declare-fun res!902486 () Bool)

(declare-fun e!770595 () Bool)

(assert (=> b!1357728 (=> (not res!902486) (not e!770595))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92395 0))(
  ( (array!92396 (arr!44643 (Array (_ BitVec 32) (_ BitVec 64))) (size!45195 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92395)

(assert (=> b!1357728 (= res!902486 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45195 a!3742)))))

(declare-fun b!1357729 () Bool)

(declare-fun e!770596 () Bool)

(assert (=> b!1357729 (= e!770596 true)))

(declare-fun lt!599039 () Bool)

(declare-datatypes ((List!31762 0))(
  ( (Nil!31759) (Cons!31758 (h!32967 (_ BitVec 64)) (t!46418 List!31762)) )
))
(declare-fun lt!599040 () List!31762)

(declare-fun contains!9382 (List!31762 (_ BitVec 64)) Bool)

(assert (=> b!1357729 (= lt!599039 (contains!9382 lt!599040 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1357730 () Bool)

(declare-fun res!902479 () Bool)

(assert (=> b!1357730 (=> (not res!902479) (not e!770595))))

(declare-fun arrayNoDuplicates!0 (array!92395 (_ BitVec 32) List!31762) Bool)

(assert (=> b!1357730 (= res!902479 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31759))))

(declare-fun b!1357731 () Bool)

(declare-fun res!902478 () Bool)

(assert (=> b!1357731 (=> (not res!902478) (not e!770595))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1357731 (= res!902478 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45195 a!3742))))))

(declare-fun res!902482 () Bool)

(assert (=> start!114354 (=> (not res!902482) (not e!770595))))

(assert (=> start!114354 (= res!902482 (and (bvslt (size!45195 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45195 a!3742))))))

(assert (=> start!114354 e!770595))

(assert (=> start!114354 true))

(declare-fun array_inv!33876 (array!92395) Bool)

(assert (=> start!114354 (array_inv!33876 a!3742)))

(declare-fun b!1357732 () Bool)

(declare-fun res!902489 () Bool)

(assert (=> b!1357732 (=> res!902489 e!770596)))

(declare-fun noDuplicate!2297 (List!31762) Bool)

(assert (=> b!1357732 (= res!902489 (not (noDuplicate!2297 lt!599040)))))

(declare-fun b!1357733 () Bool)

(assert (=> b!1357733 (= e!770595 (not e!770596))))

(declare-fun res!902484 () Bool)

(assert (=> b!1357733 (=> res!902484 e!770596)))

(assert (=> b!1357733 (= res!902484 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun acc!759 () List!31762)

(declare-fun $colon$colon!825 (List!31762 (_ BitVec 64)) List!31762)

(assert (=> b!1357733 (= lt!599040 ($colon$colon!825 acc!759 (select (arr!44643 a!3742) from!3120)))))

(declare-fun subseq!820 (List!31762 List!31762) Bool)

(assert (=> b!1357733 (subseq!820 acc!759 acc!759)))

(declare-datatypes ((Unit!44512 0))(
  ( (Unit!44513) )
))
(declare-fun lt!599041 () Unit!44512)

(declare-fun lemmaListSubSeqRefl!0 (List!31762) Unit!44512)

(assert (=> b!1357733 (= lt!599041 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1357734 () Bool)

(declare-fun res!902488 () Bool)

(assert (=> b!1357734 (=> (not res!902488) (not e!770595))))

(assert (=> b!1357734 (= res!902488 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1357735 () Bool)

(declare-fun res!902477 () Bool)

(assert (=> b!1357735 (=> (not res!902477) (not e!770595))))

(assert (=> b!1357735 (= res!902477 (not (contains!9382 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357736 () Bool)

(declare-fun res!902481 () Bool)

(assert (=> b!1357736 (=> (not res!902481) (not e!770595))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1357736 (= res!902481 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1357737 () Bool)

(declare-fun res!902487 () Bool)

(assert (=> b!1357737 (=> (not res!902487) (not e!770595))))

(assert (=> b!1357737 (= res!902487 (noDuplicate!2297 acc!759))))

(declare-fun b!1357738 () Bool)

(declare-fun res!902485 () Bool)

(assert (=> b!1357738 (=> (not res!902485) (not e!770595))))

(assert (=> b!1357738 (= res!902485 (validKeyInArray!0 (select (arr!44643 a!3742) from!3120)))))

(declare-fun b!1357739 () Bool)

(declare-fun res!902483 () Bool)

(assert (=> b!1357739 (=> (not res!902483) (not e!770595))))

(assert (=> b!1357739 (= res!902483 (not (contains!9382 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357740 () Bool)

(declare-fun res!902480 () Bool)

(assert (=> b!1357740 (=> res!902480 e!770596)))

(assert (=> b!1357740 (= res!902480 (contains!9382 lt!599040 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!114354 res!902482) b!1357737))

(assert (= (and b!1357737 res!902487) b!1357739))

(assert (= (and b!1357739 res!902483) b!1357735))

(assert (= (and b!1357735 res!902477) b!1357730))

(assert (= (and b!1357730 res!902479) b!1357734))

(assert (= (and b!1357734 res!902488) b!1357731))

(assert (= (and b!1357731 res!902478) b!1357736))

(assert (= (and b!1357736 res!902481) b!1357728))

(assert (= (and b!1357728 res!902486) b!1357738))

(assert (= (and b!1357738 res!902485) b!1357733))

(assert (= (and b!1357733 (not res!902484)) b!1357732))

(assert (= (and b!1357732 (not res!902489)) b!1357740))

(assert (= (and b!1357740 (not res!902480)) b!1357729))

(declare-fun m!1242955 () Bool)

(assert (=> b!1357733 m!1242955))

(assert (=> b!1357733 m!1242955))

(declare-fun m!1242957 () Bool)

(assert (=> b!1357733 m!1242957))

(declare-fun m!1242959 () Bool)

(assert (=> b!1357733 m!1242959))

(declare-fun m!1242961 () Bool)

(assert (=> b!1357733 m!1242961))

(declare-fun m!1242963 () Bool)

(assert (=> b!1357732 m!1242963))

(declare-fun m!1242965 () Bool)

(assert (=> b!1357737 m!1242965))

(declare-fun m!1242967 () Bool)

(assert (=> b!1357735 m!1242967))

(declare-fun m!1242969 () Bool)

(assert (=> b!1357740 m!1242969))

(declare-fun m!1242971 () Bool)

(assert (=> start!114354 m!1242971))

(assert (=> b!1357738 m!1242955))

(assert (=> b!1357738 m!1242955))

(declare-fun m!1242973 () Bool)

(assert (=> b!1357738 m!1242973))

(declare-fun m!1242975 () Bool)

(assert (=> b!1357739 m!1242975))

(declare-fun m!1242977 () Bool)

(assert (=> b!1357734 m!1242977))

(declare-fun m!1242979 () Bool)

(assert (=> b!1357729 m!1242979))

(declare-fun m!1242981 () Bool)

(assert (=> b!1357736 m!1242981))

(declare-fun m!1242983 () Bool)

(assert (=> b!1357730 m!1242983))

(push 1)

(assert (not b!1357732))

(assert (not start!114354))

(assert (not b!1357730))

(assert (not b!1357738))

(assert (not b!1357736))

(assert (not b!1357733))

(assert (not b!1357739))

(assert (not b!1357737))

(assert (not b!1357729))

(assert (not b!1357734))

(assert (not b!1357735))

(assert (not b!1357740))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

