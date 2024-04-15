; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114068 () Bool)

(assert start!114068)

(declare-fun b!1354116 () Bool)

(declare-fun e!769325 () Bool)

(assert (=> b!1354116 (= e!769325 false)))

(declare-fun lt!597971 () Bool)

(declare-datatypes ((List!31667 0))(
  ( (Nil!31664) (Cons!31663 (h!32872 (_ BitVec 64)) (t!46317 List!31667)) )
))
(declare-fun lt!597975 () List!31667)

(declare-datatypes ((array!92199 0))(
  ( (array!92200 (arr!44548 (Array (_ BitVec 32) (_ BitVec 64))) (size!45100 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92199)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92199 (_ BitVec 32) List!31667) Bool)

(assert (=> b!1354116 (= lt!597971 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597975))))

(declare-fun b!1354117 () Bool)

(declare-fun res!899262 () Bool)

(declare-fun e!769324 () Bool)

(assert (=> b!1354117 (=> (not res!899262) (not e!769324))))

(declare-fun acc!759 () List!31667)

(declare-fun noDuplicate!2202 (List!31667) Bool)

(assert (=> b!1354117 (= res!899262 (noDuplicate!2202 acc!759))))

(declare-fun res!899254 () Bool)

(assert (=> start!114068 (=> (not res!899254) (not e!769324))))

(assert (=> start!114068 (= res!899254 (and (bvslt (size!45100 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45100 a!3742))))))

(assert (=> start!114068 e!769324))

(assert (=> start!114068 true))

(declare-fun array_inv!33781 (array!92199) Bool)

(assert (=> start!114068 (array_inv!33781 a!3742)))

(declare-fun b!1354118 () Bool)

(declare-fun e!769323 () Bool)

(assert (=> b!1354118 (= e!769324 e!769323)))

(declare-fun res!899264 () Bool)

(assert (=> b!1354118 (=> (not res!899264) (not e!769323))))

(declare-fun lt!597973 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1354118 (= res!899264 (and (not (= from!3120 i!1404)) lt!597973))))

(declare-datatypes ((Unit!44301 0))(
  ( (Unit!44302) )
))
(declare-fun lt!597976 () Unit!44301)

(declare-fun e!769327 () Unit!44301)

(assert (=> b!1354118 (= lt!597976 e!769327)))

(declare-fun c!126875 () Bool)

(assert (=> b!1354118 (= c!126875 lt!597973)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1354118 (= lt!597973 (validKeyInArray!0 (select (arr!44548 a!3742) from!3120)))))

(declare-fun b!1354119 () Bool)

(declare-fun res!899260 () Bool)

(assert (=> b!1354119 (=> (not res!899260) (not e!769324))))

(assert (=> b!1354119 (= res!899260 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45100 a!3742)))))

(declare-fun b!1354120 () Bool)

(declare-fun lt!597972 () Unit!44301)

(assert (=> b!1354120 (= e!769327 lt!597972)))

(declare-fun lt!597974 () Unit!44301)

(declare-fun lemmaListSubSeqRefl!0 (List!31667) Unit!44301)

