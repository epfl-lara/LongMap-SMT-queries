; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115282 () Bool)

(assert start!115282)

(declare-fun b!1364729 () Bool)

(declare-fun e!774100 () Bool)

(declare-fun e!774101 () Bool)

(assert (=> b!1364729 (= e!774100 e!774101)))

(declare-fun res!907766 () Bool)

(assert (=> b!1364729 (=> (not res!907766) (not e!774101))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lt!601240 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1364729 (= res!907766 (and (not (= from!3120 i!1404)) (not lt!601240) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44921 0))(
  ( (Unit!44922) )
))
(declare-fun lt!601238 () Unit!44921)

(declare-fun e!774102 () Unit!44921)

(assert (=> b!1364729 (= lt!601238 e!774102)))

(declare-fun c!127933 () Bool)

(assert (=> b!1364729 (= c!127933 lt!601240)))

(declare-datatypes ((array!92800 0))(
  ( (array!92801 (arr!44827 (Array (_ BitVec 32) (_ BitVec 64))) (size!45378 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92800)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1364729 (= lt!601240 (validKeyInArray!0 (select (arr!44827 a!3742) from!3120)))))

(declare-fun b!1364730 () Bool)

(declare-fun res!907764 () Bool)

(assert (=> b!1364730 (=> (not res!907764) (not e!774100))))

(declare-datatypes ((List!31855 0))(
  ( (Nil!31852) (Cons!31851 (h!33069 (_ BitVec 64)) (t!46538 List!31855)) )
))
(declare-fun arrayNoDuplicates!0 (array!92800 (_ BitVec 32) List!31855) Bool)

(assert (=> b!1364730 (= res!907764 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31852))))

(declare-fun res!907758 () Bool)

(assert (=> start!115282 (=> (not res!907758) (not e!774100))))

(assert (=> start!115282 (= res!907758 (and (bvslt (size!45378 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45378 a!3742))))))

(assert (=> start!115282 e!774100))

(assert (=> start!115282 true))

(declare-fun array_inv!34108 (array!92800) Bool)

(assert (=> start!115282 (array_inv!34108 a!3742)))

(declare-fun b!1364731 () Bool)

(declare-fun res!907763 () Bool)

(assert (=> b!1364731 (=> (not res!907763) (not e!774100))))

(assert (=> b!1364731 (= res!907763 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45378 a!3742))))))

(declare-fun b!1364732 () Bool)

(declare-fun res!907762 () Bool)

(assert (=> b!1364732 (=> (not res!907762) (not e!774100))))

(declare-fun acc!759 () List!31855)

(declare-fun contains!9567 (List!31855 (_ BitVec 64)) Bool)

(assert (=> b!1364732 (= res!907762 (not (contains!9567 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364733 () Bool)

(declare-fun lt!601241 () Unit!44921)

(assert (=> b!1364733 (= e!774102 lt!601241)))

(declare-fun lt!601239 () Unit!44921)

(declare-fun lemmaListSubSeqRefl!0 (List!31855) Unit!44921)

(assert (=> b!1364733 (= lt!601239 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!926 (List!31855 List!31855) Bool)

(assert (=> b!1364733 (subseq!926 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92800 List!31855 List!31855 (_ BitVec 32)) Unit!44921)

(declare-fun $colon$colon!928 (List!31855 (_ BitVec 64)) List!31855)

(assert (=> b!1364733 (= lt!601241 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!928 acc!759 (select (arr!44827 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1364733 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1364734 () Bool)

(declare-fun res!907765 () Bool)

(assert (=> b!1364734 (=> (not res!907765) (not e!774100))))

(declare-fun noDuplicate!2398 (List!31855) Bool)

(assert (=> b!1364734 (= res!907765 (noDuplicate!2398 acc!759))))

(declare-fun b!1364735 () Bool)

(declare-fun Unit!44923 () Unit!44921)

(assert (=> b!1364735 (= e!774102 Unit!44923)))

(declare-fun b!1364736 () Bool)

(declare-fun res!907760 () Bool)

(assert (=> b!1364736 (=> (not res!907760) (not e!774100))))

(assert (=> b!1364736 (= res!907760 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45378 a!3742)))))

(declare-fun b!1364737 () Bool)

(declare-fun res!907761 () Bool)

(assert (=> b!1364737 (=> (not res!907761) (not e!774100))))

(assert (=> b!1364737 (= res!907761 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1364738 () Bool)

(declare-fun res!907767 () Bool)

(assert (=> b!1364738 (=> (not res!907767) (not e!774100))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1364738 (= res!907767 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1364739 () Bool)

(assert (=> b!1364739 (= e!774101 false)))

(declare-fun lt!601242 () Bool)

(assert (=> b!1364739 (= lt!601242 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1364740 () Bool)

(declare-fun res!907759 () Bool)

(assert (=> b!1364740 (=> (not res!907759) (not e!774100))))

(assert (=> b!1364740 (= res!907759 (not (contains!9567 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115282 res!907758) b!1364734))

(assert (= (and b!1364734 res!907765) b!1364732))

(assert (= (and b!1364732 res!907762) b!1364740))

(assert (= (and b!1364740 res!907759) b!1364730))

(assert (= (and b!1364730 res!907764) b!1364737))

(assert (= (and b!1364737 res!907761) b!1364731))

(assert (= (and b!1364731 res!907763) b!1364738))

(assert (= (and b!1364738 res!907767) b!1364736))

(assert (= (and b!1364736 res!907760) b!1364729))

(assert (= (and b!1364729 c!127933) b!1364733))

(assert (= (and b!1364729 (not c!127933)) b!1364735))

(assert (= (and b!1364729 res!907766) b!1364739))

(declare-fun m!1249837 () Bool)

(assert (=> b!1364739 m!1249837))

(declare-fun m!1249839 () Bool)

(assert (=> b!1364740 m!1249839))

(declare-fun m!1249841 () Bool)

(assert (=> start!115282 m!1249841))

(declare-fun m!1249843 () Bool)

(assert (=> b!1364734 m!1249843))

(declare-fun m!1249845 () Bool)

(assert (=> b!1364730 m!1249845))

(declare-fun m!1249847 () Bool)

(assert (=> b!1364737 m!1249847))

(declare-fun m!1249849 () Bool)

(assert (=> b!1364738 m!1249849))

(declare-fun m!1249851 () Bool)

(assert (=> b!1364732 m!1249851))

(declare-fun m!1249853 () Bool)

(assert (=> b!1364733 m!1249853))

(declare-fun m!1249855 () Bool)

(assert (=> b!1364733 m!1249855))

(declare-fun m!1249857 () Bool)

(assert (=> b!1364733 m!1249857))

(declare-fun m!1249859 () Bool)

(assert (=> b!1364733 m!1249859))

(assert (=> b!1364733 m!1249837))

(assert (=> b!1364733 m!1249855))

(assert (=> b!1364733 m!1249857))

(declare-fun m!1249861 () Bool)

(assert (=> b!1364733 m!1249861))

(assert (=> b!1364729 m!1249855))

(assert (=> b!1364729 m!1249855))

(declare-fun m!1249863 () Bool)

(assert (=> b!1364729 m!1249863))

(check-sat (not b!1364730) (not b!1364729) (not start!115282) (not b!1364737) (not b!1364733) (not b!1364732) (not b!1364734) (not b!1364738) (not b!1364739) (not b!1364740))
(check-sat)
