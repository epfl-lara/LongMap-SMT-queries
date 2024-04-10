; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115796 () Bool)

(assert start!115796)

(declare-fun b!1369082 () Bool)

(declare-fun res!912563 () Bool)

(declare-fun e!775616 () Bool)

(assert (=> b!1369082 (=> (not res!912563) (not e!775616))))

(declare-datatypes ((List!31962 0))(
  ( (Nil!31959) (Cons!31958 (h!33167 (_ BitVec 64)) (t!46656 List!31962)) )
))
(declare-fun newAcc!98 () List!31962)

(declare-fun contains!9644 (List!31962 (_ BitVec 64)) Bool)

(assert (=> b!1369082 (= res!912563 (not (contains!9644 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!912565 () Bool)

(assert (=> start!115796 (=> (not res!912565) (not e!775616))))

(declare-datatypes ((array!92943 0))(
  ( (array!92944 (arr!44894 (Array (_ BitVec 32) (_ BitVec 64))) (size!45444 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92943)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115796 (= res!912565 (and (bvslt (size!45444 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45444 a!3861))))))

(assert (=> start!115796 e!775616))

(declare-fun array_inv!33922 (array!92943) Bool)

(assert (=> start!115796 (array_inv!33922 a!3861)))

(assert (=> start!115796 true))

(declare-fun b!1369083 () Bool)

(declare-fun res!912560 () Bool)

(assert (=> b!1369083 (=> (not res!912560) (not e!775616))))

(assert (=> b!1369083 (= res!912560 (not (contains!9644 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369084 () Bool)

(declare-fun res!912566 () Bool)

(assert (=> b!1369084 (=> (not res!912566) (not e!775616))))

(declare-fun acc!866 () List!31962)

(declare-fun subseq!1046 (List!31962 List!31962) Bool)

(assert (=> b!1369084 (= res!912566 (subseq!1046 newAcc!98 acc!866))))

(declare-fun b!1369085 () Bool)

(declare-fun res!912564 () Bool)

(declare-fun e!775618 () Bool)

(assert (=> b!1369085 (=> (not res!912564) (not e!775618))))

(assert (=> b!1369085 (= res!912564 (bvslt from!3239 (size!45444 a!3861)))))

(declare-fun b!1369086 () Bool)

(declare-fun res!912568 () Bool)

(assert (=> b!1369086 (=> (not res!912568) (not e!775616))))

(assert (=> b!1369086 (= res!912568 (not (contains!9644 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369087 () Bool)

(declare-fun res!912562 () Bool)

(assert (=> b!1369087 (=> (not res!912562) (not e!775616))))

(assert (=> b!1369087 (= res!912562 (not (contains!9644 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369088 () Bool)

(assert (=> b!1369088 (= e!775616 e!775618)))

(declare-fun res!912561 () Bool)

(assert (=> b!1369088 (=> (not res!912561) (not e!775618))))

(declare-fun arrayNoDuplicates!0 (array!92943 (_ BitVec 32) List!31962) Bool)

(assert (=> b!1369088 (= res!912561 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45225 0))(
  ( (Unit!45226) )
))
(declare-fun lt!602184 () Unit!45225)

(declare-fun noDuplicateSubseq!233 (List!31962 List!31962) Unit!45225)

(assert (=> b!1369088 (= lt!602184 (noDuplicateSubseq!233 newAcc!98 acc!866))))

(declare-fun b!1369089 () Bool)

(declare-fun res!912569 () Bool)

(assert (=> b!1369089 (=> (not res!912569) (not e!775618))))

(assert (=> b!1369089 (= res!912569 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1369090 () Bool)

(declare-fun res!912570 () Bool)

(assert (=> b!1369090 (=> (not res!912570) (not e!775616))))

(declare-fun noDuplicate!2501 (List!31962) Bool)

(assert (=> b!1369090 (= res!912570 (noDuplicate!2501 acc!866))))

(declare-fun b!1369091 () Bool)

(declare-fun res!912567 () Bool)

(assert (=> b!1369091 (=> (not res!912567) (not e!775618))))

(assert (=> b!1369091 (= res!912567 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1369092 () Bool)

(assert (=> b!1369092 (= e!775618 (not true))))

(declare-fun lt!602185 () Bool)

(assert (=> b!1369092 (= lt!602185 (noDuplicate!2501 newAcc!98))))

(assert (=> b!1369092 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) newAcc!98)))

(declare-fun lt!602183 () Unit!45225)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92943 List!31962 List!31962 (_ BitVec 32)) Unit!45225)

(assert (=> b!1369092 (= lt!602183 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 acc!866 newAcc!98 (bvadd #b00000000000000000000000000000001 from!3239)))))

(declare-fun b!1369093 () Bool)

(declare-fun res!912571 () Bool)

(assert (=> b!1369093 (=> (not res!912571) (not e!775618))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1369093 (= res!912571 (not (validKeyInArray!0 (select (arr!44894 a!3861) from!3239))))))

(assert (= (and start!115796 res!912565) b!1369090))

(assert (= (and b!1369090 res!912570) b!1369087))

(assert (= (and b!1369087 res!912562) b!1369086))

(assert (= (and b!1369086 res!912568) b!1369082))

(assert (= (and b!1369082 res!912563) b!1369083))

(assert (= (and b!1369083 res!912560) b!1369084))

(assert (= (and b!1369084 res!912566) b!1369088))

(assert (= (and b!1369088 res!912561) b!1369085))

(assert (= (and b!1369085 res!912564) b!1369093))

(assert (= (and b!1369093 res!912571) b!1369091))

(assert (= (and b!1369091 res!912567) b!1369089))

(assert (= (and b!1369089 res!912569) b!1369092))

(declare-fun m!1252921 () Bool)

(assert (=> b!1369082 m!1252921))

(declare-fun m!1252923 () Bool)

(assert (=> start!115796 m!1252923))

(declare-fun m!1252925 () Bool)

(assert (=> b!1369090 m!1252925))

(declare-fun m!1252927 () Bool)

(assert (=> b!1369084 m!1252927))

(declare-fun m!1252929 () Bool)

(assert (=> b!1369093 m!1252929))

(assert (=> b!1369093 m!1252929))

(declare-fun m!1252931 () Bool)

(assert (=> b!1369093 m!1252931))

(declare-fun m!1252933 () Bool)

(assert (=> b!1369087 m!1252933))

(declare-fun m!1252935 () Bool)

(assert (=> b!1369088 m!1252935))

(declare-fun m!1252937 () Bool)

(assert (=> b!1369088 m!1252937))

(declare-fun m!1252939 () Bool)

(assert (=> b!1369083 m!1252939))

(declare-fun m!1252941 () Bool)

(assert (=> b!1369089 m!1252941))

(declare-fun m!1252943 () Bool)

(assert (=> b!1369092 m!1252943))

(declare-fun m!1252945 () Bool)

(assert (=> b!1369092 m!1252945))

(declare-fun m!1252947 () Bool)

(assert (=> b!1369092 m!1252947))

(declare-fun m!1252949 () Bool)

(assert (=> b!1369086 m!1252949))

(push 1)

