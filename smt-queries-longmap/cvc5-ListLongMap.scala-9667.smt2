; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114140 () Bool)

(assert start!114140)

(declare-fun b!1355726 () Bool)

(declare-fun res!900607 () Bool)

(declare-fun e!769840 () Bool)

(assert (=> b!1355726 (=> (not res!900607) (not e!769840))))

(declare-datatypes ((List!31650 0))(
  ( (Nil!31647) (Cons!31646 (h!32855 (_ BitVec 64)) (t!46308 List!31650)) )
))
(declare-fun acc!759 () List!31650)

(declare-fun noDuplicate!2216 (List!31650) Bool)

(assert (=> b!1355726 (= res!900607 (noDuplicate!2216 acc!759))))

(declare-fun b!1355727 () Bool)

(declare-fun res!900612 () Bool)

(assert (=> b!1355727 (=> (not res!900612) (not e!769840))))

(declare-datatypes ((array!92322 0))(
  ( (array!92323 (arr!44609 (Array (_ BitVec 32) (_ BitVec 64))) (size!45159 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92322)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92322 (_ BitVec 32) List!31650) Bool)

(assert (=> b!1355727 (= res!900612 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1355728 () Bool)

(declare-fun res!900608 () Bool)

(assert (=> b!1355728 (=> (not res!900608) (not e!769840))))

(assert (=> b!1355728 (= res!900608 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45159 a!3742)))))

(declare-fun b!1355729 () Bool)

(declare-fun res!900613 () Bool)

(assert (=> b!1355729 (=> (not res!900613) (not e!769840))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1355729 (= res!900613 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45159 a!3742))))))

(declare-fun b!1355730 () Bool)

(declare-fun e!769841 () Bool)

(assert (=> b!1355730 (= e!769840 e!769841)))

(declare-fun res!900606 () Bool)

(assert (=> b!1355730 (=> (not res!900606) (not e!769841))))

(declare-fun lt!598750 () Bool)

(assert (=> b!1355730 (= res!900606 (and (not (= from!3120 i!1404)) (not lt!598750) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44568 0))(
  ( (Unit!44569) )
))
(declare-fun lt!598751 () Unit!44568)

(declare-fun e!769843 () Unit!44568)

(assert (=> b!1355730 (= lt!598751 e!769843)))

(declare-fun c!127001 () Bool)

(assert (=> b!1355730 (= c!127001 lt!598750)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1355730 (= lt!598750 (validKeyInArray!0 (select (arr!44609 a!3742) from!3120)))))

(declare-fun res!900610 () Bool)

(assert (=> start!114140 (=> (not res!900610) (not e!769840))))

(assert (=> start!114140 (= res!900610 (and (bvslt (size!45159 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45159 a!3742))))))

(assert (=> start!114140 e!769840))

(assert (=> start!114140 true))

(declare-fun array_inv!33637 (array!92322) Bool)

(assert (=> start!114140 (array_inv!33637 a!3742)))

(declare-fun b!1355731 () Bool)

(declare-fun res!900611 () Bool)

(assert (=> b!1355731 (=> (not res!900611) (not e!769840))))

(assert (=> b!1355731 (= res!900611 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31647))))

(declare-fun b!1355732 () Bool)

(declare-fun res!900604 () Bool)

(assert (=> b!1355732 (=> (not res!900604) (not e!769840))))

(declare-fun contains!9359 (List!31650 (_ BitVec 64)) Bool)

(assert (=> b!1355732 (= res!900604 (not (contains!9359 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355733 () Bool)

(assert (=> b!1355733 (= e!769841 false)))

(declare-fun lt!598749 () Bool)

(assert (=> b!1355733 (= lt!598749 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1355734 () Bool)

(declare-fun lt!598752 () Unit!44568)

(assert (=> b!1355734 (= e!769843 lt!598752)))

(declare-fun lt!598753 () Unit!44568)

(declare-fun lemmaListSubSeqRefl!0 (List!31650) Unit!44568)

(assert (=> b!1355734 (= lt!598753 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!779 (List!31650 List!31650) Bool)

(assert (=> b!1355734 (subseq!779 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92322 List!31650 List!31650 (_ BitVec 32)) Unit!44568)

(declare-fun $colon$colon!794 (List!31650 (_ BitVec 64)) List!31650)

(assert (=> b!1355734 (= lt!598752 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!794 acc!759 (select (arr!44609 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1355734 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1355735 () Bool)

(declare-fun res!900609 () Bool)

(assert (=> b!1355735 (=> (not res!900609) (not e!769840))))

(assert (=> b!1355735 (= res!900609 (not (contains!9359 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355736 () Bool)

(declare-fun Unit!44570 () Unit!44568)

(assert (=> b!1355736 (= e!769843 Unit!44570)))

(declare-fun b!1355737 () Bool)

(declare-fun res!900605 () Bool)

(assert (=> b!1355737 (=> (not res!900605) (not e!769840))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1355737 (= res!900605 (not (validKeyInArray!0 l!3587)))))

(assert (= (and start!114140 res!900610) b!1355726))

(assert (= (and b!1355726 res!900607) b!1355735))

(assert (= (and b!1355735 res!900609) b!1355732))

(assert (= (and b!1355732 res!900604) b!1355731))

(assert (= (and b!1355731 res!900611) b!1355727))

(assert (= (and b!1355727 res!900612) b!1355729))

(assert (= (and b!1355729 res!900613) b!1355737))

(assert (= (and b!1355737 res!900605) b!1355728))

(assert (= (and b!1355728 res!900608) b!1355730))

(assert (= (and b!1355730 c!127001) b!1355734))

(assert (= (and b!1355730 (not c!127001)) b!1355736))

(assert (= (and b!1355730 res!900606) b!1355733))

(declare-fun m!1241845 () Bool)

(assert (=> b!1355733 m!1241845))

(declare-fun m!1241847 () Bool)

(assert (=> b!1355732 m!1241847))

(declare-fun m!1241849 () Bool)

(assert (=> b!1355726 m!1241849))

(declare-fun m!1241851 () Bool)

(assert (=> b!1355731 m!1241851))

(declare-fun m!1241853 () Bool)

(assert (=> b!1355727 m!1241853))

(declare-fun m!1241855 () Bool)

(assert (=> b!1355734 m!1241855))

(declare-fun m!1241857 () Bool)

(assert (=> b!1355734 m!1241857))

(declare-fun m!1241859 () Bool)

(assert (=> b!1355734 m!1241859))

(declare-fun m!1241861 () Bool)

(assert (=> b!1355734 m!1241861))

(assert (=> b!1355734 m!1241845))

(assert (=> b!1355734 m!1241857))

(assert (=> b!1355734 m!1241859))

(declare-fun m!1241863 () Bool)

(assert (=> b!1355734 m!1241863))

(declare-fun m!1241865 () Bool)

(assert (=> b!1355737 m!1241865))

(declare-fun m!1241867 () Bool)

(assert (=> b!1355735 m!1241867))

(declare-fun m!1241869 () Bool)

(assert (=> start!114140 m!1241869))

(assert (=> b!1355730 m!1241857))

(assert (=> b!1355730 m!1241857))

(declare-fun m!1241871 () Bool)

(assert (=> b!1355730 m!1241871))

(push 1)

