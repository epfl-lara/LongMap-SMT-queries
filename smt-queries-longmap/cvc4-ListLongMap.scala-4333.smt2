; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60016 () Bool)

(assert start!60016)

(declare-fun b!667332 () Bool)

(declare-fun e!381918 () Bool)

(declare-datatypes ((List!12809 0))(
  ( (Nil!12806) (Cons!12805 (h!13850 (_ BitVec 64)) (t!19028 List!12809)) )
))
(declare-fun lt!310646 () List!12809)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3331 (List!12809 (_ BitVec 64)) Bool)

(assert (=> b!667332 (= e!381918 (not (contains!3331 lt!310646 k!2843)))))

(declare-fun b!667333 () Bool)

(declare-fun res!434672 () Bool)

(declare-fun e!381917 () Bool)

(assert (=> b!667333 (=> res!434672 e!381917)))

(assert (=> b!667333 (= res!434672 (contains!3331 lt!310646 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!667334 () Bool)

(declare-fun res!434687 () Bool)

(declare-fun e!381911 () Bool)

(assert (=> b!667334 (=> (not res!434687) (not e!381911))))

(declare-fun acc!681 () List!12809)

(assert (=> b!667334 (= res!434687 (not (contains!3331 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!667335 () Bool)

(declare-fun res!434678 () Bool)

(assert (=> b!667335 (=> (not res!434678) (not e!381911))))

(declare-fun noDuplicate!600 (List!12809) Bool)

(assert (=> b!667335 (= res!434678 (noDuplicate!600 acc!681))))

(declare-fun b!667336 () Bool)

(declare-fun res!434675 () Bool)

(assert (=> b!667336 (=> res!434675 e!381917)))

(assert (=> b!667336 (= res!434675 (contains!3331 lt!310646 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!667337 () Bool)

(declare-fun res!434679 () Bool)

(assert (=> b!667337 (=> (not res!434679) (not e!381911))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39074 0))(
  ( (array!39075 (arr!18729 (Array (_ BitVec 32) (_ BitVec 64))) (size!19094 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39074)

(assert (=> b!667337 (= res!434679 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19094 a!3626))))))

(declare-fun b!667338 () Bool)

(declare-fun e!381910 () Bool)

(declare-fun e!381915 () Bool)

(assert (=> b!667338 (= e!381910 e!381915)))

(declare-fun res!434690 () Bool)

(assert (=> b!667338 (=> (not res!434690) (not e!381915))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!667338 (= res!434690 (bvsle from!3004 i!1382))))

(declare-fun b!667339 () Bool)

(declare-datatypes ((Unit!23353 0))(
  ( (Unit!23354) )
))
(declare-fun e!381914 () Unit!23353)

(declare-fun Unit!23355 () Unit!23353)

(assert (=> b!667339 (= e!381914 Unit!23355)))

(declare-fun b!667340 () Bool)

(declare-fun e!381916 () Unit!23353)

(declare-fun Unit!23356 () Unit!23353)

(assert (=> b!667340 (= e!381916 Unit!23356)))

(declare-fun b!667341 () Bool)

(declare-fun lt!310641 () Unit!23353)

(assert (=> b!667341 (= e!381914 lt!310641)))

(declare-fun lt!310640 () Unit!23353)

(declare-fun lemmaListSubSeqRefl!0 (List!12809) Unit!23353)

(assert (=> b!667341 (= lt!310640 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!87 (List!12809 List!12809) Bool)

(assert (=> b!667341 (subseq!87 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39074 List!12809 List!12809 (_ BitVec 32)) Unit!23353)

(declare-fun $colon$colon!218 (List!12809 (_ BitVec 64)) List!12809)

(assert (=> b!667341 (= lt!310641 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!218 acc!681 (select (arr!18729 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39074 (_ BitVec 32) List!12809) Bool)

(assert (=> b!667341 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!667342 () Bool)

(declare-fun res!434673 () Bool)

(assert (=> b!667342 (=> (not res!434673) (not e!381911))))

(assert (=> b!667342 (= res!434673 e!381910)))

(declare-fun res!434692 () Bool)

(assert (=> b!667342 (=> res!434692 e!381910)))

(declare-fun e!381919 () Bool)

(assert (=> b!667342 (= res!434692 e!381919)))

(declare-fun res!434684 () Bool)

(assert (=> b!667342 (=> (not res!434684) (not e!381919))))

(assert (=> b!667342 (= res!434684 (bvsgt from!3004 i!1382))))

(declare-fun res!434680 () Bool)

(assert (=> start!60016 (=> (not res!434680) (not e!381911))))

(assert (=> start!60016 (= res!434680 (and (bvslt (size!19094 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19094 a!3626))))))

(assert (=> start!60016 e!381911))

(assert (=> start!60016 true))

(declare-fun array_inv!14612 (array!39074) Bool)

(assert (=> start!60016 (array_inv!14612 a!3626)))

(declare-fun b!667343 () Bool)

(declare-fun res!434677 () Bool)

(assert (=> b!667343 (=> (not res!434677) (not e!381911))))

(assert (=> b!667343 (= res!434677 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12806))))

(declare-fun b!667344 () Bool)

(declare-fun e!381920 () Bool)

(assert (=> b!667344 (= e!381920 e!381918)))

(declare-fun res!434676 () Bool)

(assert (=> b!667344 (=> (not res!434676) (not e!381918))))

(assert (=> b!667344 (= res!434676 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!667345 () Bool)

(declare-fun res!434691 () Bool)

(assert (=> b!667345 (=> res!434691 e!381917)))

(assert (=> b!667345 (= res!434691 (not (noDuplicate!600 lt!310646)))))

(declare-fun b!667346 () Bool)

(assert (=> b!667346 (= e!381911 (not e!381917))))

(declare-fun res!434689 () Bool)

(assert (=> b!667346 (=> res!434689 e!381917)))

(assert (=> b!667346 (= res!434689 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!667346 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!310646)))

(declare-fun lt!310647 () Unit!23353)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39074 (_ BitVec 64) (_ BitVec 32) List!12809 List!12809) Unit!23353)

(assert (=> b!667346 (= lt!310647 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!310646))))

(declare-fun -!85 (List!12809 (_ BitVec 64)) List!12809)

(assert (=> b!667346 (= (-!85 lt!310646 k!2843) acc!681)))

(assert (=> b!667346 (= lt!310646 ($colon$colon!218 acc!681 k!2843))))

(declare-fun lt!310644 () Unit!23353)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12809) Unit!23353)

(assert (=> b!667346 (= lt!310644 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!667346 (subseq!87 acc!681 acc!681)))

(declare-fun lt!310642 () Unit!23353)

(assert (=> b!667346 (= lt!310642 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!667346 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310638 () Unit!23353)

(assert (=> b!667346 (= lt!310638 e!381914)))

(declare-fun c!76697 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!667346 (= c!76697 (validKeyInArray!0 (select (arr!18729 a!3626) from!3004)))))

(declare-fun lt!310643 () Unit!23353)

(assert (=> b!667346 (= lt!310643 e!381916)))

(declare-fun c!76698 () Bool)

(declare-fun arrayContainsKey!0 (array!39074 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!667346 (= c!76698 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!667346 (arrayContainsKey!0 (array!39075 (store (arr!18729 a!3626) i!1382 k!2843) (size!19094 a!3626)) k!2843 from!3004)))

(declare-fun b!667347 () Bool)

(declare-fun e!381913 () Bool)

(assert (=> b!667347 (= e!381913 (contains!3331 lt!310646 k!2843))))

(declare-fun b!667348 () Bool)

(declare-fun Unit!23357 () Unit!23353)

(assert (=> b!667348 (= e!381916 Unit!23357)))

(declare-fun lt!310645 () Unit!23353)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39074 (_ BitVec 64) (_ BitVec 32)) Unit!23353)

(assert (=> b!667348 (= lt!310645 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!667348 false))

(declare-fun b!667349 () Bool)

(declare-fun res!434685 () Bool)

(assert (=> b!667349 (=> (not res!434685) (not e!381911))))

(assert (=> b!667349 (= res!434685 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!667350 () Bool)

(declare-fun res!434683 () Bool)

(assert (=> b!667350 (=> (not res!434683) (not e!381911))))

(assert (=> b!667350 (= res!434683 (validKeyInArray!0 k!2843))))

(declare-fun b!667351 () Bool)

(declare-fun res!434682 () Bool)

(assert (=> b!667351 (=> (not res!434682) (not e!381911))))

(assert (=> b!667351 (= res!434682 (not (contains!3331 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!667352 () Bool)

(declare-fun res!434681 () Bool)

(assert (=> b!667352 (=> (not res!434681) (not e!381911))))

(assert (=> b!667352 (= res!434681 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!667353 () Bool)

(assert (=> b!667353 (= e!381919 (contains!3331 acc!681 k!2843))))

(declare-fun b!667354 () Bool)

(assert (=> b!667354 (= e!381917 true)))

(declare-fun lt!310639 () Bool)

(assert (=> b!667354 (= lt!310639 e!381920)))

(declare-fun res!434686 () Bool)

(assert (=> b!667354 (=> res!434686 e!381920)))

(assert (=> b!667354 (= res!434686 e!381913)))

(declare-fun res!434674 () Bool)

(assert (=> b!667354 (=> (not res!434674) (not e!381913))))

(assert (=> b!667354 (= res!434674 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!667355 () Bool)

(declare-fun res!434688 () Bool)

(assert (=> b!667355 (=> (not res!434688) (not e!381911))))

(assert (=> b!667355 (= res!434688 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19094 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!667356 () Bool)

(assert (=> b!667356 (= e!381915 (not (contains!3331 acc!681 k!2843)))))

(assert (= (and start!60016 res!434680) b!667335))

(assert (= (and b!667335 res!434678) b!667334))

(assert (= (and b!667334 res!434687) b!667351))

(assert (= (and b!667351 res!434682) b!667342))

(assert (= (and b!667342 res!434684) b!667353))

(assert (= (and b!667342 (not res!434692)) b!667338))

(assert (= (and b!667338 res!434690) b!667356))

(assert (= (and b!667342 res!434673) b!667343))

(assert (= (and b!667343 res!434677) b!667349))

(assert (= (and b!667349 res!434685) b!667337))

(assert (= (and b!667337 res!434679) b!667350))

(assert (= (and b!667350 res!434683) b!667352))

(assert (= (and b!667352 res!434681) b!667355))

(assert (= (and b!667355 res!434688) b!667346))

(assert (= (and b!667346 c!76698) b!667348))

(assert (= (and b!667346 (not c!76698)) b!667340))

(assert (= (and b!667346 c!76697) b!667341))

(assert (= (and b!667346 (not c!76697)) b!667339))

(assert (= (and b!667346 (not res!434689)) b!667345))

(assert (= (and b!667345 (not res!434691)) b!667336))

(assert (= (and b!667336 (not res!434675)) b!667333))

(assert (= (and b!667333 (not res!434672)) b!667354))

(assert (= (and b!667354 res!434674) b!667347))

(assert (= (and b!667354 (not res!434686)) b!667344))

(assert (= (and b!667344 res!434676) b!667332))

(declare-fun m!637351 () Bool)

(assert (=> b!667346 m!637351))

(declare-fun m!637353 () Bool)

(assert (=> b!667346 m!637353))

(declare-fun m!637355 () Bool)

(assert (=> b!667346 m!637355))

(declare-fun m!637357 () Bool)

(assert (=> b!667346 m!637357))

(declare-fun m!637359 () Bool)

(assert (=> b!667346 m!637359))

(declare-fun m!637361 () Bool)

(assert (=> b!667346 m!637361))

(declare-fun m!637363 () Bool)

(assert (=> b!667346 m!637363))

(declare-fun m!637365 () Bool)

(assert (=> b!667346 m!637365))

(declare-fun m!637367 () Bool)

(assert (=> b!667346 m!637367))

(assert (=> b!667346 m!637355))

(declare-fun m!637369 () Bool)

(assert (=> b!667346 m!637369))

(declare-fun m!637371 () Bool)

(assert (=> b!667346 m!637371))

(declare-fun m!637373 () Bool)

(assert (=> b!667346 m!637373))

(declare-fun m!637375 () Bool)

(assert (=> b!667346 m!637375))

(declare-fun m!637377 () Bool)

(assert (=> b!667343 m!637377))

(declare-fun m!637379 () Bool)

(assert (=> b!667335 m!637379))

(declare-fun m!637381 () Bool)

(assert (=> b!667347 m!637381))

(declare-fun m!637383 () Bool)

(assert (=> b!667345 m!637383))

(declare-fun m!637385 () Bool)

(assert (=> b!667349 m!637385))

(declare-fun m!637387 () Bool)

(assert (=> b!667333 m!637387))

(declare-fun m!637389 () Bool)

(assert (=> start!60016 m!637389))

(assert (=> b!667332 m!637381))

(assert (=> b!667341 m!637351))

(assert (=> b!667341 m!637355))

(declare-fun m!637391 () Bool)

(assert (=> b!667341 m!637391))

(declare-fun m!637393 () Bool)

(assert (=> b!667341 m!637393))

(assert (=> b!667341 m!637355))

(assert (=> b!667341 m!637391))

(assert (=> b!667341 m!637363))

(assert (=> b!667341 m!637375))

(declare-fun m!637395 () Bool)

(assert (=> b!667334 m!637395))

(declare-fun m!637397 () Bool)

(assert (=> b!667348 m!637397))

(declare-fun m!637399 () Bool)

(assert (=> b!667352 m!637399))

(declare-fun m!637401 () Bool)

(assert (=> b!667353 m!637401))

(declare-fun m!637403 () Bool)

(assert (=> b!667336 m!637403))

(declare-fun m!637405 () Bool)

(assert (=> b!667351 m!637405))

(assert (=> b!667356 m!637401))

(declare-fun m!637407 () Bool)

(assert (=> b!667350 m!637407))

(push 1)

(assert (not b!667334))

(assert (not b!667336))

(assert (not b!667332))

(assert (not b!667335))

(assert (not b!667349))

(assert (not b!667333))

(assert (not b!667346))

(assert (not b!667352))

(assert (not b!667350))

(assert (not b!667347))

(assert (not b!667353))

(assert (not b!667345))

(assert (not b!667356))

(assert (not b!667343))

(assert (not b!667348))

(assert (not b!667351))

(assert (not b!667341))

(assert (not start!60016))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

