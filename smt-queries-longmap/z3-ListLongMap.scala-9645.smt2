; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114232 () Bool)

(assert start!114232)

(declare-fun b!1354120 () Bool)

(declare-fun res!898619 () Bool)

(declare-fun e!769775 () Bool)

(assert (=> b!1354120 (=> (not res!898619) (not e!769775))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92305 0))(
  ( (array!92306 (arr!44596 (Array (_ BitVec 32) (_ BitVec 64))) (size!45147 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92305)

(assert (=> b!1354120 (= res!898619 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45147 a!3742))))))

(declare-fun res!898620 () Bool)

(assert (=> start!114232 (=> (not res!898620) (not e!769775))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114232 (= res!898620 (and (bvslt (size!45147 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45147 a!3742))))))

(assert (=> start!114232 e!769775))

(assert (=> start!114232 true))

(declare-fun array_inv!33877 (array!92305) Bool)

(assert (=> start!114232 (array_inv!33877 a!3742)))

(declare-fun b!1354121 () Bool)

(declare-fun e!769776 () Bool)

(assert (=> b!1354121 (= e!769775 e!769776)))

(declare-fun res!898616 () Bool)

(assert (=> b!1354121 (=> (not res!898616) (not e!769776))))

(assert (=> b!1354121 (= res!898616 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44309 0))(
  ( (Unit!44310) )
))
(declare-fun lt!598143 () Unit!44309)

(declare-fun e!769777 () Unit!44309)

(assert (=> b!1354121 (= lt!598143 e!769777)))

(declare-fun c!127201 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1354121 (= c!127201 (validKeyInArray!0 (select (arr!44596 a!3742) from!3120)))))

(declare-fun b!1354122 () Bool)

(declare-fun res!898621 () Bool)

(assert (=> b!1354122 (=> (not res!898621) (not e!769775))))

(declare-datatypes ((List!31624 0))(
  ( (Nil!31621) (Cons!31620 (h!32838 (_ BitVec 64)) (t!46274 List!31624)) )
))
(declare-fun acc!759 () List!31624)

(declare-fun contains!9336 (List!31624 (_ BitVec 64)) Bool)

