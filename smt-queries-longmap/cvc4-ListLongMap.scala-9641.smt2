; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113988 () Bool)

(assert start!113988)

(declare-fun b!1352451 () Bool)

(declare-fun res!897785 () Bool)

(declare-fun e!768812 () Bool)

(assert (=> b!1352451 (=> (not res!897785) (not e!768812))))

(declare-datatypes ((List!31574 0))(
  ( (Nil!31571) (Cons!31570 (h!32779 (_ BitVec 64)) (t!46232 List!31574)) )
))
(declare-fun acc!759 () List!31574)

(declare-fun contains!9283 (List!31574 (_ BitVec 64)) Bool)

(assert (=> b!1352451 (= res!897785 (not (contains!9283 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352452 () Bool)

(declare-fun res!897788 () Bool)

(assert (=> b!1352452 (=> (not res!897788) (not e!768812))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92170 0))(
  ( (array!92171 (arr!44533 (Array (_ BitVec 32) (_ BitVec 64))) (size!45083 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92170)

(assert (=> b!1352452 (= res!897788 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45083 a!3742)))))

(declare-fun b!1352453 () Bool)

(declare-datatypes ((Unit!44340 0))(
  ( (Unit!44341) )
))
(declare-fun e!768814 () Unit!44340)

(declare-fun lt!597548 () Unit!44340)

(assert (=> b!1352453 (= e!768814 lt!597548)))

(declare-fun lt!597549 () Unit!44340)

(declare-fun lemmaListSubSeqRefl!0 (List!31574) Unit!44340)

(assert (=> b!1352453 (= lt!597549 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!703 (List!31574 List!31574) Bool)

(assert (=> b!1352453 (subseq!703 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92170 List!31574 List!31574 (_ BitVec 32)) Unit!44340)

(declare-fun $colon$colon!718 (List!31574 (_ BitVec 64)) List!31574)

(assert (=> b!1352453 (= lt!597548 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!718 acc!759 (select (arr!44533 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92170 (_ BitVec 32) List!31574) Bool)

(assert (=> b!1352453 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1352454 () Bool)

(declare-fun Unit!44342 () Unit!44340)

(assert (=> b!1352454 (= e!768814 Unit!44342)))

(declare-fun b!1352455 () Bool)

(declare-fun res!897790 () Bool)

(assert (=> b!1352455 (=> (not res!897790) (not e!768812))))

(assert (=> b!1352455 (= res!897790 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31571))))

(declare-fun b!1352456 () Bool)

(declare-fun res!897787 () Bool)

(assert (=> b!1352456 (=> (not res!897787) (not e!768812))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1352456 (= res!897787 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1352457 () Bool)

(declare-fun res!897789 () Bool)

(assert (=> b!1352457 (=> (not res!897789) (not e!768812))))

(assert (=> b!1352457 (= res!897789 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun res!897784 () Bool)

(assert (=> start!113988 (=> (not res!897784) (not e!768812))))

(assert (=> start!113988 (= res!897784 (and (bvslt (size!45083 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45083 a!3742))))))

(assert (=> start!113988 e!768812))

(assert (=> start!113988 true))

(declare-fun array_inv!33561 (array!92170) Bool)

(assert (=> start!113988 (array_inv!33561 a!3742)))

(declare-fun b!1352450 () Bool)

(declare-fun e!768811 () Bool)

(assert (=> b!1352450 (= e!768811 false)))

(declare-fun lt!597547 () Bool)

(assert (=> b!1352450 (= lt!597547 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1352458 () Bool)

(declare-fun res!897793 () Bool)

(assert (=> b!1352458 (=> (not res!897793) (not e!768812))))

(assert (=> b!1352458 (= res!897793 (not (contains!9283 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352459 () Bool)

(declare-fun res!897792 () Bool)

(assert (=> b!1352459 (=> (not res!897792) (not e!768812))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1352459 (= res!897792 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45083 a!3742))))))

(declare-fun b!1352460 () Bool)

(assert (=> b!1352460 (= e!768812 e!768811)))

(declare-fun res!897786 () Bool)

(assert (=> b!1352460 (=> (not res!897786) (not e!768811))))

(assert (=> b!1352460 (= res!897786 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!597550 () Unit!44340)

(assert (=> b!1352460 (= lt!597550 e!768814)))

(declare-fun c!126773 () Bool)

(assert (=> b!1352460 (= c!126773 (validKeyInArray!0 (select (arr!44533 a!3742) from!3120)))))

(declare-fun b!1352461 () Bool)

(declare-fun res!897791 () Bool)

(assert (=> b!1352461 (=> (not res!897791) (not e!768812))))

(declare-fun noDuplicate!2140 (List!31574) Bool)

(assert (=> b!1352461 (= res!897791 (noDuplicate!2140 acc!759))))

(assert (= (and start!113988 res!897784) b!1352461))

(assert (= (and b!1352461 res!897791) b!1352451))

(assert (= (and b!1352451 res!897785) b!1352458))

(assert (= (and b!1352458 res!897793) b!1352455))

(assert (= (and b!1352455 res!897790) b!1352457))

(assert (= (and b!1352457 res!897789) b!1352459))

(assert (= (and b!1352459 res!897792) b!1352456))

(assert (= (and b!1352456 res!897787) b!1352452))

(assert (= (and b!1352452 res!897788) b!1352460))

(assert (= (and b!1352460 c!126773) b!1352453))

(assert (= (and b!1352460 (not c!126773)) b!1352454))

(assert (= (and b!1352460 res!897786) b!1352450))

(declare-fun m!1239261 () Bool)

(assert (=> b!1352450 m!1239261))

(declare-fun m!1239263 () Bool)

(assert (=> b!1352461 m!1239263))

(declare-fun m!1239265 () Bool)

(assert (=> b!1352455 m!1239265))

(declare-fun m!1239267 () Bool)

(assert (=> b!1352451 m!1239267))

(declare-fun m!1239269 () Bool)

(assert (=> start!113988 m!1239269))

(declare-fun m!1239271 () Bool)

(assert (=> b!1352460 m!1239271))

(assert (=> b!1352460 m!1239271))

(declare-fun m!1239273 () Bool)

(assert (=> b!1352460 m!1239273))

(declare-fun m!1239275 () Bool)

(assert (=> b!1352456 m!1239275))

(declare-fun m!1239277 () Bool)

(assert (=> b!1352457 m!1239277))

(declare-fun m!1239279 () Bool)

(assert (=> b!1352458 m!1239279))

(declare-fun m!1239281 () Bool)

(assert (=> b!1352453 m!1239281))

(assert (=> b!1352453 m!1239271))

(declare-fun m!1239283 () Bool)

(assert (=> b!1352453 m!1239283))

(declare-fun m!1239285 () Bool)

(assert (=> b!1352453 m!1239285))

(assert (=> b!1352453 m!1239261))

(assert (=> b!1352453 m!1239271))

(assert (=> b!1352453 m!1239283))

(declare-fun m!1239287 () Bool)

(assert (=> b!1352453 m!1239287))

(push 1)

(assert (not b!1352455))

