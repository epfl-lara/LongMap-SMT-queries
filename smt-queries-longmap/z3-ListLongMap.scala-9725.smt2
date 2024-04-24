; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115300 () Bool)

(assert start!115300)

(declare-fun b!1365065 () Bool)

(declare-fun res!908047 () Bool)

(declare-fun e!774208 () Bool)

(assert (=> b!1365065 (=> (not res!908047) (not e!774208))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92818 0))(
  ( (array!92819 (arr!44836 (Array (_ BitVec 32) (_ BitVec 64))) (size!45387 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92818)

(assert (=> b!1365065 (= res!908047 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45387 a!3742)))))

(declare-fun b!1365066 () Bool)

(declare-fun e!774210 () Bool)

(assert (=> b!1365066 (= e!774210 (not true))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-datatypes ((List!31864 0))(
  ( (Nil!31861) (Cons!31860 (h!33078 (_ BitVec 64)) (t!46547 List!31864)) )
))
(declare-fun acc!759 () List!31864)

(declare-fun i!1404 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92818 (_ BitVec 32) List!31864) Bool)

(assert (=> b!1365066 (arrayNoDuplicates!0 (array!92819 (store (arr!44836 a!3742) i!1404 l!3587) (size!45387 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-datatypes ((Unit!44948 0))(
  ( (Unit!44949) )
))
(declare-fun lt!601367 () Unit!44948)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92818 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31864) Unit!44948)

(assert (=> b!1365066 (= lt!601367 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1365067 () Bool)

(declare-fun e!774209 () Unit!44948)

(declare-fun lt!601366 () Unit!44948)

(assert (=> b!1365067 (= e!774209 lt!601366)))

(declare-fun lt!601368 () Unit!44948)

(declare-fun lemmaListSubSeqRefl!0 (List!31864) Unit!44948)

(assert (=> b!1365067 (= lt!601368 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!935 (List!31864 List!31864) Bool)

(assert (=> b!1365067 (subseq!935 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92818 List!31864 List!31864 (_ BitVec 32)) Unit!44948)

(declare-fun $colon$colon!937 (List!31864 (_ BitVec 64)) List!31864)

(assert (=> b!1365067 (= lt!601366 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!937 acc!759 (select (arr!44836 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1365067 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1365068 () Bool)

(declare-fun res!908040 () Bool)

(assert (=> b!1365068 (=> (not res!908040) (not e!774210))))

(assert (=> b!1365068 (= res!908040 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1365069 () Bool)

(declare-fun res!908045 () Bool)

(assert (=> b!1365069 (=> (not res!908045) (not e!774208))))

(declare-fun contains!9576 (List!31864 (_ BitVec 64)) Bool)

(assert (=> b!1365069 (= res!908045 (not (contains!9576 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365070 () Bool)

(declare-fun res!908041 () Bool)

(assert (=> b!1365070 (=> (not res!908041) (not e!774208))))

(assert (=> b!1365070 (= res!908041 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31861))))

(declare-fun b!1365071 () Bool)

(declare-fun Unit!44950 () Unit!44948)

(assert (=> b!1365071 (= e!774209 Unit!44950)))

(declare-fun b!1365072 () Bool)

(declare-fun res!908042 () Bool)

(assert (=> b!1365072 (=> (not res!908042) (not e!774208))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1365072 (= res!908042 (not (validKeyInArray!0 l!3587)))))

(declare-fun res!908046 () Bool)

(assert (=> start!115300 (=> (not res!908046) (not e!774208))))

(assert (=> start!115300 (= res!908046 (and (bvslt (size!45387 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45387 a!3742))))))

(assert (=> start!115300 e!774208))

(assert (=> start!115300 true))

(declare-fun array_inv!34117 (array!92818) Bool)

(assert (=> start!115300 (array_inv!34117 a!3742)))

(declare-fun b!1365064 () Bool)

(assert (=> b!1365064 (= e!774208 e!774210)))

(declare-fun res!908043 () Bool)

(assert (=> b!1365064 (=> (not res!908043) (not e!774210))))

(declare-fun lt!601365 () Bool)

(assert (=> b!1365064 (= res!908043 (and (not (= from!3120 i!1404)) (not lt!601365) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!601364 () Unit!44948)

(assert (=> b!1365064 (= lt!601364 e!774209)))

(declare-fun c!127960 () Bool)

(assert (=> b!1365064 (= c!127960 lt!601365)))

(assert (=> b!1365064 (= lt!601365 (validKeyInArray!0 (select (arr!44836 a!3742) from!3120)))))

(declare-fun b!1365073 () Bool)

(declare-fun res!908039 () Bool)

(assert (=> b!1365073 (=> (not res!908039) (not e!774208))))

(declare-fun noDuplicate!2407 (List!31864) Bool)

(assert (=> b!1365073 (= res!908039 (noDuplicate!2407 acc!759))))

(declare-fun b!1365074 () Bool)

(declare-fun res!908048 () Bool)

(assert (=> b!1365074 (=> (not res!908048) (not e!774208))))

(assert (=> b!1365074 (= res!908048 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45387 a!3742))))))

(declare-fun b!1365075 () Bool)

(declare-fun res!908044 () Bool)

(assert (=> b!1365075 (=> (not res!908044) (not e!774208))))

(assert (=> b!1365075 (= res!908044 (not (contains!9576 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365076 () Bool)

(declare-fun res!908049 () Bool)

(assert (=> b!1365076 (=> (not res!908049) (not e!774208))))

(assert (=> b!1365076 (= res!908049 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(assert (= (and start!115300 res!908046) b!1365073))

(assert (= (and b!1365073 res!908039) b!1365075))

(assert (= (and b!1365075 res!908044) b!1365069))

(assert (= (and b!1365069 res!908045) b!1365070))

(assert (= (and b!1365070 res!908041) b!1365076))

(assert (= (and b!1365076 res!908049) b!1365074))

(assert (= (and b!1365074 res!908048) b!1365072))

(assert (= (and b!1365072 res!908042) b!1365065))

(assert (= (and b!1365065 res!908047) b!1365064))

(assert (= (and b!1365064 c!127960) b!1365067))

(assert (= (and b!1365064 (not c!127960)) b!1365071))

(assert (= (and b!1365064 res!908043) b!1365068))

(assert (= (and b!1365068 res!908040) b!1365066))

(declare-fun m!1250089 () Bool)

(assert (=> b!1365072 m!1250089))

(declare-fun m!1250091 () Bool)

(assert (=> start!115300 m!1250091))

(declare-fun m!1250093 () Bool)

(assert (=> b!1365067 m!1250093))

(declare-fun m!1250095 () Bool)

(assert (=> b!1365067 m!1250095))

(declare-fun m!1250097 () Bool)

(assert (=> b!1365067 m!1250097))

(declare-fun m!1250099 () Bool)

(assert (=> b!1365067 m!1250099))

(declare-fun m!1250101 () Bool)

(assert (=> b!1365067 m!1250101))

(assert (=> b!1365067 m!1250095))

(assert (=> b!1365067 m!1250097))

(declare-fun m!1250103 () Bool)

(assert (=> b!1365067 m!1250103))

(declare-fun m!1250105 () Bool)

(assert (=> b!1365073 m!1250105))

(assert (=> b!1365064 m!1250095))

(assert (=> b!1365064 m!1250095))

(declare-fun m!1250107 () Bool)

(assert (=> b!1365064 m!1250107))

(declare-fun m!1250109 () Bool)

(assert (=> b!1365070 m!1250109))

(declare-fun m!1250111 () Bool)

(assert (=> b!1365066 m!1250111))

(declare-fun m!1250113 () Bool)

(assert (=> b!1365066 m!1250113))

(declare-fun m!1250115 () Bool)

(assert (=> b!1365066 m!1250115))

(declare-fun m!1250117 () Bool)

(assert (=> b!1365076 m!1250117))

(assert (=> b!1365068 m!1250101))

(declare-fun m!1250119 () Bool)

(assert (=> b!1365075 m!1250119))

(declare-fun m!1250121 () Bool)

(assert (=> b!1365069 m!1250121))

(check-sat (not b!1365070) (not b!1365072) (not start!115300) (not b!1365064) (not b!1365066) (not b!1365073) (not b!1365067) (not b!1365069) (not b!1365076) (not b!1365075) (not b!1365068))
(check-sat)
