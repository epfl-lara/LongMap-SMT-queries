; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62094 () Bool)

(assert start!62094)

(declare-fun b!694449 () Bool)

(declare-fun res!458401 () Bool)

(declare-fun e!395084 () Bool)

(assert (=> b!694449 (=> (not res!458401) (not e!395084))))

(declare-datatypes ((List!13044 0))(
  ( (Nil!13041) (Cons!13040 (h!14088 (_ BitVec 64)) (t!19315 List!13044)) )
))
(declare-fun acc!681 () List!13044)

(declare-fun contains!3696 (List!13044 (_ BitVec 64)) Bool)

(assert (=> b!694449 (= res!458401 (not (contains!3696 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694450 () Bool)

(declare-fun res!458396 () Bool)

(assert (=> b!694450 (=> (not res!458396) (not e!395084))))

(declare-fun noDuplicate!970 (List!13044) Bool)

(assert (=> b!694450 (= res!458396 (noDuplicate!970 acc!681))))

(declare-fun b!694451 () Bool)

(declare-fun res!458397 () Bool)

(assert (=> b!694451 (=> (not res!458397) (not e!395084))))

(declare-datatypes ((array!39873 0))(
  ( (array!39874 (arr!19096 (Array (_ BitVec 32) (_ BitVec 64))) (size!19479 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39873)

(declare-fun arrayNoDuplicates!0 (array!39873 (_ BitVec 32) List!13044) Bool)

(assert (=> b!694451 (= res!458397 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13041))))

(declare-fun b!694452 () Bool)

(declare-fun e!395087 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!694452 (= e!395087 (not (contains!3696 acc!681 k0!2843)))))

(declare-fun b!694453 () Bool)

(declare-fun e!395088 () Bool)

(declare-fun e!395089 () Bool)

(assert (=> b!694453 (= e!395088 e!395089)))

(declare-fun res!458402 () Bool)

(assert (=> b!694453 (=> (not res!458402) (not e!395089))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!694453 (= res!458402 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!694455 () Bool)

(declare-datatypes ((Unit!24501 0))(
  ( (Unit!24502) )
))
(declare-fun e!395092 () Unit!24501)

(declare-fun Unit!24503 () Unit!24501)

(assert (=> b!694455 (= e!395092 Unit!24503)))

(declare-fun arrayContainsKey!0 (array!39873 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!694455 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!316975 () Unit!24501)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39873 (_ BitVec 64) (_ BitVec 32)) Unit!24501)

(assert (=> b!694455 (= lt!316975 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!694455 false))

(declare-fun b!694456 () Bool)

(declare-fun e!395086 () Bool)

(declare-fun lt!316977 () List!13044)

(assert (=> b!694456 (= e!395086 (contains!3696 lt!316977 k0!2843))))

(declare-fun b!694457 () Bool)

(declare-fun e!395094 () Bool)

(declare-fun e!395093 () Bool)

(assert (=> b!694457 (= e!395094 e!395093)))

(declare-fun res!458415 () Bool)

(assert (=> b!694457 (=> (not res!458415) (not e!395093))))

(assert (=> b!694457 (= res!458415 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!428 (List!13044 (_ BitVec 64)) List!13044)

(assert (=> b!694457 (= lt!316977 ($colon$colon!428 acc!681 (select (arr!19096 a!3626) from!3004)))))

(declare-fun b!694458 () Bool)

(declare-fun res!458406 () Bool)

(assert (=> b!694458 (=> (not res!458406) (not e!395084))))

(declare-fun e!395090 () Bool)

(assert (=> b!694458 (= res!458406 e!395090)))

(declare-fun res!458403 () Bool)

(assert (=> b!694458 (=> res!458403 e!395090)))

(declare-fun e!395091 () Bool)

(assert (=> b!694458 (= res!458403 e!395091)))

(declare-fun res!458408 () Bool)

(assert (=> b!694458 (=> (not res!458408) (not e!395091))))

(assert (=> b!694458 (= res!458408 (bvsgt from!3004 i!1382))))

(declare-fun b!694459 () Bool)

(declare-fun res!458411 () Bool)

(assert (=> b!694459 (=> (not res!458411) (not e!395084))))

(assert (=> b!694459 (= res!458411 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!694460 () Bool)

(declare-fun res!458404 () Bool)

(assert (=> b!694460 (=> (not res!458404) (not e!395093))))

(assert (=> b!694460 (= res!458404 (not (contains!3696 lt!316977 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694461 () Bool)

(assert (=> b!694461 (= e!395084 e!395094)))

(declare-fun res!458414 () Bool)

(assert (=> b!694461 (=> (not res!458414) (not e!395094))))

(assert (=> b!694461 (= res!458414 (not (= (select (arr!19096 a!3626) from!3004) k0!2843)))))

(declare-fun lt!316978 () Unit!24501)

(assert (=> b!694461 (= lt!316978 e!395092)))

(declare-fun c!78395 () Bool)

(assert (=> b!694461 (= c!78395 (= (select (arr!19096 a!3626) from!3004) k0!2843))))

(declare-fun b!694462 () Bool)

(declare-fun res!458418 () Bool)

(assert (=> b!694462 (=> (not res!458418) (not e!395084))))

(assert (=> b!694462 (= res!458418 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!694463 () Bool)

(assert (=> b!694463 (= e!395090 e!395087)))

(declare-fun res!458407 () Bool)

(assert (=> b!694463 (=> (not res!458407) (not e!395087))))

(assert (=> b!694463 (= res!458407 (bvsle from!3004 i!1382))))

(declare-fun b!694464 () Bool)

(declare-fun res!458399 () Bool)

(assert (=> b!694464 (=> (not res!458399) (not e!395093))))

(assert (=> b!694464 (= res!458399 (noDuplicate!970 lt!316977))))

(declare-fun b!694465 () Bool)

(declare-fun res!458416 () Bool)

(assert (=> b!694465 (=> (not res!458416) (not e!395084))))

(assert (=> b!694465 (= res!458416 (not (contains!3696 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694466 () Bool)

(declare-fun Unit!24504 () Unit!24501)

(assert (=> b!694466 (= e!395092 Unit!24504)))

(declare-fun b!694467 () Bool)

(assert (=> b!694467 (= e!395093 false)))

(declare-fun lt!316976 () Bool)

(assert (=> b!694467 (= lt!316976 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316977))))

(declare-fun b!694468 () Bool)

(declare-fun res!458410 () Bool)

(assert (=> b!694468 (=> (not res!458410) (not e!395084))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!694468 (= res!458410 (validKeyInArray!0 (select (arr!19096 a!3626) from!3004)))))

(declare-fun b!694454 () Bool)

(declare-fun res!458417 () Bool)

(assert (=> b!694454 (=> (not res!458417) (not e!395093))))

(assert (=> b!694454 (= res!458417 (not (contains!3696 lt!316977 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!458409 () Bool)

(assert (=> start!62094 (=> (not res!458409) (not e!395084))))

(assert (=> start!62094 (= res!458409 (and (bvslt (size!19479 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19479 a!3626))))))

(assert (=> start!62094 e!395084))

(assert (=> start!62094 true))

(declare-fun array_inv!14955 (array!39873) Bool)

(assert (=> start!62094 (array_inv!14955 a!3626)))

(declare-fun b!694469 () Bool)

(declare-fun res!458405 () Bool)

(assert (=> b!694469 (=> (not res!458405) (not e!395093))))

(assert (=> b!694469 (= res!458405 e!395088)))

(declare-fun res!458419 () Bool)

(assert (=> b!694469 (=> res!458419 e!395088)))

(assert (=> b!694469 (= res!458419 e!395086)))

(declare-fun res!458413 () Bool)

(assert (=> b!694469 (=> (not res!458413) (not e!395086))))

(assert (=> b!694469 (= res!458413 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!694470 () Bool)

(assert (=> b!694470 (= e!395091 (contains!3696 acc!681 k0!2843))))

(declare-fun b!694471 () Bool)

(declare-fun res!458412 () Bool)

(assert (=> b!694471 (=> (not res!458412) (not e!395084))))

(assert (=> b!694471 (= res!458412 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19479 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!694472 () Bool)

(assert (=> b!694472 (= e!395089 (not (contains!3696 lt!316977 k0!2843)))))

(declare-fun b!694473 () Bool)

(declare-fun res!458398 () Bool)

(assert (=> b!694473 (=> (not res!458398) (not e!395084))))

(assert (=> b!694473 (= res!458398 (validKeyInArray!0 k0!2843))))

(declare-fun b!694474 () Bool)

(declare-fun res!458400 () Bool)

(assert (=> b!694474 (=> (not res!458400) (not e!395084))))

(assert (=> b!694474 (= res!458400 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19479 a!3626))))))

(assert (= (and start!62094 res!458409) b!694450))

(assert (= (and b!694450 res!458396) b!694465))

(assert (= (and b!694465 res!458416) b!694449))

(assert (= (and b!694449 res!458401) b!694458))

(assert (= (and b!694458 res!458408) b!694470))

(assert (= (and b!694458 (not res!458403)) b!694463))

(assert (= (and b!694463 res!458407) b!694452))

(assert (= (and b!694458 res!458406) b!694451))

(assert (= (and b!694451 res!458397) b!694462))

(assert (= (and b!694462 res!458418) b!694474))

(assert (= (and b!694474 res!458400) b!694473))

(assert (= (and b!694473 res!458398) b!694459))

(assert (= (and b!694459 res!458411) b!694471))

(assert (= (and b!694471 res!458412) b!694468))

(assert (= (and b!694468 res!458410) b!694461))

(assert (= (and b!694461 c!78395) b!694455))

(assert (= (and b!694461 (not c!78395)) b!694466))

(assert (= (and b!694461 res!458414) b!694457))

(assert (= (and b!694457 res!458415) b!694464))

(assert (= (and b!694464 res!458399) b!694454))

(assert (= (and b!694454 res!458417) b!694460))

(assert (= (and b!694460 res!458404) b!694469))

(assert (= (and b!694469 res!458413) b!694456))

(assert (= (and b!694469 (not res!458419)) b!694453))

(assert (= (and b!694453 res!458402) b!694472))

(assert (= (and b!694469 res!458405) b!694467))

(declare-fun m!656863 () Bool)

(assert (=> b!694468 m!656863))

(assert (=> b!694468 m!656863))

(declare-fun m!656865 () Bool)

(assert (=> b!694468 m!656865))

(declare-fun m!656867 () Bool)

(assert (=> b!694464 m!656867))

(declare-fun m!656869 () Bool)

(assert (=> b!694459 m!656869))

(declare-fun m!656871 () Bool)

(assert (=> b!694462 m!656871))

(declare-fun m!656873 () Bool)

(assert (=> b!694455 m!656873))

(declare-fun m!656875 () Bool)

(assert (=> b!694455 m!656875))

(declare-fun m!656877 () Bool)

(assert (=> b!694450 m!656877))

(assert (=> b!694457 m!656863))

(assert (=> b!694457 m!656863))

(declare-fun m!656879 () Bool)

(assert (=> b!694457 m!656879))

(declare-fun m!656881 () Bool)

(assert (=> b!694472 m!656881))

(declare-fun m!656883 () Bool)

(assert (=> b!694452 m!656883))

(declare-fun m!656885 () Bool)

(assert (=> b!694473 m!656885))

(declare-fun m!656887 () Bool)

(assert (=> b!694451 m!656887))

(declare-fun m!656889 () Bool)

(assert (=> b!694465 m!656889))

(assert (=> b!694456 m!656881))

(assert (=> b!694470 m!656883))

(declare-fun m!656891 () Bool)

(assert (=> b!694467 m!656891))

(declare-fun m!656893 () Bool)

(assert (=> b!694460 m!656893))

(declare-fun m!656895 () Bool)

(assert (=> start!62094 m!656895))

(declare-fun m!656897 () Bool)

(assert (=> b!694449 m!656897))

(assert (=> b!694461 m!656863))

(declare-fun m!656899 () Bool)

(assert (=> b!694454 m!656899))

(check-sat (not b!694457) (not b!694467) (not b!694472) (not b!694473) (not b!694462) (not b!694449) (not b!694464) (not b!694452) (not start!62094) (not b!694465) (not b!694455) (not b!694468) (not b!694460) (not b!694454) (not b!694459) (not b!694470) (not b!694456) (not b!694451) (not b!694450))
(check-sat)
