; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60024 () Bool)

(assert start!60024)

(declare-fun res!434702 () Bool)

(declare-fun e!382042 () Bool)

(assert (=> start!60024 (=> (not res!434702) (not e!382042))))

(declare-datatypes ((array!39071 0))(
  ( (array!39072 (arr!18728 (Array (_ BitVec 32) (_ BitVec 64))) (size!19092 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39071)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60024 (= res!434702 (and (bvslt (size!19092 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19092 a!3626))))))

(assert (=> start!60024 e!382042))

(assert (=> start!60024 true))

(declare-fun array_inv!14524 (array!39071) Bool)

(assert (=> start!60024 (array_inv!14524 a!3626)))

(declare-fun b!667478 () Bool)

(declare-fun e!382036 () Bool)

(declare-datatypes ((List!12769 0))(
  ( (Nil!12766) (Cons!12765 (h!13810 (_ BitVec 64)) (t!18997 List!12769)) )
))
(declare-fun acc!681 () List!12769)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3346 (List!12769 (_ BitVec 64)) Bool)

(assert (=> b!667478 (= e!382036 (contains!3346 acc!681 k!2843))))

(declare-fun b!667479 () Bool)

(declare-fun res!434693 () Bool)

(assert (=> b!667479 (=> (not res!434693) (not e!382042))))

(assert (=> b!667479 (= res!434693 (not (contains!3346 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!667480 () Bool)

(declare-fun res!434700 () Bool)

(assert (=> b!667480 (=> (not res!434700) (not e!382042))))

(declare-fun noDuplicate!593 (List!12769) Bool)

(assert (=> b!667480 (= res!434700 (noDuplicate!593 acc!681))))

(declare-fun b!667481 () Bool)

(declare-fun res!434684 () Bool)

(assert (=> b!667481 (=> (not res!434684) (not e!382042))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!667481 (= res!434684 (validKeyInArray!0 k!2843))))

(declare-fun b!667482 () Bool)

(declare-fun res!434682 () Bool)

(assert (=> b!667482 (=> (not res!434682) (not e!382042))))

(declare-fun e!382037 () Bool)

(assert (=> b!667482 (= res!434682 e!382037)))

(declare-fun res!434699 () Bool)

(assert (=> b!667482 (=> res!434699 e!382037)))

(assert (=> b!667482 (= res!434699 e!382036)))

(declare-fun res!434697 () Bool)

(assert (=> b!667482 (=> (not res!434697) (not e!382036))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!667482 (= res!434697 (bvsgt from!3004 i!1382))))

(declare-fun b!667483 () Bool)

(declare-fun res!434696 () Bool)

(assert (=> b!667483 (=> (not res!434696) (not e!382042))))

(assert (=> b!667483 (= res!434696 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19092 a!3626))))))

(declare-fun b!667484 () Bool)

(declare-fun e!382040 () Bool)

(assert (=> b!667484 (= e!382040 (not (contains!3346 acc!681 k!2843)))))

(declare-fun b!667485 () Bool)

(declare-datatypes ((Unit!23365 0))(
  ( (Unit!23366) )
))
(declare-fun e!382038 () Unit!23365)

(declare-fun Unit!23367 () Unit!23365)

(assert (=> b!667485 (= e!382038 Unit!23367)))

(declare-fun b!667486 () Bool)

(declare-fun res!434691 () Bool)

(declare-fun e!382043 () Bool)

(assert (=> b!667486 (=> res!434691 e!382043)))

(declare-fun lt!310840 () List!12769)

(assert (=> b!667486 (= res!434691 (contains!3346 lt!310840 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!667487 () Bool)

(declare-fun res!434689 () Bool)

(assert (=> b!667487 (=> res!434689 e!382043)))

(assert (=> b!667487 (= res!434689 (not (noDuplicate!593 lt!310840)))))

(declare-fun b!667488 () Bool)

(declare-fun e!382035 () Unit!23365)

(declare-fun Unit!23368 () Unit!23365)

(assert (=> b!667488 (= e!382035 Unit!23368)))

(declare-fun b!667489 () Bool)

(declare-fun e!382034 () Bool)

(declare-fun e!382044 () Bool)

(assert (=> b!667489 (= e!382034 e!382044)))

(declare-fun res!434685 () Bool)

(assert (=> b!667489 (=> (not res!434685) (not e!382044))))

(assert (=> b!667489 (= res!434685 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!667490 () Bool)

(declare-fun Unit!23369 () Unit!23365)

(assert (=> b!667490 (= e!382035 Unit!23369)))

(declare-fun lt!310835 () Unit!23365)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39071 (_ BitVec 64) (_ BitVec 32)) Unit!23365)

(assert (=> b!667490 (= lt!310835 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!667490 false))

(declare-fun b!667491 () Bool)

(declare-fun res!434686 () Bool)

(assert (=> b!667491 (=> (not res!434686) (not e!382042))))

(declare-fun arrayNoDuplicates!0 (array!39071 (_ BitVec 32) List!12769) Bool)

(assert (=> b!667491 (= res!434686 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12766))))

(declare-fun b!667492 () Bool)

(declare-fun res!434690 () Bool)

(assert (=> b!667492 (=> res!434690 e!382043)))

(assert (=> b!667492 (= res!434690 (contains!3346 lt!310840 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!667493 () Bool)

(declare-fun lt!310842 () Unit!23365)

(assert (=> b!667493 (= e!382038 lt!310842)))

(declare-fun lt!310836 () Unit!23365)

(declare-fun lemmaListSubSeqRefl!0 (List!12769) Unit!23365)

(assert (=> b!667493 (= lt!310836 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!85 (List!12769 List!12769) Bool)

(assert (=> b!667493 (subseq!85 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39071 List!12769 List!12769 (_ BitVec 32)) Unit!23365)

(declare-fun $colon$colon!217 (List!12769 (_ BitVec 64)) List!12769)

(assert (=> b!667493 (= lt!310842 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!217 acc!681 (select (arr!18728 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!667493 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!667494 () Bool)

(assert (=> b!667494 (= e!382043 true)))

(declare-fun lt!310837 () Bool)

(assert (=> b!667494 (= lt!310837 e!382034)))

(declare-fun res!434688 () Bool)

(assert (=> b!667494 (=> res!434688 e!382034)))

(declare-fun e!382039 () Bool)

(assert (=> b!667494 (= res!434688 e!382039)))

(declare-fun res!434687 () Bool)

(assert (=> b!667494 (=> (not res!434687) (not e!382039))))

(assert (=> b!667494 (= res!434687 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!667495 () Bool)

(assert (=> b!667495 (= e!382044 (not (contains!3346 lt!310840 k!2843)))))

(declare-fun b!667496 () Bool)

(assert (=> b!667496 (= e!382042 (not e!382043))))

(declare-fun res!434701 () Bool)

(assert (=> b!667496 (=> res!434701 e!382043)))

(assert (=> b!667496 (= res!434701 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!667496 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!310840)))

(declare-fun lt!310839 () Unit!23365)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39071 (_ BitVec 64) (_ BitVec 32) List!12769 List!12769) Unit!23365)

(assert (=> b!667496 (= lt!310839 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!310840))))

(declare-fun -!83 (List!12769 (_ BitVec 64)) List!12769)

(assert (=> b!667496 (= (-!83 lt!310840 k!2843) acc!681)))

(assert (=> b!667496 (= lt!310840 ($colon$colon!217 acc!681 k!2843))))

(declare-fun lt!310843 () Unit!23365)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12769) Unit!23365)

(assert (=> b!667496 (= lt!310843 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!667496 (subseq!85 acc!681 acc!681)))

(declare-fun lt!310841 () Unit!23365)

(assert (=> b!667496 (= lt!310841 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!667496 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310834 () Unit!23365)

(assert (=> b!667496 (= lt!310834 e!382038)))

(declare-fun c!76766 () Bool)

(assert (=> b!667496 (= c!76766 (validKeyInArray!0 (select (arr!18728 a!3626) from!3004)))))

(declare-fun lt!310838 () Unit!23365)

(assert (=> b!667496 (= lt!310838 e!382035)))

(declare-fun c!76765 () Bool)

(declare-fun arrayContainsKey!0 (array!39071 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!667496 (= c!76765 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!667496 (arrayContainsKey!0 (array!39072 (store (arr!18728 a!3626) i!1382 k!2843) (size!19092 a!3626)) k!2843 from!3004)))

(declare-fun b!667497 () Bool)

(assert (=> b!667497 (= e!382039 (contains!3346 lt!310840 k!2843))))

(declare-fun b!667498 () Bool)

(assert (=> b!667498 (= e!382037 e!382040)))

(declare-fun res!434692 () Bool)

(assert (=> b!667498 (=> (not res!434692) (not e!382040))))

(assert (=> b!667498 (= res!434692 (bvsle from!3004 i!1382))))

(declare-fun b!667499 () Bool)

(declare-fun res!434683 () Bool)

(assert (=> b!667499 (=> (not res!434683) (not e!382042))))

(assert (=> b!667499 (= res!434683 (not (contains!3346 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!667500 () Bool)

(declare-fun res!434698 () Bool)

(assert (=> b!667500 (=> (not res!434698) (not e!382042))))

(assert (=> b!667500 (= res!434698 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19092 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!667501 () Bool)

(declare-fun res!434694 () Bool)

(assert (=> b!667501 (=> (not res!434694) (not e!382042))))

(assert (=> b!667501 (= res!434694 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!667502 () Bool)

(declare-fun res!434695 () Bool)

(assert (=> b!667502 (=> (not res!434695) (not e!382042))))

(assert (=> b!667502 (= res!434695 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(assert (= (and start!60024 res!434702) b!667480))

(assert (= (and b!667480 res!434700) b!667499))

(assert (= (and b!667499 res!434683) b!667479))

(assert (= (and b!667479 res!434693) b!667482))

(assert (= (and b!667482 res!434697) b!667478))

(assert (= (and b!667482 (not res!434699)) b!667498))

(assert (= (and b!667498 res!434692) b!667484))

(assert (= (and b!667482 res!434682) b!667491))

(assert (= (and b!667491 res!434686) b!667501))

(assert (= (and b!667501 res!434694) b!667483))

(assert (= (and b!667483 res!434696) b!667481))

(assert (= (and b!667481 res!434684) b!667502))

(assert (= (and b!667502 res!434695) b!667500))

(assert (= (and b!667500 res!434698) b!667496))

(assert (= (and b!667496 c!76765) b!667490))

(assert (= (and b!667496 (not c!76765)) b!667488))

(assert (= (and b!667496 c!76766) b!667493))

(assert (= (and b!667496 (not c!76766)) b!667485))

(assert (= (and b!667496 (not res!434701)) b!667487))

(assert (= (and b!667487 (not res!434689)) b!667492))

(assert (= (and b!667492 (not res!434690)) b!667486))

(assert (= (and b!667486 (not res!434691)) b!667494))

(assert (= (and b!667494 res!434687) b!667497))

(assert (= (and b!667494 (not res!434688)) b!667489))

(assert (= (and b!667489 res!434685) b!667495))

(declare-fun m!638017 () Bool)

(assert (=> b!667493 m!638017))

(declare-fun m!638019 () Bool)

(assert (=> b!667493 m!638019))

(declare-fun m!638021 () Bool)

(assert (=> b!667493 m!638021))

(declare-fun m!638023 () Bool)

(assert (=> b!667493 m!638023))

(assert (=> b!667493 m!638019))

(assert (=> b!667493 m!638021))

(declare-fun m!638025 () Bool)

(assert (=> b!667493 m!638025))

(declare-fun m!638027 () Bool)

(assert (=> b!667493 m!638027))

(declare-fun m!638029 () Bool)

(assert (=> b!667497 m!638029))

(declare-fun m!638031 () Bool)

(assert (=> b!667486 m!638031))

(declare-fun m!638033 () Bool)

(assert (=> b!667499 m!638033))

(declare-fun m!638035 () Bool)

(assert (=> start!60024 m!638035))

(declare-fun m!638037 () Bool)

(assert (=> b!667487 m!638037))

(declare-fun m!638039 () Bool)

(assert (=> b!667481 m!638039))

(declare-fun m!638041 () Bool)

(assert (=> b!667490 m!638041))

(declare-fun m!638043 () Bool)

(assert (=> b!667496 m!638043))

(declare-fun m!638045 () Bool)

(assert (=> b!667496 m!638045))

(assert (=> b!667496 m!638017))

(assert (=> b!667496 m!638019))

(declare-fun m!638047 () Bool)

(assert (=> b!667496 m!638047))

(assert (=> b!667496 m!638025))

(declare-fun m!638049 () Bool)

(assert (=> b!667496 m!638049))

(declare-fun m!638051 () Bool)

(assert (=> b!667496 m!638051))

(assert (=> b!667496 m!638019))

(declare-fun m!638053 () Bool)

(assert (=> b!667496 m!638053))

(declare-fun m!638055 () Bool)

(assert (=> b!667496 m!638055))

(declare-fun m!638057 () Bool)

(assert (=> b!667496 m!638057))

(declare-fun m!638059 () Bool)

(assert (=> b!667496 m!638059))

(assert (=> b!667496 m!638027))

(declare-fun m!638061 () Bool)

(assert (=> b!667492 m!638061))

(declare-fun m!638063 () Bool)

(assert (=> b!667479 m!638063))

(declare-fun m!638065 () Bool)

(assert (=> b!667480 m!638065))

(declare-fun m!638067 () Bool)

(assert (=> b!667491 m!638067))

(assert (=> b!667495 m!638029))

(declare-fun m!638069 () Bool)

(assert (=> b!667502 m!638069))

(declare-fun m!638071 () Bool)

(assert (=> b!667484 m!638071))

(assert (=> b!667478 m!638071))

(declare-fun m!638073 () Bool)

(assert (=> b!667501 m!638073))

(push 1)

(assert (not b!667496))

(assert (not b!667493))

(assert (not b!667502))

(assert (not b!667481))

(assert (not b!667491))

(assert (not b!667478))

(assert (not b!667480))

(assert (not b!667492))

(assert (not b!667499))

(assert (not b!667490))

(assert (not b!667487))

(assert (not b!667501))

(assert (not b!667495))

(assert (not b!667479))

(assert (not b!667484))

(assert (not b!667497))

(assert (not start!60024))

(assert (not b!667486))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

