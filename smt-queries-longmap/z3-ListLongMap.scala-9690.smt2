; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114478 () Bool)

(assert start!114478)

(declare-fun b!1358586 () Bool)

(declare-datatypes ((Unit!44697 0))(
  ( (Unit!44698) )
))
(declare-fun e!771059 () Unit!44697)

(declare-fun lt!599378 () Unit!44697)

(assert (=> b!1358586 (= e!771059 lt!599378)))

(declare-fun lt!599380 () Unit!44697)

(declare-datatypes ((List!31720 0))(
  ( (Nil!31717) (Cons!31716 (h!32925 (_ BitVec 64)) (t!46390 List!31720)) )
))
(declare-fun acc!759 () List!31720)

(declare-fun lemmaListSubSeqRefl!0 (List!31720) Unit!44697)

(assert (=> b!1358586 (= lt!599380 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!831 (List!31720 List!31720) Bool)

(assert (=> b!1358586 (subseq!831 acc!759 acc!759)))

(declare-datatypes ((array!92474 0))(
  ( (array!92475 (arr!44679 (Array (_ BitVec 32) (_ BitVec 64))) (size!45229 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92474)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92474 List!31720 List!31720 (_ BitVec 32)) Unit!44697)

(declare-fun $colon$colon!834 (List!31720 (_ BitVec 64)) List!31720)

(assert (=> b!1358586 (= lt!599378 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!834 acc!759 (select (arr!44679 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92474 (_ BitVec 32) List!31720) Bool)

(assert (=> b!1358586 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1358587 () Bool)

(declare-fun res!903216 () Bool)

(declare-fun e!771060 () Bool)

(assert (=> b!1358587 (=> (not res!903216) (not e!771060))))

(declare-fun contains!9429 (List!31720 (_ BitVec 64)) Bool)

(assert (=> b!1358587 (= res!903216 (not (contains!9429 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358588 () Bool)

(declare-fun res!903213 () Bool)

(assert (=> b!1358588 (=> (not res!903213) (not e!771060))))

(assert (=> b!1358588 (= res!903213 (not (contains!9429 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358589 () Bool)

(declare-fun res!903220 () Bool)

(assert (=> b!1358589 (=> (not res!903220) (not e!771060))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1358589 (= res!903220 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45229 a!3742))))))

(declare-fun b!1358590 () Bool)

(declare-fun res!903212 () Bool)

(assert (=> b!1358590 (=> (not res!903212) (not e!771060))))

(declare-fun noDuplicate!2286 (List!31720) Bool)

(assert (=> b!1358590 (= res!903212 (noDuplicate!2286 acc!759))))

(declare-fun res!903215 () Bool)

(assert (=> start!114478 (=> (not res!903215) (not e!771060))))

(assert (=> start!114478 (= res!903215 (and (bvslt (size!45229 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45229 a!3742))))))

(assert (=> start!114478 e!771060))

(assert (=> start!114478 true))

(declare-fun array_inv!33707 (array!92474) Bool)

(assert (=> start!114478 (array_inv!33707 a!3742)))

(declare-fun b!1358591 () Bool)

(declare-fun res!903214 () Bool)

(assert (=> b!1358591 (=> (not res!903214) (not e!771060))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1358591 (= res!903214 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1358592 () Bool)

(declare-fun Unit!44699 () Unit!44697)

(assert (=> b!1358592 (= e!771059 Unit!44699)))

(declare-fun b!1358593 () Bool)

(assert (=> b!1358593 (= e!771060 (and (= from!3120 i!1404) (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!599379 () Unit!44697)

(assert (=> b!1358593 (= lt!599379 e!771059)))

(declare-fun c!127127 () Bool)

(assert (=> b!1358593 (= c!127127 (validKeyInArray!0 (select (arr!44679 a!3742) from!3120)))))

(declare-fun b!1358594 () Bool)

(declare-fun res!903219 () Bool)

(assert (=> b!1358594 (=> (not res!903219) (not e!771060))))

(assert (=> b!1358594 (= res!903219 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31717))))

(declare-fun b!1358595 () Bool)

(declare-fun res!903218 () Bool)

(assert (=> b!1358595 (=> (not res!903218) (not e!771060))))

(assert (=> b!1358595 (= res!903218 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1358596 () Bool)

(declare-fun res!903217 () Bool)

(assert (=> b!1358596 (=> (not res!903217) (not e!771060))))

(assert (=> b!1358596 (= res!903217 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45229 a!3742)))))

(assert (= (and start!114478 res!903215) b!1358590))

(assert (= (and b!1358590 res!903212) b!1358587))

(assert (= (and b!1358587 res!903216) b!1358588))

(assert (= (and b!1358588 res!903213) b!1358594))

(assert (= (and b!1358594 res!903219) b!1358595))

(assert (= (and b!1358595 res!903218) b!1358589))

(assert (= (and b!1358589 res!903220) b!1358591))

(assert (= (and b!1358591 res!903214) b!1358596))

(assert (= (and b!1358596 res!903217) b!1358593))

(assert (= (and b!1358593 c!127127) b!1358586))

(assert (= (and b!1358593 (not c!127127)) b!1358592))

(declare-fun m!1244147 () Bool)

(assert (=> b!1358587 m!1244147))

(declare-fun m!1244149 () Bool)

(assert (=> b!1358590 m!1244149))

(declare-fun m!1244151 () Bool)

(assert (=> b!1358588 m!1244151))

(declare-fun m!1244153 () Bool)

(assert (=> b!1358594 m!1244153))

(declare-fun m!1244155 () Bool)

(assert (=> start!114478 m!1244155))

(declare-fun m!1244157 () Bool)

(assert (=> b!1358593 m!1244157))

(assert (=> b!1358593 m!1244157))

(declare-fun m!1244159 () Bool)

(assert (=> b!1358593 m!1244159))

(declare-fun m!1244161 () Bool)

(assert (=> b!1358586 m!1244161))

(assert (=> b!1358586 m!1244157))

(declare-fun m!1244163 () Bool)

(assert (=> b!1358586 m!1244163))

(declare-fun m!1244165 () Bool)

(assert (=> b!1358586 m!1244165))

(declare-fun m!1244167 () Bool)

(assert (=> b!1358586 m!1244167))

(assert (=> b!1358586 m!1244157))

(assert (=> b!1358586 m!1244163))

(declare-fun m!1244169 () Bool)

(assert (=> b!1358586 m!1244169))

(declare-fun m!1244171 () Bool)

(assert (=> b!1358595 m!1244171))

(declare-fun m!1244173 () Bool)

(assert (=> b!1358591 m!1244173))

(check-sat (not b!1358586) (not b!1358587) (not b!1358591) (not b!1358594) (not b!1358593) (not start!114478) (not b!1358595) (not b!1358590) (not b!1358588))
(check-sat)
