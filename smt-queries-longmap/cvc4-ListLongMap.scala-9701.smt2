; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114660 () Bool)

(assert start!114660)

(declare-fun b!1360134 () Bool)

(declare-fun e!771730 () Bool)

(assert (=> b!1360134 (= e!771730 false)))

(declare-datatypes ((Unit!44799 0))(
  ( (Unit!44800) )
))
(declare-fun lt!599798 () Unit!44799)

(declare-fun e!771728 () Unit!44799)

(assert (=> b!1360134 (= lt!599798 e!771728)))

(declare-fun c!127265 () Bool)

(declare-datatypes ((array!92548 0))(
  ( (array!92549 (arr!44713 (Array (_ BitVec 32) (_ BitVec 64))) (size!45263 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92548)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1360134 (= c!127265 (validKeyInArray!0 (select (arr!44713 a!3742) from!3120)))))

(declare-fun res!904486 () Bool)

(assert (=> start!114660 (=> (not res!904486) (not e!771730))))

(assert (=> start!114660 (= res!904486 (and (bvslt (size!45263 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45263 a!3742))))))

(assert (=> start!114660 e!771730))

(assert (=> start!114660 true))

(declare-fun array_inv!33741 (array!92548) Bool)

(assert (=> start!114660 (array_inv!33741 a!3742)))

(declare-fun b!1360135 () Bool)

(declare-fun lt!599799 () Unit!44799)

(assert (=> b!1360135 (= e!771728 lt!599799)))

(declare-fun lt!599800 () Unit!44799)

(declare-datatypes ((List!31754 0))(
  ( (Nil!31751) (Cons!31750 (h!32959 (_ BitVec 64)) (t!46430 List!31754)) )
))
(declare-fun acc!759 () List!31754)

(declare-fun lemmaListSubSeqRefl!0 (List!31754) Unit!44799)

(assert (=> b!1360135 (= lt!599800 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!865 (List!31754 List!31754) Bool)

(assert (=> b!1360135 (subseq!865 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92548 List!31754 List!31754 (_ BitVec 32)) Unit!44799)

(declare-fun $colon$colon!868 (List!31754 (_ BitVec 64)) List!31754)

(assert (=> b!1360135 (= lt!599799 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!868 acc!759 (select (arr!44713 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92548 (_ BitVec 32) List!31754) Bool)

(assert (=> b!1360135 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1360136 () Bool)

(declare-fun Unit!44801 () Unit!44799)

(assert (=> b!1360136 (= e!771728 Unit!44801)))

(declare-fun b!1360137 () Bool)

(declare-fun res!904484 () Bool)

(assert (=> b!1360137 (=> (not res!904484) (not e!771730))))

(declare-fun contains!9463 (List!31754 (_ BitVec 64)) Bool)

(assert (=> b!1360137 (= res!904484 (not (contains!9463 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360138 () Bool)

(declare-fun res!904485 () Bool)

(assert (=> b!1360138 (=> (not res!904485) (not e!771730))))

(assert (=> b!1360138 (= res!904485 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31751))))

(declare-fun b!1360139 () Bool)

(declare-fun res!904491 () Bool)

(assert (=> b!1360139 (=> (not res!904491) (not e!771730))))

(assert (=> b!1360139 (= res!904491 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1360140 () Bool)

(declare-fun res!904492 () Bool)

(assert (=> b!1360140 (=> (not res!904492) (not e!771730))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1360140 (= res!904492 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45263 a!3742))))))

(declare-fun b!1360141 () Bool)

(declare-fun res!904489 () Bool)

(assert (=> b!1360141 (=> (not res!904489) (not e!771730))))

(declare-fun noDuplicate!2320 (List!31754) Bool)

(assert (=> b!1360141 (= res!904489 (noDuplicate!2320 acc!759))))

(declare-fun b!1360142 () Bool)

(declare-fun res!904490 () Bool)

(assert (=> b!1360142 (=> (not res!904490) (not e!771730))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1360142 (= res!904490 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1360143 () Bool)

(declare-fun res!904487 () Bool)

(assert (=> b!1360143 (=> (not res!904487) (not e!771730))))

(assert (=> b!1360143 (= res!904487 (not (contains!9463 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360144 () Bool)

(declare-fun res!904488 () Bool)

(assert (=> b!1360144 (=> (not res!904488) (not e!771730))))

(assert (=> b!1360144 (= res!904488 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45263 a!3742)))))

(assert (= (and start!114660 res!904486) b!1360141))

(assert (= (and b!1360141 res!904489) b!1360143))

(assert (= (and b!1360143 res!904487) b!1360137))

(assert (= (and b!1360137 res!904484) b!1360138))

(assert (= (and b!1360138 res!904485) b!1360139))

(assert (= (and b!1360139 res!904491) b!1360140))

(assert (= (and b!1360140 res!904492) b!1360142))

(assert (= (and b!1360142 res!904490) b!1360144))

(assert (= (and b!1360144 res!904488) b!1360134))

(assert (= (and b!1360134 c!127265) b!1360135))

(assert (= (and b!1360134 (not c!127265)) b!1360136))

(declare-fun m!1245453 () Bool)

(assert (=> b!1360138 m!1245453))

(declare-fun m!1245455 () Bool)

(assert (=> b!1360142 m!1245455))

(declare-fun m!1245457 () Bool)

(assert (=> b!1360137 m!1245457))

(declare-fun m!1245459 () Bool)

(assert (=> start!114660 m!1245459))

(declare-fun m!1245461 () Bool)

(assert (=> b!1360143 m!1245461))

(declare-fun m!1245463 () Bool)

(assert (=> b!1360139 m!1245463))

(declare-fun m!1245465 () Bool)

(assert (=> b!1360141 m!1245465))

(declare-fun m!1245467 () Bool)

(assert (=> b!1360135 m!1245467))

(declare-fun m!1245469 () Bool)

(assert (=> b!1360135 m!1245469))

(declare-fun m!1245471 () Bool)

(assert (=> b!1360135 m!1245471))

(declare-fun m!1245473 () Bool)

(assert (=> b!1360135 m!1245473))

(declare-fun m!1245475 () Bool)

(assert (=> b!1360135 m!1245475))

(assert (=> b!1360135 m!1245469))

(assert (=> b!1360135 m!1245471))

(declare-fun m!1245477 () Bool)

(assert (=> b!1360135 m!1245477))

(assert (=> b!1360134 m!1245469))

(assert (=> b!1360134 m!1245469))

(declare-fun m!1245479 () Bool)

(assert (=> b!1360134 m!1245479))

(push 1)

(assert (not b!1360139))

(assert (not b!1360143))

(assert (not b!1360134))

(assert (not b!1360135))

(assert (not b!1360137))

(assert (not b!1360141))

(assert (not b!1360142))

(assert (not start!114660))

(assert (not b!1360138))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

