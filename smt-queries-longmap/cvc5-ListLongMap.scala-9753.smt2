; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115550 () Bool)

(assert start!115550)

(declare-fun b!1366779 () Bool)

(declare-fun res!910335 () Bool)

(declare-fun e!774658 () Bool)

(assert (=> b!1366779 (=> (not res!910335) (not e!774658))))

(declare-datatypes ((List!31908 0))(
  ( (Nil!31905) (Cons!31904 (h!33113 (_ BitVec 64)) (t!46602 List!31908)) )
))
(declare-fun newAcc!98 () List!31908)

(declare-fun contains!9590 (List!31908 (_ BitVec 64)) Bool)

(assert (=> b!1366779 (= res!910335 (not (contains!9590 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366781 () Bool)

(declare-fun res!910331 () Bool)

(declare-fun e!774656 () Bool)

(assert (=> b!1366781 (=> (not res!910331) (not e!774656))))

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((array!92826 0))(
  ( (array!92827 (arr!44840 (Array (_ BitVec 32) (_ BitVec 64))) (size!45390 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92826)

(assert (=> b!1366781 (= res!910331 (bvslt from!3239 (size!45390 a!3861)))))

(declare-fun b!1366782 () Bool)

(declare-fun res!910332 () Bool)

(assert (=> b!1366782 (=> (not res!910332) (not e!774658))))

(declare-fun acc!866 () List!31908)

(declare-fun noDuplicate!2447 (List!31908) Bool)

(assert (=> b!1366782 (= res!910332 (noDuplicate!2447 acc!866))))

(declare-fun b!1366783 () Bool)

(declare-fun res!910338 () Bool)

(assert (=> b!1366783 (=> (not res!910338) (not e!774658))))

(declare-fun subseq!992 (List!31908 List!31908) Bool)

(assert (=> b!1366783 (= res!910338 (subseq!992 newAcc!98 acc!866))))

(declare-fun b!1366784 () Bool)

(declare-fun res!910333 () Bool)

(assert (=> b!1366784 (=> (not res!910333) (not e!774658))))

(assert (=> b!1366784 (= res!910333 (not (contains!9590 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366785 () Bool)

(declare-fun res!910329 () Bool)

(assert (=> b!1366785 (=> (not res!910329) (not e!774656))))

(assert (=> b!1366785 (= res!910329 (not (contains!9590 acc!866 (select (arr!44840 a!3861) from!3239))))))

(declare-fun b!1366786 () Bool)

(assert (=> b!1366786 (= e!774656 (not true))))

(declare-datatypes ((Unit!45117 0))(
  ( (Unit!45118) )
))
(declare-fun lt!601676 () Unit!45117)

(declare-fun lt!601675 () List!31908)

(declare-fun lt!601674 () List!31908)

(declare-fun noDuplicateSubseq!179 (List!31908 List!31908) Unit!45117)

(assert (=> b!1366786 (= lt!601676 (noDuplicateSubseq!179 lt!601675 lt!601674))))

(declare-fun arrayNoDuplicates!0 (array!92826 (_ BitVec 32) List!31908) Bool)

(assert (=> b!1366786 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601675)))

(declare-fun lt!601677 () Unit!45117)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92826 List!31908 List!31908 (_ BitVec 32)) Unit!45117)

(assert (=> b!1366786 (= lt!601677 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 lt!601674 lt!601675 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (=> b!1366786 (= lt!601675 (Cons!31904 (select (arr!44840 a!3861) from!3239) newAcc!98))))

(assert (=> b!1366786 (= lt!601674 (Cons!31904 (select (arr!44840 a!3861) from!3239) acc!866))))

(declare-fun b!1366787 () Bool)

(declare-fun res!910337 () Bool)

(assert (=> b!1366787 (=> (not res!910337) (not e!774658))))

(assert (=> b!1366787 (= res!910337 (not (contains!9590 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366780 () Bool)

(declare-fun res!910339 () Bool)

(assert (=> b!1366780 (=> (not res!910339) (not e!774658))))

(assert (=> b!1366780 (= res!910339 (not (contains!9590 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!910334 () Bool)

(assert (=> start!115550 (=> (not res!910334) (not e!774658))))

(assert (=> start!115550 (= res!910334 (and (bvslt (size!45390 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45390 a!3861))))))

(assert (=> start!115550 e!774658))

(declare-fun array_inv!33868 (array!92826) Bool)

(assert (=> start!115550 (array_inv!33868 a!3861)))

(assert (=> start!115550 true))

(declare-fun b!1366788 () Bool)

(declare-fun res!910336 () Bool)

(assert (=> b!1366788 (=> (not res!910336) (not e!774656))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1366788 (= res!910336 (validKeyInArray!0 (select (arr!44840 a!3861) from!3239)))))

(declare-fun b!1366789 () Bool)

(assert (=> b!1366789 (= e!774658 e!774656)))

(declare-fun res!910330 () Bool)

(assert (=> b!1366789 (=> (not res!910330) (not e!774656))))

(assert (=> b!1366789 (= res!910330 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-fun lt!601678 () Unit!45117)

(assert (=> b!1366789 (= lt!601678 (noDuplicateSubseq!179 newAcc!98 acc!866))))

(assert (= (and start!115550 res!910334) b!1366782))

(assert (= (and b!1366782 res!910332) b!1366787))

(assert (= (and b!1366787 res!910337) b!1366784))

(assert (= (and b!1366784 res!910333) b!1366779))

(assert (= (and b!1366779 res!910335) b!1366780))

(assert (= (and b!1366780 res!910339) b!1366783))

(assert (= (and b!1366783 res!910338) b!1366789))

(assert (= (and b!1366789 res!910330) b!1366781))

(assert (= (and b!1366781 res!910331) b!1366788))

(assert (= (and b!1366788 res!910336) b!1366785))

(assert (= (and b!1366785 res!910329) b!1366786))

(declare-fun m!1251055 () Bool)

(assert (=> b!1366779 m!1251055))

(declare-fun m!1251057 () Bool)

(assert (=> b!1366784 m!1251057))

(declare-fun m!1251059 () Bool)

(assert (=> b!1366780 m!1251059))

(declare-fun m!1251061 () Bool)

(assert (=> b!1366783 m!1251061))

(declare-fun m!1251063 () Bool)

(assert (=> b!1366788 m!1251063))

(assert (=> b!1366788 m!1251063))

(declare-fun m!1251065 () Bool)

(assert (=> b!1366788 m!1251065))

(declare-fun m!1251067 () Bool)

(assert (=> b!1366786 m!1251067))

(declare-fun m!1251069 () Bool)

(assert (=> b!1366786 m!1251069))

(declare-fun m!1251071 () Bool)

(assert (=> b!1366786 m!1251071))

(assert (=> b!1366786 m!1251063))

(declare-fun m!1251073 () Bool)

(assert (=> b!1366789 m!1251073))

(declare-fun m!1251075 () Bool)

(assert (=> b!1366789 m!1251075))

(declare-fun m!1251077 () Bool)

(assert (=> b!1366782 m!1251077))

(assert (=> b!1366785 m!1251063))

(assert (=> b!1366785 m!1251063))

(declare-fun m!1251079 () Bool)

(assert (=> b!1366785 m!1251079))

(declare-fun m!1251081 () Bool)

(assert (=> b!1366787 m!1251081))

(declare-fun m!1251083 () Bool)

(assert (=> start!115550 m!1251083))

(push 1)

