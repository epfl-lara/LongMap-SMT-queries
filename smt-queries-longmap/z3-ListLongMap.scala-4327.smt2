; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59992 () Bool)

(assert start!59992)

(declare-fun b!666278 () Bool)

(declare-fun res!433689 () Bool)

(declare-fun e!381629 () Bool)

(assert (=> b!666278 (=> (not res!433689) (not e!381629))))

(declare-datatypes ((array!39039 0))(
  ( (array!39040 (arr!18712 (Array (_ BitVec 32) (_ BitVec 64))) (size!19076 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39039)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12753 0))(
  ( (Nil!12750) (Cons!12749 (h!13794 (_ BitVec 64)) (t!18981 List!12753)) )
))
(declare-fun acc!681 () List!12753)

(declare-fun arrayNoDuplicates!0 (array!39039 (_ BitVec 32) List!12753) Bool)

(assert (=> b!666278 (= res!433689 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!666279 () Bool)

(declare-datatypes ((Unit!23285 0))(
  ( (Unit!23286) )
))
(declare-fun e!381628 () Unit!23285)

(declare-fun Unit!23287 () Unit!23285)

(assert (=> b!666279 (= e!381628 Unit!23287)))

(declare-fun lt!310361 () Unit!23285)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39039 (_ BitVec 64) (_ BitVec 32)) Unit!23285)

(assert (=> b!666279 (= lt!310361 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!666279 false))

(declare-fun b!666280 () Bool)

(declare-fun e!381633 () Bool)

(assert (=> b!666280 (= e!381629 (not e!381633))))

(declare-fun res!433690 () Bool)

(assert (=> b!666280 (=> res!433690 e!381633)))

(assert (=> b!666280 (= res!433690 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun lt!310360 () List!12753)

(declare-fun -!67 (List!12753 (_ BitVec 64)) List!12753)

(assert (=> b!666280 (= (-!67 lt!310360 k0!2843) acc!681)))

(declare-fun $colon$colon!201 (List!12753 (_ BitVec 64)) List!12753)

(assert (=> b!666280 (= lt!310360 ($colon$colon!201 acc!681 k0!2843))))

(declare-fun lt!310354 () Unit!23285)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12753) Unit!23285)

(assert (=> b!666280 (= lt!310354 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!69 (List!12753 List!12753) Bool)

(assert (=> b!666280 (subseq!69 acc!681 acc!681)))

(declare-fun lt!310358 () Unit!23285)

(declare-fun lemmaListSubSeqRefl!0 (List!12753) Unit!23285)

(assert (=> b!666280 (= lt!310358 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!666280 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310362 () Unit!23285)

(declare-fun e!381627 () Unit!23285)

(assert (=> b!666280 (= lt!310362 e!381627)))

(declare-fun c!76670 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!666280 (= c!76670 (validKeyInArray!0 (select (arr!18712 a!3626) from!3004)))))

(declare-fun lt!310363 () Unit!23285)

(assert (=> b!666280 (= lt!310363 e!381628)))

(declare-fun c!76669 () Bool)

(declare-fun lt!310359 () Bool)

(assert (=> b!666280 (= c!76669 lt!310359)))

(declare-fun arrayContainsKey!0 (array!39039 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!666280 (= lt!310359 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!666280 (arrayContainsKey!0 (array!39040 (store (arr!18712 a!3626) i!1382 k0!2843) (size!19076 a!3626)) k0!2843 from!3004)))

(declare-fun b!666281 () Bool)

(declare-fun res!433691 () Bool)

(assert (=> b!666281 (=> (not res!433691) (not e!381629))))

(assert (=> b!666281 (= res!433691 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!666282 () Bool)

(declare-fun Unit!23288 () Unit!23285)

(assert (=> b!666282 (= e!381628 Unit!23288)))

(declare-fun b!666283 () Bool)

(declare-fun res!433694 () Bool)

(assert (=> b!666283 (=> res!433694 e!381633)))

(declare-fun contains!3330 (List!12753 (_ BitVec 64)) Bool)

(assert (=> b!666283 (= res!433694 (contains!3330 acc!681 k0!2843))))

(declare-fun b!666284 () Bool)

(declare-fun res!433684 () Bool)

(assert (=> b!666284 (=> res!433684 e!381633)))

(assert (=> b!666284 (= res!433684 lt!310359)))

(declare-fun b!666286 () Bool)

(declare-fun res!433676 () Bool)

(assert (=> b!666286 (=> (not res!433676) (not e!381629))))

(assert (=> b!666286 (= res!433676 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19076 a!3626))))))

(declare-fun b!666287 () Bool)

(declare-fun res!433680 () Bool)

(assert (=> b!666287 (=> res!433680 e!381633)))

(assert (=> b!666287 (= res!433680 (not (subseq!69 acc!681 lt!310360)))))

(declare-fun b!666288 () Bool)

(declare-fun res!433675 () Bool)

(assert (=> b!666288 (=> (not res!433675) (not e!381629))))

(assert (=> b!666288 (= res!433675 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12750))))

(declare-fun b!666289 () Bool)

(declare-fun e!381631 () Bool)

(assert (=> b!666289 (= e!381631 (contains!3330 acc!681 k0!2843))))

(declare-fun b!666290 () Bool)

(declare-fun res!433678 () Bool)

(assert (=> b!666290 (=> (not res!433678) (not e!381629))))

(declare-fun e!381626 () Bool)

(assert (=> b!666290 (= res!433678 e!381626)))

(declare-fun res!433677 () Bool)

(assert (=> b!666290 (=> res!433677 e!381626)))

(assert (=> b!666290 (= res!433677 e!381631)))

(declare-fun res!433687 () Bool)

(assert (=> b!666290 (=> (not res!433687) (not e!381631))))

(assert (=> b!666290 (= res!433687 (bvsgt from!3004 i!1382))))

(declare-fun b!666291 () Bool)

(declare-fun e!381630 () Bool)

(assert (=> b!666291 (= e!381626 e!381630)))

(declare-fun res!433679 () Bool)

(assert (=> b!666291 (=> (not res!433679) (not e!381630))))

(assert (=> b!666291 (= res!433679 (bvsle from!3004 i!1382))))

(declare-fun b!666292 () Bool)

(declare-fun lt!310356 () Unit!23285)

(assert (=> b!666292 (= e!381627 lt!310356)))

(declare-fun lt!310355 () Unit!23285)

(assert (=> b!666292 (= lt!310355 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!666292 (subseq!69 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39039 List!12753 List!12753 (_ BitVec 32)) Unit!23285)

(assert (=> b!666292 (= lt!310356 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!201 acc!681 (select (arr!18712 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!666292 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!666293 () Bool)

(declare-fun res!433685 () Bool)

(assert (=> b!666293 (=> (not res!433685) (not e!381629))))

(assert (=> b!666293 (= res!433685 (not (contains!3330 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!666294 () Bool)

(declare-fun Unit!23289 () Unit!23285)

(assert (=> b!666294 (= e!381627 Unit!23289)))

(declare-fun b!666295 () Bool)

(declare-fun res!433686 () Bool)

(assert (=> b!666295 (=> res!433686 e!381633)))

(assert (=> b!666295 (= res!433686 (contains!3330 lt!310360 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!666296 () Bool)

(declare-fun res!433693 () Bool)

(assert (=> b!666296 (=> (not res!433693) (not e!381629))))

(assert (=> b!666296 (= res!433693 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19076 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!666297 () Bool)

(declare-fun res!433688 () Bool)

(assert (=> b!666297 (=> (not res!433688) (not e!381629))))

(declare-fun noDuplicate!577 (List!12753) Bool)

(assert (=> b!666297 (= res!433688 (noDuplicate!577 acc!681))))

(declare-fun b!666298 () Bool)

(declare-fun res!433681 () Bool)

(assert (=> b!666298 (=> (not res!433681) (not e!381629))))

(assert (=> b!666298 (= res!433681 (validKeyInArray!0 k0!2843))))

(declare-fun b!666285 () Bool)

(declare-fun res!433682 () Bool)

(assert (=> b!666285 (=> res!433682 e!381633)))

(assert (=> b!666285 (= res!433682 (not (contains!3330 lt!310360 k0!2843)))))

(declare-fun res!433683 () Bool)

(assert (=> start!59992 (=> (not res!433683) (not e!381629))))

(assert (=> start!59992 (= res!433683 (and (bvslt (size!19076 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19076 a!3626))))))

(assert (=> start!59992 e!381629))

(assert (=> start!59992 true))

(declare-fun array_inv!14508 (array!39039) Bool)

(assert (=> start!59992 (array_inv!14508 a!3626)))

(declare-fun b!666299 () Bool)

(declare-fun res!433674 () Bool)

(assert (=> b!666299 (=> res!433674 e!381633)))

(assert (=> b!666299 (= res!433674 (not (noDuplicate!577 lt!310360)))))

(declare-fun b!666300 () Bool)

(assert (=> b!666300 (= e!381633 true)))

(declare-fun lt!310357 () Bool)

(assert (=> b!666300 (= lt!310357 (contains!3330 lt!310360 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!666301 () Bool)

(assert (=> b!666301 (= e!381630 (not (contains!3330 acc!681 k0!2843)))))

(declare-fun b!666302 () Bool)

(declare-fun res!433692 () Bool)

(assert (=> b!666302 (=> (not res!433692) (not e!381629))))

(assert (=> b!666302 (= res!433692 (not (contains!3330 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!59992 res!433683) b!666297))

(assert (= (and b!666297 res!433688) b!666302))

(assert (= (and b!666302 res!433692) b!666293))

(assert (= (and b!666293 res!433685) b!666290))

(assert (= (and b!666290 res!433687) b!666289))

(assert (= (and b!666290 (not res!433677)) b!666291))

(assert (= (and b!666291 res!433679) b!666301))

(assert (= (and b!666290 res!433678) b!666288))

(assert (= (and b!666288 res!433675) b!666278))

(assert (= (and b!666278 res!433689) b!666286))

(assert (= (and b!666286 res!433676) b!666298))

(assert (= (and b!666298 res!433681) b!666281))

(assert (= (and b!666281 res!433691) b!666296))

(assert (= (and b!666296 res!433693) b!666280))

(assert (= (and b!666280 c!76669) b!666279))

(assert (= (and b!666280 (not c!76669)) b!666282))

(assert (= (and b!666280 c!76670) b!666292))

(assert (= (and b!666280 (not c!76670)) b!666294))

(assert (= (and b!666280 (not res!433690)) b!666299))

(assert (= (and b!666299 (not res!433674)) b!666284))

(assert (= (and b!666284 (not res!433684)) b!666283))

(assert (= (and b!666283 (not res!433694)) b!666287))

(assert (= (and b!666287 (not res!433680)) b!666285))

(assert (= (and b!666285 (not res!433682)) b!666295))

(assert (= (and b!666295 (not res!433686)) b!666300))

(declare-fun m!637117 () Bool)

(assert (=> b!666297 m!637117))

(declare-fun m!637119 () Bool)

(assert (=> b!666283 m!637119))

(declare-fun m!637121 () Bool)

(assert (=> b!666281 m!637121))

(declare-fun m!637123 () Bool)

(assert (=> start!59992 m!637123))

(declare-fun m!637125 () Bool)

(assert (=> b!666292 m!637125))

(declare-fun m!637127 () Bool)

(assert (=> b!666292 m!637127))

(declare-fun m!637129 () Bool)

(assert (=> b!666292 m!637129))

(declare-fun m!637131 () Bool)

(assert (=> b!666292 m!637131))

(assert (=> b!666292 m!637127))

(assert (=> b!666292 m!637129))

(declare-fun m!637133 () Bool)

(assert (=> b!666292 m!637133))

(declare-fun m!637135 () Bool)

(assert (=> b!666292 m!637135))

(declare-fun m!637137 () Bool)

(assert (=> b!666287 m!637137))

(assert (=> b!666289 m!637119))

(declare-fun m!637139 () Bool)

(assert (=> b!666285 m!637139))

(assert (=> b!666301 m!637119))

(declare-fun m!637141 () Bool)

(assert (=> b!666300 m!637141))

(declare-fun m!637143 () Bool)

(assert (=> b!666288 m!637143))

(declare-fun m!637145 () Bool)

(assert (=> b!666295 m!637145))

(declare-fun m!637147 () Bool)

(assert (=> b!666298 m!637147))

(declare-fun m!637149 () Bool)

(assert (=> b!666278 m!637149))

(declare-fun m!637151 () Bool)

(assert (=> b!666279 m!637151))

(declare-fun m!637153 () Bool)

(assert (=> b!666280 m!637153))

(assert (=> b!666280 m!637125))

(assert (=> b!666280 m!637127))

(declare-fun m!637155 () Bool)

(assert (=> b!666280 m!637155))

(declare-fun m!637157 () Bool)

(assert (=> b!666280 m!637157))

(assert (=> b!666280 m!637133))

(declare-fun m!637159 () Bool)

(assert (=> b!666280 m!637159))

(declare-fun m!637161 () Bool)

(assert (=> b!666280 m!637161))

(assert (=> b!666280 m!637127))

(declare-fun m!637163 () Bool)

(assert (=> b!666280 m!637163))

(declare-fun m!637165 () Bool)

(assert (=> b!666280 m!637165))

(assert (=> b!666280 m!637135))

(declare-fun m!637167 () Bool)

(assert (=> b!666293 m!637167))

(declare-fun m!637169 () Bool)

(assert (=> b!666302 m!637169))

(declare-fun m!637171 () Bool)

(assert (=> b!666299 m!637171))

(check-sat (not b!666295) (not b!666302) (not b!666279) (not b!666301) (not b!666292) (not b!666298) (not b!666297) (not b!666283) (not b!666300) (not b!666293) (not b!666289) (not b!666299) (not b!666285) (not b!666278) (not start!59992) (not b!666288) (not b!666281) (not b!666287) (not b!666280))
(check-sat)
