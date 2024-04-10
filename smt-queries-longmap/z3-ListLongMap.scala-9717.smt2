; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114976 () Bool)

(assert start!114976)

(declare-fun b!1362804 () Bool)

(declare-fun res!906728 () Bool)

(declare-fun e!772983 () Bool)

(assert (=> b!1362804 (=> (not res!906728) (not e!772983))))

(declare-datatypes ((List!31801 0))(
  ( (Nil!31798) (Cons!31797 (h!33006 (_ BitVec 64)) (t!46489 List!31801)) )
))
(declare-fun acc!759 () List!31801)

(declare-fun noDuplicate!2367 (List!31801) Bool)

(assert (=> b!1362804 (= res!906728 (noDuplicate!2367 acc!759))))

(declare-fun b!1362805 () Bool)

(assert (=> b!1362805 (= e!772983 false)))

(declare-datatypes ((Unit!44940 0))(
  ( (Unit!44941) )
))
(declare-fun lt!600594 () Unit!44940)

(declare-fun e!772984 () Unit!44940)

(assert (=> b!1362805 (= lt!600594 e!772984)))

(declare-fun c!127478 () Bool)

(declare-datatypes ((array!92654 0))(
  ( (array!92655 (arr!44760 (Array (_ BitVec 32) (_ BitVec 64))) (size!45310 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92654)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1362805 (= c!127478 (validKeyInArray!0 (select (arr!44760 a!3742) from!3120)))))

(declare-fun b!1362806 () Bool)

(declare-fun res!906735 () Bool)

(assert (=> b!1362806 (=> (not res!906735) (not e!772983))))

(assert (=> b!1362806 (= res!906735 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45310 a!3742)))))

(declare-fun res!906731 () Bool)

(assert (=> start!114976 (=> (not res!906731) (not e!772983))))

(assert (=> start!114976 (= res!906731 (and (bvslt (size!45310 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45310 a!3742))))))

(assert (=> start!114976 e!772983))

(assert (=> start!114976 true))

(declare-fun array_inv!33788 (array!92654) Bool)

(assert (=> start!114976 (array_inv!33788 a!3742)))

(declare-fun b!1362807 () Bool)

(declare-fun res!906729 () Bool)

(assert (=> b!1362807 (=> (not res!906729) (not e!772983))))

(declare-fun arrayNoDuplicates!0 (array!92654 (_ BitVec 32) List!31801) Bool)

(assert (=> b!1362807 (= res!906729 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1362808 () Bool)

(declare-fun res!906734 () Bool)

(assert (=> b!1362808 (=> (not res!906734) (not e!772983))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1362808 (= res!906734 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1362809 () Bool)

(declare-fun res!906730 () Bool)

(assert (=> b!1362809 (=> (not res!906730) (not e!772983))))

(declare-fun contains!9510 (List!31801 (_ BitVec 64)) Bool)

(assert (=> b!1362809 (= res!906730 (not (contains!9510 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362810 () Bool)

(declare-fun lt!600593 () Unit!44940)

(assert (=> b!1362810 (= e!772984 lt!600593)))

(declare-fun lt!600595 () Unit!44940)

(declare-fun lemmaListSubSeqRefl!0 (List!31801) Unit!44940)

(assert (=> b!1362810 (= lt!600595 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!912 (List!31801 List!31801) Bool)

(assert (=> b!1362810 (subseq!912 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92654 List!31801 List!31801 (_ BitVec 32)) Unit!44940)

(declare-fun $colon$colon!915 (List!31801 (_ BitVec 64)) List!31801)

(assert (=> b!1362810 (= lt!600593 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!915 acc!759 (select (arr!44760 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1362810 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1362811 () Bool)

(declare-fun res!906732 () Bool)

(assert (=> b!1362811 (=> (not res!906732) (not e!772983))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1362811 (= res!906732 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45310 a!3742))))))

(declare-fun b!1362812 () Bool)

(declare-fun res!906733 () Bool)

(assert (=> b!1362812 (=> (not res!906733) (not e!772983))))

(assert (=> b!1362812 (= res!906733 (not (contains!9510 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362813 () Bool)

(declare-fun res!906736 () Bool)

(assert (=> b!1362813 (=> (not res!906736) (not e!772983))))

(assert (=> b!1362813 (= res!906736 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31798))))

(declare-fun b!1362814 () Bool)

(declare-fun Unit!44942 () Unit!44940)

(assert (=> b!1362814 (= e!772984 Unit!44942)))

(assert (= (and start!114976 res!906731) b!1362804))

(assert (= (and b!1362804 res!906728) b!1362812))

(assert (= (and b!1362812 res!906733) b!1362809))

(assert (= (and b!1362809 res!906730) b!1362813))

(assert (= (and b!1362813 res!906736) b!1362807))

(assert (= (and b!1362807 res!906729) b!1362811))

(assert (= (and b!1362811 res!906732) b!1362808))

(assert (= (and b!1362808 res!906734) b!1362806))

(assert (= (and b!1362806 res!906735) b!1362805))

(assert (= (and b!1362805 c!127478) b!1362810))

(assert (= (and b!1362805 (not c!127478)) b!1362814))

(declare-fun m!1247723 () Bool)

(assert (=> b!1362805 m!1247723))

(assert (=> b!1362805 m!1247723))

(declare-fun m!1247725 () Bool)

(assert (=> b!1362805 m!1247725))

(declare-fun m!1247727 () Bool)

(assert (=> b!1362807 m!1247727))

(declare-fun m!1247729 () Bool)

(assert (=> b!1362804 m!1247729))

(declare-fun m!1247731 () Bool)

(assert (=> b!1362810 m!1247731))

(assert (=> b!1362810 m!1247723))

(declare-fun m!1247733 () Bool)

(assert (=> b!1362810 m!1247733))

(declare-fun m!1247735 () Bool)

(assert (=> b!1362810 m!1247735))

(declare-fun m!1247737 () Bool)

(assert (=> b!1362810 m!1247737))

(assert (=> b!1362810 m!1247723))

(assert (=> b!1362810 m!1247733))

(declare-fun m!1247739 () Bool)

(assert (=> b!1362810 m!1247739))

(declare-fun m!1247741 () Bool)

(assert (=> b!1362813 m!1247741))

(declare-fun m!1247743 () Bool)

(assert (=> b!1362808 m!1247743))

(declare-fun m!1247745 () Bool)

(assert (=> b!1362809 m!1247745))

(declare-fun m!1247747 () Bool)

(assert (=> start!114976 m!1247747))

(declare-fun m!1247749 () Bool)

(assert (=> b!1362812 m!1247749))

(check-sat (not b!1362807) (not b!1362810) (not b!1362813) (not b!1362808) (not b!1362812) (not start!114976) (not b!1362809) (not b!1362805) (not b!1362804))
