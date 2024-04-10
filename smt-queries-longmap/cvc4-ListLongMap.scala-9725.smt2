; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115080 () Bool)

(assert start!115080)

(declare-fun b!1363843 () Bool)

(declare-fun res!907596 () Bool)

(declare-fun e!773390 () Bool)

(assert (=> b!1363843 (=> (not res!907596) (not e!773390))))

(declare-datatypes ((List!31826 0))(
  ( (Nil!31823) (Cons!31822 (h!33031 (_ BitVec 64)) (t!46517 List!31826)) )
))
(declare-fun acc!759 () List!31826)

(declare-fun contains!9535 (List!31826 (_ BitVec 64)) Bool)

(assert (=> b!1363843 (= res!907596 (not (contains!9535 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363844 () Bool)

(declare-fun res!907593 () Bool)

(assert (=> b!1363844 (=> (not res!907593) (not e!773390))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92707 0))(
  ( (array!92708 (arr!44785 (Array (_ BitVec 32) (_ BitVec 64))) (size!45335 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92707)

(assert (=> b!1363844 (= res!907593 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45335 a!3742)))))

(declare-fun b!1363845 () Bool)

(declare-fun res!907595 () Bool)

(assert (=> b!1363845 (=> (not res!907595) (not e!773390))))

(declare-fun arrayNoDuplicates!0 (array!92707 (_ BitVec 32) List!31826) Bool)

(assert (=> b!1363845 (= res!907595 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31823))))

(declare-fun b!1363846 () Bool)

(declare-fun res!907587 () Bool)

(assert (=> b!1363846 (=> (not res!907587) (not e!773390))))

(assert (=> b!1363846 (= res!907587 (not (contains!9535 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!907590 () Bool)

(assert (=> start!115080 (=> (not res!907590) (not e!773390))))

(assert (=> start!115080 (= res!907590 (and (bvslt (size!45335 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45335 a!3742))))))

(assert (=> start!115080 e!773390))

(assert (=> start!115080 true))

(declare-fun array_inv!33813 (array!92707) Bool)

(assert (=> start!115080 (array_inv!33813 a!3742)))

(declare-fun b!1363847 () Bool)

(declare-fun res!907594 () Bool)

(assert (=> b!1363847 (=> (not res!907594) (not e!773390))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1363847 (= res!907594 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1363848 () Bool)

(declare-fun e!773389 () Bool)

(assert (=> b!1363848 (= e!773389 (not true))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1363848 (arrayNoDuplicates!0 (array!92708 (store (arr!44785 a!3742) i!1404 l!3587) (size!45335 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-datatypes ((Unit!45015 0))(
  ( (Unit!45016) )
))
(declare-fun lt!600922 () Unit!45015)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92707 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31826) Unit!45015)

(assert (=> b!1363848 (= lt!600922 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1363849 () Bool)

(declare-fun e!773391 () Unit!45015)

(declare-fun lt!600921 () Unit!45015)

(assert (=> b!1363849 (= e!773391 lt!600921)))

(declare-fun lt!600918 () Unit!45015)

(declare-fun lemmaListSubSeqRefl!0 (List!31826) Unit!45015)

(assert (=> b!1363849 (= lt!600918 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!937 (List!31826 List!31826) Bool)

(assert (=> b!1363849 (subseq!937 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92707 List!31826 List!31826 (_ BitVec 32)) Unit!45015)

(declare-fun $colon$colon!940 (List!31826 (_ BitVec 64)) List!31826)

(assert (=> b!1363849 (= lt!600921 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!940 acc!759 (select (arr!44785 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1363849 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1363850 () Bool)

(declare-fun res!907589 () Bool)

(assert (=> b!1363850 (=> (not res!907589) (not e!773390))))

(assert (=> b!1363850 (= res!907589 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45335 a!3742))))))

(declare-fun b!1363851 () Bool)

(declare-fun res!907597 () Bool)

(assert (=> b!1363851 (=> (not res!907597) (not e!773389))))

(assert (=> b!1363851 (= res!907597 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1363852 () Bool)

(declare-fun res!907588 () Bool)

(assert (=> b!1363852 (=> (not res!907588) (not e!773390))))

(assert (=> b!1363852 (= res!907588 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1363853 () Bool)

(declare-fun Unit!45017 () Unit!45015)

(assert (=> b!1363853 (= e!773391 Unit!45017)))

(declare-fun b!1363854 () Bool)

(assert (=> b!1363854 (= e!773390 e!773389)))

(declare-fun res!907592 () Bool)

(assert (=> b!1363854 (=> (not res!907592) (not e!773389))))

(declare-fun lt!600919 () Bool)

(assert (=> b!1363854 (= res!907592 (and (not (= from!3120 i!1404)) (not lt!600919) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!600920 () Unit!45015)

(assert (=> b!1363854 (= lt!600920 e!773391)))

(declare-fun c!127568 () Bool)

(assert (=> b!1363854 (= c!127568 lt!600919)))

(assert (=> b!1363854 (= lt!600919 (validKeyInArray!0 (select (arr!44785 a!3742) from!3120)))))

(declare-fun b!1363855 () Bool)

(declare-fun res!907591 () Bool)

(assert (=> b!1363855 (=> (not res!907591) (not e!773390))))

(declare-fun noDuplicate!2392 (List!31826) Bool)

(assert (=> b!1363855 (= res!907591 (noDuplicate!2392 acc!759))))

(assert (= (and start!115080 res!907590) b!1363855))

(assert (= (and b!1363855 res!907591) b!1363843))

(assert (= (and b!1363843 res!907596) b!1363846))

(assert (= (and b!1363846 res!907587) b!1363845))

(assert (= (and b!1363845 res!907595) b!1363852))

(assert (= (and b!1363852 res!907588) b!1363850))

(assert (= (and b!1363850 res!907589) b!1363847))

(assert (= (and b!1363847 res!907594) b!1363844))

(assert (= (and b!1363844 res!907593) b!1363854))

(assert (= (and b!1363854 c!127568) b!1363849))

(assert (= (and b!1363854 (not c!127568)) b!1363853))

(assert (= (and b!1363854 res!907592) b!1363851))

(assert (= (and b!1363851 res!907597) b!1363848))

(declare-fun m!1248561 () Bool)

(assert (=> b!1363845 m!1248561))

(declare-fun m!1248563 () Bool)

(assert (=> b!1363852 m!1248563))

(declare-fun m!1248565 () Bool)

(assert (=> start!115080 m!1248565))

(declare-fun m!1248567 () Bool)

(assert (=> b!1363854 m!1248567))

(assert (=> b!1363854 m!1248567))

(declare-fun m!1248569 () Bool)

(assert (=> b!1363854 m!1248569))

(declare-fun m!1248571 () Bool)

(assert (=> b!1363848 m!1248571))

(declare-fun m!1248573 () Bool)

(assert (=> b!1363848 m!1248573))

(declare-fun m!1248575 () Bool)

(assert (=> b!1363848 m!1248575))

(declare-fun m!1248577 () Bool)

(assert (=> b!1363846 m!1248577))

(declare-fun m!1248579 () Bool)

(assert (=> b!1363843 m!1248579))

(declare-fun m!1248581 () Bool)

(assert (=> b!1363855 m!1248581))

(declare-fun m!1248583 () Bool)

(assert (=> b!1363847 m!1248583))

(declare-fun m!1248585 () Bool)

(assert (=> b!1363851 m!1248585))

(declare-fun m!1248587 () Bool)

(assert (=> b!1363849 m!1248587))

(assert (=> b!1363849 m!1248567))

(declare-fun m!1248589 () Bool)

(assert (=> b!1363849 m!1248589))

(declare-fun m!1248591 () Bool)

(assert (=> b!1363849 m!1248591))

(assert (=> b!1363849 m!1248585))

(assert (=> b!1363849 m!1248567))

(assert (=> b!1363849 m!1248589))

(declare-fun m!1248593 () Bool)

(assert (=> b!1363849 m!1248593))

(push 1)

