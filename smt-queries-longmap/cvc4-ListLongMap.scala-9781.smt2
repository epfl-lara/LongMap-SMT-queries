; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115896 () Bool)

(assert start!115896)

(declare-datatypes ((array!93010 0))(
  ( (array!93011 (arr!44926 (Array (_ BitVec 32) (_ BitVec 64))) (size!45476 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93010)

(declare-fun e!776010 () Bool)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun b!1370105 () Bool)

(declare-datatypes ((List!31994 0))(
  ( (Nil!31991) (Cons!31990 (h!33199 (_ BitVec 64)) (t!46688 List!31994)) )
))
(declare-fun acc!866 () List!31994)

(declare-fun noDuplicate!2533 (List!31994) Bool)

(assert (=> b!1370105 (= e!776010 (not (noDuplicate!2533 (Cons!31990 (select (arr!44926 a!3861) from!3239) acc!866))))))

(declare-fun res!913569 () Bool)

(declare-fun e!776011 () Bool)

(assert (=> start!115896 (=> (not res!913569) (not e!776011))))

(assert (=> start!115896 (= res!913569 (and (bvslt (size!45476 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45476 a!3861))))))

(assert (=> start!115896 e!776011))

(declare-fun array_inv!33954 (array!93010) Bool)

(assert (=> start!115896 (array_inv!33954 a!3861)))

(assert (=> start!115896 true))

(declare-fun b!1370106 () Bool)

(declare-fun res!913572 () Bool)

(assert (=> b!1370106 (=> (not res!913572) (not e!776010))))

(assert (=> b!1370106 (= res!913572 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1370107 () Bool)

(declare-fun res!913565 () Bool)

(assert (=> b!1370107 (=> (not res!913565) (not e!776010))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1370107 (= res!913565 (validKeyInArray!0 (select (arr!44926 a!3861) from!3239)))))

(declare-fun b!1370108 () Bool)

(declare-fun res!913573 () Bool)

(assert (=> b!1370108 (=> (not res!913573) (not e!776011))))

(declare-fun contains!9676 (List!31994 (_ BitVec 64)) Bool)

(assert (=> b!1370108 (= res!913573 (not (contains!9676 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370109 () Bool)

(declare-fun res!913574 () Bool)

(assert (=> b!1370109 (=> (not res!913574) (not e!776011))))

(declare-fun newAcc!98 () List!31994)

(declare-fun subseq!1078 (List!31994 List!31994) Bool)

(assert (=> b!1370109 (= res!913574 (subseq!1078 newAcc!98 acc!866))))

(declare-fun b!1370110 () Bool)

(declare-fun res!913575 () Bool)

(assert (=> b!1370110 (=> (not res!913575) (not e!776011))))

(assert (=> b!1370110 (= res!913575 (noDuplicate!2533 acc!866))))

(declare-fun b!1370111 () Bool)

(declare-fun res!913567 () Bool)

(assert (=> b!1370111 (=> (not res!913567) (not e!776011))))

(assert (=> b!1370111 (= res!913567 (not (contains!9676 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370112 () Bool)

(declare-fun res!913566 () Bool)

(assert (=> b!1370112 (=> (not res!913566) (not e!776010))))

(assert (=> b!1370112 (= res!913566 (bvslt from!3239 (size!45476 a!3861)))))

(declare-fun b!1370113 () Bool)

(assert (=> b!1370113 (= e!776011 e!776010)))

(declare-fun res!913568 () Bool)

(assert (=> b!1370113 (=> (not res!913568) (not e!776010))))

(declare-fun arrayNoDuplicates!0 (array!93010 (_ BitVec 32) List!31994) Bool)

(assert (=> b!1370113 (= res!913568 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45289 0))(
  ( (Unit!45290) )
))
(declare-fun lt!602383 () Unit!45289)

(declare-fun noDuplicateSubseq!265 (List!31994 List!31994) Unit!45289)

(assert (=> b!1370113 (= lt!602383 (noDuplicateSubseq!265 newAcc!98 acc!866))))

(declare-fun b!1370114 () Bool)

(declare-fun res!913576 () Bool)

(assert (=> b!1370114 (=> (not res!913576) (not e!776011))))

(assert (=> b!1370114 (= res!913576 (not (contains!9676 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370115 () Bool)

(declare-fun res!913570 () Bool)

(assert (=> b!1370115 (=> (not res!913570) (not e!776010))))

(assert (=> b!1370115 (= res!913570 (not (contains!9676 acc!866 (select (arr!44926 a!3861) from!3239))))))

(declare-fun b!1370116 () Bool)

(declare-fun res!913571 () Bool)

(assert (=> b!1370116 (=> (not res!913571) (not e!776011))))

(assert (=> b!1370116 (= res!913571 (not (contains!9676 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115896 res!913569) b!1370110))

(assert (= (and b!1370110 res!913575) b!1370108))

(assert (= (and b!1370108 res!913573) b!1370114))

(assert (= (and b!1370114 res!913576) b!1370116))

(assert (= (and b!1370116 res!913571) b!1370111))

(assert (= (and b!1370111 res!913567) b!1370109))

(assert (= (and b!1370109 res!913574) b!1370113))

(assert (= (and b!1370113 res!913568) b!1370112))

(assert (= (and b!1370112 res!913566) b!1370107))

(assert (= (and b!1370107 res!913565) b!1370115))

(assert (= (and b!1370115 res!913570) b!1370106))

(assert (= (and b!1370106 res!913572) b!1370105))

(declare-fun m!1253741 () Bool)

(assert (=> b!1370108 m!1253741))

(declare-fun m!1253743 () Bool)

(assert (=> start!115896 m!1253743))

(declare-fun m!1253745 () Bool)

(assert (=> b!1370116 m!1253745))

(declare-fun m!1253747 () Bool)

(assert (=> b!1370115 m!1253747))

(assert (=> b!1370115 m!1253747))

(declare-fun m!1253749 () Bool)

(assert (=> b!1370115 m!1253749))

(declare-fun m!1253751 () Bool)

(assert (=> b!1370114 m!1253751))

(declare-fun m!1253753 () Bool)

(assert (=> b!1370111 m!1253753))

(assert (=> b!1370107 m!1253747))

(assert (=> b!1370107 m!1253747))

(declare-fun m!1253755 () Bool)

(assert (=> b!1370107 m!1253755))

(declare-fun m!1253757 () Bool)

(assert (=> b!1370110 m!1253757))

(declare-fun m!1253759 () Bool)

(assert (=> b!1370109 m!1253759))

(declare-fun m!1253761 () Bool)

(assert (=> b!1370113 m!1253761))

(declare-fun m!1253763 () Bool)

(assert (=> b!1370113 m!1253763))

(assert (=> b!1370105 m!1253747))

(declare-fun m!1253765 () Bool)

(assert (=> b!1370105 m!1253765))

(push 1)

(assert (not b!1370110))

(assert (not b!1370114))

(assert (not b!1370109))

(assert (not b!1370107))

(assert (not b!1370115))

(assert (not b!1370108))

(assert (not b!1370113))

(assert (not start!115896))

(assert (not b!1370105))

(assert (not b!1370111))

(assert (not b!1370116))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!147101 () Bool)

(assert (=> d!147101 (= (validKeyInArray!0 (select (arr!44926 a!3861) from!3239)) (and (not (= (select (arr!44926 a!3861) from!3239) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44926 a!3861) from!3239) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1370107 d!147101))

(declare-fun d!147107 () Bool)

(assert (=> d!147107 (= (array_inv!33954 a!3861) (bvsge (size!45476 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!115896 d!147107))

(declare-fun d!147109 () Bool)

(declare-fun lt!602392 () Bool)

(declare-fun content!727 (List!31994) (Set (_ BitVec 64)))

(assert (=> d!147109 (= lt!602392 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!727 newAcc!98)))))

(declare-fun e!776067 () Bool)

(assert (=> d!147109 (= lt!602392 e!776067)))

(declare-fun res!913630 () Bool)

(assert (=> d!147109 (=> (not res!913630) (not e!776067))))

(assert (=> d!147109 (= res!913630 (is-Cons!31990 newAcc!98))))

(assert (=> d!147109 (= (contains!9676 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602392)))

(declare-fun b!1370171 () Bool)

(declare-fun e!776066 () Bool)

(assert (=> b!1370171 (= e!776067 e!776066)))

(declare-fun res!913629 () Bool)

(assert (=> b!1370171 (=> res!913629 e!776066)))

(assert (=> b!1370171 (= res!913629 (= (h!33199 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370172 () Bool)

(assert (=> b!1370172 (= e!776066 (contains!9676 (t!46688 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147109 res!913630) b!1370171))

(assert (= (and b!1370171 (not res!913629)) b!1370172))

(declare-fun m!1253803 () Bool)

(assert (=> d!147109 m!1253803))

(declare-fun m!1253805 () Bool)

(assert (=> d!147109 m!1253805))

(declare-fun m!1253807 () Bool)

(assert (=> b!1370172 m!1253807))

(assert (=> b!1370111 d!147109))

(declare-fun d!147113 () Bool)

(declare-fun lt!602393 () Bool)

(assert (=> d!147113 (= lt!602393 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!727 newAcc!98)))))

(declare-fun e!776073 () Bool)

(assert (=> d!147113 (= lt!602393 e!776073)))

(declare-fun res!913634 () Bool)

(assert (=> d!147113 (=> (not res!913634) (not e!776073))))

(assert (=> d!147113 (= res!913634 (is-Cons!31990 newAcc!98))))

(assert (=> d!147113 (= (contains!9676 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602393)))

(declare-fun b!1370181 () Bool)

(declare-fun e!776072 () Bool)

(assert (=> b!1370181 (= e!776073 e!776072)))

(declare-fun res!913633 () Bool)

(assert (=> b!1370181 (=> res!913633 e!776072)))

(assert (=> b!1370181 (= res!913633 (= (h!33199 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370182 () Bool)

(assert (=> b!1370182 (= e!776072 (contains!9676 (t!46688 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147113 res!913634) b!1370181))

(assert (= (and b!1370181 (not res!913633)) b!1370182))

(assert (=> d!147113 m!1253803))

(declare-fun m!1253809 () Bool)

(assert (=> d!147113 m!1253809))

(declare-fun m!1253811 () Bool)

(assert (=> b!1370182 m!1253811))

(assert (=> b!1370116 d!147113))

(declare-fun d!147115 () Bool)

(declare-fun res!913645 () Bool)

(declare-fun e!776084 () Bool)

(assert (=> d!147115 (=> res!913645 e!776084)))

(assert (=> d!147115 (= res!913645 (is-Nil!31991 (Cons!31990 (select (arr!44926 a!3861) from!3239) acc!866)))))

(assert (=> d!147115 (= (noDuplicate!2533 (Cons!31990 (select (arr!44926 a!3861) from!3239) acc!866)) e!776084)))

(declare-fun b!1370196 () Bool)

(declare-fun e!776087 () Bool)

(assert (=> b!1370196 (= e!776084 e!776087)))

(declare-fun res!913646 () Bool)

(assert (=> b!1370196 (=> (not res!913646) (not e!776087))))

(assert (=> b!1370196 (= res!913646 (not (contains!9676 (t!46688 (Cons!31990 (select (arr!44926 a!3861) from!3239) acc!866)) (h!33199 (Cons!31990 (select (arr!44926 a!3861) from!3239) acc!866)))))))

(declare-fun b!1370197 () Bool)

(assert (=> b!1370197 (= e!776087 (noDuplicate!2533 (t!46688 (Cons!31990 (select (arr!44926 a!3861) from!3239) acc!866))))))

(assert (= (and d!147115 (not res!913645)) b!1370196))

(assert (= (and b!1370196 res!913646) b!1370197))

(declare-fun m!1253815 () Bool)

(assert (=> b!1370196 m!1253815))

(declare-fun m!1253817 () Bool)

(assert (=> b!1370197 m!1253817))

(assert (=> b!1370105 d!147115))

(declare-fun d!147119 () Bool)

(declare-fun res!913649 () Bool)

(declare-fun e!776090 () Bool)

(assert (=> d!147119 (=> res!913649 e!776090)))

(assert (=> d!147119 (= res!913649 (is-Nil!31991 acc!866))))

(assert (=> d!147119 (= (noDuplicate!2533 acc!866) e!776090)))

(declare-fun b!1370201 () Bool)

(declare-fun e!776091 () Bool)

(assert (=> b!1370201 (= e!776090 e!776091)))

(declare-fun res!913650 () Bool)

(assert (=> b!1370201 (=> (not res!913650) (not e!776091))))

(assert (=> b!1370201 (= res!913650 (not (contains!9676 (t!46688 acc!866) (h!33199 acc!866))))))

(declare-fun b!1370202 () Bool)

(assert (=> b!1370202 (= e!776091 (noDuplicate!2533 (t!46688 acc!866)))))

(assert (= (and d!147119 (not res!913649)) b!1370201))

(assert (= (and b!1370201 res!913650) b!1370202))

(declare-fun m!1253819 () Bool)

(assert (=> b!1370201 m!1253819))

(declare-fun m!1253821 () Bool)

(assert (=> b!1370202 m!1253821))

(assert (=> b!1370110 d!147119))

(declare-fun lt!602396 () Bool)

(declare-fun d!147121 () Bool)

(assert (=> d!147121 (= lt!602396 (member (select (arr!44926 a!3861) from!3239) (content!727 acc!866)))))

(declare-fun e!776093 () Bool)

(assert (=> d!147121 (= lt!602396 e!776093)))

(declare-fun res!913652 () Bool)

(assert (=> d!147121 (=> (not res!913652) (not e!776093))))

(assert (=> d!147121 (= res!913652 (is-Cons!31990 acc!866))))

