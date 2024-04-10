; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113918 () Bool)

(assert start!113918)

(declare-fun b!1351061 () Bool)

(declare-fun res!896530 () Bool)

(declare-fun e!768435 () Bool)

(assert (=> b!1351061 (=> res!896530 e!768435)))

(declare-datatypes ((List!31539 0))(
  ( (Nil!31536) (Cons!31535 (h!32744 (_ BitVec 64)) (t!46197 List!31539)) )
))
(declare-fun lt!597129 () List!31539)

(declare-fun noDuplicate!2105 (List!31539) Bool)

(assert (=> b!1351061 (= res!896530 (not (noDuplicate!2105 lt!597129)))))

(declare-fun b!1351062 () Bool)

(declare-fun res!896521 () Bool)

(assert (=> b!1351062 (=> res!896521 e!768435)))

(declare-fun acc!759 () List!31539)

(declare-fun subseq!668 (List!31539 List!31539) Bool)

(assert (=> b!1351062 (= res!896521 (not (subseq!668 acc!759 lt!597129)))))

(declare-fun res!896524 () Bool)

(declare-fun e!768434 () Bool)

(assert (=> start!113918 (=> (not res!896524) (not e!768434))))

(declare-datatypes ((array!92100 0))(
  ( (array!92101 (arr!44498 (Array (_ BitVec 32) (_ BitVec 64))) (size!45048 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92100)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!113918 (= res!896524 (and (bvslt (size!45048 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45048 a!3742))))))

(assert (=> start!113918 e!768434))

(assert (=> start!113918 true))

(declare-fun array_inv!33526 (array!92100) Bool)

(assert (=> start!113918 (array_inv!33526 a!3742)))

(declare-fun b!1351063 () Bool)

(declare-fun res!896523 () Bool)

(assert (=> b!1351063 (=> (not res!896523) (not e!768434))))

(assert (=> b!1351063 (= res!896523 (noDuplicate!2105 acc!759))))

(declare-fun b!1351064 () Bool)

(assert (=> b!1351064 (= e!768435 true)))

(declare-fun lt!597128 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92100 (_ BitVec 32) List!31539) Bool)

(assert (=> b!1351064 (= lt!597128 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597129))))

(declare-datatypes ((Unit!44250 0))(
  ( (Unit!44251) )
))
(declare-fun lt!597130 () Unit!44250)

(declare-fun noDuplicateSubseq!119 (List!31539 List!31539) Unit!44250)

(assert (=> b!1351064 (= lt!597130 (noDuplicateSubseq!119 acc!759 lt!597129))))

(declare-fun b!1351065 () Bool)

(declare-fun res!896533 () Bool)

(assert (=> b!1351065 (=> (not res!896533) (not e!768434))))

(declare-fun contains!9248 (List!31539 (_ BitVec 64)) Bool)

