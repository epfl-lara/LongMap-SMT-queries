; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114142 () Bool)

(assert start!114142)

(declare-fun b!1355762 () Bool)

(declare-fun res!900641 () Bool)

(declare-fun e!769853 () Bool)

(assert (=> b!1355762 (=> (not res!900641) (not e!769853))))

(declare-datatypes ((List!31651 0))(
  ( (Nil!31648) (Cons!31647 (h!32856 (_ BitVec 64)) (t!46309 List!31651)) )
))
(declare-fun acc!759 () List!31651)

(declare-fun contains!9360 (List!31651 (_ BitVec 64)) Bool)

(assert (=> b!1355762 (= res!900641 (not (contains!9360 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355763 () Bool)

(declare-fun res!900637 () Bool)

(assert (=> b!1355763 (=> (not res!900637) (not e!769853))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92324 0))(
  ( (array!92325 (arr!44610 (Array (_ BitVec 32) (_ BitVec 64))) (size!45160 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92324)

(assert (=> b!1355763 (= res!900637 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45160 a!3742))))))

(declare-fun res!900634 () Bool)

(assert (=> start!114142 (=> (not res!900634) (not e!769853))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114142 (= res!900634 (and (bvslt (size!45160 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45160 a!3742))))))

(assert (=> start!114142 e!769853))

(assert (=> start!114142 true))

(declare-fun array_inv!33638 (array!92324) Bool)

(assert (=> start!114142 (array_inv!33638 a!3742)))

(declare-fun b!1355764 () Bool)

(declare-datatypes ((Unit!44571 0))(
  ( (Unit!44572) )
))
(declare-fun e!769855 () Unit!44571)

(declare-fun lt!598768 () Unit!44571)

(assert (=> b!1355764 (= e!769855 lt!598768)))

(declare-fun lt!598764 () Unit!44571)

(declare-fun lemmaListSubSeqRefl!0 (List!31651) Unit!44571)

(assert (=> b!1355764 (= lt!598764 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!780 (List!31651 List!31651) Bool)

(assert (=> b!1355764 (subseq!780 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92324 List!31651 List!31651 (_ BitVec 32)) Unit!44571)

(declare-fun $colon$colon!795 (List!31651 (_ BitVec 64)) List!31651)

(assert (=> b!1355764 (= lt!598768 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!795 acc!759 (select (arr!44610 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92324 (_ BitVec 32) List!31651) Bool)

(assert (=> b!1355764 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1355765 () Bool)

(declare-fun res!900642 () Bool)

(assert (=> b!1355765 (=> (not res!900642) (not e!769853))))

(assert (=> b!1355765 (= res!900642 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31648))))

(declare-fun b!1355766 () Bool)

(declare-fun e!769854 () Bool)

(assert (=> b!1355766 (= e!769853 e!769854)))

(declare-fun res!900635 () Bool)

(assert (=> b!1355766 (=> (not res!900635) (not e!769854))))

(declare-fun lt!598766 () Bool)

(assert (=> b!1355766 (= res!900635 (and (not (= from!3120 i!1404)) (not lt!598766) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!598767 () Unit!44571)

(assert (=> b!1355766 (= lt!598767 e!769855)))

(declare-fun c!127004 () Bool)

(assert (=> b!1355766 (= c!127004 lt!598766)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1355766 (= lt!598766 (validKeyInArray!0 (select (arr!44610 a!3742) from!3120)))))

(declare-fun b!1355767 () Bool)

(declare-fun Unit!44573 () Unit!44571)

(assert (=> b!1355767 (= e!769855 Unit!44573)))

(declare-fun b!1355768 () Bool)

(declare-fun res!900640 () Bool)

(assert (=> b!1355768 (=> (not res!900640) (not e!769853))))

(assert (=> b!1355768 (= res!900640 (not (contains!9360 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355769 () Bool)

(declare-fun res!900643 () Bool)

(assert (=> b!1355769 (=> (not res!900643) (not e!769853))))

(assert (=> b!1355769 (= res!900643 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45160 a!3742)))))

(declare-fun b!1355770 () Bool)

(declare-fun res!900639 () Bool)

(assert (=> b!1355770 (=> (not res!900639) (not e!769853))))

(assert (=> b!1355770 (= res!900639 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1355771 () Bool)

(declare-fun res!900638 () Bool)

(assert (=> b!1355771 (=> (not res!900638) (not e!769853))))

(declare-fun noDuplicate!2217 (List!31651) Bool)

(assert (=> b!1355771 (= res!900638 (noDuplicate!2217 acc!759))))

(declare-fun b!1355772 () Bool)

(assert (=> b!1355772 (= e!769854 false)))

(declare-fun lt!598765 () Bool)

(assert (=> b!1355772 (= lt!598765 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1355773 () Bool)

(declare-fun res!900636 () Bool)

(assert (=> b!1355773 (=> (not res!900636) (not e!769853))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1355773 (= res!900636 (not (validKeyInArray!0 l!3587)))))

(assert (= (and start!114142 res!900634) b!1355771))

(assert (= (and b!1355771 res!900638) b!1355768))

(assert (= (and b!1355768 res!900640) b!1355762))

(assert (= (and b!1355762 res!900641) b!1355765))

(assert (= (and b!1355765 res!900642) b!1355770))

(assert (= (and b!1355770 res!900639) b!1355763))

(assert (= (and b!1355763 res!900637) b!1355773))

(assert (= (and b!1355773 res!900636) b!1355769))

(assert (= (and b!1355769 res!900643) b!1355766))

(assert (= (and b!1355766 c!127004) b!1355764))

(assert (= (and b!1355766 (not c!127004)) b!1355767))

(assert (= (and b!1355766 res!900635) b!1355772))

(declare-fun m!1241873 () Bool)

(assert (=> b!1355773 m!1241873))

(declare-fun m!1241875 () Bool)

(assert (=> b!1355764 m!1241875))

(declare-fun m!1241877 () Bool)

(assert (=> b!1355764 m!1241877))

(declare-fun m!1241879 () Bool)

(assert (=> b!1355764 m!1241879))

(declare-fun m!1241881 () Bool)

(assert (=> b!1355764 m!1241881))

(declare-fun m!1241883 () Bool)

(assert (=> b!1355764 m!1241883))

(assert (=> b!1355764 m!1241877))

(assert (=> b!1355764 m!1241879))

(declare-fun m!1241885 () Bool)

(assert (=> b!1355764 m!1241885))

(declare-fun m!1241887 () Bool)

(assert (=> b!1355771 m!1241887))

(declare-fun m!1241889 () Bool)

(assert (=> b!1355765 m!1241889))

(declare-fun m!1241891 () Bool)

(assert (=> b!1355762 m!1241891))

(declare-fun m!1241893 () Bool)

(assert (=> start!114142 m!1241893))

(declare-fun m!1241895 () Bool)

(assert (=> b!1355770 m!1241895))

(assert (=> b!1355772 m!1241883))

(declare-fun m!1241897 () Bool)

(assert (=> b!1355768 m!1241897))

(assert (=> b!1355766 m!1241877))

(assert (=> b!1355766 m!1241877))

(declare-fun m!1241899 () Bool)

(assert (=> b!1355766 m!1241899))

(check-sat (not b!1355771) (not b!1355768) (not start!114142) (not b!1355762) (not b!1355773) (not b!1355772) (not b!1355770) (not b!1355765) (not b!1355764) (not b!1355766))
(check-sat)
