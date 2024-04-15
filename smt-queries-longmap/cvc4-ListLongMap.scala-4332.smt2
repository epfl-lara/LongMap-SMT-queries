; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60010 () Bool)

(assert start!60010)

(declare-fun b!667107 () Bool)

(declare-datatypes ((Unit!23338 0))(
  ( (Unit!23339) )
))
(declare-fun e!381820 () Unit!23338)

(declare-fun Unit!23340 () Unit!23338)

(assert (=> b!667107 (= e!381820 Unit!23340)))

(declare-fun b!667108 () Bool)

(declare-fun e!381815 () Bool)

(assert (=> b!667108 (= e!381815 true)))

(declare-fun lt!310556 () Bool)

(declare-fun e!381821 () Bool)

(assert (=> b!667108 (= lt!310556 e!381821)))

(declare-fun res!434496 () Bool)

(assert (=> b!667108 (=> res!434496 e!381821)))

(declare-fun e!381816 () Bool)

(assert (=> b!667108 (= res!434496 e!381816)))

(declare-fun res!434492 () Bool)

(assert (=> b!667108 (=> (not res!434492) (not e!381816))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!667108 (= res!434492 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!667109 () Bool)

(declare-fun res!434498 () Bool)

(assert (=> b!667109 (=> res!434498 e!381815)))

(declare-datatypes ((List!12806 0))(
  ( (Nil!12803) (Cons!12802 (h!13847 (_ BitVec 64)) (t!19025 List!12806)) )
))
(declare-fun lt!310548 () List!12806)

(declare-fun contains!3328 (List!12806 (_ BitVec 64)) Bool)

(assert (=> b!667109 (= res!434498 (contains!3328 lt!310548 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!667110 () Bool)

(declare-fun res!434484 () Bool)

(declare-fun e!381819 () Bool)

(assert (=> b!667110 (=> (not res!434484) (not e!381819))))

(declare-datatypes ((array!39068 0))(
  ( (array!39069 (arr!18726 (Array (_ BitVec 32) (_ BitVec 64))) (size!19091 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39068)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39068 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!667110 (= res!434484 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!667111 () Bool)

(declare-fun e!381814 () Unit!23338)

(declare-fun lt!310551 () Unit!23338)

(assert (=> b!667111 (= e!381814 lt!310551)))

(declare-fun lt!310557 () Unit!23338)

(declare-fun acc!681 () List!12806)

(declare-fun lemmaListSubSeqRefl!0 (List!12806) Unit!23338)

(assert (=> b!667111 (= lt!310557 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!84 (List!12806 List!12806) Bool)

(assert (=> b!667111 (subseq!84 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39068 List!12806 List!12806 (_ BitVec 32)) Unit!23338)

(declare-fun $colon$colon!215 (List!12806 (_ BitVec 64)) List!12806)

(assert (=> b!667111 (= lt!310551 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!215 acc!681 (select (arr!18726 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39068 (_ BitVec 32) List!12806) Bool)

(assert (=> b!667111 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!667112 () Bool)

(declare-fun res!434483 () Bool)

(assert (=> b!667112 (=> res!434483 e!381815)))

(assert (=> b!667112 (= res!434483 (contains!3328 lt!310548 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!667113 () Bool)

(assert (=> b!667113 (= e!381816 (contains!3328 lt!310548 k!2843))))

(declare-fun b!667114 () Bool)

(declare-fun e!381817 () Bool)

(assert (=> b!667114 (= e!381817 (not (contains!3328 acc!681 k!2843)))))

(declare-fun b!667115 () Bool)

(declare-fun res!434494 () Bool)

(assert (=> b!667115 (=> (not res!434494) (not e!381819))))

(assert (=> b!667115 (= res!434494 (not (contains!3328 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!667116 () Bool)

(declare-fun res!434495 () Bool)

(assert (=> b!667116 (=> (not res!434495) (not e!381819))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!667116 (= res!434495 (validKeyInArray!0 k!2843))))

(declare-fun b!667117 () Bool)

(declare-fun res!434488 () Bool)

(assert (=> b!667117 (=> (not res!434488) (not e!381819))))

(declare-fun noDuplicate!597 (List!12806) Bool)

(assert (=> b!667117 (= res!434488 (noDuplicate!597 acc!681))))

(declare-fun res!434501 () Bool)

(assert (=> start!60010 (=> (not res!434501) (not e!381819))))

(assert (=> start!60010 (= res!434501 (and (bvslt (size!19091 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19091 a!3626))))))

(assert (=> start!60010 e!381819))

(assert (=> start!60010 true))

(declare-fun array_inv!14609 (array!39068) Bool)

(assert (=> start!60010 (array_inv!14609 a!3626)))

(declare-fun b!667118 () Bool)

(declare-fun res!434491 () Bool)

(assert (=> b!667118 (=> (not res!434491) (not e!381819))))

(assert (=> b!667118 (= res!434491 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19091 a!3626))))))

(declare-fun b!667119 () Bool)

(declare-fun res!434503 () Bool)

(assert (=> b!667119 (=> (not res!434503) (not e!381819))))

(assert (=> b!667119 (= res!434503 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!667120 () Bool)

(declare-fun e!381811 () Bool)

(assert (=> b!667120 (= e!381821 e!381811)))

(declare-fun res!434493 () Bool)

(assert (=> b!667120 (=> (not res!434493) (not e!381811))))

(assert (=> b!667120 (= res!434493 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!667121 () Bool)

(declare-fun Unit!23341 () Unit!23338)

(assert (=> b!667121 (= e!381814 Unit!23341)))

(declare-fun b!667122 () Bool)

(assert (=> b!667122 (= e!381811 (not (contains!3328 lt!310548 k!2843)))))

(declare-fun b!667123 () Bool)

(declare-fun e!381818 () Bool)

(assert (=> b!667123 (= e!381818 e!381817)))

(declare-fun res!434485 () Bool)

(assert (=> b!667123 (=> (not res!434485) (not e!381817))))

(assert (=> b!667123 (= res!434485 (bvsle from!3004 i!1382))))

(declare-fun b!667124 () Bool)

(declare-fun res!434486 () Bool)

(assert (=> b!667124 (=> res!434486 e!381815)))

(assert (=> b!667124 (= res!434486 (not (noDuplicate!597 lt!310548)))))

(declare-fun b!667125 () Bool)

(declare-fun res!434497 () Bool)

(assert (=> b!667125 (=> (not res!434497) (not e!381819))))

(assert (=> b!667125 (= res!434497 e!381818)))

(declare-fun res!434490 () Bool)

(assert (=> b!667125 (=> res!434490 e!381818)))

(declare-fun e!381812 () Bool)

(assert (=> b!667125 (= res!434490 e!381812)))

(declare-fun res!434500 () Bool)

(assert (=> b!667125 (=> (not res!434500) (not e!381812))))

(assert (=> b!667125 (= res!434500 (bvsgt from!3004 i!1382))))

(declare-fun b!667126 () Bool)

(declare-fun res!434487 () Bool)

(assert (=> b!667126 (=> (not res!434487) (not e!381819))))

(assert (=> b!667126 (= res!434487 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12803))))

(declare-fun b!667127 () Bool)

(assert (=> b!667127 (= e!381819 (not e!381815))))

(declare-fun res!434499 () Bool)

(assert (=> b!667127 (=> res!434499 e!381815)))

(assert (=> b!667127 (= res!434499 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!667127 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!310548)))

(declare-fun lt!310554 () Unit!23338)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39068 (_ BitVec 64) (_ BitVec 32) List!12806 List!12806) Unit!23338)

(assert (=> b!667127 (= lt!310554 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!310548))))

(declare-fun -!82 (List!12806 (_ BitVec 64)) List!12806)

(assert (=> b!667127 (= (-!82 lt!310548 k!2843) acc!681)))

(assert (=> b!667127 (= lt!310548 ($colon$colon!215 acc!681 k!2843))))

(declare-fun lt!310549 () Unit!23338)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12806) Unit!23338)

(assert (=> b!667127 (= lt!310549 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!667127 (subseq!84 acc!681 acc!681)))

(declare-fun lt!310553 () Unit!23338)

(assert (=> b!667127 (= lt!310553 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!667127 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310552 () Unit!23338)

(assert (=> b!667127 (= lt!310552 e!381814)))

(declare-fun c!76680 () Bool)

(assert (=> b!667127 (= c!76680 (validKeyInArray!0 (select (arr!18726 a!3626) from!3004)))))

(declare-fun lt!310550 () Unit!23338)

(assert (=> b!667127 (= lt!310550 e!381820)))

(declare-fun c!76679 () Bool)

(assert (=> b!667127 (= c!76679 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!667127 (arrayContainsKey!0 (array!39069 (store (arr!18726 a!3626) i!1382 k!2843) (size!19091 a!3626)) k!2843 from!3004)))

(declare-fun b!667128 () Bool)

(declare-fun res!434489 () Bool)

(assert (=> b!667128 (=> (not res!434489) (not e!381819))))

(assert (=> b!667128 (= res!434489 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19091 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!667129 () Bool)

(declare-fun res!434502 () Bool)

(assert (=> b!667129 (=> (not res!434502) (not e!381819))))

(assert (=> b!667129 (= res!434502 (not (contains!3328 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!667130 () Bool)

(declare-fun Unit!23342 () Unit!23338)

(assert (=> b!667130 (= e!381820 Unit!23342)))

(declare-fun lt!310555 () Unit!23338)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39068 (_ BitVec 64) (_ BitVec 32)) Unit!23338)

(assert (=> b!667130 (= lt!310555 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!667130 false))

(declare-fun b!667131 () Bool)

(assert (=> b!667131 (= e!381812 (contains!3328 acc!681 k!2843))))

(assert (= (and start!60010 res!434501) b!667117))

(assert (= (and b!667117 res!434488) b!667129))

(assert (= (and b!667129 res!434502) b!667115))

(assert (= (and b!667115 res!434494) b!667125))

(assert (= (and b!667125 res!434500) b!667131))

(assert (= (and b!667125 (not res!434490)) b!667123))

(assert (= (and b!667123 res!434485) b!667114))

(assert (= (and b!667125 res!434497) b!667126))

(assert (= (and b!667126 res!434487) b!667119))

(assert (= (and b!667119 res!434503) b!667118))

(assert (= (and b!667118 res!434491) b!667116))

(assert (= (and b!667116 res!434495) b!667110))

(assert (= (and b!667110 res!434484) b!667128))

(assert (= (and b!667128 res!434489) b!667127))

(assert (= (and b!667127 c!76679) b!667130))

(assert (= (and b!667127 (not c!76679)) b!667107))

(assert (= (and b!667127 c!76680) b!667111))

(assert (= (and b!667127 (not c!76680)) b!667121))

(assert (= (and b!667127 (not res!434499)) b!667124))

(assert (= (and b!667124 (not res!434486)) b!667109))

(assert (= (and b!667109 (not res!434498)) b!667112))

(assert (= (and b!667112 (not res!434483)) b!667108))

(assert (= (and b!667108 res!434492) b!667113))

(assert (= (and b!667108 (not res!434496)) b!667120))

(assert (= (and b!667120 res!434493) b!667122))

(declare-fun m!637177 () Bool)

(assert (=> b!667130 m!637177))

(declare-fun m!637179 () Bool)

(assert (=> b!667115 m!637179))

(declare-fun m!637181 () Bool)

(assert (=> b!667111 m!637181))

(declare-fun m!637183 () Bool)

(assert (=> b!667111 m!637183))

(declare-fun m!637185 () Bool)

(assert (=> b!667111 m!637185))

(declare-fun m!637187 () Bool)

(assert (=> b!667111 m!637187))

(assert (=> b!667111 m!637183))

(assert (=> b!667111 m!637185))

(declare-fun m!637189 () Bool)

(assert (=> b!667111 m!637189))

(declare-fun m!637191 () Bool)

(assert (=> b!667111 m!637191))

(declare-fun m!637193 () Bool)

(assert (=> b!667109 m!637193))

(declare-fun m!637195 () Bool)

(assert (=> b!667131 m!637195))

(declare-fun m!637197 () Bool)

(assert (=> b!667113 m!637197))

(declare-fun m!637199 () Bool)

(assert (=> b!667110 m!637199))

(declare-fun m!637201 () Bool)

(assert (=> b!667127 m!637201))

(assert (=> b!667127 m!637181))

(assert (=> b!667127 m!637183))

(declare-fun m!637203 () Bool)

(assert (=> b!667127 m!637203))

(declare-fun m!637205 () Bool)

(assert (=> b!667127 m!637205))

(declare-fun m!637207 () Bool)

(assert (=> b!667127 m!637207))

(declare-fun m!637209 () Bool)

(assert (=> b!667127 m!637209))

(declare-fun m!637211 () Bool)

(assert (=> b!667127 m!637211))

(assert (=> b!667127 m!637183))

(declare-fun m!637213 () Bool)

(assert (=> b!667127 m!637213))

(declare-fun m!637215 () Bool)

(assert (=> b!667127 m!637215))

(assert (=> b!667127 m!637189))

(declare-fun m!637217 () Bool)

(assert (=> b!667127 m!637217))

(assert (=> b!667127 m!637191))

(declare-fun m!637219 () Bool)

(assert (=> b!667119 m!637219))

(assert (=> b!667114 m!637195))

(declare-fun m!637221 () Bool)

(assert (=> b!667126 m!637221))

(declare-fun m!637223 () Bool)

(assert (=> b!667124 m!637223))

(declare-fun m!637225 () Bool)

(assert (=> start!60010 m!637225))

(declare-fun m!637227 () Bool)

(assert (=> b!667129 m!637227))

(declare-fun m!637229 () Bool)

(assert (=> b!667117 m!637229))

(declare-fun m!637231 () Bool)

(assert (=> b!667112 m!637231))

(declare-fun m!637233 () Bool)

(assert (=> b!667116 m!637233))

(assert (=> b!667122 m!637197))

(push 1)

(assert (not b!667127))

(assert (not b!667131))

(assert (not b!667130))

(assert (not b!667115))

(assert (not b!667122))

(assert (not b!667117))

(assert (not b!667112))

(assert (not b!667111))

(assert (not b!667119))

(assert (not b!667124))

(assert (not b!667114))

(assert (not b!667126))

(assert (not b!667116))

(assert (not b!667109))

(assert (not start!60010))

(assert (not b!667110))

(assert (not b!667113))

(assert (not b!667129))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