(assert (=> b!1354120 (= lt!597974 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!743 (List!31667 List!31667) Bool)

(assert (=> b!1354120 (subseq!743 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92199 List!31667 List!31667 (_ BitVec 32)) Unit!44301)

(declare-fun $colon$colon!760 (List!31667 (_ BitVec 64)) List!31667)

(assert (=> b!1354120 (= lt!597972 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!760 acc!759 (select (arr!44548 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1354120 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1354121 () Bool)

(declare-fun res!899255 () Bool)

(assert (=> b!1354121 (=> (not res!899255) (not e!769324))))

(assert (=> b!1354121 (= res!899255 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31664))))

(declare-fun b!1354122 () Bool)

(declare-fun res!899259 () Bool)

(assert (=> b!1354122 (=> (not res!899259) (not e!769325))))

(assert (=> b!1354122 (= res!899259 (noDuplicate!2202 lt!597975))))

(declare-fun b!1354123 () Bool)

(declare-fun Unit!44303 () Unit!44301)

(assert (=> b!1354123 (= e!769327 Unit!44303)))

(declare-fun b!1354124 () Bool)

(declare-fun res!899252 () Bool)

(assert (=> b!1354124 (=> (not res!899252) (not e!769324))))

(assert (=> b!1354124 (= res!899252 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45100 a!3742))))))

(declare-fun b!1354125 () Bool)

(declare-fun res!899261 () Bool)

(assert (=> b!1354125 (=> (not res!899261) (not e!769324))))

(assert (=> b!1354125 (= res!899261 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1354126 () Bool)

(declare-fun res!899258 () Bool)

(assert (=> b!1354126 (=> (not res!899258) (not e!769325))))

(declare-fun contains!9287 (List!31667 (_ BitVec 64)) Bool)

(assert (=> b!1354126 (= res!899258 (not (contains!9287 lt!597975 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354127 () Bool)

(declare-fun res!899263 () Bool)

(assert (=> b!1354127 (=> (not res!899263) (not e!769324))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1354127 (= res!899263 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1354128 () Bool)

(declare-fun res!899256 () Bool)

(assert (=> b!1354128 (=> (not res!899256) (not e!769324))))

(assert (=> b!1354128 (= res!899256 (not (contains!9287 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354129 () Bool)

(declare-fun res!899257 () Bool)

(assert (=> b!1354129 (=> (not res!899257) (not e!769325))))

(assert (=> b!1354129 (= res!899257 (not (contains!9287 lt!597975 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354130 () Bool)

(assert (=> b!1354130 (= e!769323 e!769325)))

(declare-fun res!899253 () Bool)

(assert (=> b!1354130 (=> (not res!899253) (not e!769325))))

(assert (=> b!1354130 (= res!899253 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1354130 (= lt!597975 ($colon$colon!760 acc!759 (select (arr!44548 a!3742) from!3120)))))

(declare-fun b!1354131 () Bool)

(declare-fun res!899251 () Bool)

(assert (=> b!1354131 (=> (not res!899251) (not e!769324))))

(assert (=> b!1354131 (= res!899251 (not (contains!9287 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114068 res!899254) b!1354117))

(assert (= (and b!1354117 res!899262) b!1354131))

(assert (= (and b!1354131 res!899251) b!1354128))

(assert (= (and b!1354128 res!899256) b!1354121))

(assert (= (and b!1354121 res!899255) b!1354125))

(assert (= (and b!1354125 res!899261) b!1354124))

(assert (= (and b!1354124 res!899252) b!1354127))

(assert (= (and b!1354127 res!899263) b!1354119))

(assert (= (and b!1354119 res!899260) b!1354118))

(assert (= (and b!1354118 c!126875) b!1354120))

(assert (= (and b!1354118 (not c!126875)) b!1354123))

(assert (= (and b!1354118 res!899264) b!1354130))

(assert (= (and b!1354130 res!899253) b!1354122))

(assert (= (and b!1354122 res!899259) b!1354126))

(assert (= (and b!1354126 res!899258) b!1354129))

(assert (= (and b!1354129 res!899257) b!1354116))

(declare-fun m!1240105 () Bool)

(assert (=> b!1354127 m!1240105))

(declare-fun m!1240107 () Bool)

(assert (=> b!1354118 m!1240107))

(assert (=> b!1354118 m!1240107))

(declare-fun m!1240109 () Bool)

(assert (=> b!1354118 m!1240109))

(declare-fun m!1240111 () Bool)

(assert (=> b!1354121 m!1240111))

(declare-fun m!1240113 () Bool)

(assert (=> start!114068 m!1240113))

(declare-fun m!1240115 () Bool)

(assert (=> b!1354131 m!1240115))

(declare-fun m!1240117 () Bool)

(assert (=> b!1354128 m!1240117))

(declare-fun m!1240119 () Bool)

(assert (=> b!1354126 m!1240119))

(declare-fun m!1240121 () Bool)

(assert (=> b!1354120 m!1240121))

(assert (=> b!1354120 m!1240107))

(declare-fun m!1240123 () Bool)

(assert (=> b!1354120 m!1240123))

(declare-fun m!1240125 () Bool)

(assert (=> b!1354120 m!1240125))

(declare-fun m!1240127 () Bool)

(assert (=> b!1354120 m!1240127))

(assert (=> b!1354120 m!1240107))

(assert (=> b!1354120 m!1240123))

(declare-fun m!1240129 () Bool)

(assert (=> b!1354120 m!1240129))

(declare-fun m!1240131 () Bool)

(assert (=> b!1354122 m!1240131))

(declare-fun m!1240133 () Bool)

(assert (=> b!1354125 m!1240133))

(declare-fun m!1240135 () Bool)

(assert (=> b!1354117 m!1240135))

(declare-fun m!1240137 () Bool)

(assert (=> b!1354116 m!1240137))

(assert (=> b!1354130 m!1240107))

(assert (=> b!1354130 m!1240107))

(assert (=> b!1354130 m!1240123))

(declare-fun m!1240139 () Bool)

(assert (=> b!1354129 m!1240139))

(check-sat (not b!1354116) (not b!1354117) (not b!1354130) (not b!1354125) (not start!114068) (not b!1354122) (not b!1354126) (not b!1354118) (not b!1354131) (not b!1354127) (not b!1354128) (not b!1354129) (not b!1354120) (not b!1354121))
(check-sat)
