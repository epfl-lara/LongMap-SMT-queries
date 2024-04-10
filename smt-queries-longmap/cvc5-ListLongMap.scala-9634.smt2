; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113942 () Bool)

(assert start!113942)

(declare-fun b!1351601 () Bool)

(declare-fun res!897065 () Bool)

(declare-fun e!768542 () Bool)

(assert (=> b!1351601 (=> res!897065 e!768542)))

(declare-datatypes ((List!31551 0))(
  ( (Nil!31548) (Cons!31547 (h!32756 (_ BitVec 64)) (t!46209 List!31551)) )
))
(declare-fun acc!759 () List!31551)

(declare-fun lt!597272 () List!31551)

(declare-fun subseq!680 (List!31551 List!31551) Bool)

(assert (=> b!1351601 (= res!897065 (not (subseq!680 acc!759 lt!597272)))))

(declare-fun b!1351602 () Bool)

(declare-fun res!897072 () Bool)

(declare-fun e!768544 () Bool)

(assert (=> b!1351602 (=> (not res!897072) (not e!768544))))

(declare-datatypes ((array!92124 0))(
  ( (array!92125 (arr!44510 (Array (_ BitVec 32) (_ BitVec 64))) (size!45060 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92124)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1351602 (= res!897072 (validKeyInArray!0 (select (arr!44510 a!3742) from!3120)))))

(declare-fun b!1351603 () Bool)

(declare-fun res!897069 () Bool)

(assert (=> b!1351603 (=> res!897069 e!768542)))

(declare-fun contains!9260 (List!31551 (_ BitVec 64)) Bool)

(assert (=> b!1351603 (= res!897069 (contains!9260 lt!597272 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351604 () Bool)

(assert (=> b!1351604 (= e!768542 true)))

(declare-fun lt!597274 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92124 (_ BitVec 32) List!31551) Bool)

(assert (=> b!1351604 (= lt!597274 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597272))))

(declare-datatypes ((Unit!44274 0))(
  ( (Unit!44275) )
))
(declare-fun lt!597273 () Unit!44274)

(declare-fun noDuplicateSubseq!131 (List!31551 List!31551) Unit!44274)

(assert (=> b!1351604 (= lt!597273 (noDuplicateSubseq!131 acc!759 lt!597272))))

(declare-fun b!1351605 () Bool)

(declare-fun res!897066 () Bool)

(assert (=> b!1351605 (=> (not res!897066) (not e!768544))))

(assert (=> b!1351605 (= res!897066 (not (contains!9260 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351606 () Bool)

(declare-fun res!897067 () Bool)

(assert (=> b!1351606 (=> (not res!897067) (not e!768544))))

(assert (=> b!1351606 (= res!897067 (not (contains!9260 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351607 () Bool)

(declare-fun res!897073 () Bool)

(assert (=> b!1351607 (=> res!897073 e!768542)))

(assert (=> b!1351607 (= res!897073 (contains!9260 lt!597272 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351608 () Bool)

(assert (=> b!1351608 (= e!768544 (not e!768542))))

(declare-fun res!897068 () Bool)

(assert (=> b!1351608 (=> res!897068 e!768542)))

(assert (=> b!1351608 (= res!897068 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!695 (List!31551 (_ BitVec 64)) List!31551)

(assert (=> b!1351608 (= lt!597272 ($colon$colon!695 acc!759 (select (arr!44510 a!3742) from!3120)))))

(assert (=> b!1351608 (subseq!680 acc!759 acc!759)))

(declare-fun lt!597271 () Unit!44274)

(declare-fun lemmaListSubSeqRefl!0 (List!31551) Unit!44274)

(assert (=> b!1351608 (= lt!597271 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1351609 () Bool)

(declare-fun res!897061 () Bool)

(assert (=> b!1351609 (=> (not res!897061) (not e!768544))))

(assert (=> b!1351609 (= res!897061 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31548))))

(declare-fun res!897070 () Bool)

(assert (=> start!113942 (=> (not res!897070) (not e!768544))))

(assert (=> start!113942 (= res!897070 (and (bvslt (size!45060 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45060 a!3742))))))

(assert (=> start!113942 e!768544))

(assert (=> start!113942 true))

(declare-fun array_inv!33538 (array!92124) Bool)

(assert (=> start!113942 (array_inv!33538 a!3742)))

(declare-fun b!1351610 () Bool)

(declare-fun res!897060 () Bool)

(assert (=> b!1351610 (=> (not res!897060) (not e!768544))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1351610 (= res!897060 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1351611 () Bool)

(declare-fun res!897064 () Bool)

(assert (=> b!1351611 (=> (not res!897064) (not e!768544))))

(declare-fun noDuplicate!2117 (List!31551) Bool)

(assert (=> b!1351611 (= res!897064 (noDuplicate!2117 acc!759))))

(declare-fun b!1351612 () Bool)

(declare-fun res!897059 () Bool)

(assert (=> b!1351612 (=> (not res!897059) (not e!768544))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1351612 (= res!897059 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45060 a!3742))))))

(declare-fun b!1351613 () Bool)

(declare-fun res!897071 () Bool)

(assert (=> b!1351613 (=> res!897071 e!768542)))

(assert (=> b!1351613 (= res!897071 (not (noDuplicate!2117 lt!597272)))))

(declare-fun b!1351614 () Bool)

(declare-fun res!897062 () Bool)

(assert (=> b!1351614 (=> (not res!897062) (not e!768544))))

(assert (=> b!1351614 (= res!897062 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45060 a!3742)))))

(declare-fun b!1351615 () Bool)

(declare-fun res!897063 () Bool)

(assert (=> b!1351615 (=> (not res!897063) (not e!768544))))

(assert (=> b!1351615 (= res!897063 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(assert (= (and start!113942 res!897070) b!1351611))

(assert (= (and b!1351611 res!897064) b!1351606))

(assert (= (and b!1351606 res!897067) b!1351605))

(assert (= (and b!1351605 res!897066) b!1351609))

(assert (= (and b!1351609 res!897061) b!1351615))

(assert (= (and b!1351615 res!897063) b!1351612))

(assert (= (and b!1351612 res!897059) b!1351610))

(assert (= (and b!1351610 res!897060) b!1351614))

(assert (= (and b!1351614 res!897062) b!1351602))

(assert (= (and b!1351602 res!897072) b!1351608))

(assert (= (and b!1351608 (not res!897068)) b!1351613))

(assert (= (and b!1351613 (not res!897071)) b!1351607))

(assert (= (and b!1351607 (not res!897073)) b!1351603))

(assert (= (and b!1351603 (not res!897069)) b!1351601))

(assert (= (and b!1351601 (not res!897065)) b!1351604))

(declare-fun m!1238593 () Bool)

(assert (=> b!1351602 m!1238593))

(assert (=> b!1351602 m!1238593))

(declare-fun m!1238595 () Bool)

(assert (=> b!1351602 m!1238595))

(declare-fun m!1238597 () Bool)

(assert (=> b!1351609 m!1238597))

(declare-fun m!1238599 () Bool)

(assert (=> b!1351601 m!1238599))

(declare-fun m!1238601 () Bool)

(assert (=> b!1351603 m!1238601))

(assert (=> b!1351608 m!1238593))

(assert (=> b!1351608 m!1238593))

(declare-fun m!1238603 () Bool)

(assert (=> b!1351608 m!1238603))

(declare-fun m!1238605 () Bool)

(assert (=> b!1351608 m!1238605))

(declare-fun m!1238607 () Bool)

(assert (=> b!1351608 m!1238607))

(declare-fun m!1238609 () Bool)

(assert (=> b!1351604 m!1238609))

(declare-fun m!1238611 () Bool)

(assert (=> b!1351604 m!1238611))

(declare-fun m!1238613 () Bool)

(assert (=> b!1351605 m!1238613))

(declare-fun m!1238615 () Bool)

(assert (=> b!1351615 m!1238615))

(declare-fun m!1238617 () Bool)

(assert (=> b!1351607 m!1238617))

(declare-fun m!1238619 () Bool)

(assert (=> b!1351606 m!1238619))

(declare-fun m!1238621 () Bool)

(assert (=> b!1351613 m!1238621))

(declare-fun m!1238623 () Bool)

(assert (=> start!113942 m!1238623))

(declare-fun m!1238625 () Bool)

(assert (=> b!1351610 m!1238625))

(declare-fun m!1238627 () Bool)

(assert (=> b!1351611 m!1238627))

(push 1)

(assert (not b!1351606))

(assert (not start!113942))

(assert (not b!1351601))

(assert (not b!1351609))

(assert (not b!1351603))

(assert (not b!1351608))

(assert (not b!1351602))

(assert (not b!1351615))

(assert (not b!1351611))

(assert (not b!1351604))

(assert (not b!1351610))

(assert (not b!1351613))

(assert (not b!1351607))

(assert (not b!1351605))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

