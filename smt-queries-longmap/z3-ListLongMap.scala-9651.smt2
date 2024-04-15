; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114044 () Bool)

(assert start!114044)

(declare-fun b!1353540 () Bool)

(declare-fun res!898755 () Bool)

(declare-fun e!769144 () Bool)

(assert (=> b!1353540 (=> (not res!898755) (not e!769144))))

(declare-datatypes ((List!31655 0))(
  ( (Nil!31652) (Cons!31651 (h!32860 (_ BitVec 64)) (t!46305 List!31655)) )
))
(declare-fun lt!597760 () List!31655)

(declare-fun noDuplicate!2190 (List!31655) Bool)

(assert (=> b!1353540 (= res!898755 (noDuplicate!2190 lt!597760))))

(declare-fun b!1353541 () Bool)

(declare-fun res!898757 () Bool)

(declare-fun e!769143 () Bool)

(assert (=> b!1353541 (=> (not res!898757) (not e!769143))))

(declare-fun acc!759 () List!31655)

(declare-datatypes ((array!92175 0))(
  ( (array!92176 (arr!44536 (Array (_ BitVec 32) (_ BitVec 64))) (size!45088 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92175)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92175 (_ BitVec 32) List!31655) Bool)

(assert (=> b!1353541 (= res!898757 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1353542 () Bool)

(declare-fun res!898749 () Bool)

(assert (=> b!1353542 (=> (not res!898749) (not e!769143))))

(assert (=> b!1353542 (= res!898749 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31652))))

(declare-fun b!1353543 () Bool)

(declare-fun res!898750 () Bool)

(assert (=> b!1353543 (=> (not res!898750) (not e!769144))))

(declare-fun contains!9275 (List!31655 (_ BitVec 64)) Bool)

(assert (=> b!1353543 (= res!898750 (not (contains!9275 lt!597760 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353544 () Bool)

(declare-fun res!898756 () Bool)

(assert (=> b!1353544 (=> (not res!898756) (not e!769143))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1353544 (= res!898756 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45088 a!3742))))))

(declare-fun b!1353545 () Bool)

(declare-fun res!898748 () Bool)

(assert (=> b!1353545 (=> (not res!898748) (not e!769143))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1353545 (= res!898748 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1353546 () Bool)

(declare-fun res!898752 () Bool)

(assert (=> b!1353546 (=> (not res!898752) (not e!769143))))

(assert (=> b!1353546 (= res!898752 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45088 a!3742)))))

(declare-fun b!1353547 () Bool)

(declare-fun e!769147 () Bool)

(assert (=> b!1353547 (= e!769147 e!769144)))

(declare-fun res!898747 () Bool)

(assert (=> b!1353547 (=> (not res!898747) (not e!769144))))

(assert (=> b!1353547 (= res!898747 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!748 (List!31655 (_ BitVec 64)) List!31655)

(assert (=> b!1353547 (= lt!597760 ($colon$colon!748 acc!759 (select (arr!44536 a!3742) from!3120)))))

(declare-fun b!1353548 () Bool)

(declare-fun res!898758 () Bool)

(assert (=> b!1353548 (=> (not res!898758) (not e!769143))))

(assert (=> b!1353548 (= res!898758 (not (contains!9275 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353549 () Bool)

(declare-datatypes ((Unit!44265 0))(
  ( (Unit!44266) )
))
(declare-fun e!769146 () Unit!44265)

(declare-fun lt!597755 () Unit!44265)

(assert (=> b!1353549 (= e!769146 lt!597755)))

(declare-fun lt!597757 () Unit!44265)

(declare-fun lemmaListSubSeqRefl!0 (List!31655) Unit!44265)

(assert (=> b!1353549 (= lt!597757 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!731 (List!31655 List!31655) Bool)

(assert (=> b!1353549 (subseq!731 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92175 List!31655 List!31655 (_ BitVec 32)) Unit!44265)

(assert (=> b!1353549 (= lt!597755 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!748 acc!759 (select (arr!44536 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1353549 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1353550 () Bool)

(assert (=> b!1353550 (= e!769144 false)))

(declare-fun lt!597756 () Bool)

(assert (=> b!1353550 (= lt!597756 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597760))))

(declare-fun b!1353552 () Bool)

(declare-fun res!898759 () Bool)

(assert (=> b!1353552 (=> (not res!898759) (not e!769143))))

(assert (=> b!1353552 (= res!898759 (noDuplicate!2190 acc!759))))

(declare-fun b!1353553 () Bool)

(declare-fun res!898760 () Bool)

(assert (=> b!1353553 (=> (not res!898760) (not e!769143))))

(assert (=> b!1353553 (= res!898760 (not (contains!9275 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353554 () Bool)

(declare-fun Unit!44267 () Unit!44265)

(assert (=> b!1353554 (= e!769146 Unit!44267)))

(declare-fun b!1353555 () Bool)

(declare-fun res!898751 () Bool)

(assert (=> b!1353555 (=> (not res!898751) (not e!769144))))

(assert (=> b!1353555 (= res!898751 (not (contains!9275 lt!597760 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!898753 () Bool)

(assert (=> start!114044 (=> (not res!898753) (not e!769143))))

(assert (=> start!114044 (= res!898753 (and (bvslt (size!45088 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45088 a!3742))))))

(assert (=> start!114044 e!769143))

(assert (=> start!114044 true))

(declare-fun array_inv!33769 (array!92175) Bool)

(assert (=> start!114044 (array_inv!33769 a!3742)))

(declare-fun b!1353551 () Bool)

(assert (=> b!1353551 (= e!769143 e!769147)))

(declare-fun res!898754 () Bool)

(assert (=> b!1353551 (=> (not res!898754) (not e!769147))))

(declare-fun lt!597759 () Bool)

(assert (=> b!1353551 (= res!898754 (and (not (= from!3120 i!1404)) lt!597759))))

(declare-fun lt!597758 () Unit!44265)

(assert (=> b!1353551 (= lt!597758 e!769146)))

(declare-fun c!126839 () Bool)

(assert (=> b!1353551 (= c!126839 lt!597759)))

(assert (=> b!1353551 (= lt!597759 (validKeyInArray!0 (select (arr!44536 a!3742) from!3120)))))

(assert (= (and start!114044 res!898753) b!1353552))

(assert (= (and b!1353552 res!898759) b!1353548))

(assert (= (and b!1353548 res!898758) b!1353553))

(assert (= (and b!1353553 res!898760) b!1353542))

(assert (= (and b!1353542 res!898749) b!1353541))

(assert (= (and b!1353541 res!898757) b!1353544))

(assert (= (and b!1353544 res!898756) b!1353545))

(assert (= (and b!1353545 res!898748) b!1353546))

(assert (= (and b!1353546 res!898752) b!1353551))

(assert (= (and b!1353551 c!126839) b!1353549))

(assert (= (and b!1353551 (not c!126839)) b!1353554))

(assert (= (and b!1353551 res!898754) b!1353547))

(assert (= (and b!1353547 res!898747) b!1353540))

(assert (= (and b!1353540 res!898755) b!1353543))

(assert (= (and b!1353543 res!898750) b!1353555))

(assert (= (and b!1353555 res!898751) b!1353550))

(declare-fun m!1239673 () Bool)

(assert (=> b!1353551 m!1239673))

(assert (=> b!1353551 m!1239673))

(declare-fun m!1239675 () Bool)

(assert (=> b!1353551 m!1239675))

(declare-fun m!1239677 () Bool)

(assert (=> b!1353553 m!1239677))

(declare-fun m!1239679 () Bool)

(assert (=> b!1353555 m!1239679))

(assert (=> b!1353547 m!1239673))

(assert (=> b!1353547 m!1239673))

(declare-fun m!1239681 () Bool)

(assert (=> b!1353547 m!1239681))

(declare-fun m!1239683 () Bool)

(assert (=> b!1353550 m!1239683))

(declare-fun m!1239685 () Bool)

(assert (=> b!1353541 m!1239685))

(declare-fun m!1239687 () Bool)

(assert (=> start!114044 m!1239687))

(declare-fun m!1239689 () Bool)

(assert (=> b!1353549 m!1239689))

(assert (=> b!1353549 m!1239673))

(assert (=> b!1353549 m!1239681))

(declare-fun m!1239691 () Bool)

(assert (=> b!1353549 m!1239691))

(declare-fun m!1239693 () Bool)

(assert (=> b!1353549 m!1239693))

(assert (=> b!1353549 m!1239673))

(assert (=> b!1353549 m!1239681))

(declare-fun m!1239695 () Bool)

(assert (=> b!1353549 m!1239695))

(declare-fun m!1239697 () Bool)

(assert (=> b!1353545 m!1239697))

(declare-fun m!1239699 () Bool)

(assert (=> b!1353548 m!1239699))

(declare-fun m!1239701 () Bool)

(assert (=> b!1353552 m!1239701))

(declare-fun m!1239703 () Bool)

(assert (=> b!1353540 m!1239703))

(declare-fun m!1239705 () Bool)

(assert (=> b!1353543 m!1239705))

(declare-fun m!1239707 () Bool)

(assert (=> b!1353542 m!1239707))

(check-sat (not b!1353540) (not b!1353548) (not b!1353545) (not b!1353542) (not b!1353555) (not b!1353549) (not b!1353551) (not b!1353550) (not b!1353553) (not b!1353547) (not b!1353552) (not start!114044) (not b!1353543) (not b!1353541))
(check-sat)
