; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114106 () Bool)

(assert start!114106)

(declare-fun b!1355114 () Bool)

(declare-fun e!769636 () Bool)

(assert (=> b!1355114 (= e!769636 false)))

(declare-fun lt!598496 () Bool)

(declare-datatypes ((array!92288 0))(
  ( (array!92289 (arr!44592 (Array (_ BitVec 32) (_ BitVec 64))) (size!45142 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92288)

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((List!31633 0))(
  ( (Nil!31630) (Cons!31629 (h!32838 (_ BitVec 64)) (t!46291 List!31633)) )
))
(declare-fun acc!759 () List!31633)

(declare-fun arrayNoDuplicates!0 (array!92288 (_ BitVec 32) List!31633) Bool)

(assert (=> b!1355114 (= lt!598496 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1355115 () Bool)

(declare-fun res!900095 () Bool)

(declare-fun e!769637 () Bool)

(assert (=> b!1355115 (=> (not res!900095) (not e!769637))))

(declare-fun contains!9342 (List!31633 (_ BitVec 64)) Bool)

(assert (=> b!1355115 (= res!900095 (not (contains!9342 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355117 () Bool)

(declare-fun res!900102 () Bool)

(assert (=> b!1355117 (=> (not res!900102) (not e!769637))))

(assert (=> b!1355117 (= res!900102 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1355118 () Bool)

(declare-fun res!900099 () Bool)

(assert (=> b!1355118 (=> (not res!900099) (not e!769637))))

(assert (=> b!1355118 (= res!900099 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31630))))

(declare-fun b!1355119 () Bool)

(declare-fun res!900094 () Bool)

(assert (=> b!1355119 (=> (not res!900094) (not e!769637))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1355119 (= res!900094 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1355120 () Bool)

(assert (=> b!1355120 (= e!769637 e!769636)))

(declare-fun res!900097 () Bool)

(assert (=> b!1355120 (=> (not res!900097) (not e!769636))))

(declare-fun lt!598497 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1355120 (= res!900097 (and (not (= from!3120 i!1404)) (not lt!598497) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44517 0))(
  ( (Unit!44518) )
))
(declare-fun lt!598498 () Unit!44517)

(declare-fun e!769639 () Unit!44517)

(assert (=> b!1355120 (= lt!598498 e!769639)))

(declare-fun c!126950 () Bool)

(assert (=> b!1355120 (= c!126950 lt!598497)))

(assert (=> b!1355120 (= lt!598497 (validKeyInArray!0 (select (arr!44592 a!3742) from!3120)))))

(declare-fun b!1355121 () Bool)

(declare-fun res!900096 () Bool)

(assert (=> b!1355121 (=> (not res!900096) (not e!769637))))

(assert (=> b!1355121 (= res!900096 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45142 a!3742)))))

(declare-fun b!1355116 () Bool)

(declare-fun lt!598494 () Unit!44517)

(assert (=> b!1355116 (= e!769639 lt!598494)))

(declare-fun lt!598495 () Unit!44517)

(declare-fun lemmaListSubSeqRefl!0 (List!31633) Unit!44517)

(assert (=> b!1355116 (= lt!598495 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!762 (List!31633 List!31633) Bool)

(assert (=> b!1355116 (subseq!762 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92288 List!31633 List!31633 (_ BitVec 32)) Unit!44517)

(declare-fun $colon$colon!777 (List!31633 (_ BitVec 64)) List!31633)

(assert (=> b!1355116 (= lt!598494 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!777 acc!759 (select (arr!44592 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1355116 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun res!900100 () Bool)

(assert (=> start!114106 (=> (not res!900100) (not e!769637))))

(assert (=> start!114106 (= res!900100 (and (bvslt (size!45142 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45142 a!3742))))))

(assert (=> start!114106 e!769637))

(assert (=> start!114106 true))

(declare-fun array_inv!33620 (array!92288) Bool)

(assert (=> start!114106 (array_inv!33620 a!3742)))

(declare-fun b!1355122 () Bool)

(declare-fun res!900101 () Bool)

(assert (=> b!1355122 (=> (not res!900101) (not e!769637))))

(assert (=> b!1355122 (= res!900101 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45142 a!3742))))))

(declare-fun b!1355123 () Bool)

(declare-fun res!900103 () Bool)

(assert (=> b!1355123 (=> (not res!900103) (not e!769637))))

(declare-fun noDuplicate!2199 (List!31633) Bool)

(assert (=> b!1355123 (= res!900103 (noDuplicate!2199 acc!759))))

(declare-fun b!1355124 () Bool)

(declare-fun Unit!44519 () Unit!44517)

(assert (=> b!1355124 (= e!769639 Unit!44519)))

(declare-fun b!1355125 () Bool)

(declare-fun res!900098 () Bool)

(assert (=> b!1355125 (=> (not res!900098) (not e!769637))))

(assert (=> b!1355125 (= res!900098 (not (contains!9342 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114106 res!900100) b!1355123))

(assert (= (and b!1355123 res!900103) b!1355125))

(assert (= (and b!1355125 res!900098) b!1355115))

(assert (= (and b!1355115 res!900095) b!1355118))

(assert (= (and b!1355118 res!900099) b!1355117))

(assert (= (and b!1355117 res!900102) b!1355122))

(assert (= (and b!1355122 res!900101) b!1355119))

(assert (= (and b!1355119 res!900094) b!1355121))

(assert (= (and b!1355121 res!900096) b!1355120))

(assert (= (and b!1355120 c!126950) b!1355116))

(assert (= (and b!1355120 (not c!126950)) b!1355124))

(assert (= (and b!1355120 res!900097) b!1355114))

(declare-fun m!1241369 () Bool)

(assert (=> start!114106 m!1241369))

(declare-fun m!1241371 () Bool)

(assert (=> b!1355116 m!1241371))

(declare-fun m!1241373 () Bool)

(assert (=> b!1355116 m!1241373))

(declare-fun m!1241375 () Bool)

(assert (=> b!1355116 m!1241375))

(declare-fun m!1241377 () Bool)

(assert (=> b!1355116 m!1241377))

(declare-fun m!1241379 () Bool)

(assert (=> b!1355116 m!1241379))

(assert (=> b!1355116 m!1241373))

(assert (=> b!1355116 m!1241375))

(declare-fun m!1241381 () Bool)

(assert (=> b!1355116 m!1241381))

(declare-fun m!1241383 () Bool)

(assert (=> b!1355123 m!1241383))

(declare-fun m!1241385 () Bool)

(assert (=> b!1355117 m!1241385))

(declare-fun m!1241387 () Bool)

(assert (=> b!1355125 m!1241387))

(assert (=> b!1355114 m!1241379))

(declare-fun m!1241389 () Bool)

(assert (=> b!1355118 m!1241389))

(assert (=> b!1355120 m!1241373))

(assert (=> b!1355120 m!1241373))

(declare-fun m!1241391 () Bool)

(assert (=> b!1355120 m!1241391))

(declare-fun m!1241393 () Bool)

(assert (=> b!1355119 m!1241393))

(declare-fun m!1241395 () Bool)

(assert (=> b!1355115 m!1241395))

(check-sat (not b!1355118) (not b!1355120) (not b!1355119) (not b!1355116) (not b!1355125) (not start!114106) (not b!1355115) (not b!1355117) (not b!1355114) (not b!1355123))
(check-sat)
