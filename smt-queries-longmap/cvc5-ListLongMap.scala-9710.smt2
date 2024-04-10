; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114872 () Bool)

(assert start!114872)

(declare-fun res!905726 () Bool)

(declare-fun e!772497 () Bool)

(assert (=> start!114872 (=> (not res!905726) (not e!772497))))

(declare-datatypes ((array!92607 0))(
  ( (array!92608 (arr!44738 (Array (_ BitVec 32) (_ BitVec 64))) (size!45288 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92607)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114872 (= res!905726 (and (bvslt (size!45288 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45288 a!3742))))))

(assert (=> start!114872 e!772497))

(assert (=> start!114872 true))

(declare-fun array_inv!33766 (array!92607) Bool)

(assert (=> start!114872 (array_inv!33766 a!3742)))

(declare-fun b!1361611 () Bool)

(declare-fun res!905717 () Bool)

(declare-fun e!772498 () Bool)

(assert (=> b!1361611 (=> (not res!905717) (not e!772498))))

(declare-datatypes ((List!31779 0))(
  ( (Nil!31776) (Cons!31775 (h!32984 (_ BitVec 64)) (t!46464 List!31779)) )
))
(declare-fun lt!600214 () List!31779)

(declare-fun noDuplicate!2345 (List!31779) Bool)

(assert (=> b!1361611 (= res!905717 (noDuplicate!2345 lt!600214))))

(declare-fun b!1361612 () Bool)

(declare-fun res!905716 () Bool)

(assert (=> b!1361612 (=> (not res!905716) (not e!772497))))

(declare-fun acc!759 () List!31779)

(assert (=> b!1361612 (= res!905716 (noDuplicate!2345 acc!759))))

(declare-fun b!1361613 () Bool)

(declare-fun res!905721 () Bool)

(assert (=> b!1361613 (=> (not res!905721) (not e!772497))))

(declare-fun contains!9488 (List!31779 (_ BitVec 64)) Bool)

(assert (=> b!1361613 (= res!905721 (not (contains!9488 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361614 () Bool)

(declare-fun res!905724 () Bool)

(assert (=> b!1361614 (=> (not res!905724) (not e!772498))))

(assert (=> b!1361614 (= res!905724 (not (contains!9488 lt!600214 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361615 () Bool)

(declare-fun res!905720 () Bool)

(assert (=> b!1361615 (=> (not res!905720) (not e!772498))))

(assert (=> b!1361615 (= res!905720 (not (contains!9488 lt!600214 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361616 () Bool)

(declare-fun res!905723 () Bool)

(assert (=> b!1361616 (=> (not res!905723) (not e!772497))))

(assert (=> b!1361616 (= res!905723 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45288 a!3742)))))

(declare-fun b!1361617 () Bool)

(declare-fun res!905719 () Bool)

(assert (=> b!1361617 (=> (not res!905719) (not e!772497))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1361617 (= res!905719 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1361618 () Bool)

(declare-fun res!905715 () Bool)

(assert (=> b!1361618 (=> (not res!905715) (not e!772497))))

(declare-fun arrayNoDuplicates!0 (array!92607 (_ BitVec 32) List!31779) Bool)

(assert (=> b!1361618 (= res!905715 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31776))))

(declare-fun b!1361619 () Bool)

(assert (=> b!1361619 (= e!772498 false)))

(declare-fun lt!600217 () Bool)

(assert (=> b!1361619 (= lt!600217 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!600214))))

(declare-fun b!1361620 () Bool)

(declare-fun res!905725 () Bool)

(assert (=> b!1361620 (=> (not res!905725) (not e!772497))))

(assert (=> b!1361620 (= res!905725 (not (contains!9488 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361621 () Bool)

(declare-fun res!905718 () Bool)

(assert (=> b!1361621 (=> (not res!905718) (not e!772497))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1361621 (= res!905718 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45288 a!3742))))))

(declare-fun b!1361622 () Bool)

(declare-fun e!772501 () Bool)

(assert (=> b!1361622 (= e!772501 e!772498)))

(declare-fun res!905728 () Bool)

(assert (=> b!1361622 (=> (not res!905728) (not e!772498))))

(assert (=> b!1361622 (= res!905728 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!893 (List!31779 (_ BitVec 64)) List!31779)

(assert (=> b!1361622 (= lt!600214 ($colon$colon!893 acc!759 (select (arr!44738 a!3742) from!3120)))))

(declare-fun b!1361623 () Bool)

(declare-datatypes ((Unit!44874 0))(
  ( (Unit!44875) )
))
(declare-fun e!772500 () Unit!44874)

(declare-fun Unit!44876 () Unit!44874)

(assert (=> b!1361623 (= e!772500 Unit!44876)))

(declare-fun b!1361624 () Bool)

(assert (=> b!1361624 (= e!772497 e!772501)))

(declare-fun res!905722 () Bool)

(assert (=> b!1361624 (=> (not res!905722) (not e!772501))))

(declare-fun lt!600213 () Bool)

(assert (=> b!1361624 (= res!905722 (and (not (= from!3120 i!1404)) lt!600213))))

(declare-fun lt!600212 () Unit!44874)

(assert (=> b!1361624 (= lt!600212 e!772500)))

(declare-fun c!127388 () Bool)

(assert (=> b!1361624 (= c!127388 lt!600213)))

(assert (=> b!1361624 (= lt!600213 (validKeyInArray!0 (select (arr!44738 a!3742) from!3120)))))

(declare-fun b!1361625 () Bool)

(declare-fun res!905727 () Bool)

(assert (=> b!1361625 (=> (not res!905727) (not e!772497))))

(assert (=> b!1361625 (= res!905727 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1361626 () Bool)

(declare-fun lt!600215 () Unit!44874)

(assert (=> b!1361626 (= e!772500 lt!600215)))

(declare-fun lt!600216 () Unit!44874)

(declare-fun lemmaListSubSeqRefl!0 (List!31779) Unit!44874)

(assert (=> b!1361626 (= lt!600216 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!890 (List!31779 List!31779) Bool)

(assert (=> b!1361626 (subseq!890 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92607 List!31779 List!31779 (_ BitVec 32)) Unit!44874)

(assert (=> b!1361626 (= lt!600215 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!893 acc!759 (select (arr!44738 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1361626 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(assert (= (and start!114872 res!905726) b!1361612))

(assert (= (and b!1361612 res!905716) b!1361613))

(assert (= (and b!1361613 res!905721) b!1361620))

(assert (= (and b!1361620 res!905725) b!1361618))

(assert (= (and b!1361618 res!905715) b!1361625))

(assert (= (and b!1361625 res!905727) b!1361621))

(assert (= (and b!1361621 res!905718) b!1361617))

(assert (= (and b!1361617 res!905719) b!1361616))

(assert (= (and b!1361616 res!905723) b!1361624))

(assert (= (and b!1361624 c!127388) b!1361626))

(assert (= (and b!1361624 (not c!127388)) b!1361623))

(assert (= (and b!1361624 res!905722) b!1361622))

(assert (= (and b!1361622 res!905728) b!1361611))

(assert (= (and b!1361611 res!905717) b!1361614))

(assert (= (and b!1361614 res!905724) b!1361615))

(assert (= (and b!1361615 res!905720) b!1361619))

(declare-fun m!1246705 () Bool)

(assert (=> b!1361626 m!1246705))

(declare-fun m!1246707 () Bool)

(assert (=> b!1361626 m!1246707))

(declare-fun m!1246709 () Bool)

(assert (=> b!1361626 m!1246709))

(declare-fun m!1246711 () Bool)

(assert (=> b!1361626 m!1246711))

(declare-fun m!1246713 () Bool)

(assert (=> b!1361626 m!1246713))

(assert (=> b!1361626 m!1246707))

(assert (=> b!1361626 m!1246709))

(declare-fun m!1246715 () Bool)

(assert (=> b!1361626 m!1246715))

(declare-fun m!1246717 () Bool)

(assert (=> b!1361619 m!1246717))

(assert (=> b!1361622 m!1246707))

(assert (=> b!1361622 m!1246707))

(assert (=> b!1361622 m!1246709))

(declare-fun m!1246719 () Bool)

(assert (=> b!1361613 m!1246719))

(declare-fun m!1246721 () Bool)

(assert (=> b!1361614 m!1246721))

(declare-fun m!1246723 () Bool)

(assert (=> b!1361615 m!1246723))

(declare-fun m!1246725 () Bool)

(assert (=> b!1361625 m!1246725))

(declare-fun m!1246727 () Bool)

(assert (=> start!114872 m!1246727))

(declare-fun m!1246729 () Bool)

(assert (=> b!1361617 m!1246729))

(declare-fun m!1246731 () Bool)

(assert (=> b!1361620 m!1246731))

(declare-fun m!1246733 () Bool)

(assert (=> b!1361618 m!1246733))

(declare-fun m!1246735 () Bool)

(assert (=> b!1361611 m!1246735))

(assert (=> b!1361624 m!1246707))

(assert (=> b!1361624 m!1246707))

(declare-fun m!1246737 () Bool)

(assert (=> b!1361624 m!1246737))

(declare-fun m!1246739 () Bool)

(assert (=> b!1361612 m!1246739))

(push 1)

