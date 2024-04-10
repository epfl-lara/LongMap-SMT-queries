; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59996 () Bool)

(assert start!59996)

(declare-fun b!666428 () Bool)

(declare-datatypes ((Unit!23295 0))(
  ( (Unit!23296) )
))
(declare-fun e!381678 () Unit!23295)

(declare-fun lt!310420 () Unit!23295)

(assert (=> b!666428 (= e!381678 lt!310420)))

(declare-fun lt!310414 () Unit!23295)

(declare-datatypes ((List!12755 0))(
  ( (Nil!12752) (Cons!12751 (h!13796 (_ BitVec 64)) (t!18983 List!12755)) )
))
(declare-fun acc!681 () List!12755)

(declare-fun lemmaListSubSeqRefl!0 (List!12755) Unit!23295)

(assert (=> b!666428 (= lt!310414 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!71 (List!12755 List!12755) Bool)

(assert (=> b!666428 (subseq!71 acc!681 acc!681)))

(declare-datatypes ((array!39043 0))(
  ( (array!39044 (arr!18714 (Array (_ BitVec 32) (_ BitVec 64))) (size!19078 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39043)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39043 List!12755 List!12755 (_ BitVec 32)) Unit!23295)

(declare-fun $colon$colon!203 (List!12755 (_ BitVec 64)) List!12755)

(assert (=> b!666428 (= lt!310420 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!203 acc!681 (select (arr!18714 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39043 (_ BitVec 32) List!12755) Bool)

(assert (=> b!666428 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!666429 () Bool)

(declare-fun e!381676 () Unit!23295)

(declare-fun Unit!23297 () Unit!23295)

(assert (=> b!666429 (= e!381676 Unit!23297)))

(declare-fun lt!310422 () Unit!23295)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39043 (_ BitVec 64) (_ BitVec 32)) Unit!23295)

(assert (=> b!666429 (= lt!310422 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!666429 false))

(declare-fun res!433820 () Bool)

(declare-fun e!381679 () Bool)

(assert (=> start!59996 (=> (not res!433820) (not e!381679))))

(assert (=> start!59996 (= res!433820 (and (bvslt (size!19078 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19078 a!3626))))))

(assert (=> start!59996 e!381679))

(assert (=> start!59996 true))

(declare-fun array_inv!14510 (array!39043) Bool)

(assert (=> start!59996 (array_inv!14510 a!3626)))

(declare-fun b!666430 () Bool)

(declare-fun res!433816 () Bool)

(assert (=> b!666430 (=> (not res!433816) (not e!381679))))

(declare-fun contains!3332 (List!12755 (_ BitVec 64)) Bool)

(assert (=> b!666430 (= res!433816 (not (contains!3332 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!666431 () Bool)

(declare-fun e!381680 () Bool)

(assert (=> b!666431 (= e!381680 (not (contains!3332 acc!681 k!2843)))))

(declare-fun b!666432 () Bool)

(declare-fun res!433806 () Bool)

(assert (=> b!666432 (=> (not res!433806) (not e!381679))))

(declare-fun e!381681 () Bool)

(assert (=> b!666432 (= res!433806 e!381681)))

(declare-fun res!433803 () Bool)

(assert (=> b!666432 (=> res!433803 e!381681)))

(declare-fun e!381675 () Bool)

(assert (=> b!666432 (= res!433803 e!381675)))

(declare-fun res!433819 () Bool)

(assert (=> b!666432 (=> (not res!433819) (not e!381675))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!666432 (= res!433819 (bvsgt from!3004 i!1382))))

(declare-fun b!666433 () Bool)

(declare-fun res!433818 () Bool)

(assert (=> b!666433 (=> (not res!433818) (not e!381679))))

(assert (=> b!666433 (= res!433818 (not (contains!3332 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!666434 () Bool)

(declare-fun res!433807 () Bool)

(declare-fun e!381677 () Bool)

(assert (=> b!666434 (=> res!433807 e!381677)))

(declare-fun lt!310415 () List!12755)

(declare-fun noDuplicate!579 (List!12755) Bool)

(assert (=> b!666434 (= res!433807 (not (noDuplicate!579 lt!310415)))))

(declare-fun b!666435 () Bool)

(declare-fun res!433811 () Bool)

(assert (=> b!666435 (=> res!433811 e!381677)))

(assert (=> b!666435 (= res!433811 (contains!3332 acc!681 k!2843))))

(declare-fun b!666436 () Bool)

(declare-fun res!433801 () Bool)

(assert (=> b!666436 (=> (not res!433801) (not e!381679))))

(declare-fun arrayContainsKey!0 (array!39043 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!666436 (= res!433801 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!666437 () Bool)

(declare-fun res!433817 () Bool)

(assert (=> b!666437 (=> (not res!433817) (not e!381679))))

(assert (=> b!666437 (= res!433817 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19078 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!666438 () Bool)

(declare-fun res!433812 () Bool)

(assert (=> b!666438 (=> (not res!433812) (not e!381679))))

(assert (=> b!666438 (= res!433812 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12752))))

(declare-fun b!666439 () Bool)

(declare-fun res!433808 () Bool)

(assert (=> b!666439 (=> (not res!433808) (not e!381679))))

(assert (=> b!666439 (= res!433808 (noDuplicate!579 acc!681))))

(declare-fun b!666440 () Bool)

(assert (=> b!666440 (= e!381679 (not e!381677))))

(declare-fun res!433804 () Bool)

(assert (=> b!666440 (=> res!433804 e!381677)))

(assert (=> b!666440 (= res!433804 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!69 (List!12755 (_ BitVec 64)) List!12755)

(assert (=> b!666440 (= (-!69 lt!310415 k!2843) acc!681)))

(assert (=> b!666440 (= lt!310415 ($colon$colon!203 acc!681 k!2843))))

(declare-fun lt!310416 () Unit!23295)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12755) Unit!23295)

(assert (=> b!666440 (= lt!310416 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!666440 (subseq!71 acc!681 acc!681)))

(declare-fun lt!310419 () Unit!23295)

(assert (=> b!666440 (= lt!310419 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!666440 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310418 () Unit!23295)

(assert (=> b!666440 (= lt!310418 e!381678)))

(declare-fun c!76681 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!666440 (= c!76681 (validKeyInArray!0 (select (arr!18714 a!3626) from!3004)))))

(declare-fun lt!310423 () Unit!23295)

(assert (=> b!666440 (= lt!310423 e!381676)))

(declare-fun c!76682 () Bool)

(declare-fun lt!310421 () Bool)

(assert (=> b!666440 (= c!76682 lt!310421)))

(assert (=> b!666440 (= lt!310421 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!666440 (arrayContainsKey!0 (array!39044 (store (arr!18714 a!3626) i!1382 k!2843) (size!19078 a!3626)) k!2843 from!3004)))

(declare-fun b!666441 () Bool)

(declare-fun res!433810 () Bool)

(assert (=> b!666441 (=> res!433810 e!381677)))

(assert (=> b!666441 (= res!433810 (not (contains!3332 lt!310415 k!2843)))))

(declare-fun b!666442 () Bool)

(assert (=> b!666442 (= e!381677 true)))

(declare-fun lt!310417 () Bool)

(assert (=> b!666442 (= lt!310417 (contains!3332 lt!310415 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!666443 () Bool)

(declare-fun Unit!23298 () Unit!23295)

(assert (=> b!666443 (= e!381678 Unit!23298)))

(declare-fun b!666444 () Bool)

(declare-fun res!433813 () Bool)

(assert (=> b!666444 (=> (not res!433813) (not e!381679))))

(assert (=> b!666444 (= res!433813 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19078 a!3626))))))

(declare-fun b!666445 () Bool)

(declare-fun res!433814 () Bool)

(assert (=> b!666445 (=> res!433814 e!381677)))

(assert (=> b!666445 (= res!433814 (contains!3332 lt!310415 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!666446 () Bool)

(assert (=> b!666446 (= e!381675 (contains!3332 acc!681 k!2843))))

(declare-fun b!666447 () Bool)

(declare-fun res!433805 () Bool)

(assert (=> b!666447 (=> (not res!433805) (not e!381679))))

(assert (=> b!666447 (= res!433805 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!666448 () Bool)

(declare-fun res!433809 () Bool)

(assert (=> b!666448 (=> (not res!433809) (not e!381679))))

(assert (=> b!666448 (= res!433809 (validKeyInArray!0 k!2843))))

(declare-fun b!666449 () Bool)

(declare-fun Unit!23299 () Unit!23295)

(assert (=> b!666449 (= e!381676 Unit!23299)))

(declare-fun b!666450 () Bool)

(assert (=> b!666450 (= e!381681 e!381680)))

(declare-fun res!433800 () Bool)

(assert (=> b!666450 (=> (not res!433800) (not e!381680))))

(assert (=> b!666450 (= res!433800 (bvsle from!3004 i!1382))))

(declare-fun b!666451 () Bool)

(declare-fun res!433802 () Bool)

(assert (=> b!666451 (=> res!433802 e!381677)))

(assert (=> b!666451 (= res!433802 (not (subseq!71 acc!681 lt!310415)))))

(declare-fun b!666452 () Bool)

(declare-fun res!433815 () Bool)

(assert (=> b!666452 (=> res!433815 e!381677)))

(assert (=> b!666452 (= res!433815 lt!310421)))

(assert (= (and start!59996 res!433820) b!666439))

(assert (= (and b!666439 res!433808) b!666433))

(assert (= (and b!666433 res!433818) b!666430))

(assert (= (and b!666430 res!433816) b!666432))

(assert (= (and b!666432 res!433819) b!666446))

(assert (= (and b!666432 (not res!433803)) b!666450))

(assert (= (and b!666450 res!433800) b!666431))

(assert (= (and b!666432 res!433806) b!666438))

(assert (= (and b!666438 res!433812) b!666447))

(assert (= (and b!666447 res!433805) b!666444))

(assert (= (and b!666444 res!433813) b!666448))

(assert (= (and b!666448 res!433809) b!666436))

(assert (= (and b!666436 res!433801) b!666437))

(assert (= (and b!666437 res!433817) b!666440))

(assert (= (and b!666440 c!76682) b!666429))

(assert (= (and b!666440 (not c!76682)) b!666449))

(assert (= (and b!666440 c!76681) b!666428))

(assert (= (and b!666440 (not c!76681)) b!666443))

(assert (= (and b!666440 (not res!433804)) b!666434))

(assert (= (and b!666434 (not res!433807)) b!666452))

(assert (= (and b!666452 (not res!433815)) b!666435))

(assert (= (and b!666435 (not res!433811)) b!666451))

(assert (= (and b!666451 (not res!433802)) b!666441))

(assert (= (and b!666441 (not res!433810)) b!666445))

(assert (= (and b!666445 (not res!433814)) b!666442))

(declare-fun m!637229 () Bool)

(assert (=> b!666445 m!637229))

(declare-fun m!637231 () Bool)

(assert (=> start!59996 m!637231))

(declare-fun m!637233 () Bool)

(assert (=> b!666448 m!637233))

(declare-fun m!637235 () Bool)

(assert (=> b!666438 m!637235))

(declare-fun m!637237 () Bool)

(assert (=> b!666434 m!637237))

(declare-fun m!637239 () Bool)

(assert (=> b!666436 m!637239))

(declare-fun m!637241 () Bool)

(assert (=> b!666435 m!637241))

(assert (=> b!666431 m!637241))

(declare-fun m!637243 () Bool)

(assert (=> b!666447 m!637243))

(declare-fun m!637245 () Bool)

(assert (=> b!666439 m!637245))

(declare-fun m!637247 () Bool)

(assert (=> b!666433 m!637247))

(declare-fun m!637249 () Bool)

(assert (=> b!666442 m!637249))

(declare-fun m!637251 () Bool)

(assert (=> b!666430 m!637251))

(declare-fun m!637253 () Bool)

(assert (=> b!666440 m!637253))

(declare-fun m!637255 () Bool)

(assert (=> b!666440 m!637255))

(declare-fun m!637257 () Bool)

(assert (=> b!666440 m!637257))

(declare-fun m!637259 () Bool)

(assert (=> b!666440 m!637259))

(declare-fun m!637261 () Bool)

(assert (=> b!666440 m!637261))

(declare-fun m!637263 () Bool)

(assert (=> b!666440 m!637263))

(declare-fun m!637265 () Bool)

(assert (=> b!666440 m!637265))

(declare-fun m!637267 () Bool)

(assert (=> b!666440 m!637267))

(assert (=> b!666440 m!637255))

(declare-fun m!637269 () Bool)

(assert (=> b!666440 m!637269))

(declare-fun m!637271 () Bool)

(assert (=> b!666440 m!637271))

(declare-fun m!637273 () Bool)

(assert (=> b!666440 m!637273))

(declare-fun m!637275 () Bool)

(assert (=> b!666441 m!637275))

(declare-fun m!637277 () Bool)

(assert (=> b!666451 m!637277))

(declare-fun m!637279 () Bool)

(assert (=> b!666429 m!637279))

(assert (=> b!666446 m!637241))

(assert (=> b!666428 m!637253))

(assert (=> b!666428 m!637255))

(declare-fun m!637281 () Bool)

(assert (=> b!666428 m!637281))

(declare-fun m!637283 () Bool)

(assert (=> b!666428 m!637283))

(assert (=> b!666428 m!637255))

(assert (=> b!666428 m!637281))

(assert (=> b!666428 m!637263))

(assert (=> b!666428 m!637273))

(push 1)

(assert (not b!666451))

(assert (not b!666428))

(assert (not b!666441))

(assert (not b!666439))

(assert (not b!666445))

(assert (not b!666433))

(assert (not b!666442))

(assert (not b!666434))

(assert (not b!666435))

(assert (not start!59996))

(assert (not b!666436))

(assert (not b!666440))

(assert (not b!666431))

(assert (not b!666430))

(assert (not b!666438))

(assert (not b!666446))

(assert (not b!666448))

(assert (not b!666429))

(assert (not b!666447))

(check-sat)