(assert (=> b!1354122 (= res!898621 (not (contains!9336 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354123 () Bool)

(declare-fun res!898613 () Bool)

(assert (=> b!1354123 (=> (not res!898613) (not e!769775))))

(declare-fun arrayNoDuplicates!0 (array!92305 (_ BitVec 32) List!31624) Bool)

(assert (=> b!1354123 (= res!898613 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1354124 () Bool)

(declare-fun lt!598144 () Unit!44309)

(assert (=> b!1354124 (= e!769777 lt!598144)))

(declare-fun lt!598145 () Unit!44309)

(declare-fun lemmaListSubSeqRefl!0 (List!31624) Unit!44309)

(assert (=> b!1354124 (= lt!598145 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!713 (List!31624 List!31624) Bool)

(assert (=> b!1354124 (subseq!713 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92305 List!31624 List!31624 (_ BitVec 32)) Unit!44309)

(declare-fun $colon$colon!727 (List!31624 (_ BitVec 64)) List!31624)

(assert (=> b!1354124 (= lt!598144 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!727 acc!759 (select (arr!44596 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1354124 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1354125 () Bool)

(declare-fun res!898622 () Bool)

(assert (=> b!1354125 (=> (not res!898622) (not e!769775))))

(assert (=> b!1354125 (= res!898622 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45147 a!3742)))))

(declare-fun b!1354126 () Bool)

(declare-fun res!898623 () Bool)

(assert (=> b!1354126 (=> (not res!898623) (not e!769775))))

(declare-fun noDuplicate!2167 (List!31624) Bool)

(assert (=> b!1354126 (= res!898623 (noDuplicate!2167 acc!759))))

(declare-fun b!1354127 () Bool)

(declare-fun Unit!44311 () Unit!44309)

(assert (=> b!1354127 (= e!769777 Unit!44311)))

(declare-fun b!1354128 () Bool)

(declare-fun res!898618 () Bool)

(assert (=> b!1354128 (=> (not res!898618) (not e!769776))))

(assert (=> b!1354128 (= res!898618 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1354129 () Bool)

(declare-fun res!898617 () Bool)

(assert (=> b!1354129 (=> (not res!898617) (not e!769775))))

(assert (=> b!1354129 (= res!898617 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31621))))

(declare-fun b!1354130 () Bool)

(declare-fun res!898615 () Bool)

(assert (=> b!1354130 (=> (not res!898615) (not e!769775))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1354130 (= res!898615 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1354131 () Bool)

(assert (=> b!1354131 (= e!769776 (not true))))

(assert (=> b!1354131 (arrayNoDuplicates!0 (array!92306 (store (arr!44596 a!3742) i!1404 l!3587) (size!45147 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!598146 () Unit!44309)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92305 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31624) Unit!44309)

(assert (=> b!1354131 (= lt!598146 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1354132 () Bool)

(declare-fun res!898614 () Bool)

(assert (=> b!1354132 (=> (not res!898614) (not e!769775))))

(assert (=> b!1354132 (= res!898614 (not (contains!9336 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114232 res!898620) b!1354126))

(assert (= (and b!1354126 res!898623) b!1354122))

(assert (= (and b!1354122 res!898621) b!1354132))

(assert (= (and b!1354132 res!898614) b!1354129))

(assert (= (and b!1354129 res!898617) b!1354123))

(assert (= (and b!1354123 res!898613) b!1354120))

(assert (= (and b!1354120 res!898619) b!1354130))

(assert (= (and b!1354130 res!898615) b!1354125))

(assert (= (and b!1354125 res!898622) b!1354121))

(assert (= (and b!1354121 c!127201) b!1354124))

(assert (= (and b!1354121 (not c!127201)) b!1354127))

(assert (= (and b!1354121 res!898616) b!1354128))

(assert (= (and b!1354128 res!898618) b!1354131))

(declare-fun m!1241155 () Bool)

(assert (=> b!1354126 m!1241155))

(declare-fun m!1241157 () Bool)

(assert (=> b!1354123 m!1241157))

(declare-fun m!1241159 () Bool)

(assert (=> b!1354130 m!1241159))

(declare-fun m!1241161 () Bool)

(assert (=> b!1354129 m!1241161))

(declare-fun m!1241163 () Bool)

(assert (=> b!1354131 m!1241163))

(declare-fun m!1241165 () Bool)

(assert (=> b!1354131 m!1241165))

(declare-fun m!1241167 () Bool)

(assert (=> b!1354131 m!1241167))

(declare-fun m!1241169 () Bool)

(assert (=> b!1354132 m!1241169))

(declare-fun m!1241171 () Bool)

(assert (=> b!1354124 m!1241171))

(declare-fun m!1241173 () Bool)

(assert (=> b!1354124 m!1241173))

(declare-fun m!1241175 () Bool)

(assert (=> b!1354124 m!1241175))

(declare-fun m!1241177 () Bool)

(assert (=> b!1354124 m!1241177))

(declare-fun m!1241179 () Bool)

(assert (=> b!1354124 m!1241179))

(assert (=> b!1354124 m!1241173))

(assert (=> b!1354124 m!1241175))

(declare-fun m!1241181 () Bool)

(assert (=> b!1354124 m!1241181))

(assert (=> b!1354128 m!1241179))

(declare-fun m!1241183 () Bool)

(assert (=> start!114232 m!1241183))

(assert (=> b!1354121 m!1241173))

(assert (=> b!1354121 m!1241173))

(declare-fun m!1241185 () Bool)

(assert (=> b!1354121 m!1241185))

(declare-fun m!1241187 () Bool)

(assert (=> b!1354122 m!1241187))

(check-sat (not b!1354123) (not b!1354132) (not b!1354124) (not b!1354130) (not b!1354122) (not b!1354129) (not b!1354128) (not b!1354131) (not start!114232) (not b!1354121) (not b!1354126))
(check-sat)
