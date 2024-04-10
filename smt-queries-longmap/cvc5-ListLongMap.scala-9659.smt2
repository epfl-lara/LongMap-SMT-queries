; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114092 () Bool)

(assert start!114092)

(declare-fun b!1354783 () Bool)

(declare-datatypes ((Unit!44496 0))(
  ( (Unit!44497) )
))
(declare-fun e!769538 () Unit!44496)

(declare-fun Unit!44498 () Unit!44496)

(assert (=> b!1354783 (= e!769538 Unit!44498)))

(declare-fun b!1354784 () Bool)

(declare-fun res!899813 () Bool)

(declare-fun e!769539 () Bool)

(assert (=> b!1354784 (=> (not res!899813) (not e!769539))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92274 0))(
  ( (array!92275 (arr!44585 (Array (_ BitVec 32) (_ BitVec 64))) (size!45135 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92274)

(assert (=> b!1354784 (= res!899813 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45135 a!3742))))))

(declare-fun b!1354785 () Bool)

(declare-fun e!769540 () Bool)

(declare-fun e!769537 () Bool)

(assert (=> b!1354785 (= e!769540 e!769537)))

(declare-fun res!899806 () Bool)

(assert (=> b!1354785 (=> (not res!899806) (not e!769537))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1354785 (= res!899806 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-datatypes ((List!31626 0))(
  ( (Nil!31623) (Cons!31622 (h!32831 (_ BitVec 64)) (t!46284 List!31626)) )
))
(declare-fun lt!598376 () List!31626)

(declare-fun acc!759 () List!31626)

(declare-fun $colon$colon!770 (List!31626 (_ BitVec 64)) List!31626)

(assert (=> b!1354785 (= lt!598376 ($colon$colon!770 acc!759 (select (arr!44585 a!3742) from!3120)))))

(declare-fun b!1354786 () Bool)

(declare-fun res!899812 () Bool)

(assert (=> b!1354786 (=> (not res!899812) (not e!769537))))

(declare-fun contains!9335 (List!31626 (_ BitVec 64)) Bool)

(assert (=> b!1354786 (= res!899812 (not (contains!9335 lt!598376 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354787 () Bool)

(declare-fun res!899811 () Bool)

(assert (=> b!1354787 (=> (not res!899811) (not e!769537))))

(assert (=> b!1354787 (= res!899811 (not (contains!9335 lt!598376 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354788 () Bool)

(declare-fun res!899805 () Bool)

(assert (=> b!1354788 (=> (not res!899805) (not e!769539))))

(assert (=> b!1354788 (= res!899805 (not (contains!9335 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354789 () Bool)

(assert (=> b!1354789 (= e!769539 e!769540)))

(declare-fun res!899816 () Bool)

(assert (=> b!1354789 (=> (not res!899816) (not e!769540))))

(declare-fun lt!598377 () Bool)

(assert (=> b!1354789 (= res!899816 (and (not (= from!3120 i!1404)) lt!598377))))

(declare-fun lt!598378 () Unit!44496)

(assert (=> b!1354789 (= lt!598378 e!769538)))

(declare-fun c!126929 () Bool)

(assert (=> b!1354789 (= c!126929 lt!598377)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1354789 (= lt!598377 (validKeyInArray!0 (select (arr!44585 a!3742) from!3120)))))

(declare-fun b!1354790 () Bool)

(declare-fun res!899808 () Bool)

(assert (=> b!1354790 (=> (not res!899808) (not e!769539))))

(declare-fun noDuplicate!2192 (List!31626) Bool)

(assert (=> b!1354790 (= res!899808 (noDuplicate!2192 acc!759))))

(declare-fun res!899804 () Bool)

(assert (=> start!114092 (=> (not res!899804) (not e!769539))))

(assert (=> start!114092 (= res!899804 (and (bvslt (size!45135 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45135 a!3742))))))

(assert (=> start!114092 e!769539))

(assert (=> start!114092 true))

(declare-fun array_inv!33613 (array!92274) Bool)

(assert (=> start!114092 (array_inv!33613 a!3742)))

(declare-fun b!1354782 () Bool)

(declare-fun res!899817 () Bool)

(assert (=> b!1354782 (=> (not res!899817) (not e!769537))))

(declare-fun arrayNoDuplicates!0 (array!92274 (_ BitVec 32) List!31626) Bool)

(assert (=> b!1354782 (= res!899817 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!598376))))

(declare-fun b!1354791 () Bool)

(assert (=> b!1354791 (= e!769537 (not true))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1354791 (arrayNoDuplicates!0 (array!92275 (store (arr!44585 a!3742) i!1404 l!3587) (size!45135 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) lt!598376)))

(declare-fun lt!598373 () Unit!44496)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92274 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31626) Unit!44496)

(assert (=> b!1354791 (= lt!598373 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) lt!598376))))

(declare-fun b!1354792 () Bool)

(declare-fun res!899815 () Bool)

(assert (=> b!1354792 (=> (not res!899815) (not e!769539))))

(assert (=> b!1354792 (= res!899815 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1354793 () Bool)

(declare-fun res!899809 () Bool)

(assert (=> b!1354793 (=> (not res!899809) (not e!769539))))

(assert (=> b!1354793 (= res!899809 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1354794 () Bool)

(declare-fun lt!598375 () Unit!44496)

(assert (=> b!1354794 (= e!769538 lt!598375)))

(declare-fun lt!598374 () Unit!44496)

(declare-fun lemmaListSubSeqRefl!0 (List!31626) Unit!44496)

(assert (=> b!1354794 (= lt!598374 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!755 (List!31626 List!31626) Bool)

(assert (=> b!1354794 (subseq!755 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92274 List!31626 List!31626 (_ BitVec 32)) Unit!44496)

(assert (=> b!1354794 (= lt!598375 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!770 acc!759 (select (arr!44585 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1354794 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1354795 () Bool)

(declare-fun res!899818 () Bool)

(assert (=> b!1354795 (=> (not res!899818) (not e!769537))))

(assert (=> b!1354795 (= res!899818 (noDuplicate!2192 lt!598376))))

(declare-fun b!1354796 () Bool)

(declare-fun res!899814 () Bool)

(assert (=> b!1354796 (=> (not res!899814) (not e!769539))))

(assert (=> b!1354796 (= res!899814 (not (contains!9335 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354797 () Bool)

(declare-fun res!899810 () Bool)

(assert (=> b!1354797 (=> (not res!899810) (not e!769539))))

(assert (=> b!1354797 (= res!899810 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31623))))

(declare-fun b!1354798 () Bool)

(declare-fun res!899807 () Bool)

(assert (=> b!1354798 (=> (not res!899807) (not e!769539))))

(assert (=> b!1354798 (= res!899807 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45135 a!3742)))))

(assert (= (and start!114092 res!899804) b!1354790))

(assert (= (and b!1354790 res!899808) b!1354788))

(assert (= (and b!1354788 res!899805) b!1354796))

(assert (= (and b!1354796 res!899814) b!1354797))

(assert (= (and b!1354797 res!899810) b!1354792))

(assert (= (and b!1354792 res!899815) b!1354784))

(assert (= (and b!1354784 res!899813) b!1354793))

(assert (= (and b!1354793 res!899809) b!1354798))

(assert (= (and b!1354798 res!899807) b!1354789))

(assert (= (and b!1354789 c!126929) b!1354794))

(assert (= (and b!1354789 (not c!126929)) b!1354783))

(assert (= (and b!1354789 res!899816) b!1354785))

(assert (= (and b!1354785 res!899806) b!1354795))

(assert (= (and b!1354795 res!899818) b!1354786))

(assert (= (and b!1354786 res!899812) b!1354787))

(assert (= (and b!1354787 res!899811) b!1354782))

(assert (= (and b!1354782 res!899817) b!1354791))

(declare-fun m!1241089 () Bool)

(assert (=> b!1354794 m!1241089))

(declare-fun m!1241091 () Bool)

(assert (=> b!1354794 m!1241091))

(declare-fun m!1241093 () Bool)

(assert (=> b!1354794 m!1241093))

(declare-fun m!1241095 () Bool)

(assert (=> b!1354794 m!1241095))

(declare-fun m!1241097 () Bool)

(assert (=> b!1354794 m!1241097))

(assert (=> b!1354794 m!1241091))

(assert (=> b!1354794 m!1241093))

(declare-fun m!1241099 () Bool)

(assert (=> b!1354794 m!1241099))

(assert (=> b!1354789 m!1241091))

(assert (=> b!1354789 m!1241091))

(declare-fun m!1241101 () Bool)

(assert (=> b!1354789 m!1241101))

(declare-fun m!1241103 () Bool)

(assert (=> b!1354795 m!1241103))

(assert (=> b!1354785 m!1241091))

(assert (=> b!1354785 m!1241091))

(assert (=> b!1354785 m!1241093))

(declare-fun m!1241105 () Bool)

(assert (=> start!114092 m!1241105))

(declare-fun m!1241107 () Bool)

(assert (=> b!1354782 m!1241107))

(declare-fun m!1241109 () Bool)

(assert (=> b!1354788 m!1241109))

(declare-fun m!1241111 () Bool)

(assert (=> b!1354786 m!1241111))

(declare-fun m!1241113 () Bool)

(assert (=> b!1354792 m!1241113))

(declare-fun m!1241115 () Bool)

(assert (=> b!1354793 m!1241115))

(declare-fun m!1241117 () Bool)

(assert (=> b!1354787 m!1241117))

(declare-fun m!1241119 () Bool)

(assert (=> b!1354796 m!1241119))

(declare-fun m!1241121 () Bool)

(assert (=> b!1354797 m!1241121))

(declare-fun m!1241123 () Bool)

(assert (=> b!1354791 m!1241123))

(declare-fun m!1241125 () Bool)

(assert (=> b!1354791 m!1241125))

(declare-fun m!1241127 () Bool)

(assert (=> b!1354791 m!1241127))

(declare-fun m!1241129 () Bool)

(assert (=> b!1354790 m!1241129))

(push 1)

