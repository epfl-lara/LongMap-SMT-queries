; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114088 () Bool)

(assert start!114088)

(declare-fun b!1354680 () Bool)

(declare-datatypes ((Unit!44490 0))(
  ( (Unit!44491) )
))
(declare-fun e!769507 () Unit!44490)

(declare-fun lt!598342 () Unit!44490)

(assert (=> b!1354680 (= e!769507 lt!598342)))

(declare-fun lt!598340 () Unit!44490)

(declare-datatypes ((List!31624 0))(
  ( (Nil!31621) (Cons!31620 (h!32829 (_ BitVec 64)) (t!46282 List!31624)) )
))
(declare-fun acc!759 () List!31624)

(declare-fun lemmaListSubSeqRefl!0 (List!31624) Unit!44490)

(assert (=> b!1354680 (= lt!598340 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!753 (List!31624 List!31624) Bool)

(assert (=> b!1354680 (subseq!753 acc!759 acc!759)))

(declare-datatypes ((array!92270 0))(
  ( (array!92271 (arr!44583 (Array (_ BitVec 32) (_ BitVec 64))) (size!45133 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92270)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92270 List!31624 List!31624 (_ BitVec 32)) Unit!44490)

(declare-fun $colon$colon!768 (List!31624 (_ BitVec 64)) List!31624)

(assert (=> b!1354680 (= lt!598342 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!768 acc!759 (select (arr!44583 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92270 (_ BitVec 32) List!31624) Bool)

(assert (=> b!1354680 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1354681 () Bool)

(declare-fun e!769506 () Bool)

(assert (=> b!1354681 (= e!769506 (not true))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun lt!598341 () List!31624)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1354681 (arrayNoDuplicates!0 (array!92271 (store (arr!44583 a!3742) i!1404 l!3587) (size!45133 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) lt!598341)))

(declare-fun lt!598337 () Unit!44490)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92270 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31624) Unit!44490)

(assert (=> b!1354681 (= lt!598337 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) lt!598341))))

(declare-fun b!1354682 () Bool)

(declare-fun res!899723 () Bool)

(declare-fun e!769510 () Bool)

(assert (=> b!1354682 (=> (not res!899723) (not e!769510))))

(declare-fun noDuplicate!2190 (List!31624) Bool)

(assert (=> b!1354682 (= res!899723 (noDuplicate!2190 acc!759))))

(declare-fun b!1354683 () Bool)

(declare-fun res!899725 () Bool)

(assert (=> b!1354683 (=> (not res!899725) (not e!769510))))

(declare-fun contains!9333 (List!31624 (_ BitVec 64)) Bool)

(assert (=> b!1354683 (= res!899725 (not (contains!9333 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354684 () Bool)

(declare-fun res!899727 () Bool)

(assert (=> b!1354684 (=> (not res!899727) (not e!769506))))

(assert (=> b!1354684 (= res!899727 (not (contains!9333 lt!598341 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354685 () Bool)

(declare-fun res!899726 () Bool)

(assert (=> b!1354685 (=> (not res!899726) (not e!769510))))

(assert (=> b!1354685 (= res!899726 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1354686 () Bool)

(declare-fun res!899728 () Bool)

(assert (=> b!1354686 (=> (not res!899728) (not e!769506))))

(assert (=> b!1354686 (= res!899728 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!598341))))

(declare-fun res!899715 () Bool)

(assert (=> start!114088 (=> (not res!899715) (not e!769510))))

(assert (=> start!114088 (= res!899715 (and (bvslt (size!45133 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45133 a!3742))))))

(assert (=> start!114088 e!769510))

(assert (=> start!114088 true))

(declare-fun array_inv!33611 (array!92270) Bool)

(assert (=> start!114088 (array_inv!33611 a!3742)))

(declare-fun b!1354687 () Bool)

(declare-fun res!899724 () Bool)

(assert (=> b!1354687 (=> (not res!899724) (not e!769510))))

(assert (=> b!1354687 (= res!899724 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31621))))

(declare-fun b!1354688 () Bool)

(declare-fun res!899716 () Bool)

(assert (=> b!1354688 (=> (not res!899716) (not e!769506))))

(assert (=> b!1354688 (= res!899716 (not (contains!9333 lt!598341 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354689 () Bool)

(declare-fun Unit!44492 () Unit!44490)

(assert (=> b!1354689 (= e!769507 Unit!44492)))

(declare-fun b!1354690 () Bool)

(declare-fun e!769509 () Bool)

(assert (=> b!1354690 (= e!769509 e!769506)))

(declare-fun res!899721 () Bool)

(assert (=> b!1354690 (=> (not res!899721) (not e!769506))))

(assert (=> b!1354690 (= res!899721 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1354690 (= lt!598341 ($colon$colon!768 acc!759 (select (arr!44583 a!3742) from!3120)))))

(declare-fun b!1354691 () Bool)

(assert (=> b!1354691 (= e!769510 e!769509)))

(declare-fun res!899719 () Bool)

(assert (=> b!1354691 (=> (not res!899719) (not e!769509))))

(declare-fun lt!598338 () Bool)

(assert (=> b!1354691 (= res!899719 (and (not (= from!3120 i!1404)) lt!598338))))

(declare-fun lt!598339 () Unit!44490)

(assert (=> b!1354691 (= lt!598339 e!769507)))

(declare-fun c!126923 () Bool)

(assert (=> b!1354691 (= c!126923 lt!598338)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1354691 (= lt!598338 (validKeyInArray!0 (select (arr!44583 a!3742) from!3120)))))

(declare-fun b!1354692 () Bool)

(declare-fun res!899722 () Bool)

(assert (=> b!1354692 (=> (not res!899722) (not e!769510))))

(assert (=> b!1354692 (= res!899722 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1354693 () Bool)

(declare-fun res!899718 () Bool)

(assert (=> b!1354693 (=> (not res!899718) (not e!769510))))

(assert (=> b!1354693 (= res!899718 (not (contains!9333 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354694 () Bool)

(declare-fun res!899720 () Bool)

(assert (=> b!1354694 (=> (not res!899720) (not e!769510))))

(assert (=> b!1354694 (= res!899720 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45133 a!3742)))))

(declare-fun b!1354695 () Bool)

(declare-fun res!899717 () Bool)

(assert (=> b!1354695 (=> (not res!899717) (not e!769510))))

(assert (=> b!1354695 (= res!899717 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45133 a!3742))))))

(declare-fun b!1354696 () Bool)

(declare-fun res!899714 () Bool)

(assert (=> b!1354696 (=> (not res!899714) (not e!769506))))

(assert (=> b!1354696 (= res!899714 (noDuplicate!2190 lt!598341))))

(assert (= (and start!114088 res!899715) b!1354682))

(assert (= (and b!1354682 res!899723) b!1354693))

(assert (= (and b!1354693 res!899718) b!1354683))

(assert (= (and b!1354683 res!899725) b!1354687))

(assert (= (and b!1354687 res!899724) b!1354685))

(assert (= (and b!1354685 res!899726) b!1354695))

(assert (= (and b!1354695 res!899717) b!1354692))

(assert (= (and b!1354692 res!899722) b!1354694))

(assert (= (and b!1354694 res!899720) b!1354691))

(assert (= (and b!1354691 c!126923) b!1354680))

(assert (= (and b!1354691 (not c!126923)) b!1354689))

(assert (= (and b!1354691 res!899719) b!1354690))

(assert (= (and b!1354690 res!899721) b!1354696))

(assert (= (and b!1354696 res!899714) b!1354688))

(assert (= (and b!1354688 res!899716) b!1354684))

(assert (= (and b!1354684 res!899727) b!1354686))

(assert (= (and b!1354686 res!899728) b!1354681))

(declare-fun m!1241005 () Bool)

(assert (=> b!1354688 m!1241005))

(declare-fun m!1241007 () Bool)

(assert (=> b!1354696 m!1241007))

(declare-fun m!1241009 () Bool)

(assert (=> b!1354681 m!1241009))

(declare-fun m!1241011 () Bool)

(assert (=> b!1354681 m!1241011))

(declare-fun m!1241013 () Bool)

(assert (=> b!1354681 m!1241013))

(declare-fun m!1241015 () Bool)

(assert (=> b!1354692 m!1241015))

(declare-fun m!1241017 () Bool)

(assert (=> b!1354680 m!1241017))

(declare-fun m!1241019 () Bool)

(assert (=> b!1354680 m!1241019))

(declare-fun m!1241021 () Bool)

(assert (=> b!1354680 m!1241021))

(declare-fun m!1241023 () Bool)

(assert (=> b!1354680 m!1241023))

(declare-fun m!1241025 () Bool)

(assert (=> b!1354680 m!1241025))

(assert (=> b!1354680 m!1241019))

(assert (=> b!1354680 m!1241021))

(declare-fun m!1241027 () Bool)

(assert (=> b!1354680 m!1241027))

(assert (=> b!1354690 m!1241019))

(assert (=> b!1354690 m!1241019))

(assert (=> b!1354690 m!1241021))

(declare-fun m!1241029 () Bool)

(assert (=> b!1354682 m!1241029))

(declare-fun m!1241031 () Bool)

(assert (=> b!1354687 m!1241031))

(declare-fun m!1241033 () Bool)

(assert (=> b!1354683 m!1241033))

(declare-fun m!1241035 () Bool)

(assert (=> b!1354684 m!1241035))

(declare-fun m!1241037 () Bool)

(assert (=> b!1354685 m!1241037))

(declare-fun m!1241039 () Bool)

(assert (=> start!114088 m!1241039))

(declare-fun m!1241041 () Bool)

(assert (=> b!1354686 m!1241041))

(declare-fun m!1241043 () Bool)

(assert (=> b!1354693 m!1241043))

(assert (=> b!1354691 m!1241019))

(assert (=> b!1354691 m!1241019))

(declare-fun m!1241045 () Bool)

(assert (=> b!1354691 m!1241045))

(check-sat (not b!1354683) (not b!1354696) (not b!1354680) (not b!1354685) (not b!1354684) (not b!1354681) (not start!114088) (not b!1354691) (not b!1354692) (not b!1354690) (not b!1354693) (not b!1354688) (not b!1354682) (not b!1354687) (not b!1354686))
(check-sat)
