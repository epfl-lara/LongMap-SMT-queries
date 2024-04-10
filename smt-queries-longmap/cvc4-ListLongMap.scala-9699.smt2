; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114588 () Bool)

(assert start!114588)

(declare-fun b!1359724 () Bool)

(declare-datatypes ((Unit!44781 0))(
  ( (Unit!44782) )
))
(declare-fun e!771493 () Unit!44781)

(declare-fun lt!599687 () Unit!44781)

(assert (=> b!1359724 (= e!771493 lt!599687)))

(declare-fun lt!599686 () Unit!44781)

(declare-datatypes ((List!31748 0))(
  ( (Nil!31745) (Cons!31744 (h!32953 (_ BitVec 64)) (t!46421 List!31748)) )
))
(declare-fun acc!759 () List!31748)

(declare-fun lemmaListSubSeqRefl!0 (List!31748) Unit!44781)

(assert (=> b!1359724 (= lt!599686 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!859 (List!31748 List!31748) Bool)

(assert (=> b!1359724 (subseq!859 acc!759 acc!759)))

(declare-datatypes ((array!92533 0))(
  ( (array!92534 (arr!44707 (Array (_ BitVec 32) (_ BitVec 64))) (size!45257 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92533)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92533 List!31748 List!31748 (_ BitVec 32)) Unit!44781)

(declare-fun $colon$colon!862 (List!31748 (_ BitVec 64)) List!31748)

(assert (=> b!1359724 (= lt!599687 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!862 acc!759 (select (arr!44707 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92533 (_ BitVec 32) List!31748) Bool)

(assert (=> b!1359724 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1359725 () Bool)

(declare-fun res!904160 () Bool)

(declare-fun e!771495 () Bool)

(assert (=> b!1359725 (=> (not res!904160) (not e!771495))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1359725 (= res!904160 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45257 a!3742))))))

(declare-fun b!1359726 () Bool)

(declare-fun res!904159 () Bool)

(assert (=> b!1359726 (=> (not res!904159) (not e!771495))))

(assert (=> b!1359726 (= res!904159 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun res!904161 () Bool)

(assert (=> start!114588 (=> (not res!904161) (not e!771495))))

(assert (=> start!114588 (= res!904161 (and (bvslt (size!45257 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45257 a!3742))))))

(assert (=> start!114588 e!771495))

(assert (=> start!114588 true))

(declare-fun array_inv!33735 (array!92533) Bool)

(assert (=> start!114588 (array_inv!33735 a!3742)))

(declare-fun b!1359727 () Bool)

(declare-fun res!904158 () Bool)

(assert (=> b!1359727 (=> (not res!904158) (not e!771495))))

(declare-fun contains!9457 (List!31748 (_ BitVec 64)) Bool)

(assert (=> b!1359727 (= res!904158 (not (contains!9457 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359728 () Bool)

(declare-fun res!904156 () Bool)

(assert (=> b!1359728 (=> (not res!904156) (not e!771495))))

(assert (=> b!1359728 (= res!904156 (not (contains!9457 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359729 () Bool)

(declare-fun e!771496 () Bool)

(assert (=> b!1359729 (= e!771495 e!771496)))

(declare-fun res!904153 () Bool)

(assert (=> b!1359729 (=> (not res!904153) (not e!771496))))

(assert (=> b!1359729 (= res!904153 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!599689 () Unit!44781)

(assert (=> b!1359729 (= lt!599689 e!771493)))

(declare-fun c!127226 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1359729 (= c!127226 (validKeyInArray!0 (select (arr!44707 a!3742) from!3120)))))

(declare-fun b!1359730 () Bool)

(declare-fun res!904162 () Bool)

(assert (=> b!1359730 (=> (not res!904162) (not e!771495))))

(assert (=> b!1359730 (= res!904162 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45257 a!3742)))))

(declare-fun b!1359731 () Bool)

(declare-fun res!904152 () Bool)

(assert (=> b!1359731 (=> (not res!904152) (not e!771495))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1359731 (= res!904152 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1359732 () Bool)

(declare-fun Unit!44783 () Unit!44781)

(assert (=> b!1359732 (= e!771493 Unit!44783)))

(declare-fun b!1359733 () Bool)

(assert (=> b!1359733 (= e!771496 (not true))))

(assert (=> b!1359733 (arrayNoDuplicates!0 (array!92534 (store (arr!44707 a!3742) i!1404 l!3587) (size!45257 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!599688 () Unit!44781)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92533 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31748) Unit!44781)

(assert (=> b!1359733 (= lt!599688 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1359734 () Bool)

(declare-fun res!904157 () Bool)

(assert (=> b!1359734 (=> (not res!904157) (not e!771496))))

(assert (=> b!1359734 (= res!904157 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1359735 () Bool)

(declare-fun res!904154 () Bool)

(assert (=> b!1359735 (=> (not res!904154) (not e!771495))))

(declare-fun noDuplicate!2314 (List!31748) Bool)

(assert (=> b!1359735 (= res!904154 (noDuplicate!2314 acc!759))))

(declare-fun b!1359736 () Bool)

(declare-fun res!904155 () Bool)

(assert (=> b!1359736 (=> (not res!904155) (not e!771495))))

(assert (=> b!1359736 (= res!904155 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31745))))

(assert (= (and start!114588 res!904161) b!1359735))

(assert (= (and b!1359735 res!904154) b!1359727))

(assert (= (and b!1359727 res!904158) b!1359728))

(assert (= (and b!1359728 res!904156) b!1359736))

(assert (= (and b!1359736 res!904155) b!1359726))

(assert (= (and b!1359726 res!904159) b!1359725))

(assert (= (and b!1359725 res!904160) b!1359731))

(assert (= (and b!1359731 res!904152) b!1359730))

(assert (= (and b!1359730 res!904162) b!1359729))

(assert (= (and b!1359729 c!127226) b!1359724))

(assert (= (and b!1359729 (not c!127226)) b!1359732))

(assert (= (and b!1359729 res!904153) b!1359734))

(assert (= (and b!1359734 res!904157) b!1359733))

(declare-fun m!1245069 () Bool)

(assert (=> b!1359733 m!1245069))

(declare-fun m!1245071 () Bool)

(assert (=> b!1359733 m!1245071))

(declare-fun m!1245073 () Bool)

(assert (=> b!1359733 m!1245073))

(declare-fun m!1245075 () Bool)

(assert (=> b!1359726 m!1245075))

(declare-fun m!1245077 () Bool)

(assert (=> start!114588 m!1245077))

(declare-fun m!1245079 () Bool)

(assert (=> b!1359727 m!1245079))

(declare-fun m!1245081 () Bool)

(assert (=> b!1359734 m!1245081))

(declare-fun m!1245083 () Bool)

(assert (=> b!1359735 m!1245083))

(declare-fun m!1245085 () Bool)

(assert (=> b!1359724 m!1245085))

(declare-fun m!1245087 () Bool)

(assert (=> b!1359724 m!1245087))

(declare-fun m!1245089 () Bool)

(assert (=> b!1359724 m!1245089))

(declare-fun m!1245091 () Bool)

(assert (=> b!1359724 m!1245091))

(assert (=> b!1359724 m!1245081))

(assert (=> b!1359724 m!1245087))

(assert (=> b!1359724 m!1245089))

(declare-fun m!1245093 () Bool)

(assert (=> b!1359724 m!1245093))

(declare-fun m!1245095 () Bool)

(assert (=> b!1359731 m!1245095))

(declare-fun m!1245097 () Bool)

(assert (=> b!1359736 m!1245097))

(declare-fun m!1245099 () Bool)

(assert (=> b!1359728 m!1245099))

(assert (=> b!1359729 m!1245087))

(assert (=> b!1359729 m!1245087))

(declare-fun m!1245101 () Bool)

(assert (=> b!1359729 m!1245101))

(push 1)

