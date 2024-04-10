; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113972 () Bool)

(assert start!113972)

(declare-fun b!1352162 () Bool)

(declare-datatypes ((Unit!44316 0))(
  ( (Unit!44317) )
))
(declare-fun e!768715 () Unit!44316)

(declare-fun Unit!44318 () Unit!44316)

(assert (=> b!1352162 (= e!768715 Unit!44318)))

(declare-fun b!1352163 () Bool)

(declare-fun res!897549 () Bool)

(declare-fun e!768716 () Bool)

(assert (=> b!1352163 (=> (not res!897549) (not e!768716))))

(declare-datatypes ((array!92154 0))(
  ( (array!92155 (arr!44525 (Array (_ BitVec 32) (_ BitVec 64))) (size!45075 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92154)

(declare-datatypes ((List!31566 0))(
  ( (Nil!31563) (Cons!31562 (h!32771 (_ BitVec 64)) (t!46224 List!31566)) )
))
(declare-fun arrayNoDuplicates!0 (array!92154 (_ BitVec 32) List!31566) Bool)

(assert (=> b!1352163 (= res!897549 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31563))))

(declare-fun b!1352164 () Bool)

(declare-fun res!897545 () Bool)

(assert (=> b!1352164 (=> (not res!897545) (not e!768716))))

(declare-fun acc!759 () List!31566)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1352164 (= res!897545 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1352165 () Bool)

(declare-fun res!897548 () Bool)

(assert (=> b!1352165 (=> (not res!897548) (not e!768716))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1352165 (= res!897548 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45075 a!3742))))))

(declare-fun res!897547 () Bool)

(assert (=> start!113972 (=> (not res!897547) (not e!768716))))

(assert (=> start!113972 (= res!897547 (and (bvslt (size!45075 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45075 a!3742))))))

(assert (=> start!113972 e!768716))

(assert (=> start!113972 true))

(declare-fun array_inv!33553 (array!92154) Bool)

(assert (=> start!113972 (array_inv!33553 a!3742)))

(declare-fun b!1352166 () Bool)

(declare-fun res!897550 () Bool)

(assert (=> b!1352166 (=> (not res!897550) (not e!768716))))

(declare-fun contains!9275 (List!31566 (_ BitVec 64)) Bool)

(assert (=> b!1352166 (= res!897550 (not (contains!9275 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352167 () Bool)

(declare-fun lt!597451 () Unit!44316)

(assert (=> b!1352167 (= e!768715 lt!597451)))

(declare-fun lt!597453 () Unit!44316)

(declare-fun lemmaListSubSeqRefl!0 (List!31566) Unit!44316)

(assert (=> b!1352167 (= lt!597453 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!695 (List!31566 List!31566) Bool)

(assert (=> b!1352167 (subseq!695 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92154 List!31566 List!31566 (_ BitVec 32)) Unit!44316)

(declare-fun $colon$colon!710 (List!31566 (_ BitVec 64)) List!31566)

(assert (=> b!1352167 (= lt!597451 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!710 acc!759 (select (arr!44525 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1352167 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1352168 () Bool)

(declare-fun res!897546 () Bool)

(assert (=> b!1352168 (=> (not res!897546) (not e!768716))))

(assert (=> b!1352168 (= res!897546 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45075 a!3742)))))

(declare-fun b!1352169 () Bool)

(declare-fun res!897544 () Bool)

(assert (=> b!1352169 (=> (not res!897544) (not e!768716))))

(assert (=> b!1352169 (= res!897544 (not (contains!9275 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352170 () Bool)

(declare-fun res!897552 () Bool)

(assert (=> b!1352170 (=> (not res!897552) (not e!768716))))

(declare-fun noDuplicate!2132 (List!31566) Bool)

(assert (=> b!1352170 (= res!897552 (noDuplicate!2132 acc!759))))

(declare-fun b!1352171 () Bool)

(declare-fun e!768718 () Bool)

(assert (=> b!1352171 (= e!768716 e!768718)))

(declare-fun res!897551 () Bool)

(assert (=> b!1352171 (=> (not res!897551) (not e!768718))))

(assert (=> b!1352171 (= res!897551 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!597452 () Unit!44316)

(assert (=> b!1352171 (= lt!597452 e!768715)))

(declare-fun c!126749 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1352171 (= c!126749 (validKeyInArray!0 (select (arr!44525 a!3742) from!3120)))))

(declare-fun b!1352172 () Bool)

(assert (=> b!1352172 (= e!768718 false)))

(declare-fun lt!597454 () Bool)

(assert (=> b!1352172 (= lt!597454 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1352173 () Bool)

(declare-fun res!897553 () Bool)

(assert (=> b!1352173 (=> (not res!897553) (not e!768716))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1352173 (= res!897553 (not (validKeyInArray!0 l!3587)))))

(assert (= (and start!113972 res!897547) b!1352170))

(assert (= (and b!1352170 res!897552) b!1352169))

(assert (= (and b!1352169 res!897544) b!1352166))

(assert (= (and b!1352166 res!897550) b!1352163))

(assert (= (and b!1352163 res!897549) b!1352164))

(assert (= (and b!1352164 res!897545) b!1352165))

(assert (= (and b!1352165 res!897548) b!1352173))

(assert (= (and b!1352173 res!897553) b!1352168))

(assert (= (and b!1352168 res!897546) b!1352171))

(assert (= (and b!1352171 c!126749) b!1352167))

(assert (= (and b!1352171 (not c!126749)) b!1352162))

(assert (= (and b!1352171 res!897551) b!1352172))

(declare-fun m!1239037 () Bool)

(assert (=> b!1352169 m!1239037))

(declare-fun m!1239039 () Bool)

(assert (=> b!1352171 m!1239039))

(assert (=> b!1352171 m!1239039))

(declare-fun m!1239041 () Bool)

(assert (=> b!1352171 m!1239041))

(declare-fun m!1239043 () Bool)

(assert (=> b!1352163 m!1239043))

(declare-fun m!1239045 () Bool)

(assert (=> start!113972 m!1239045))

(declare-fun m!1239047 () Bool)

(assert (=> b!1352173 m!1239047))

(declare-fun m!1239049 () Bool)

(assert (=> b!1352172 m!1239049))

(declare-fun m!1239051 () Bool)

(assert (=> b!1352170 m!1239051))

(declare-fun m!1239053 () Bool)

(assert (=> b!1352167 m!1239053))

(assert (=> b!1352167 m!1239039))

(declare-fun m!1239055 () Bool)

(assert (=> b!1352167 m!1239055))

(declare-fun m!1239057 () Bool)

(assert (=> b!1352167 m!1239057))

(assert (=> b!1352167 m!1239049))

(assert (=> b!1352167 m!1239039))

(assert (=> b!1352167 m!1239055))

(declare-fun m!1239059 () Bool)

(assert (=> b!1352167 m!1239059))

(declare-fun m!1239061 () Bool)

(assert (=> b!1352164 m!1239061))

(declare-fun m!1239063 () Bool)

(assert (=> b!1352166 m!1239063))

(push 1)

