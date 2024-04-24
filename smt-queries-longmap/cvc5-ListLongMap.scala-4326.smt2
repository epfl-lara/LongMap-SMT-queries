; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60046 () Bool)

(assert start!60046)

(declare-fun b!666353 () Bool)

(declare-fun res!433670 () Bool)

(declare-fun e!381726 () Bool)

(assert (=> b!666353 (=> res!433670 e!381726)))

(declare-datatypes ((List!12653 0))(
  ( (Nil!12650) (Cons!12649 (h!13697 (_ BitVec 64)) (t!18873 List!12653)) )
))
(declare-fun acc!681 () List!12653)

(declare-fun lt!310403 () List!12653)

(declare-fun subseq!67 (List!12653 List!12653) Bool)

(assert (=> b!666353 (= res!433670 (not (subseq!67 acc!681 lt!310403)))))

(declare-fun b!666354 () Bool)

(declare-fun res!433671 () Bool)

(declare-fun e!381722 () Bool)

(assert (=> b!666354 (=> (not res!433671) (not e!381722))))

(declare-fun noDuplicate!579 (List!12653) Bool)

(assert (=> b!666354 (= res!433671 (noDuplicate!579 acc!681))))

(declare-fun b!666355 () Bool)

(declare-datatypes ((Unit!23254 0))(
  ( (Unit!23255) )
))
(declare-fun e!381721 () Unit!23254)

(declare-fun Unit!23256 () Unit!23254)

(assert (=> b!666355 (= e!381721 Unit!23256)))

(declare-fun b!666356 () Bool)

(declare-fun res!433672 () Bool)

(assert (=> b!666356 (=> res!433672 e!381726)))

(declare-fun contains!3305 (List!12653 (_ BitVec 64)) Bool)

