; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60072 () Bool)

(assert start!60072)

(declare-fun b!667327 () Bool)

(declare-fun e!382038 () Bool)

(declare-fun e!382032 () Bool)

(assert (=> b!667327 (= e!382038 (not e!382032))))

(declare-fun res!434499 () Bool)

(assert (=> b!667327 (=> res!434499 e!382032)))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!667327 (= res!434499 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((List!12666 0))(
  ( (Nil!12663) (Cons!12662 (h!13710 (_ BitVec 64)) (t!18886 List!12666)) )
))
(declare-fun lt!310795 () List!12666)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun acc!681 () List!12666)

(declare-fun -!77 (List!12666 (_ BitVec 64)) List!12666)

(assert (=> b!667327 (= (-!77 lt!310795 k0!2843) acc!681)))

(declare-fun $colon$colon!209 (List!12666 (_ BitVec 64)) List!12666)

(assert (=> b!667327 (= lt!310795 ($colon$colon!209 acc!681 k0!2843))))

(declare-datatypes ((Unit!23319 0))(
  ( (Unit!23320) )
))
(declare-fun lt!310794 () Unit!23319)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12666) Unit!23319)

(assert (=> b!667327 (= lt!310794 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!80 (List!12666 List!12666) Bool)

(assert (=> b!667327 (subseq!80 acc!681 acc!681)))

(declare-fun lt!310790 () Unit!23319)

(declare-fun lemmaListSubSeqRefl!0 (List!12666) Unit!23319)

(assert (=> b!667327 (= lt!310790 (lemmaListSubSeqRefl!0 acc!681))))

(declare-datatypes ((array!39057 0))(
  ( (array!39058 (arr!18718 (Array (_ BitVec 32) (_ BitVec 64))) (size!19082 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39057)

(declare-fun arrayNoDuplicates!0 (array!39057 (_ BitVec 32) List!12666) Bool)

(assert (=> b!667327 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310791 () Unit!23319)

(declare-fun e!382034 () Unit!23319)

(assert (=> b!667327 (= lt!310791 e!382034)))

(declare-fun c!76793 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!667327 (= c!76793 (validKeyInArray!0 (select (arr!18718 a!3626) from!3004)))))

(declare-fun lt!310786 () Unit!23319)

(declare-fun e!382037 () Unit!23319)

(assert (=> b!667327 (= lt!310786 e!382037)))

(declare-fun c!76792 () Bool)

(declare-fun lt!310792 () Bool)

(assert (=> b!667327 (= c!76792 lt!310792)))

(declare-fun arrayContainsKey!0 (array!39057 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!667327 (= lt!310792 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!667327 (arrayContainsKey!0 (array!39058 (store (arr!18718 a!3626) i!1382 k0!2843) (size!19082 a!3626)) k0!2843 from!3004)))

(declare-fun b!667328 () Bool)

(declare-fun e!382035 () Bool)

(declare-fun contains!3318 (List!12666 (_ BitVec 64)) Bool)

(assert (=> b!667328 (= e!382035 (not (contains!3318 acc!681 k0!2843)))))

(declare-fun b!667329 () Bool)

(declare-fun res!434497 () Bool)

(assert (=> b!667329 (=> (not res!434497) (not e!382038))))

(assert (=> b!667329 (= res!434497 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12663))))

(declare-fun b!667330 () Bool)

(declare-fun res!434494 () Bool)

(assert (=> b!667330 (=> (not res!434494) (not e!382038))))

(assert (=> b!667330 (= res!434494 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19082 a!3626))))))

(declare-fun b!667331 () Bool)

(declare-fun lt!310789 () Unit!23319)

(assert (=> b!667331 (= e!382034 lt!310789)))

(declare-fun lt!310788 () Unit!23319)

(assert (=> b!667331 (= lt!310788 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!667331 (subseq!80 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39057 List!12666 List!12666 (_ BitVec 32)) Unit!23319)

(assert (=> b!667331 (= lt!310789 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!209 acc!681 (select (arr!18718 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!667331 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!667332 () Bool)

(declare-fun res!434481 () Bool)

(assert (=> b!667332 (=> (not res!434481) (not e!382038))))

(assert (=> b!667332 (= res!434481 (validKeyInArray!0 k0!2843))))

(declare-fun b!667333 () Bool)

(declare-fun res!434489 () Bool)

(assert (=> b!667333 (=> res!434489 e!382032)))

(assert (=> b!667333 (= res!434489 (not (subseq!80 acc!681 lt!310795)))))

(declare-fun b!667334 () Bool)

(declare-fun res!434484 () Bool)

(assert (=> b!667334 (=> res!434484 e!382032)))

(assert (=> b!667334 (= res!434484 (not (contains!3318 lt!310795 k0!2843)))))

(declare-fun b!667335 () Bool)

(declare-fun res!434500 () Bool)

(assert (=> b!667335 (=> res!434500 e!382032)))

(declare-fun noDuplicate!592 (List!12666) Bool)

(assert (=> b!667335 (= res!434500 (not (noDuplicate!592 lt!310795)))))

(declare-fun b!667336 () Bool)

(declare-fun res!434490 () Bool)

(assert (=> b!667336 (=> res!434490 e!382032)))

(assert (=> b!667336 (= res!434490 (contains!3318 acc!681 k0!2843))))

(declare-fun b!667337 () Bool)

(declare-fun res!434496 () Bool)

(assert (=> b!667337 (=> (not res!434496) (not e!382038))))

(assert (=> b!667337 (= res!434496 (not (contains!3318 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!667338 () Bool)

(declare-fun Unit!23321 () Unit!23319)

(assert (=> b!667338 (= e!382037 Unit!23321)))

(declare-fun b!667339 () Bool)

(declare-fun res!434485 () Bool)

(assert (=> b!667339 (=> (not res!434485) (not e!382038))))

(assert (=> b!667339 (= res!434485 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!667340 () Bool)

(declare-fun e!382031 () Bool)

(assert (=> b!667340 (= e!382031 e!382035)))

(declare-fun res!434492 () Bool)

(assert (=> b!667340 (=> (not res!434492) (not e!382035))))

(assert (=> b!667340 (= res!434492 (bvsle from!3004 i!1382))))

(declare-fun b!667341 () Bool)

(declare-fun res!434488 () Bool)

(assert (=> b!667341 (=> (not res!434488) (not e!382038))))

(assert (=> b!667341 (= res!434488 (noDuplicate!592 acc!681))))

(declare-fun b!667342 () Bool)

(declare-fun res!434491 () Bool)

(assert (=> b!667342 (=> res!434491 e!382032)))

(assert (=> b!667342 (= res!434491 lt!310792)))

(declare-fun res!434495 () Bool)

(assert (=> start!60072 (=> (not res!434495) (not e!382038))))

(assert (=> start!60072 (= res!434495 (and (bvslt (size!19082 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19082 a!3626))))))

(assert (=> start!60072 e!382038))

(assert (=> start!60072 true))

(declare-fun array_inv!14577 (array!39057) Bool)

(assert (=> start!60072 (array_inv!14577 a!3626)))

(declare-fun b!667343 () Bool)

(declare-fun res!434493 () Bool)

(assert (=> b!667343 (=> res!434493 e!382032)))

(assert (=> b!667343 (= res!434493 (contains!3318 lt!310795 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!667344 () Bool)

(declare-fun res!434487 () Bool)

(assert (=> b!667344 (=> (not res!434487) (not e!382038))))

(assert (=> b!667344 (= res!434487 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19082 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!667345 () Bool)

(declare-fun Unit!23322 () Unit!23319)

(assert (=> b!667345 (= e!382034 Unit!23322)))

(declare-fun b!667346 () Bool)

(declare-fun res!434486 () Bool)

(assert (=> b!667346 (=> (not res!434486) (not e!382038))))

(assert (=> b!667346 (= res!434486 (not (contains!3318 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!667347 () Bool)

(assert (=> b!667347 (= e!382032 true)))

(declare-fun lt!310793 () Bool)

(assert (=> b!667347 (= lt!310793 (contains!3318 lt!310795 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!667348 () Bool)

(declare-fun res!434498 () Bool)

(assert (=> b!667348 (=> (not res!434498) (not e!382038))))

(assert (=> b!667348 (= res!434498 e!382031)))

(declare-fun res!434483 () Bool)

(assert (=> b!667348 (=> res!434483 e!382031)))

(declare-fun e!382036 () Bool)

(assert (=> b!667348 (= res!434483 e!382036)))

(declare-fun res!434480 () Bool)

(assert (=> b!667348 (=> (not res!434480) (not e!382036))))

(assert (=> b!667348 (= res!434480 (bvsgt from!3004 i!1382))))

(declare-fun b!667349 () Bool)

(declare-fun Unit!23323 () Unit!23319)

(assert (=> b!667349 (= e!382037 Unit!23323)))

(declare-fun lt!310787 () Unit!23319)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39057 (_ BitVec 64) (_ BitVec 32)) Unit!23319)

(assert (=> b!667349 (= lt!310787 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!667349 false))

(declare-fun b!667350 () Bool)

(declare-fun res!434482 () Bool)

(assert (=> b!667350 (=> (not res!434482) (not e!382038))))

(assert (=> b!667350 (= res!434482 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!667351 () Bool)

(assert (=> b!667351 (= e!382036 (contains!3318 acc!681 k0!2843))))

(assert (= (and start!60072 res!434495) b!667341))

(assert (= (and b!667341 res!434488) b!667337))

(assert (= (and b!667337 res!434496) b!667346))

(assert (= (and b!667346 res!434486) b!667348))

(assert (= (and b!667348 res!434480) b!667351))

(assert (= (and b!667348 (not res!434483)) b!667340))

(assert (= (and b!667340 res!434492) b!667328))

(assert (= (and b!667348 res!434498) b!667329))

(assert (= (and b!667329 res!434497) b!667339))

(assert (= (and b!667339 res!434485) b!667330))

(assert (= (and b!667330 res!434494) b!667332))

(assert (= (and b!667332 res!434481) b!667350))

(assert (= (and b!667350 res!434482) b!667344))

(assert (= (and b!667344 res!434487) b!667327))

(assert (= (and b!667327 c!76792) b!667349))

(assert (= (and b!667327 (not c!76792)) b!667338))

(assert (= (and b!667327 c!76793) b!667331))

(assert (= (and b!667327 (not c!76793)) b!667345))

(assert (= (and b!667327 (not res!434499)) b!667335))

(assert (= (and b!667335 (not res!434500)) b!667342))

(assert (= (and b!667342 (not res!434491)) b!667336))

(assert (= (and b!667336 (not res!434490)) b!667333))

(assert (= (and b!667333 (not res!434489)) b!667334))

(assert (= (and b!667334 (not res!434484)) b!667343))

(assert (= (and b!667343 (not res!434493)) b!667347))

(declare-fun m!638431 () Bool)

(assert (=> b!667349 m!638431))

(declare-fun m!638433 () Bool)

(assert (=> b!667332 m!638433))

(declare-fun m!638435 () Bool)

(assert (=> b!667341 m!638435))

(declare-fun m!638437 () Bool)

(assert (=> b!667336 m!638437))

(declare-fun m!638439 () Bool)

(assert (=> b!667343 m!638439))

(assert (=> b!667328 m!638437))

(declare-fun m!638441 () Bool)

(assert (=> b!667339 m!638441))

(declare-fun m!638443 () Bool)

(assert (=> b!667331 m!638443))

(declare-fun m!638445 () Bool)

(assert (=> b!667331 m!638445))

(declare-fun m!638447 () Bool)

(assert (=> b!667331 m!638447))

(declare-fun m!638449 () Bool)

(assert (=> b!667331 m!638449))

(assert (=> b!667331 m!638445))

(assert (=> b!667331 m!638447))

(declare-fun m!638451 () Bool)

(assert (=> b!667331 m!638451))

(declare-fun m!638453 () Bool)

(assert (=> b!667331 m!638453))

(declare-fun m!638455 () Bool)

(assert (=> b!667334 m!638455))

(declare-fun m!638457 () Bool)

(assert (=> b!667335 m!638457))

(declare-fun m!638459 () Bool)

(assert (=> b!667346 m!638459))

(assert (=> b!667327 m!638443))

(assert (=> b!667327 m!638445))

(declare-fun m!638461 () Bool)

(assert (=> b!667327 m!638461))

(declare-fun m!638463 () Bool)

(assert (=> b!667327 m!638463))

(assert (=> b!667327 m!638451))

(declare-fun m!638465 () Bool)

(assert (=> b!667327 m!638465))

(assert (=> b!667327 m!638445))

(declare-fun m!638467 () Bool)

(assert (=> b!667327 m!638467))

(declare-fun m!638469 () Bool)

(assert (=> b!667327 m!638469))

(declare-fun m!638471 () Bool)

(assert (=> b!667327 m!638471))

(declare-fun m!638473 () Bool)

(assert (=> b!667327 m!638473))

(assert (=> b!667327 m!638453))

(declare-fun m!638475 () Bool)

(assert (=> b!667347 m!638475))

(declare-fun m!638477 () Bool)

(assert (=> b!667350 m!638477))

(assert (=> b!667351 m!638437))

(declare-fun m!638479 () Bool)

(assert (=> b!667333 m!638479))

(declare-fun m!638481 () Bool)

(assert (=> start!60072 m!638481))

(declare-fun m!638483 () Bool)

(assert (=> b!667337 m!638483))

(declare-fun m!638485 () Bool)

(assert (=> b!667329 m!638485))

(check-sat (not b!667351) (not b!667327) (not b!667347) (not b!667343) (not b!667334) (not b!667336) (not b!667346) (not b!667341) (not b!667337) (not b!667339) (not b!667328) (not b!667332) (not b!667331) (not b!667329) (not start!60072) (not b!667350) (not b!667333) (not b!667349) (not b!667335))
(check-sat)
