; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113924 () Bool)

(assert start!113924)

(declare-fun b!1351126 () Bool)

(declare-fun e!768429 () Bool)

(assert (=> b!1351126 (= e!768429 true)))

(declare-fun lt!596980 () Bool)

(declare-datatypes ((List!31595 0))(
  ( (Nil!31592) (Cons!31591 (h!32800 (_ BitVec 64)) (t!46245 List!31595)) )
))
(declare-fun lt!596977 () List!31595)

(declare-datatypes ((array!92055 0))(
  ( (array!92056 (arr!44476 (Array (_ BitVec 32) (_ BitVec 64))) (size!45028 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92055)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92055 (_ BitVec 32) List!31595) Bool)

(assert (=> b!1351126 (= lt!596980 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!596977))))

(declare-datatypes ((Unit!44097 0))(
  ( (Unit!44098) )
))
(declare-fun lt!596979 () Unit!44097)

(declare-fun acc!759 () List!31595)

(declare-fun noDuplicateSubseq!122 (List!31595 List!31595) Unit!44097)

(assert (=> b!1351126 (= lt!596979 (noDuplicateSubseq!122 acc!759 lt!596977))))

(declare-fun b!1351127 () Bool)

(declare-fun res!896635 () Bool)

(declare-fun e!768428 () Bool)

(assert (=> b!1351127 (=> (not res!896635) (not e!768428))))

(assert (=> b!1351127 (= res!896635 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31592))))

(declare-fun b!1351128 () Bool)

(declare-fun res!896632 () Bool)

(assert (=> b!1351128 (=> res!896632 e!768429)))

(declare-fun contains!9215 (List!31595 (_ BitVec 64)) Bool)

