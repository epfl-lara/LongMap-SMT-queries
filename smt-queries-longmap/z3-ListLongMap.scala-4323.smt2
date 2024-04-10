; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59968 () Bool)

(assert start!59968)

(declare-fun b!665378 () Bool)

(declare-fun res!432933 () Bool)

(declare-fun e!381343 () Bool)

(assert (=> b!665378 (=> res!432933 e!381343)))

(declare-datatypes ((List!12741 0))(
  ( (Nil!12738) (Cons!12737 (h!13782 (_ BitVec 64)) (t!18969 List!12741)) )
))
(declare-fun acc!681 () List!12741)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3318 (List!12741 (_ BitVec 64)) Bool)

(assert (=> b!665378 (= res!432933 (contains!3318 acc!681 k0!2843))))

(declare-fun b!665379 () Bool)

(declare-fun res!432934 () Bool)

(declare-fun e!381344 () Bool)

(assert (=> b!665379 (=> (not res!432934) (not e!381344))))

(declare-datatypes ((array!39015 0))(
  ( (array!39016 (arr!18700 (Array (_ BitVec 32) (_ BitVec 64))) (size!19064 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39015)

(declare-fun arrayContainsKey!0 (array!39015 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!665379 (= res!432934 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!665380 () Bool)

(declare-datatypes ((Unit!23225 0))(
  ( (Unit!23226) )
))
(declare-fun e!381338 () Unit!23225)

(declare-fun lt!309999 () Unit!23225)

(assert (=> b!665380 (= e!381338 lt!309999)))

(declare-fun lt!310003 () Unit!23225)

(declare-fun lemmaListSubSeqRefl!0 (List!12741) Unit!23225)

(assert (=> b!665380 (= lt!310003 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!57 (List!12741 List!12741) Bool)

(assert (=> b!665380 (subseq!57 acc!681 acc!681)))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39015 List!12741 List!12741 (_ BitVec 32)) Unit!23225)

(declare-fun $colon$colon!189 (List!12741 (_ BitVec 64)) List!12741)

(assert (=> b!665380 (= lt!309999 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!189 acc!681 (select (arr!18700 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39015 (_ BitVec 32) List!12741) Bool)

(assert (=> b!665380 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!665381 () Bool)

(declare-fun res!432930 () Bool)

(assert (=> b!665381 (=> (not res!432930) (not e!381344))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!665381 (= res!432930 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19064 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!665382 () Bool)

(declare-fun res!432923 () Bool)

(assert (=> b!665382 (=> (not res!432923) (not e!381344))))

(assert (=> b!665382 (= res!432923 (not (contains!3318 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!665383 () Bool)

(declare-fun res!432937 () Bool)

(assert (=> b!665383 (=> res!432937 e!381343)))

(declare-fun lt!309997 () List!12741)

(assert (=> b!665383 (= res!432937 (not (subseq!57 acc!681 lt!309997)))))

(declare-fun b!665384 () Bool)

(declare-fun e!381342 () Bool)

(assert (=> b!665384 (= e!381342 (contains!3318 acc!681 k0!2843))))

(declare-fun b!665385 () Bool)

(declare-fun e!381339 () Bool)

(declare-fun e!381341 () Bool)

(assert (=> b!665385 (= e!381339 e!381341)))

(declare-fun res!432929 () Bool)

(assert (=> b!665385 (=> (not res!432929) (not e!381341))))

(assert (=> b!665385 (= res!432929 (bvsle from!3004 i!1382))))

(declare-fun b!665386 () Bool)

(declare-fun res!432919 () Bool)

(assert (=> b!665386 (=> (not res!432919) (not e!381344))))

(declare-fun noDuplicate!565 (List!12741) Bool)

(assert (=> b!665386 (= res!432919 (noDuplicate!565 acc!681))))

(declare-fun b!665387 () Bool)

(declare-fun res!432932 () Bool)

(assert (=> b!665387 (=> res!432932 e!381343)))

(declare-fun lt!309998 () Bool)

(assert (=> b!665387 (= res!432932 lt!309998)))

(declare-fun b!665388 () Bool)

(declare-fun res!432924 () Bool)

(assert (=> b!665388 (=> res!432924 e!381343)))

(assert (=> b!665388 (= res!432924 (not (noDuplicate!565 lt!309997)))))

(declare-fun b!665389 () Bool)

(declare-fun res!432925 () Bool)

(assert (=> b!665389 (=> (not res!432925) (not e!381344))))

(assert (=> b!665389 (= res!432925 (not (contains!3318 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!665390 () Bool)

(declare-fun res!432921 () Bool)

(assert (=> b!665390 (=> (not res!432921) (not e!381344))))

(assert (=> b!665390 (= res!432921 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12738))))

(declare-fun b!665391 () Bool)

(declare-fun e!381345 () Unit!23225)

(declare-fun Unit!23227 () Unit!23225)

(assert (=> b!665391 (= e!381345 Unit!23227)))

(declare-fun lt!310000 () Unit!23225)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39015 (_ BitVec 64) (_ BitVec 32)) Unit!23225)

(assert (=> b!665391 (= lt!310000 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!665391 false))

(declare-fun b!665392 () Bool)

(declare-fun Unit!23228 () Unit!23225)

(assert (=> b!665392 (= e!381345 Unit!23228)))

(declare-fun b!665393 () Bool)

(assert (=> b!665393 (= e!381344 (not e!381343))))

(declare-fun res!432926 () Bool)

(assert (=> b!665393 (=> res!432926 e!381343)))

(assert (=> b!665393 (= res!432926 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!55 (List!12741 (_ BitVec 64)) List!12741)

(assert (=> b!665393 (= (-!55 lt!309997 k0!2843) acc!681)))

(assert (=> b!665393 (= lt!309997 ($colon$colon!189 acc!681 k0!2843))))

(declare-fun lt!309994 () Unit!23225)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12741) Unit!23225)

(assert (=> b!665393 (= lt!309994 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!665393 (subseq!57 acc!681 acc!681)))

(declare-fun lt!309995 () Unit!23225)

(assert (=> b!665393 (= lt!309995 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!665393 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!309996 () Unit!23225)

(assert (=> b!665393 (= lt!309996 e!381338)))

(declare-fun c!76598 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!665393 (= c!76598 (validKeyInArray!0 (select (arr!18700 a!3626) from!3004)))))

(declare-fun lt!310001 () Unit!23225)

(assert (=> b!665393 (= lt!310001 e!381345)))

(declare-fun c!76597 () Bool)

(assert (=> b!665393 (= c!76597 lt!309998)))

(assert (=> b!665393 (= lt!309998 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!665393 (arrayContainsKey!0 (array!39016 (store (arr!18700 a!3626) i!1382 k0!2843) (size!19064 a!3626)) k0!2843 from!3004)))

(declare-fun b!665394 () Bool)

(declare-fun res!432922 () Bool)

(assert (=> b!665394 (=> (not res!432922) (not e!381344))))

(assert (=> b!665394 (= res!432922 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!665395 () Bool)

(declare-fun Unit!23229 () Unit!23225)

(assert (=> b!665395 (= e!381338 Unit!23229)))

(declare-fun b!665396 () Bool)

(declare-fun res!432928 () Bool)

(assert (=> b!665396 (=> (not res!432928) (not e!381344))))

(assert (=> b!665396 (= res!432928 (validKeyInArray!0 k0!2843))))

(declare-fun res!432918 () Bool)

(assert (=> start!59968 (=> (not res!432918) (not e!381344))))

(assert (=> start!59968 (= res!432918 (and (bvslt (size!19064 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19064 a!3626))))))

(assert (=> start!59968 e!381344))

(assert (=> start!59968 true))

(declare-fun array_inv!14496 (array!39015) Bool)

(assert (=> start!59968 (array_inv!14496 a!3626)))

(declare-fun b!665397 () Bool)

(declare-fun res!432936 () Bool)

(assert (=> b!665397 (=> res!432936 e!381343)))

(assert (=> b!665397 (= res!432936 (contains!3318 lt!309997 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!665398 () Bool)

(assert (=> b!665398 (= e!381341 (not (contains!3318 acc!681 k0!2843)))))

(declare-fun b!665399 () Bool)

(assert (=> b!665399 (= e!381343 true)))

(declare-fun lt!310002 () Bool)

(assert (=> b!665399 (= lt!310002 (contains!3318 lt!309997 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!665400 () Bool)

(declare-fun res!432931 () Bool)

(assert (=> b!665400 (=> res!432931 e!381343)))

(assert (=> b!665400 (= res!432931 (not (contains!3318 lt!309997 k0!2843)))))

(declare-fun b!665401 () Bool)

(declare-fun res!432938 () Bool)

(assert (=> b!665401 (=> (not res!432938) (not e!381344))))

(assert (=> b!665401 (= res!432938 e!381339)))

(declare-fun res!432935 () Bool)

(assert (=> b!665401 (=> res!432935 e!381339)))

(assert (=> b!665401 (= res!432935 e!381342)))

(declare-fun res!432927 () Bool)

(assert (=> b!665401 (=> (not res!432927) (not e!381342))))

(assert (=> b!665401 (= res!432927 (bvsgt from!3004 i!1382))))

(declare-fun b!665402 () Bool)

(declare-fun res!432920 () Bool)

(assert (=> b!665402 (=> (not res!432920) (not e!381344))))

(assert (=> b!665402 (= res!432920 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19064 a!3626))))))

(assert (= (and start!59968 res!432918) b!665386))

(assert (= (and b!665386 res!432919) b!665382))

(assert (= (and b!665382 res!432923) b!665389))

(assert (= (and b!665389 res!432925) b!665401))

(assert (= (and b!665401 res!432927) b!665384))

(assert (= (and b!665401 (not res!432935)) b!665385))

(assert (= (and b!665385 res!432929) b!665398))

(assert (= (and b!665401 res!432938) b!665390))

(assert (= (and b!665390 res!432921) b!665394))

(assert (= (and b!665394 res!432922) b!665402))

(assert (= (and b!665402 res!432920) b!665396))

(assert (= (and b!665396 res!432928) b!665379))

(assert (= (and b!665379 res!432934) b!665381))

(assert (= (and b!665381 res!432930) b!665393))

(assert (= (and b!665393 c!76597) b!665391))

(assert (= (and b!665393 (not c!76597)) b!665392))

(assert (= (and b!665393 c!76598) b!665380))

(assert (= (and b!665393 (not c!76598)) b!665395))

(assert (= (and b!665393 (not res!432926)) b!665388))

(assert (= (and b!665388 (not res!432924)) b!665387))

(assert (= (and b!665387 (not res!432932)) b!665378))

(assert (= (and b!665378 (not res!432933)) b!665383))

(assert (= (and b!665383 (not res!432937)) b!665400))

(assert (= (and b!665400 (not res!432931)) b!665397))

(assert (= (and b!665397 (not res!432936)) b!665399))

(declare-fun m!636445 () Bool)

(assert (=> b!665386 m!636445))

(declare-fun m!636447 () Bool)

(assert (=> b!665400 m!636447))

(declare-fun m!636449 () Bool)

(assert (=> b!665382 m!636449))

(declare-fun m!636451 () Bool)

(assert (=> b!665397 m!636451))

(declare-fun m!636453 () Bool)

(assert (=> b!665384 m!636453))

(declare-fun m!636455 () Bool)

(assert (=> b!665389 m!636455))

(declare-fun m!636457 () Bool)

(assert (=> b!665388 m!636457))

(declare-fun m!636459 () Bool)

(assert (=> b!665383 m!636459))

(assert (=> b!665398 m!636453))

(declare-fun m!636461 () Bool)

(assert (=> b!665390 m!636461))

(declare-fun m!636463 () Bool)

(assert (=> b!665393 m!636463))

(declare-fun m!636465 () Bool)

(assert (=> b!665393 m!636465))

(declare-fun m!636467 () Bool)

(assert (=> b!665393 m!636467))

(declare-fun m!636469 () Bool)

(assert (=> b!665393 m!636469))

(declare-fun m!636471 () Bool)

(assert (=> b!665393 m!636471))

(declare-fun m!636473 () Bool)

(assert (=> b!665393 m!636473))

(declare-fun m!636475 () Bool)

(assert (=> b!665393 m!636475))

(declare-fun m!636477 () Bool)

(assert (=> b!665393 m!636477))

(declare-fun m!636479 () Bool)

(assert (=> b!665393 m!636479))

(assert (=> b!665393 m!636475))

(declare-fun m!636481 () Bool)

(assert (=> b!665393 m!636481))

(declare-fun m!636483 () Bool)

(assert (=> b!665393 m!636483))

(assert (=> b!665380 m!636463))

(assert (=> b!665380 m!636475))

(declare-fun m!636485 () Bool)

(assert (=> b!665380 m!636485))

(declare-fun m!636487 () Bool)

(assert (=> b!665380 m!636487))

(assert (=> b!665380 m!636475))

(assert (=> b!665380 m!636485))

(assert (=> b!665380 m!636469))

(assert (=> b!665380 m!636483))

(declare-fun m!636489 () Bool)

(assert (=> b!665379 m!636489))

(declare-fun m!636491 () Bool)

(assert (=> b!665399 m!636491))

(assert (=> b!665378 m!636453))

(declare-fun m!636493 () Bool)

(assert (=> b!665391 m!636493))

(declare-fun m!636495 () Bool)

(assert (=> start!59968 m!636495))

(declare-fun m!636497 () Bool)

(assert (=> b!665396 m!636497))

(declare-fun m!636499 () Bool)

(assert (=> b!665394 m!636499))

(check-sat (not b!665382) (not b!665390) (not b!665388) (not b!665400) (not b!665383) (not b!665378) (not start!59968) (not b!665389) (not b!665396) (not b!665398) (not b!665394) (not b!665379) (not b!665391) (not b!665384) (not b!665397) (not b!665380) (not b!665386) (not b!665399) (not b!665393))
(check-sat)
