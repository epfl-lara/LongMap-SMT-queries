; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114584 () Bool)

(assert start!114584)

(declare-fun b!1359646 () Bool)

(declare-fun res!904095 () Bool)

(declare-fun e!771471 () Bool)

(assert (=> b!1359646 (=> (not res!904095) (not e!771471))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1359646 (= res!904095 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1359647 () Bool)

(declare-fun res!904092 () Bool)

(assert (=> b!1359647 (=> (not res!904092) (not e!771471))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92529 0))(
  ( (array!92530 (arr!44705 (Array (_ BitVec 32) (_ BitVec 64))) (size!45255 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92529)

(assert (=> b!1359647 (= res!904092 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45255 a!3742))))))

(declare-fun b!1359648 () Bool)

(declare-fun res!904094 () Bool)

(assert (=> b!1359648 (=> (not res!904094) (not e!771471))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((List!31746 0))(
  ( (Nil!31743) (Cons!31742 (h!32951 (_ BitVec 64)) (t!46419 List!31746)) )
))
(declare-fun acc!759 () List!31746)

(declare-fun arrayNoDuplicates!0 (array!92529 (_ BitVec 32) List!31746) Bool)

(assert (=> b!1359648 (= res!904094 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1359649 () Bool)

(declare-fun e!771470 () Bool)

(assert (=> b!1359649 (= e!771471 e!771470)))

(declare-fun res!904087 () Bool)

(assert (=> b!1359649 (=> (not res!904087) (not e!771470))))

(assert (=> b!1359649 (= res!904087 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44775 0))(
  ( (Unit!44776) )
))
(declare-fun lt!599662 () Unit!44775)

(declare-fun e!771469 () Unit!44775)

(assert (=> b!1359649 (= lt!599662 e!771469)))

(declare-fun c!127220 () Bool)

(assert (=> b!1359649 (= c!127220 (validKeyInArray!0 (select (arr!44705 a!3742) from!3120)))))

(declare-fun res!904086 () Bool)

(assert (=> start!114584 (=> (not res!904086) (not e!771471))))

(assert (=> start!114584 (= res!904086 (and (bvslt (size!45255 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45255 a!3742))))))

(assert (=> start!114584 e!771471))

(assert (=> start!114584 true))

(declare-fun array_inv!33733 (array!92529) Bool)

(assert (=> start!114584 (array_inv!33733 a!3742)))

(declare-fun b!1359650 () Bool)

(declare-fun res!904093 () Bool)

(assert (=> b!1359650 (=> (not res!904093) (not e!771471))))

(declare-fun noDuplicate!2312 (List!31746) Bool)

(assert (=> b!1359650 (= res!904093 (noDuplicate!2312 acc!759))))

(declare-fun b!1359651 () Bool)

(assert (=> b!1359651 (= e!771470 (not true))))

(assert (=> b!1359651 (arrayNoDuplicates!0 (array!92530 (store (arr!44705 a!3742) i!1404 l!3587) (size!45255 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!599665 () Unit!44775)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92529 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31746) Unit!44775)

(assert (=> b!1359651 (= lt!599665 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1359652 () Bool)

(declare-fun res!904090 () Bool)

(assert (=> b!1359652 (=> (not res!904090) (not e!771471))))

(assert (=> b!1359652 (= res!904090 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31743))))

(declare-fun b!1359653 () Bool)

(declare-fun res!904089 () Bool)

(assert (=> b!1359653 (=> (not res!904089) (not e!771471))))

(declare-fun contains!9455 (List!31746 (_ BitVec 64)) Bool)

(assert (=> b!1359653 (= res!904089 (not (contains!9455 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359654 () Bool)

(declare-fun res!904088 () Bool)

(assert (=> b!1359654 (=> (not res!904088) (not e!771471))))

(assert (=> b!1359654 (= res!904088 (not (contains!9455 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359655 () Bool)

(declare-fun res!904096 () Bool)

(assert (=> b!1359655 (=> (not res!904096) (not e!771470))))

(assert (=> b!1359655 (= res!904096 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1359656 () Bool)

(declare-fun lt!599663 () Unit!44775)

(assert (=> b!1359656 (= e!771469 lt!599663)))

(declare-fun lt!599664 () Unit!44775)

(declare-fun lemmaListSubSeqRefl!0 (List!31746) Unit!44775)

(assert (=> b!1359656 (= lt!599664 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!857 (List!31746 List!31746) Bool)

(assert (=> b!1359656 (subseq!857 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92529 List!31746 List!31746 (_ BitVec 32)) Unit!44775)

(declare-fun $colon$colon!860 (List!31746 (_ BitVec 64)) List!31746)

(assert (=> b!1359656 (= lt!599663 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!860 acc!759 (select (arr!44705 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1359656 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1359657 () Bool)

(declare-fun Unit!44777 () Unit!44775)

(assert (=> b!1359657 (= e!771469 Unit!44777)))

(declare-fun b!1359658 () Bool)

(declare-fun res!904091 () Bool)

(assert (=> b!1359658 (=> (not res!904091) (not e!771471))))

(assert (=> b!1359658 (= res!904091 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45255 a!3742)))))

(assert (= (and start!114584 res!904086) b!1359650))

(assert (= (and b!1359650 res!904093) b!1359654))

(assert (= (and b!1359654 res!904088) b!1359653))

(assert (= (and b!1359653 res!904089) b!1359652))

(assert (= (and b!1359652 res!904090) b!1359648))

(assert (= (and b!1359648 res!904094) b!1359647))

(assert (= (and b!1359647 res!904092) b!1359646))

(assert (= (and b!1359646 res!904095) b!1359658))

(assert (= (and b!1359658 res!904091) b!1359649))

(assert (= (and b!1359649 c!127220) b!1359656))

(assert (= (and b!1359649 (not c!127220)) b!1359657))

(assert (= (and b!1359649 res!904087) b!1359655))

(assert (= (and b!1359655 res!904096) b!1359651))

(declare-fun m!1245001 () Bool)

(assert (=> b!1359646 m!1245001))

(declare-fun m!1245003 () Bool)

(assert (=> b!1359654 m!1245003))

(declare-fun m!1245005 () Bool)

(assert (=> b!1359650 m!1245005))

(declare-fun m!1245007 () Bool)

(assert (=> b!1359653 m!1245007))

(declare-fun m!1245009 () Bool)

(assert (=> start!114584 m!1245009))

(declare-fun m!1245011 () Bool)

(assert (=> b!1359656 m!1245011))

(declare-fun m!1245013 () Bool)

(assert (=> b!1359656 m!1245013))

(declare-fun m!1245015 () Bool)

(assert (=> b!1359656 m!1245015))

(declare-fun m!1245017 () Bool)

(assert (=> b!1359656 m!1245017))

(declare-fun m!1245019 () Bool)

(assert (=> b!1359656 m!1245019))

(assert (=> b!1359656 m!1245013))

(assert (=> b!1359656 m!1245015))

(declare-fun m!1245021 () Bool)

(assert (=> b!1359656 m!1245021))

(assert (=> b!1359655 m!1245019))

(declare-fun m!1245023 () Bool)

(assert (=> b!1359652 m!1245023))

(declare-fun m!1245025 () Bool)

(assert (=> b!1359648 m!1245025))

(declare-fun m!1245027 () Bool)

(assert (=> b!1359651 m!1245027))

(declare-fun m!1245029 () Bool)

(assert (=> b!1359651 m!1245029))

(declare-fun m!1245031 () Bool)

(assert (=> b!1359651 m!1245031))

(assert (=> b!1359649 m!1245013))

(assert (=> b!1359649 m!1245013))

(declare-fun m!1245033 () Bool)

(assert (=> b!1359649 m!1245033))

(push 1)

