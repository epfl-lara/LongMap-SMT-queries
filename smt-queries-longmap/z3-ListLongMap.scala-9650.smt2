; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114262 () Bool)

(assert start!114262)

(declare-fun b!1354765 () Bool)

(declare-fun res!899180 () Bool)

(declare-fun e!769976 () Bool)

(assert (=> b!1354765 (=> (not res!899180) (not e!769976))))

(declare-datatypes ((List!31639 0))(
  ( (Nil!31636) (Cons!31635 (h!32853 (_ BitVec 64)) (t!46289 List!31639)) )
))
(declare-fun lt!598368 () List!31639)

(declare-fun contains!9351 (List!31639 (_ BitVec 64)) Bool)

(assert (=> b!1354765 (= res!899180 (not (contains!9351 lt!598368 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354766 () Bool)

(assert (=> b!1354766 (= e!769976 false)))

(declare-fun lt!598366 () Bool)

(declare-datatypes ((array!92335 0))(
  ( (array!92336 (arr!44611 (Array (_ BitVec 32) (_ BitVec 64))) (size!45162 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92335)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92335 (_ BitVec 32) List!31639) Bool)

(assert (=> b!1354766 (= lt!598366 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!598368))))

(declare-fun b!1354767 () Bool)

(declare-fun res!899175 () Bool)

(declare-fun e!769977 () Bool)

(assert (=> b!1354767 (=> (not res!899175) (not e!769977))))

(declare-fun acc!759 () List!31639)

(assert (=> b!1354767 (= res!899175 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1354769 () Bool)

(declare-fun res!899179 () Bool)

(assert (=> b!1354769 (=> (not res!899179) (not e!769977))))

(declare-fun noDuplicate!2182 (List!31639) Bool)

(assert (=> b!1354769 (= res!899179 (noDuplicate!2182 acc!759))))

(declare-fun b!1354770 () Bool)

(declare-fun res!899170 () Bool)

(assert (=> b!1354770 (=> (not res!899170) (not e!769977))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1354770 (= res!899170 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45162 a!3742))))))

(declare-fun b!1354771 () Bool)

(declare-fun res!899178 () Bool)

(assert (=> b!1354771 (=> (not res!899178) (not e!769977))))

(assert (=> b!1354771 (= res!899178 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31636))))

(declare-fun b!1354772 () Bool)

(declare-datatypes ((Unit!44354 0))(
  ( (Unit!44355) )
))
(declare-fun e!769974 () Unit!44354)

(declare-fun Unit!44356 () Unit!44354)

(assert (=> b!1354772 (= e!769974 Unit!44356)))

(declare-fun b!1354768 () Bool)

(declare-fun res!899176 () Bool)

(assert (=> b!1354768 (=> (not res!899176) (not e!769976))))

(assert (=> b!1354768 (= res!899176 (not (contains!9351 lt!598368 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!899181 () Bool)

(assert (=> start!114262 (=> (not res!899181) (not e!769977))))

(assert (=> start!114262 (= res!899181 (and (bvslt (size!45162 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45162 a!3742))))))

(assert (=> start!114262 e!769977))

(assert (=> start!114262 true))

(declare-fun array_inv!33892 (array!92335) Bool)

(assert (=> start!114262 (array_inv!33892 a!3742)))

(declare-fun b!1354773 () Bool)

(declare-fun e!769978 () Bool)

(assert (=> b!1354773 (= e!769977 e!769978)))

(declare-fun res!899171 () Bool)

(assert (=> b!1354773 (=> (not res!899171) (not e!769978))))

(declare-fun lt!598364 () Bool)

(assert (=> b!1354773 (= res!899171 (and (not (= from!3120 i!1404)) lt!598364))))

(declare-fun lt!598367 () Unit!44354)

(assert (=> b!1354773 (= lt!598367 e!769974)))

(declare-fun c!127246 () Bool)

(assert (=> b!1354773 (= c!127246 lt!598364)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1354773 (= lt!598364 (validKeyInArray!0 (select (arr!44611 a!3742) from!3120)))))

(declare-fun b!1354774 () Bool)

(declare-fun res!899174 () Bool)

(assert (=> b!1354774 (=> (not res!899174) (not e!769977))))

(assert (=> b!1354774 (= res!899174 (not (contains!9351 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354775 () Bool)

(declare-fun res!899168 () Bool)

(assert (=> b!1354775 (=> (not res!899168) (not e!769977))))

(assert (=> b!1354775 (= res!899168 (not (contains!9351 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354776 () Bool)

(declare-fun res!899169 () Bool)

(assert (=> b!1354776 (=> (not res!899169) (not e!769977))))

(assert (=> b!1354776 (= res!899169 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45162 a!3742)))))

(declare-fun b!1354777 () Bool)

(declare-fun res!899172 () Bool)

(assert (=> b!1354777 (=> (not res!899172) (not e!769977))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1354777 (= res!899172 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1354778 () Bool)

(declare-fun lt!598363 () Unit!44354)

(assert (=> b!1354778 (= e!769974 lt!598363)))

(declare-fun lt!598365 () Unit!44354)

(declare-fun lemmaListSubSeqRefl!0 (List!31639) Unit!44354)

(assert (=> b!1354778 (= lt!598365 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!728 (List!31639 List!31639) Bool)

(assert (=> b!1354778 (subseq!728 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92335 List!31639 List!31639 (_ BitVec 32)) Unit!44354)

(declare-fun $colon$colon!742 (List!31639 (_ BitVec 64)) List!31639)

(assert (=> b!1354778 (= lt!598363 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!742 acc!759 (select (arr!44611 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1354778 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1354779 () Bool)

(assert (=> b!1354779 (= e!769978 e!769976)))

(declare-fun res!899173 () Bool)

(assert (=> b!1354779 (=> (not res!899173) (not e!769976))))

(assert (=> b!1354779 (= res!899173 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1354779 (= lt!598368 ($colon$colon!742 acc!759 (select (arr!44611 a!3742) from!3120)))))

(declare-fun b!1354780 () Bool)

(declare-fun res!899177 () Bool)

(assert (=> b!1354780 (=> (not res!899177) (not e!769976))))

(assert (=> b!1354780 (= res!899177 (noDuplicate!2182 lt!598368))))

(assert (= (and start!114262 res!899181) b!1354769))

(assert (= (and b!1354769 res!899179) b!1354774))

(assert (= (and b!1354774 res!899174) b!1354775))

(assert (= (and b!1354775 res!899168) b!1354771))

(assert (= (and b!1354771 res!899178) b!1354767))

(assert (= (and b!1354767 res!899175) b!1354770))

(assert (= (and b!1354770 res!899170) b!1354777))

(assert (= (and b!1354777 res!899172) b!1354776))

(assert (= (and b!1354776 res!899169) b!1354773))

(assert (= (and b!1354773 c!127246) b!1354778))

(assert (= (and b!1354773 (not c!127246)) b!1354772))

(assert (= (and b!1354773 res!899171) b!1354779))

(assert (= (and b!1354779 res!899173) b!1354780))

(assert (= (and b!1354780 res!899177) b!1354768))

(assert (= (and b!1354768 res!899176) b!1354765))

(assert (= (and b!1354765 res!899180) b!1354766))

(declare-fun m!1241677 () Bool)

(assert (=> b!1354778 m!1241677))

(declare-fun m!1241679 () Bool)

(assert (=> b!1354778 m!1241679))

(declare-fun m!1241681 () Bool)

(assert (=> b!1354778 m!1241681))

(declare-fun m!1241683 () Bool)

(assert (=> b!1354778 m!1241683))

(declare-fun m!1241685 () Bool)

(assert (=> b!1354778 m!1241685))

(assert (=> b!1354778 m!1241679))

(assert (=> b!1354778 m!1241681))

(declare-fun m!1241687 () Bool)

(assert (=> b!1354778 m!1241687))

(declare-fun m!1241689 () Bool)

(assert (=> b!1354765 m!1241689))

(declare-fun m!1241691 () Bool)

(assert (=> b!1354771 m!1241691))

(declare-fun m!1241693 () Bool)

(assert (=> start!114262 m!1241693))

(declare-fun m!1241695 () Bool)

(assert (=> b!1354767 m!1241695))

(declare-fun m!1241697 () Bool)

(assert (=> b!1354768 m!1241697))

(declare-fun m!1241699 () Bool)

(assert (=> b!1354766 m!1241699))

(declare-fun m!1241701 () Bool)

(assert (=> b!1354777 m!1241701))

(assert (=> b!1354779 m!1241679))

(assert (=> b!1354779 m!1241679))

(assert (=> b!1354779 m!1241681))

(declare-fun m!1241703 () Bool)

(assert (=> b!1354775 m!1241703))

(declare-fun m!1241705 () Bool)

(assert (=> b!1354780 m!1241705))

(declare-fun m!1241707 () Bool)

(assert (=> b!1354769 m!1241707))

(assert (=> b!1354773 m!1241679))

(assert (=> b!1354773 m!1241679))

(declare-fun m!1241709 () Bool)

(assert (=> b!1354773 m!1241709))

(declare-fun m!1241711 () Bool)

(assert (=> b!1354774 m!1241711))

(check-sat (not b!1354780) (not b!1354777) (not b!1354768) (not b!1354778) (not b!1354779) (not b!1354774) (not b!1354771) (not start!114262) (not b!1354767) (not b!1354775) (not b!1354769) (not b!1354765) (not b!1354773) (not b!1354766))
(check-sat)
