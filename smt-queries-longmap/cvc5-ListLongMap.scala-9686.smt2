; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114578 () Bool)

(assert start!114578)

(declare-fun b!1359097 () Bool)

(declare-fun res!903029 () Bool)

(declare-fun e!771471 () Bool)

(assert (=> b!1359097 (=> (not res!903029) (not e!771471))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1359097 (= res!903029 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1359098 () Bool)

(declare-fun e!771472 () Bool)

(assert (=> b!1359098 (= e!771471 (not e!771472))))

(declare-fun res!903036 () Bool)

(assert (=> b!1359098 (=> res!903036 e!771472)))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1359098 (= res!903036 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-datatypes ((List!31749 0))(
  ( (Nil!31746) (Cons!31745 (h!32963 (_ BitVec 64)) (t!46405 List!31749)) )
))
(declare-fun acc!759 () List!31749)

(declare-fun lt!599703 () List!31749)

(declare-datatypes ((array!92561 0))(
  ( (array!92562 (arr!44721 (Array (_ BitVec 32) (_ BitVec 64))) (size!45272 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92561)

(declare-fun $colon$colon!822 (List!31749 (_ BitVec 64)) List!31749)

(assert (=> b!1359098 (= lt!599703 ($colon$colon!822 acc!759 (select (arr!44721 a!3742) from!3120)))))

(declare-fun subseq!820 (List!31749 List!31749) Bool)

(assert (=> b!1359098 (subseq!820 acc!759 acc!759)))

(declare-datatypes ((Unit!44610 0))(
  ( (Unit!44611) )
))
(declare-fun lt!599702 () Unit!44610)

(declare-fun lemmaListSubSeqRefl!0 (List!31749) Unit!44610)

(assert (=> b!1359098 (= lt!599702 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1359099 () Bool)

(declare-fun res!903028 () Bool)

(assert (=> b!1359099 (=> (not res!903028) (not e!771471))))

(declare-fun noDuplicate!2292 (List!31749) Bool)

(assert (=> b!1359099 (= res!903028 (noDuplicate!2292 acc!759))))

(declare-fun b!1359100 () Bool)

(declare-fun res!903035 () Bool)

(assert (=> b!1359100 (=> (not res!903035) (not e!771471))))

(declare-fun arrayNoDuplicates!0 (array!92561 (_ BitVec 32) List!31749) Bool)

(assert (=> b!1359100 (= res!903035 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun res!903024 () Bool)

(assert (=> start!114578 (=> (not res!903024) (not e!771471))))

(assert (=> start!114578 (= res!903024 (and (bvslt (size!45272 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45272 a!3742))))))

(assert (=> start!114578 e!771471))

(assert (=> start!114578 true))

(declare-fun array_inv!34002 (array!92561) Bool)

(assert (=> start!114578 (array_inv!34002 a!3742)))

(declare-fun b!1359101 () Bool)

(declare-fun res!903031 () Bool)

(assert (=> b!1359101 (=> (not res!903031) (not e!771471))))

(assert (=> b!1359101 (= res!903031 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45272 a!3742)))))

(declare-fun b!1359102 () Bool)

(assert (=> b!1359102 (= e!771472 true)))

(declare-fun lt!599701 () Bool)

(declare-fun contains!9461 (List!31749 (_ BitVec 64)) Bool)

(assert (=> b!1359102 (= lt!599701 (contains!9461 lt!599703 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1359103 () Bool)

(declare-fun res!903032 () Bool)

(assert (=> b!1359103 (=> (not res!903032) (not e!771471))))

(assert (=> b!1359103 (= res!903032 (not (contains!9461 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359104 () Bool)

(declare-fun res!903033 () Bool)

(assert (=> b!1359104 (=> res!903033 e!771472)))

(assert (=> b!1359104 (= res!903033 (not (noDuplicate!2292 lt!599703)))))

(declare-fun b!1359105 () Bool)

(declare-fun res!903026 () Bool)

(assert (=> b!1359105 (=> (not res!903026) (not e!771471))))

(assert (=> b!1359105 (= res!903026 (validKeyInArray!0 (select (arr!44721 a!3742) from!3120)))))

(declare-fun b!1359106 () Bool)

(declare-fun res!903030 () Bool)

(assert (=> b!1359106 (=> res!903030 e!771472)))

(assert (=> b!1359106 (= res!903030 (contains!9461 lt!599703 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1359107 () Bool)

(declare-fun res!903034 () Bool)

(assert (=> b!1359107 (=> (not res!903034) (not e!771471))))

(assert (=> b!1359107 (= res!903034 (not (contains!9461 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359108 () Bool)

(declare-fun res!903027 () Bool)

(assert (=> b!1359108 (=> (not res!903027) (not e!771471))))

(assert (=> b!1359108 (= res!903027 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31746))))

(declare-fun b!1359109 () Bool)

(declare-fun res!903025 () Bool)

(assert (=> b!1359109 (=> (not res!903025) (not e!771471))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1359109 (= res!903025 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45272 a!3742))))))

(assert (= (and start!114578 res!903024) b!1359099))

(assert (= (and b!1359099 res!903028) b!1359103))

(assert (= (and b!1359103 res!903032) b!1359107))

(assert (= (and b!1359107 res!903034) b!1359108))

(assert (= (and b!1359108 res!903027) b!1359100))

(assert (= (and b!1359100 res!903035) b!1359109))

(assert (= (and b!1359109 res!903025) b!1359097))

(assert (= (and b!1359097 res!903029) b!1359101))

(assert (= (and b!1359101 res!903031) b!1359105))

(assert (= (and b!1359105 res!903026) b!1359098))

(assert (= (and b!1359098 (not res!903036)) b!1359104))

(assert (= (and b!1359104 (not res!903033)) b!1359106))

(assert (= (and b!1359106 (not res!903030)) b!1359102))

(declare-fun m!1245067 () Bool)

(assert (=> b!1359097 m!1245067))

(declare-fun m!1245069 () Bool)

(assert (=> b!1359102 m!1245069))

(declare-fun m!1245071 () Bool)

(assert (=> b!1359100 m!1245071))

(declare-fun m!1245073 () Bool)

(assert (=> b!1359104 m!1245073))

(declare-fun m!1245075 () Bool)

(assert (=> b!1359107 m!1245075))

(declare-fun m!1245077 () Bool)

(assert (=> b!1359105 m!1245077))

(assert (=> b!1359105 m!1245077))

(declare-fun m!1245079 () Bool)

(assert (=> b!1359105 m!1245079))

(declare-fun m!1245081 () Bool)

(assert (=> b!1359106 m!1245081))

(declare-fun m!1245083 () Bool)

(assert (=> b!1359108 m!1245083))

(declare-fun m!1245085 () Bool)

(assert (=> start!114578 m!1245085))

(assert (=> b!1359098 m!1245077))

(assert (=> b!1359098 m!1245077))

(declare-fun m!1245087 () Bool)

(assert (=> b!1359098 m!1245087))

(declare-fun m!1245089 () Bool)

(assert (=> b!1359098 m!1245089))

(declare-fun m!1245091 () Bool)

(assert (=> b!1359098 m!1245091))

(declare-fun m!1245093 () Bool)

(assert (=> b!1359103 m!1245093))

(declare-fun m!1245095 () Bool)

(assert (=> b!1359099 m!1245095))

(push 1)

(assert (not b!1359100))

(assert (not b!1359108))

(assert (not b!1359104))

(assert (not b!1359097))

(assert (not b!1359102))

(assert (not start!114578))

(assert (not b!1359105))

(assert (not b!1359098))

(assert (not b!1359099))

(assert (not b!1359107))

(assert (not b!1359106))

(assert (not b!1359103))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