(assert (=> b!1351065 (= res!896533 (not (contains!9248 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351066 () Bool)

(declare-fun res!896532 () Bool)

(assert (=> b!1351066 (=> (not res!896532) (not e!768434))))

(assert (=> b!1351066 (= res!896532 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1351067 () Bool)

(declare-fun res!896531 () Bool)

(assert (=> b!1351067 (=> (not res!896531) (not e!768434))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1351067 (= res!896531 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45048 a!3742))))))

(declare-fun b!1351068 () Bool)

(declare-fun res!896525 () Bool)

(assert (=> b!1351068 (=> res!896525 e!768435)))

(assert (=> b!1351068 (= res!896525 (contains!9248 lt!597129 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351069 () Bool)

(declare-fun res!896522 () Bool)

(assert (=> b!1351069 (=> (not res!896522) (not e!768434))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1351069 (= res!896522 (validKeyInArray!0 (select (arr!44498 a!3742) from!3120)))))

(declare-fun b!1351070 () Bool)

(declare-fun res!896528 () Bool)

(assert (=> b!1351070 (=> res!896528 e!768435)))

(assert (=> b!1351070 (= res!896528 (contains!9248 lt!597129 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351071 () Bool)

(assert (=> b!1351071 (= e!768434 (not e!768435))))

(declare-fun res!896526 () Bool)

(assert (=> b!1351071 (=> res!896526 e!768435)))

(assert (=> b!1351071 (= res!896526 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!683 (List!31539 (_ BitVec 64)) List!31539)

(assert (=> b!1351071 (= lt!597129 ($colon$colon!683 acc!759 (select (arr!44498 a!3742) from!3120)))))

(assert (=> b!1351071 (subseq!668 acc!759 acc!759)))

(declare-fun lt!597127 () Unit!44250)

(declare-fun lemmaListSubSeqRefl!0 (List!31539) Unit!44250)

(assert (=> b!1351071 (= lt!597127 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1351072 () Bool)

(declare-fun res!896520 () Bool)

(assert (=> b!1351072 (=> (not res!896520) (not e!768434))))

(assert (=> b!1351072 (= res!896520 (not (contains!9248 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351073 () Bool)

(declare-fun res!896527 () Bool)

(assert (=> b!1351073 (=> (not res!896527) (not e!768434))))

(assert (=> b!1351073 (= res!896527 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45048 a!3742)))))

(declare-fun b!1351074 () Bool)

(declare-fun res!896529 () Bool)

(assert (=> b!1351074 (=> (not res!896529) (not e!768434))))

(assert (=> b!1351074 (= res!896529 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31536))))

(declare-fun b!1351075 () Bool)

(declare-fun res!896519 () Bool)

(assert (=> b!1351075 (=> (not res!896519) (not e!768434))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1351075 (= res!896519 (not (validKeyInArray!0 l!3587)))))

(assert (= (and start!113918 res!896524) b!1351063))

(assert (= (and b!1351063 res!896523) b!1351072))

(assert (= (and b!1351072 res!896520) b!1351065))

(assert (= (and b!1351065 res!896533) b!1351074))

(assert (= (and b!1351074 res!896529) b!1351066))

(assert (= (and b!1351066 res!896532) b!1351067))

(assert (= (and b!1351067 res!896531) b!1351075))

(assert (= (and b!1351075 res!896519) b!1351073))

(assert (= (and b!1351073 res!896527) b!1351069))

(assert (= (and b!1351069 res!896522) b!1351071))

(assert (= (and b!1351071 (not res!896526)) b!1351061))

(assert (= (and b!1351061 (not res!896530)) b!1351068))

(assert (= (and b!1351068 (not res!896525)) b!1351070))

(assert (= (and b!1351070 (not res!896528)) b!1351062))

(assert (= (and b!1351062 (not res!896521)) b!1351064))

(declare-fun m!1238161 () Bool)

(assert (=> b!1351069 m!1238161))

(assert (=> b!1351069 m!1238161))

(declare-fun m!1238163 () Bool)

(assert (=> b!1351069 m!1238163))

(assert (=> b!1351071 m!1238161))

(assert (=> b!1351071 m!1238161))

(declare-fun m!1238165 () Bool)

(assert (=> b!1351071 m!1238165))

(declare-fun m!1238167 () Bool)

(assert (=> b!1351071 m!1238167))

(declare-fun m!1238169 () Bool)

(assert (=> b!1351071 m!1238169))

(declare-fun m!1238171 () Bool)

(assert (=> b!1351064 m!1238171))

(declare-fun m!1238173 () Bool)

(assert (=> b!1351064 m!1238173))

(declare-fun m!1238175 () Bool)

(assert (=> b!1351070 m!1238175))

(declare-fun m!1238177 () Bool)

(assert (=> b!1351075 m!1238177))

(declare-fun m!1238179 () Bool)

(assert (=> b!1351061 m!1238179))

(declare-fun m!1238181 () Bool)

(assert (=> start!113918 m!1238181))

(declare-fun m!1238183 () Bool)

(assert (=> b!1351063 m!1238183))

(declare-fun m!1238185 () Bool)

(assert (=> b!1351062 m!1238185))

(declare-fun m!1238187 () Bool)

(assert (=> b!1351074 m!1238187))

(declare-fun m!1238189 () Bool)

(assert (=> b!1351065 m!1238189))

(declare-fun m!1238191 () Bool)

(assert (=> b!1351068 m!1238191))

(declare-fun m!1238193 () Bool)

(assert (=> b!1351072 m!1238193))

(declare-fun m!1238195 () Bool)

(assert (=> b!1351066 m!1238195))

(push 1)

(assert (not b!1351064))

(assert (not b!1351072))

(assert (not b!1351070))

(assert (not b!1351062))

(assert (not b!1351061))

(assert (not b!1351066))

(assert (not start!113918))

(assert (not b!1351063))

(assert (not b!1351071))

(assert (not b!1351069))

(assert (not b!1351074))

(assert (not b!1351068))

(assert (not b!1351065))

(assert (not b!1351075))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

