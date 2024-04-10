; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114066 () Bool)

(assert start!114066)

(declare-fun b!1354138 () Bool)

(declare-fun res!899251 () Bool)

(declare-fun e!769345 () Bool)

(assert (=> b!1354138 (=> (not res!899251) (not e!769345))))

(declare-datatypes ((array!92248 0))(
  ( (array!92249 (arr!44572 (Array (_ BitVec 32) (_ BitVec 64))) (size!45122 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92248)

(declare-datatypes ((List!31613 0))(
  ( (Nil!31610) (Cons!31609 (h!32818 (_ BitVec 64)) (t!46271 List!31613)) )
))
(declare-fun arrayNoDuplicates!0 (array!92248 (_ BitVec 32) List!31613) Bool)

(assert (=> b!1354138 (= res!899251 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31610))))

(declare-fun b!1354139 () Bool)

(declare-fun res!899250 () Bool)

(declare-fun e!769341 () Bool)

(assert (=> b!1354139 (=> (not res!899250) (not e!769341))))

(declare-fun lt!598141 () List!31613)

(declare-fun contains!9322 (List!31613 (_ BitVec 64)) Bool)

(assert (=> b!1354139 (= res!899250 (not (contains!9322 lt!598141 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354140 () Bool)

(declare-datatypes ((Unit!44457 0))(
  ( (Unit!44458) )
))
(declare-fun e!769342 () Unit!44457)

(declare-fun lt!598143 () Unit!44457)

(assert (=> b!1354140 (= e!769342 lt!598143)))

(declare-fun lt!598140 () Unit!44457)

(declare-fun acc!759 () List!31613)

(declare-fun lemmaListSubSeqRefl!0 (List!31613) Unit!44457)

(assert (=> b!1354140 (= lt!598140 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!742 (List!31613 List!31613) Bool)

(assert (=> b!1354140 (subseq!742 acc!759 acc!759)))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92248 List!31613 List!31613 (_ BitVec 32)) Unit!44457)

(declare-fun $colon$colon!757 (List!31613 (_ BitVec 64)) List!31613)

(assert (=> b!1354140 (= lt!598143 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!757 acc!759 (select (arr!44572 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1354140 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1354141 () Bool)

(declare-fun res!899246 () Bool)

(assert (=> b!1354141 (=> (not res!899246) (not e!769345))))

(assert (=> b!1354141 (= res!899246 (not (contains!9322 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354142 () Bool)

(declare-fun res!899241 () Bool)

(assert (=> b!1354142 (=> (not res!899241) (not e!769345))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1354142 (= res!899241 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1354143 () Bool)

(declare-fun res!899244 () Bool)

(assert (=> b!1354143 (=> (not res!899244) (not e!769345))))

(assert (=> b!1354143 (= res!899244 (not (contains!9322 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354144 () Bool)

(declare-fun e!769344 () Bool)

(assert (=> b!1354144 (= e!769345 e!769344)))

(declare-fun res!899247 () Bool)

(assert (=> b!1354144 (=> (not res!899247) (not e!769344))))

(declare-fun lt!598142 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1354144 (= res!899247 (and (not (= from!3120 i!1404)) lt!598142))))

(declare-fun lt!598139 () Unit!44457)

(assert (=> b!1354144 (= lt!598139 e!769342)))

(declare-fun c!126890 () Bool)

(assert (=> b!1354144 (= c!126890 lt!598142)))

(assert (=> b!1354144 (= lt!598142 (validKeyInArray!0 (select (arr!44572 a!3742) from!3120)))))

(declare-fun b!1354145 () Bool)

(declare-fun res!899243 () Bool)

(assert (=> b!1354145 (=> (not res!899243) (not e!769345))))

(declare-fun noDuplicate!2179 (List!31613) Bool)

(assert (=> b!1354145 (= res!899243 (noDuplicate!2179 acc!759))))

(declare-fun b!1354146 () Bool)

(declare-fun res!899239 () Bool)

(assert (=> b!1354146 (=> (not res!899239) (not e!769345))))

(assert (=> b!1354146 (= res!899239 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45122 a!3742))))))

(declare-fun res!899245 () Bool)

(assert (=> start!114066 (=> (not res!899245) (not e!769345))))

(assert (=> start!114066 (= res!899245 (and (bvslt (size!45122 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45122 a!3742))))))

(assert (=> start!114066 e!769345))

(assert (=> start!114066 true))

(declare-fun array_inv!33600 (array!92248) Bool)

(assert (=> start!114066 (array_inv!33600 a!3742)))

(declare-fun b!1354147 () Bool)

(assert (=> b!1354147 (= e!769341 false)))

(declare-fun lt!598144 () Bool)

(assert (=> b!1354147 (= lt!598144 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!598141))))

(declare-fun b!1354148 () Bool)

(declare-fun res!899242 () Bool)

(assert (=> b!1354148 (=> (not res!899242) (not e!769341))))

(assert (=> b!1354148 (= res!899242 (not (contains!9322 lt!598141 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354149 () Bool)

(declare-fun res!899238 () Bool)

(assert (=> b!1354149 (=> (not res!899238) (not e!769345))))

(assert (=> b!1354149 (= res!899238 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45122 a!3742)))))

(declare-fun b!1354150 () Bool)

(assert (=> b!1354150 (= e!769344 e!769341)))

(declare-fun res!899240 () Bool)

(assert (=> b!1354150 (=> (not res!899240) (not e!769341))))

(assert (=> b!1354150 (= res!899240 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1354150 (= lt!598141 ($colon$colon!757 acc!759 (select (arr!44572 a!3742) from!3120)))))

(declare-fun b!1354151 () Bool)

(declare-fun res!899248 () Bool)

(assert (=> b!1354151 (=> (not res!899248) (not e!769345))))

(assert (=> b!1354151 (= res!899248 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1354152 () Bool)

(declare-fun res!899249 () Bool)

(assert (=> b!1354152 (=> (not res!899249) (not e!769341))))

(assert (=> b!1354152 (= res!899249 (noDuplicate!2179 lt!598141))))

(declare-fun b!1354153 () Bool)

(declare-fun Unit!44459 () Unit!44457)

(assert (=> b!1354153 (= e!769342 Unit!44459)))

(assert (= (and start!114066 res!899245) b!1354145))

(assert (= (and b!1354145 res!899243) b!1354143))

(assert (= (and b!1354143 res!899244) b!1354141))

(assert (= (and b!1354141 res!899246) b!1354138))

(assert (= (and b!1354138 res!899251) b!1354151))

(assert (= (and b!1354151 res!899248) b!1354146))

(assert (= (and b!1354146 res!899239) b!1354142))

(assert (= (and b!1354142 res!899241) b!1354149))

(assert (= (and b!1354149 res!899238) b!1354144))

(assert (= (and b!1354144 c!126890) b!1354140))

(assert (= (and b!1354144 (not c!126890)) b!1354153))

(assert (= (and b!1354144 res!899247) b!1354150))

(assert (= (and b!1354150 res!899240) b!1354152))

(assert (= (and b!1354152 res!899249) b!1354139))

(assert (= (and b!1354139 res!899250) b!1354148))

(assert (= (and b!1354148 res!899242) b!1354147))

(declare-fun m!1240585 () Bool)

(assert (=> b!1354140 m!1240585))

(declare-fun m!1240587 () Bool)

(assert (=> b!1354140 m!1240587))

(declare-fun m!1240589 () Bool)

(assert (=> b!1354140 m!1240589))

(declare-fun m!1240591 () Bool)

(assert (=> b!1354140 m!1240591))

(declare-fun m!1240593 () Bool)

(assert (=> b!1354140 m!1240593))

(assert (=> b!1354140 m!1240587))

(assert (=> b!1354140 m!1240589))

(declare-fun m!1240595 () Bool)

(assert (=> b!1354140 m!1240595))

(declare-fun m!1240597 () Bool)

(assert (=> b!1354141 m!1240597))

(declare-fun m!1240599 () Bool)

(assert (=> b!1354147 m!1240599))

(assert (=> b!1354150 m!1240587))

(assert (=> b!1354150 m!1240587))

(assert (=> b!1354150 m!1240589))

(declare-fun m!1240601 () Bool)

(assert (=> b!1354145 m!1240601))

(declare-fun m!1240603 () Bool)

(assert (=> start!114066 m!1240603))

(declare-fun m!1240605 () Bool)

(assert (=> b!1354143 m!1240605))

(declare-fun m!1240607 () Bool)

(assert (=> b!1354151 m!1240607))

(declare-fun m!1240609 () Bool)

(assert (=> b!1354139 m!1240609))

(declare-fun m!1240611 () Bool)

(assert (=> b!1354152 m!1240611))

(declare-fun m!1240613 () Bool)

(assert (=> b!1354148 m!1240613))

(assert (=> b!1354144 m!1240587))

(assert (=> b!1354144 m!1240587))

(declare-fun m!1240615 () Bool)

(assert (=> b!1354144 m!1240615))

(declare-fun m!1240617 () Bool)

(assert (=> b!1354138 m!1240617))

(declare-fun m!1240619 () Bool)

(assert (=> b!1354142 m!1240619))

(push 1)

