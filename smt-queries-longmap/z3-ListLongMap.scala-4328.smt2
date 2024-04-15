; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59984 () Bool)

(assert start!59984)

(declare-fun b!666132 () Bool)

(declare-datatypes ((Unit!23273 0))(
  ( (Unit!23274) )
))
(declare-fun e!381486 () Unit!23273)

(declare-fun Unit!23275 () Unit!23273)

(assert (=> b!666132 (= e!381486 Unit!23275)))

(declare-fun lt!310166 () Unit!23273)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-datatypes ((array!39042 0))(
  ( (array!39043 (arr!18713 (Array (_ BitVec 32) (_ BitVec 64))) (size!19078 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39042)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39042 (_ BitVec 64) (_ BitVec 32)) Unit!23273)

(assert (=> b!666132 (= lt!310166 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!666132 false))

(declare-fun b!666133 () Bool)

(declare-fun res!433680 () Bool)

(declare-fun e!381489 () Bool)

(assert (=> b!666133 (=> res!433680 e!381489)))

(declare-datatypes ((List!12793 0))(
  ( (Nil!12790) (Cons!12789 (h!13834 (_ BitVec 64)) (t!19012 List!12793)) )
))
(declare-fun acc!681 () List!12793)

(declare-fun lt!310162 () List!12793)

(declare-fun subseq!71 (List!12793 List!12793) Bool)

(assert (=> b!666133 (= res!433680 (not (subseq!71 acc!681 lt!310162)))))

(declare-fun b!666134 () Bool)

(declare-fun e!381487 () Unit!23273)

(declare-fun Unit!23276 () Unit!23273)

(assert (=> b!666134 (= e!381487 Unit!23276)))

(declare-fun b!666135 () Bool)

(declare-fun res!433684 () Bool)

(assert (=> b!666135 (=> res!433684 e!381489)))

(declare-fun lt!310167 () Bool)

(assert (=> b!666135 (= res!433684 lt!310167)))

(declare-fun b!666136 () Bool)

(declare-fun res!433666 () Bool)

(declare-fun e!381485 () Bool)

(assert (=> b!666136 (=> (not res!433666) (not e!381485))))

(declare-fun arrayNoDuplicates!0 (array!39042 (_ BitVec 32) List!12793) Bool)

(assert (=> b!666136 (= res!433666 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12790))))

(declare-fun b!666137 () Bool)

(declare-fun res!433676 () Bool)

(assert (=> b!666137 (=> res!433676 e!381489)))

(declare-fun contains!3315 (List!12793 (_ BitVec 64)) Bool)

(assert (=> b!666137 (= res!433676 (contains!3315 acc!681 k0!2843))))

(declare-fun b!666138 () Bool)

(declare-fun res!433674 () Bool)

(assert (=> b!666138 (=> res!433674 e!381489)))

(assert (=> b!666138 (= res!433674 (not (contains!3315 lt!310162 k0!2843)))))

(declare-fun b!666139 () Bool)

(declare-fun e!381491 () Bool)

(assert (=> b!666139 (= e!381491 (contains!3315 acc!681 k0!2843))))

(declare-fun b!666140 () Bool)

(declare-fun res!433678 () Bool)

(assert (=> b!666140 (=> (not res!433678) (not e!381485))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!666140 (= res!433678 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19078 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!666141 () Bool)

(declare-fun res!433665 () Bool)

(assert (=> b!666141 (=> res!433665 e!381489)))

(assert (=> b!666141 (= res!433665 (contains!3315 lt!310162 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!666142 () Bool)

(declare-fun res!433669 () Bool)

(assert (=> b!666142 (=> (not res!433669) (not e!381485))))

(assert (=> b!666142 (= res!433669 (not (contains!3315 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!666143 () Bool)

(assert (=> b!666143 (= e!381489 true)))

(declare-fun lt!310163 () Bool)

(assert (=> b!666143 (= lt!310163 (contains!3315 lt!310162 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!666144 () Bool)

(declare-fun res!433670 () Bool)

(assert (=> b!666144 (=> (not res!433670) (not e!381485))))

(declare-fun arrayContainsKey!0 (array!39042 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!666144 (= res!433670 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!666145 () Bool)

(declare-fun res!433682 () Bool)

(assert (=> b!666145 (=> (not res!433682) (not e!381485))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!666145 (= res!433682 (validKeyInArray!0 k0!2843))))

(declare-fun b!666146 () Bool)

(declare-fun e!381488 () Bool)

(declare-fun e!381484 () Bool)

(assert (=> b!666146 (= e!381488 e!381484)))

(declare-fun res!433677 () Bool)

(assert (=> b!666146 (=> (not res!433677) (not e!381484))))

(assert (=> b!666146 (= res!433677 (bvsle from!3004 i!1382))))

(declare-fun b!666147 () Bool)

(declare-fun res!433667 () Bool)

(assert (=> b!666147 (=> (not res!433667) (not e!381485))))

(assert (=> b!666147 (= res!433667 e!381488)))

(declare-fun res!433675 () Bool)

(assert (=> b!666147 (=> res!433675 e!381488)))

(assert (=> b!666147 (= res!433675 e!381491)))

(declare-fun res!433673 () Bool)

(assert (=> b!666147 (=> (not res!433673) (not e!381491))))

(assert (=> b!666147 (= res!433673 (bvsgt from!3004 i!1382))))

(declare-fun res!433664 () Bool)

(assert (=> start!59984 (=> (not res!433664) (not e!381485))))

(assert (=> start!59984 (= res!433664 (and (bvslt (size!19078 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19078 a!3626))))))

(assert (=> start!59984 e!381485))

(assert (=> start!59984 true))

(declare-fun array_inv!14596 (array!39042) Bool)

(assert (=> start!59984 (array_inv!14596 a!3626)))

(declare-fun b!666148 () Bool)

(declare-fun res!433672 () Bool)

(assert (=> b!666148 (=> (not res!433672) (not e!381485))))

(assert (=> b!666148 (= res!433672 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!666149 () Bool)

(assert (=> b!666149 (= e!381485 (not e!381489))))

(declare-fun res!433679 () Bool)

(assert (=> b!666149 (=> res!433679 e!381489)))

(assert (=> b!666149 (= res!433679 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!69 (List!12793 (_ BitVec 64)) List!12793)

(assert (=> b!666149 (= (-!69 lt!310162 k0!2843) acc!681)))

(declare-fun $colon$colon!202 (List!12793 (_ BitVec 64)) List!12793)

(assert (=> b!666149 (= lt!310162 ($colon$colon!202 acc!681 k0!2843))))

(declare-fun lt!310160 () Unit!23273)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12793) Unit!23273)

(assert (=> b!666149 (= lt!310160 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!666149 (subseq!71 acc!681 acc!681)))

(declare-fun lt!310161 () Unit!23273)

(declare-fun lemmaListSubSeqRefl!0 (List!12793) Unit!23273)

(assert (=> b!666149 (= lt!310161 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!666149 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310159 () Unit!23273)

(assert (=> b!666149 (= lt!310159 e!381487)))

(declare-fun c!76602 () Bool)

(assert (=> b!666149 (= c!76602 (validKeyInArray!0 (select (arr!18713 a!3626) from!3004)))))

(declare-fun lt!310158 () Unit!23273)

(assert (=> b!666149 (= lt!310158 e!381486)))

(declare-fun c!76601 () Bool)

(assert (=> b!666149 (= c!76601 lt!310167)))

(assert (=> b!666149 (= lt!310167 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!666149 (arrayContainsKey!0 (array!39043 (store (arr!18713 a!3626) i!1382 k0!2843) (size!19078 a!3626)) k0!2843 from!3004)))

(declare-fun b!666150 () Bool)

(declare-fun lt!310165 () Unit!23273)

(assert (=> b!666150 (= e!381487 lt!310165)))

(declare-fun lt!310164 () Unit!23273)

(assert (=> b!666150 (= lt!310164 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!666150 (subseq!71 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39042 List!12793 List!12793 (_ BitVec 32)) Unit!23273)

(assert (=> b!666150 (= lt!310165 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!202 acc!681 (select (arr!18713 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!666150 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!666151 () Bool)

(declare-fun res!433681 () Bool)

(assert (=> b!666151 (=> (not res!433681) (not e!381485))))

(assert (=> b!666151 (= res!433681 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19078 a!3626))))))

(declare-fun b!666152 () Bool)

(assert (=> b!666152 (= e!381484 (not (contains!3315 acc!681 k0!2843)))))

(declare-fun b!666153 () Bool)

(declare-fun res!433671 () Bool)

(assert (=> b!666153 (=> (not res!433671) (not e!381485))))

(declare-fun noDuplicate!584 (List!12793) Bool)

(assert (=> b!666153 (= res!433671 (noDuplicate!584 acc!681))))

(declare-fun b!666154 () Bool)

(declare-fun res!433683 () Bool)

(assert (=> b!666154 (=> res!433683 e!381489)))

(assert (=> b!666154 (= res!433683 (not (noDuplicate!584 lt!310162)))))

(declare-fun b!666155 () Bool)

(declare-fun Unit!23277 () Unit!23273)

(assert (=> b!666155 (= e!381486 Unit!23277)))

(declare-fun b!666156 () Bool)

(declare-fun res!433668 () Bool)

(assert (=> b!666156 (=> (not res!433668) (not e!381485))))

(assert (=> b!666156 (= res!433668 (not (contains!3315 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!59984 res!433664) b!666153))

(assert (= (and b!666153 res!433671) b!666142))

(assert (= (and b!666142 res!433669) b!666156))

(assert (= (and b!666156 res!433668) b!666147))

(assert (= (and b!666147 res!433673) b!666139))

(assert (= (and b!666147 (not res!433675)) b!666146))

(assert (= (and b!666146 res!433677) b!666152))

(assert (= (and b!666147 res!433667) b!666136))

(assert (= (and b!666136 res!433666) b!666148))

(assert (= (and b!666148 res!433672) b!666151))

(assert (= (and b!666151 res!433681) b!666145))

(assert (= (and b!666145 res!433682) b!666144))

(assert (= (and b!666144 res!433670) b!666140))

(assert (= (and b!666140 res!433678) b!666149))

(assert (= (and b!666149 c!76601) b!666132))

(assert (= (and b!666149 (not c!76601)) b!666155))

(assert (= (and b!666149 c!76602) b!666150))

(assert (= (and b!666149 (not c!76602)) b!666134))

(assert (= (and b!666149 (not res!433679)) b!666154))

(assert (= (and b!666154 (not res!433683)) b!666135))

(assert (= (and b!666135 (not res!433684)) b!666137))

(assert (= (and b!666137 (not res!433676)) b!666133))

(assert (= (and b!666133 (not res!433680)) b!666138))

(assert (= (and b!666138 (not res!433674)) b!666141))

(assert (= (and b!666141 (not res!433665)) b!666143))

(declare-fun m!636447 () Bool)

(assert (=> b!666149 m!636447))

(declare-fun m!636449 () Bool)

(assert (=> b!666149 m!636449))

(declare-fun m!636451 () Bool)

(assert (=> b!666149 m!636451))

(declare-fun m!636453 () Bool)

(assert (=> b!666149 m!636453))

(declare-fun m!636455 () Bool)

(assert (=> b!666149 m!636455))

(declare-fun m!636457 () Bool)

(assert (=> b!666149 m!636457))

(declare-fun m!636459 () Bool)

(assert (=> b!666149 m!636459))

(declare-fun m!636461 () Bool)

(assert (=> b!666149 m!636461))

(assert (=> b!666149 m!636449))

(declare-fun m!636463 () Bool)

(assert (=> b!666149 m!636463))

(declare-fun m!636465 () Bool)

(assert (=> b!666149 m!636465))

(declare-fun m!636467 () Bool)

(assert (=> b!666149 m!636467))

(declare-fun m!636469 () Bool)

(assert (=> b!666136 m!636469))

(declare-fun m!636471 () Bool)

(assert (=> b!666133 m!636471))

(assert (=> b!666150 m!636447))

(assert (=> b!666150 m!636449))

(declare-fun m!636473 () Bool)

(assert (=> b!666150 m!636473))

(declare-fun m!636475 () Bool)

(assert (=> b!666150 m!636475))

(assert (=> b!666150 m!636449))

(assert (=> b!666150 m!636473))

(assert (=> b!666150 m!636457))

(assert (=> b!666150 m!636467))

(declare-fun m!636477 () Bool)

(assert (=> b!666152 m!636477))

(declare-fun m!636479 () Bool)

(assert (=> b!666142 m!636479))

(declare-fun m!636481 () Bool)

(assert (=> b!666148 m!636481))

(declare-fun m!636483 () Bool)

(assert (=> b!666144 m!636483))

(declare-fun m!636485 () Bool)

(assert (=> b!666145 m!636485))

(declare-fun m!636487 () Bool)

(assert (=> b!666138 m!636487))

(assert (=> b!666137 m!636477))

(declare-fun m!636489 () Bool)

(assert (=> b!666154 m!636489))

(declare-fun m!636491 () Bool)

(assert (=> b!666141 m!636491))

(declare-fun m!636493 () Bool)

(assert (=> b!666153 m!636493))

(declare-fun m!636495 () Bool)

(assert (=> b!666156 m!636495))

(assert (=> b!666139 m!636477))

(declare-fun m!636497 () Bool)

(assert (=> b!666143 m!636497))

(declare-fun m!636499 () Bool)

(assert (=> start!59984 m!636499))

(declare-fun m!636501 () Bool)

(assert (=> b!666132 m!636501))

(check-sat (not b!666133) (not b!666150) (not b!666149) (not b!666156) (not b!666142) (not b!666153) (not b!666148) (not b!666154) (not b!666152) (not b!666136) (not b!666145) (not start!59984) (not b!666139) (not b!666138) (not b!666137) (not b!666141) (not b!666132) (not b!666143) (not b!666144))
(check-sat)
