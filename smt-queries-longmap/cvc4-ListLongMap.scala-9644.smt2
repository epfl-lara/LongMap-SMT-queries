; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114006 () Bool)

(assert start!114006)

(declare-fun b!1352782 () Bool)

(declare-fun res!898062 () Bool)

(declare-fun e!768920 () Bool)

(assert (=> b!1352782 (=> (not res!898062) (not e!768920))))

(declare-datatypes ((List!31583 0))(
  ( (Nil!31580) (Cons!31579 (h!32788 (_ BitVec 64)) (t!46241 List!31583)) )
))
(declare-fun acc!759 () List!31583)

(declare-fun noDuplicate!2149 (List!31583) Bool)

(assert (=> b!1352782 (= res!898062 (noDuplicate!2149 acc!759))))

(declare-fun b!1352783 () Bool)

(declare-fun res!898070 () Bool)

(assert (=> b!1352783 (=> (not res!898070) (not e!768920))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1352783 (= res!898070 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1352784 () Bool)

(declare-fun res!898067 () Bool)

(assert (=> b!1352784 (=> (not res!898067) (not e!768920))))

(declare-datatypes ((array!92188 0))(
  ( (array!92189 (arr!44542 (Array (_ BitVec 32) (_ BitVec 64))) (size!45092 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92188)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92188 (_ BitVec 32) List!31583) Bool)

(assert (=> b!1352784 (= res!898067 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1352785 () Bool)

(declare-fun res!898066 () Bool)

(assert (=> b!1352785 (=> (not res!898066) (not e!768920))))

(declare-fun contains!9292 (List!31583 (_ BitVec 64)) Bool)

(assert (=> b!1352785 (= res!898066 (not (contains!9292 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!898072 () Bool)

(assert (=> start!114006 (=> (not res!898072) (not e!768920))))

(assert (=> start!114006 (= res!898072 (and (bvslt (size!45092 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45092 a!3742))))))

(assert (=> start!114006 e!768920))

(assert (=> start!114006 true))

(declare-fun array_inv!33570 (array!92188) Bool)

(assert (=> start!114006 (array_inv!33570 a!3742)))

(declare-fun b!1352786 () Bool)

(declare-fun e!768919 () Bool)

(assert (=> b!1352786 (= e!768920 e!768919)))

(declare-fun res!898063 () Bool)

(assert (=> b!1352786 (=> (not res!898063) (not e!768919))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1352786 (= res!898063 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44367 0))(
  ( (Unit!44368) )
))
(declare-fun lt!597657 () Unit!44367)

(declare-fun e!768922 () Unit!44367)

(assert (=> b!1352786 (= lt!597657 e!768922)))

(declare-fun c!126800 () Bool)

(assert (=> b!1352786 (= c!126800 (validKeyInArray!0 (select (arr!44542 a!3742) from!3120)))))

(declare-fun b!1352787 () Bool)

(declare-fun res!898069 () Bool)

(assert (=> b!1352787 (=> (not res!898069) (not e!768920))))

(assert (=> b!1352787 (= res!898069 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45092 a!3742))))))

(declare-fun b!1352788 () Bool)

(declare-fun res!898065 () Bool)

(assert (=> b!1352788 (=> (not res!898065) (not e!768920))))

(assert (=> b!1352788 (= res!898065 (not (contains!9292 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352789 () Bool)

(declare-fun res!898064 () Bool)

(assert (=> b!1352789 (=> (not res!898064) (not e!768920))))

(assert (=> b!1352789 (= res!898064 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31580))))

(declare-fun b!1352790 () Bool)

(assert (=> b!1352790 (= e!768919 (not (bvsle from!3120 (size!45092 a!3742))))))

(assert (=> b!1352790 (arrayNoDuplicates!0 (array!92189 (store (arr!44542 a!3742) i!1404 l!3587) (size!45092 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!597658 () Unit!44367)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92188 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31583) Unit!44367)

(assert (=> b!1352790 (= lt!597658 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1352791 () Bool)

(declare-fun res!898071 () Bool)

(assert (=> b!1352791 (=> (not res!898071) (not e!768919))))

(assert (=> b!1352791 (= res!898071 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1352792 () Bool)

(declare-fun res!898068 () Bool)

(assert (=> b!1352792 (=> (not res!898068) (not e!768920))))

(assert (=> b!1352792 (= res!898068 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45092 a!3742)))))

(declare-fun b!1352793 () Bool)

(declare-fun Unit!44369 () Unit!44367)

(assert (=> b!1352793 (= e!768922 Unit!44369)))

(declare-fun b!1352794 () Bool)

(declare-fun lt!597656 () Unit!44367)

(assert (=> b!1352794 (= e!768922 lt!597656)))

(declare-fun lt!597655 () Unit!44367)

(declare-fun lemmaListSubSeqRefl!0 (List!31583) Unit!44367)

(assert (=> b!1352794 (= lt!597655 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!712 (List!31583 List!31583) Bool)

(assert (=> b!1352794 (subseq!712 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92188 List!31583 List!31583 (_ BitVec 32)) Unit!44367)

(declare-fun $colon$colon!727 (List!31583 (_ BitVec 64)) List!31583)

(assert (=> b!1352794 (= lt!597656 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!727 acc!759 (select (arr!44542 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1352794 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(assert (= (and start!114006 res!898072) b!1352782))

(assert (= (and b!1352782 res!898062) b!1352785))

(assert (= (and b!1352785 res!898066) b!1352788))

(assert (= (and b!1352788 res!898065) b!1352789))

(assert (= (and b!1352789 res!898064) b!1352784))

(assert (= (and b!1352784 res!898067) b!1352787))

(assert (= (and b!1352787 res!898069) b!1352783))

(assert (= (and b!1352783 res!898070) b!1352792))

(assert (= (and b!1352792 res!898068) b!1352786))

(assert (= (and b!1352786 c!126800) b!1352794))

(assert (= (and b!1352786 (not c!126800)) b!1352793))

(assert (= (and b!1352786 res!898063) b!1352791))

(assert (= (and b!1352791 res!898071) b!1352790))

(declare-fun m!1239525 () Bool)

(assert (=> b!1352783 m!1239525))

(declare-fun m!1239527 () Bool)

(assert (=> b!1352786 m!1239527))

(assert (=> b!1352786 m!1239527))

(declare-fun m!1239529 () Bool)

(assert (=> b!1352786 m!1239529))

(declare-fun m!1239531 () Bool)

(assert (=> b!1352791 m!1239531))

(declare-fun m!1239533 () Bool)

(assert (=> b!1352785 m!1239533))

(declare-fun m!1239535 () Bool)

(assert (=> start!114006 m!1239535))

(declare-fun m!1239537 () Bool)

(assert (=> b!1352784 m!1239537))

(declare-fun m!1239539 () Bool)

(assert (=> b!1352782 m!1239539))

(declare-fun m!1239541 () Bool)

(assert (=> b!1352794 m!1239541))

(assert (=> b!1352794 m!1239527))

(declare-fun m!1239543 () Bool)

(assert (=> b!1352794 m!1239543))

(declare-fun m!1239545 () Bool)

(assert (=> b!1352794 m!1239545))

(assert (=> b!1352794 m!1239531))

(assert (=> b!1352794 m!1239527))

(assert (=> b!1352794 m!1239543))

(declare-fun m!1239547 () Bool)

(assert (=> b!1352794 m!1239547))

(declare-fun m!1239549 () Bool)

(assert (=> b!1352788 m!1239549))

(declare-fun m!1239551 () Bool)

(assert (=> b!1352789 m!1239551))

(declare-fun m!1239553 () Bool)

(assert (=> b!1352790 m!1239553))

(declare-fun m!1239555 () Bool)

(assert (=> b!1352790 m!1239555))

(declare-fun m!1239557 () Bool)

(assert (=> b!1352790 m!1239557))

(push 1)

(assert (not b!1352785))

(assert (not b!1352784))

(assert (not b!1352788))

(assert (not b!1352783))

(assert (not b!1352791))

(assert (not b!1352782))

(assert (not b!1352789))

(assert (not start!114006))

(assert (not b!1352786))

(assert (not b!1352790))

(assert (not b!1352794))

(check-sat)

(pop 1)

(push 1)

(check-sat)