(assert (=> b!1351128 (= res!896632 (contains!9215 lt!596977 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351129 () Bool)

(assert (=> b!1351129 (= e!768428 (not e!768429))))

(declare-fun res!896630 () Bool)

(assert (=> b!1351129 (=> res!896630 e!768429)))

(assert (=> b!1351129 (= res!896630 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!688 (List!31595 (_ BitVec 64)) List!31595)

(assert (=> b!1351129 (= lt!596977 ($colon$colon!688 acc!759 (select (arr!44476 a!3742) from!3120)))))

(declare-fun subseq!671 (List!31595 List!31595) Bool)

(assert (=> b!1351129 (subseq!671 acc!759 acc!759)))

(declare-fun lt!596978 () Unit!44097)

(declare-fun lemmaListSubSeqRefl!0 (List!31595) Unit!44097)

(assert (=> b!1351129 (= lt!596978 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1351130 () Bool)

(declare-fun res!896631 () Bool)

(assert (=> b!1351130 (=> (not res!896631) (not e!768428))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1351130 (= res!896631 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45028 a!3742))))))

(declare-fun b!1351131 () Bool)

(declare-fun res!896633 () Bool)

(assert (=> b!1351131 (=> (not res!896633) (not e!768428))))

(assert (=> b!1351131 (= res!896633 (not (contains!9215 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351132 () Bool)

(declare-fun res!896626 () Bool)

(assert (=> b!1351132 (=> res!896626 e!768429)))

(assert (=> b!1351132 (= res!896626 (contains!9215 lt!596977 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351133 () Bool)

(declare-fun res!896639 () Bool)

(assert (=> b!1351133 (=> (not res!896639) (not e!768428))))

(assert (=> b!1351133 (= res!896639 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun res!896636 () Bool)

(assert (=> start!113924 (=> (not res!896636) (not e!768428))))

(assert (=> start!113924 (= res!896636 (and (bvslt (size!45028 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45028 a!3742))))))

(assert (=> start!113924 e!768428))

(assert (=> start!113924 true))

(declare-fun array_inv!33709 (array!92055) Bool)

(assert (=> start!113924 (array_inv!33709 a!3742)))

(declare-fun b!1351134 () Bool)

(declare-fun res!896638 () Bool)

(assert (=> b!1351134 (=> (not res!896638) (not e!768428))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1351134 (= res!896638 (validKeyInArray!0 (select (arr!44476 a!3742) from!3120)))))

(declare-fun b!1351135 () Bool)

(declare-fun res!896637 () Bool)

(assert (=> b!1351135 (=> res!896637 e!768429)))

(declare-fun noDuplicate!2130 (List!31595) Bool)

(assert (=> b!1351135 (= res!896637 (not (noDuplicate!2130 lt!596977)))))

(declare-fun b!1351136 () Bool)

(declare-fun res!896627 () Bool)

(assert (=> b!1351136 (=> (not res!896627) (not e!768428))))

(assert (=> b!1351136 (= res!896627 (noDuplicate!2130 acc!759))))

(declare-fun b!1351137 () Bool)

(declare-fun res!896625 () Bool)

(assert (=> b!1351137 (=> (not res!896625) (not e!768428))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1351137 (= res!896625 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1351138 () Bool)

(declare-fun res!896634 () Bool)

(assert (=> b!1351138 (=> (not res!896634) (not e!768428))))

(assert (=> b!1351138 (= res!896634 (not (contains!9215 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351139 () Bool)

(declare-fun res!896629 () Bool)

(assert (=> b!1351139 (=> (not res!896629) (not e!768428))))

(assert (=> b!1351139 (= res!896629 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45028 a!3742)))))

(declare-fun b!1351140 () Bool)

(declare-fun res!896628 () Bool)

(assert (=> b!1351140 (=> res!896628 e!768429)))

(assert (=> b!1351140 (= res!896628 (not (subseq!671 acc!759 lt!596977)))))

(assert (= (and start!113924 res!896636) b!1351136))

(assert (= (and b!1351136 res!896627) b!1351138))

(assert (= (and b!1351138 res!896634) b!1351131))

(assert (= (and b!1351131 res!896633) b!1351127))

(assert (= (and b!1351127 res!896635) b!1351133))

(assert (= (and b!1351133 res!896639) b!1351130))

(assert (= (and b!1351130 res!896631) b!1351137))

(assert (= (and b!1351137 res!896625) b!1351139))

(assert (= (and b!1351139 res!896629) b!1351134))

(assert (= (and b!1351134 res!896638) b!1351129))

(assert (= (and b!1351129 (not res!896630)) b!1351135))

(assert (= (and b!1351135 (not res!896637)) b!1351128))

(assert (= (and b!1351128 (not res!896632)) b!1351132))

(assert (= (and b!1351132 (not res!896626)) b!1351140))

(assert (= (and b!1351140 (not res!896628)) b!1351126))

(declare-fun m!1237753 () Bool)

(assert (=> b!1351127 m!1237753))

(declare-fun m!1237755 () Bool)

(assert (=> b!1351134 m!1237755))

(assert (=> b!1351134 m!1237755))

(declare-fun m!1237757 () Bool)

(assert (=> b!1351134 m!1237757))

(declare-fun m!1237759 () Bool)

(assert (=> b!1351128 m!1237759))

(declare-fun m!1237761 () Bool)

(assert (=> b!1351137 m!1237761))

(declare-fun m!1237763 () Bool)

(assert (=> b!1351131 m!1237763))

(declare-fun m!1237765 () Bool)

(assert (=> b!1351133 m!1237765))

(declare-fun m!1237767 () Bool)

(assert (=> start!113924 m!1237767))

(declare-fun m!1237769 () Bool)

(assert (=> b!1351132 m!1237769))

(declare-fun m!1237771 () Bool)

(assert (=> b!1351135 m!1237771))

(declare-fun m!1237773 () Bool)

(assert (=> b!1351140 m!1237773))

(declare-fun m!1237775 () Bool)

(assert (=> b!1351136 m!1237775))

(declare-fun m!1237777 () Bool)

(assert (=> b!1351138 m!1237777))

(assert (=> b!1351129 m!1237755))

(assert (=> b!1351129 m!1237755))

(declare-fun m!1237779 () Bool)

(assert (=> b!1351129 m!1237779))

(declare-fun m!1237781 () Bool)

(assert (=> b!1351129 m!1237781))

(declare-fun m!1237783 () Bool)

(assert (=> b!1351129 m!1237783))

(declare-fun m!1237785 () Bool)

(assert (=> b!1351126 m!1237785))

(declare-fun m!1237787 () Bool)

(assert (=> b!1351126 m!1237787))

(check-sat (not start!113924) (not b!1351131) (not b!1351127) (not b!1351134) (not b!1351140) (not b!1351126) (not b!1351133) (not b!1351128) (not b!1351132) (not b!1351129) (not b!1351136) (not b!1351137) (not b!1351138) (not b!1351135))
(check-sat)