(assert (=> b!666356 (= res!433672 (contains!3305 lt!310403 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!666357 () Bool)

(declare-fun res!433663 () Bool)

(assert (=> b!666357 (=> res!433663 e!381726)))

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!666357 (= res!433663 (not (contains!3305 lt!310403 k!2843)))))

(declare-fun b!666358 () Bool)

(declare-fun res!433678 () Bool)

(assert (=> b!666358 (=> (not res!433678) (not e!381722))))

(declare-datatypes ((array!39031 0))(
  ( (array!39032 (arr!18705 (Array (_ BitVec 32) (_ BitVec 64))) (size!19069 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39031)

(declare-fun arrayNoDuplicates!0 (array!39031 (_ BitVec 32) List!12653) Bool)

(assert (=> b!666358 (= res!433678 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12650))))

(declare-fun b!666359 () Bool)

(declare-fun res!433674 () Bool)

(assert (=> b!666359 (=> (not res!433674) (not e!381722))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!666359 (= res!433674 (validKeyInArray!0 k!2843))))

(declare-fun b!666360 () Bool)

(declare-fun res!433679 () Bool)

(assert (=> b!666360 (=> (not res!433679) (not e!381722))))

(declare-fun e!381725 () Bool)

(assert (=> b!666360 (= res!433679 e!381725)))

(declare-fun res!433673 () Bool)

(assert (=> b!666360 (=> res!433673 e!381725)))

(declare-fun e!381719 () Bool)

(assert (=> b!666360 (= res!433673 e!381719)))

(declare-fun res!433666 () Bool)

(assert (=> b!666360 (=> (not res!433666) (not e!381719))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!666360 (= res!433666 (bvsgt from!3004 i!1382))))

(declare-fun b!666361 () Bool)

(declare-fun res!433681 () Bool)

(assert (=> b!666361 (=> res!433681 e!381726)))

(assert (=> b!666361 (= res!433681 (contains!3305 acc!681 k!2843))))

(declare-fun b!666362 () Bool)

(declare-fun res!433669 () Bool)

(assert (=> b!666362 (=> (not res!433669) (not e!381722))))

(declare-fun arrayContainsKey!0 (array!39031 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!666362 (= res!433669 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun res!433664 () Bool)

(assert (=> start!60046 (=> (not res!433664) (not e!381722))))

(assert (=> start!60046 (= res!433664 (and (bvslt (size!19069 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19069 a!3626))))))

(assert (=> start!60046 e!381722))

(assert (=> start!60046 true))

(declare-fun array_inv!14564 (array!39031) Bool)

(assert (=> start!60046 (array_inv!14564 a!3626)))

(declare-fun b!666352 () Bool)

(declare-fun res!433667 () Bool)

(assert (=> b!666352 (=> (not res!433667) (not e!381722))))

(assert (=> b!666352 (= res!433667 (not (contains!3305 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!666363 () Bool)

(declare-fun e!381724 () Bool)

(assert (=> b!666363 (= e!381725 e!381724)))

(declare-fun res!433680 () Bool)

(assert (=> b!666363 (=> (not res!433680) (not e!381724))))

(assert (=> b!666363 (= res!433680 (bvsle from!3004 i!1382))))

(declare-fun b!666364 () Bool)

(declare-fun res!433661 () Bool)

(assert (=> b!666364 (=> res!433661 e!381726)))

(assert (=> b!666364 (= res!433661 (not (noDuplicate!579 lt!310403)))))

(declare-fun b!666365 () Bool)

(assert (=> b!666365 (= e!381724 (not (contains!3305 acc!681 k!2843)))))

(declare-fun b!666366 () Bool)

(declare-fun res!433662 () Bool)

(assert (=> b!666366 (=> (not res!433662) (not e!381722))))

(assert (=> b!666366 (= res!433662 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!666367 () Bool)

(declare-fun res!433676 () Bool)

(assert (=> b!666367 (=> (not res!433676) (not e!381722))))

(assert (=> b!666367 (= res!433676 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19069 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!666368 () Bool)

(declare-fun e!381720 () Unit!23254)

(declare-fun Unit!23257 () Unit!23254)

(assert (=> b!666368 (= e!381720 Unit!23257)))

(declare-fun lt!310402 () Unit!23254)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39031 (_ BitVec 64) (_ BitVec 32)) Unit!23254)

(assert (=> b!666368 (= lt!310402 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!666368 false))

(declare-fun b!666369 () Bool)

(assert (=> b!666369 (= e!381726 true)))

(declare-fun lt!310398 () Bool)

(assert (=> b!666369 (= lt!310398 (contains!3305 lt!310403 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!666370 () Bool)

(assert (=> b!666370 (= e!381722 (not e!381726))))

(declare-fun res!433677 () Bool)

(assert (=> b!666370 (=> res!433677 e!381726)))

(assert (=> b!666370 (= res!433677 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!64 (List!12653 (_ BitVec 64)) List!12653)

(assert (=> b!666370 (= (-!64 lt!310403 k!2843) acc!681)))

(declare-fun $colon$colon!196 (List!12653 (_ BitVec 64)) List!12653)

(assert (=> b!666370 (= lt!310403 ($colon$colon!196 acc!681 k!2843))))

(declare-fun lt!310404 () Unit!23254)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12653) Unit!23254)

(assert (=> b!666370 (= lt!310404 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!666370 (subseq!67 acc!681 acc!681)))

(declare-fun lt!310399 () Unit!23254)

(declare-fun lemmaListSubSeqRefl!0 (List!12653) Unit!23254)

(assert (=> b!666370 (= lt!310399 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!666370 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310396 () Unit!23254)

(assert (=> b!666370 (= lt!310396 e!381721)))

(declare-fun c!76714 () Bool)

(assert (=> b!666370 (= c!76714 (validKeyInArray!0 (select (arr!18705 a!3626) from!3004)))))

(declare-fun lt!310397 () Unit!23254)

(assert (=> b!666370 (= lt!310397 e!381720)))

(declare-fun c!76715 () Bool)

(declare-fun lt!310401 () Bool)

(assert (=> b!666370 (= c!76715 lt!310401)))

(assert (=> b!666370 (= lt!310401 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!666370 (arrayContainsKey!0 (array!39032 (store (arr!18705 a!3626) i!1382 k!2843) (size!19069 a!3626)) k!2843 from!3004)))

(declare-fun b!666371 () Bool)

(assert (=> b!666371 (= e!381719 (contains!3305 acc!681 k!2843))))

(declare-fun b!666372 () Bool)

(declare-fun res!433665 () Bool)

(assert (=> b!666372 (=> res!433665 e!381726)))

(assert (=> b!666372 (= res!433665 lt!310401)))

(declare-fun b!666373 () Bool)

(declare-fun lt!310400 () Unit!23254)

(assert (=> b!666373 (= e!381721 lt!310400)))

(declare-fun lt!310405 () Unit!23254)

(assert (=> b!666373 (= lt!310405 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!666373 (subseq!67 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39031 List!12653 List!12653 (_ BitVec 32)) Unit!23254)

(assert (=> b!666373 (= lt!310400 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!196 acc!681 (select (arr!18705 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!666373 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!666374 () Bool)

(declare-fun res!433675 () Bool)

(assert (=> b!666374 (=> (not res!433675) (not e!381722))))

(assert (=> b!666374 (= res!433675 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19069 a!3626))))))

(declare-fun b!666375 () Bool)

(declare-fun Unit!23258 () Unit!23254)

(assert (=> b!666375 (= e!381720 Unit!23258)))

(declare-fun b!666376 () Bool)

(declare-fun res!433668 () Bool)

(assert (=> b!666376 (=> (not res!433668) (not e!381722))))

(assert (=> b!666376 (= res!433668 (not (contains!3305 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60046 res!433664) b!666354))

(assert (= (and b!666354 res!433671) b!666352))

(assert (= (and b!666352 res!433667) b!666376))

(assert (= (and b!666376 res!433668) b!666360))

(assert (= (and b!666360 res!433666) b!666371))

(assert (= (and b!666360 (not res!433673)) b!666363))

(assert (= (and b!666363 res!433680) b!666365))

(assert (= (and b!666360 res!433679) b!666358))

(assert (= (and b!666358 res!433678) b!666366))

(assert (= (and b!666366 res!433662) b!666374))

(assert (= (and b!666374 res!433675) b!666359))

(assert (= (and b!666359 res!433674) b!666362))

(assert (= (and b!666362 res!433669) b!666367))

(assert (= (and b!666367 res!433676) b!666370))

(assert (= (and b!666370 c!76715) b!666368))

(assert (= (and b!666370 (not c!76715)) b!666375))

(assert (= (and b!666370 c!76714) b!666373))

(assert (= (and b!666370 (not c!76714)) b!666355))

(assert (= (and b!666370 (not res!433677)) b!666364))

(assert (= (and b!666364 (not res!433661)) b!666372))

(assert (= (and b!666372 (not res!433665)) b!666361))

(assert (= (and b!666361 (not res!433681)) b!666353))

(assert (= (and b!666353 (not res!433670)) b!666357))

(assert (= (and b!666357 (not res!433663)) b!666356))

(assert (= (and b!666356 (not res!433672)) b!666369))

(declare-fun m!637703 () Bool)

(assert (=> b!666354 m!637703))

(declare-fun m!637705 () Bool)

(assert (=> b!666373 m!637705))

(declare-fun m!637707 () Bool)

(assert (=> b!666373 m!637707))

(declare-fun m!637709 () Bool)

(assert (=> b!666373 m!637709))

(declare-fun m!637711 () Bool)

(assert (=> b!666373 m!637711))

(assert (=> b!666373 m!637707))

(assert (=> b!666373 m!637709))

(declare-fun m!637713 () Bool)

(assert (=> b!666373 m!637713))

(declare-fun m!637715 () Bool)

(assert (=> b!666373 m!637715))

(declare-fun m!637717 () Bool)

(assert (=> b!666371 m!637717))

(declare-fun m!637719 () Bool)

(assert (=> b!666366 m!637719))

(assert (=> b!666361 m!637717))

(declare-fun m!637721 () Bool)

(assert (=> b!666368 m!637721))

(declare-fun m!637723 () Bool)

(assert (=> b!666356 m!637723))

(declare-fun m!637725 () Bool)

(assert (=> start!60046 m!637725))

(declare-fun m!637727 () Bool)

(assert (=> b!666358 m!637727))

(declare-fun m!637729 () Bool)

(assert (=> b!666364 m!637729))

(declare-fun m!637731 () Bool)

(assert (=> b!666369 m!637731))

(declare-fun m!637733 () Bool)

(assert (=> b!666376 m!637733))

(declare-fun m!637735 () Bool)

(assert (=> b!666357 m!637735))

(declare-fun m!637737 () Bool)

(assert (=> b!666352 m!637737))

(assert (=> b!666370 m!637705))

(assert (=> b!666370 m!637707))

(declare-fun m!637739 () Bool)

(assert (=> b!666370 m!637739))

(declare-fun m!637741 () Bool)

(assert (=> b!666370 m!637741))

(declare-fun m!637743 () Bool)

(assert (=> b!666370 m!637743))

(assert (=> b!666370 m!637713))

(declare-fun m!637745 () Bool)

(assert (=> b!666370 m!637745))

(declare-fun m!637747 () Bool)

(assert (=> b!666370 m!637747))

(assert (=> b!666370 m!637707))

(declare-fun m!637749 () Bool)

(assert (=> b!666370 m!637749))

(declare-fun m!637751 () Bool)

(assert (=> b!666370 m!637751))

(assert (=> b!666370 m!637715))

(declare-fun m!637753 () Bool)

(assert (=> b!666362 m!637753))

(declare-fun m!637755 () Bool)

(assert (=> b!666359 m!637755))

(assert (=> b!666365 m!637717))

(declare-fun m!637757 () Bool)

(assert (=> b!666353 m!637757))

(push 1)

(assert (not b!666365))

(assert (not b!666352))

(assert (not start!60046))

(assert (not b!666358))

(assert (not b!666353))

(assert (not b!666371))

(assert (not b!666373))

(assert (not b!666361))

(assert (not b!666357))

(assert (not b!666359))

(assert (not b!666376))

(assert (not b!666356))

(assert (not b!666362))

(assert (not b!666366))

(assert (not b!666370))

(assert (not b!666364))

(assert (not b!666368))

(assert (not b!666354))

(assert (not b!666369))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

