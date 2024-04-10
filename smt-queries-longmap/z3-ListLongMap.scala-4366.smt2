; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60226 () Bool)

(assert start!60226)

(declare-fun b!674460 () Bool)

(declare-fun res!440935 () Bool)

(declare-fun e!384995 () Bool)

(assert (=> b!674460 (=> (not res!440935) (not e!384995))))

(declare-datatypes ((List!12870 0))(
  ( (Nil!12867) (Cons!12866 (h!13911 (_ BitVec 64)) (t!19098 List!12870)) )
))
(declare-fun acc!681 () List!12870)

(declare-fun contains!3447 (List!12870 (_ BitVec 64)) Bool)

(assert (=> b!674460 (= res!440935 (not (contains!3447 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674461 () Bool)

(declare-fun res!440937 () Bool)

(declare-fun e!384997 () Bool)

(assert (=> b!674461 (=> (not res!440937) (not e!384997))))

(declare-datatypes ((array!39273 0))(
  ( (array!39274 (arr!18829 (Array (_ BitVec 32) (_ BitVec 64))) (size!19193 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39273)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lt!312619 () List!12870)

(declare-fun arrayNoDuplicates!0 (array!39273 (_ BitVec 32) List!12870) Bool)

(assert (=> b!674461 (= res!440937 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312619))))

(declare-fun b!674462 () Bool)

(declare-fun e!384993 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!674462 (= e!384993 (contains!3447 acc!681 k0!2843))))

(declare-fun b!674463 () Bool)

(declare-fun e!384994 () Bool)

(declare-fun e!384991 () Bool)

(assert (=> b!674463 (= e!384994 e!384991)))

(declare-fun res!440954 () Bool)

(assert (=> b!674463 (=> (not res!440954) (not e!384991))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!674463 (= res!440954 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!674464 () Bool)

(declare-fun e!384998 () Bool)

(assert (=> b!674464 (= e!384998 (contains!3447 lt!312619 k0!2843))))

(declare-fun b!674465 () Bool)

(declare-fun e!384990 () Bool)

(assert (=> b!674465 (= e!384990 e!384997)))

(declare-fun res!440953 () Bool)

(assert (=> b!674465 (=> (not res!440953) (not e!384997))))

(assert (=> b!674465 (= res!440953 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!297 (List!12870 (_ BitVec 64)) List!12870)

(assert (=> b!674465 (= lt!312619 ($colon$colon!297 acc!681 (select (arr!18829 a!3626) from!3004)))))

(declare-fun b!674466 () Bool)

(declare-fun res!440940 () Bool)

(assert (=> b!674466 (=> (not res!440940) (not e!384997))))

(assert (=> b!674466 (= res!440940 e!384994)))

(declare-fun res!440949 () Bool)

(assert (=> b!674466 (=> res!440949 e!384994)))

(assert (=> b!674466 (= res!440949 e!384998)))

(declare-fun res!440943 () Bool)

(assert (=> b!674466 (=> (not res!440943) (not e!384998))))

(assert (=> b!674466 (= res!440943 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!674467 () Bool)

(declare-fun e!384992 () Bool)

(declare-fun e!384996 () Bool)

(assert (=> b!674467 (= e!384992 e!384996)))

(declare-fun res!440951 () Bool)

(assert (=> b!674467 (=> (not res!440951) (not e!384996))))

(assert (=> b!674467 (= res!440951 (bvsle from!3004 i!1382))))

(declare-fun b!674468 () Bool)

(declare-fun res!440942 () Bool)

(assert (=> b!674468 (=> (not res!440942) (not e!384995))))

(declare-fun arrayContainsKey!0 (array!39273 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!674468 (= res!440942 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun res!440936 () Bool)

(assert (=> start!60226 (=> (not res!440936) (not e!384995))))

(assert (=> start!60226 (= res!440936 (and (bvslt (size!19193 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19193 a!3626))))))

(assert (=> start!60226 e!384995))

(assert (=> start!60226 true))

(declare-fun array_inv!14625 (array!39273) Bool)

(assert (=> start!60226 (array_inv!14625 a!3626)))

(declare-fun b!674469 () Bool)

(declare-fun res!440952 () Bool)

(assert (=> b!674469 (=> (not res!440952) (not e!384997))))

(declare-fun noDuplicate!694 (List!12870) Bool)

(assert (=> b!674469 (= res!440952 (noDuplicate!694 lt!312619))))

(declare-fun b!674470 () Bool)

(declare-fun res!440931 () Bool)

(assert (=> b!674470 (=> (not res!440931) (not e!384995))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!674470 (= res!440931 (validKeyInArray!0 k0!2843))))

(declare-fun b!674471 () Bool)

(declare-fun res!440938 () Bool)

(assert (=> b!674471 (=> (not res!440938) (not e!384995))))

(assert (=> b!674471 (= res!440938 e!384992)))

(declare-fun res!440930 () Bool)

(assert (=> b!674471 (=> res!440930 e!384992)))

(assert (=> b!674471 (= res!440930 e!384993)))

(declare-fun res!440944 () Bool)

(assert (=> b!674471 (=> (not res!440944) (not e!384993))))

(assert (=> b!674471 (= res!440944 (bvsgt from!3004 i!1382))))

(declare-fun b!674472 () Bool)

(declare-datatypes ((Unit!23728 0))(
  ( (Unit!23729) )
))
(declare-fun e!384999 () Unit!23728)

(declare-fun Unit!23730 () Unit!23728)

(assert (=> b!674472 (= e!384999 Unit!23730)))

(assert (=> b!674472 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!312620 () Unit!23728)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39273 (_ BitVec 64) (_ BitVec 32)) Unit!23728)

(assert (=> b!674472 (= lt!312620 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!674472 false))

(declare-fun b!674473 () Bool)

(declare-fun res!440947 () Bool)

(assert (=> b!674473 (=> (not res!440947) (not e!384995))))

(assert (=> b!674473 (= res!440947 (noDuplicate!694 acc!681))))

(declare-fun b!674474 () Bool)

(declare-fun res!440934 () Bool)

(assert (=> b!674474 (=> (not res!440934) (not e!384995))))

(assert (=> b!674474 (= res!440934 (not (contains!3447 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674475 () Bool)

(assert (=> b!674475 (= e!384997 (not true))))

(assert (=> b!674475 (arrayNoDuplicates!0 (array!39274 (store (arr!18829 a!3626) i!1382 k0!2843) (size!19193 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) lt!312619)))

(declare-fun lt!312621 () Unit!23728)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39273 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12870) Unit!23728)

(assert (=> b!674475 (= lt!312621 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!312619))))

(declare-fun b!674476 () Bool)

(declare-fun res!440946 () Bool)

(assert (=> b!674476 (=> (not res!440946) (not e!384997))))

(assert (=> b!674476 (= res!440946 (not (contains!3447 lt!312619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674477 () Bool)

(assert (=> b!674477 (= e!384995 e!384990)))

(declare-fun res!440941 () Bool)

(assert (=> b!674477 (=> (not res!440941) (not e!384990))))

(assert (=> b!674477 (= res!440941 (not (= (select (arr!18829 a!3626) from!3004) k0!2843)))))

(declare-fun lt!312622 () Unit!23728)

(assert (=> b!674477 (= lt!312622 e!384999)))

(declare-fun c!77132 () Bool)

(assert (=> b!674477 (= c!77132 (= (select (arr!18829 a!3626) from!3004) k0!2843))))

(declare-fun b!674478 () Bool)

(declare-fun res!440933 () Bool)

(assert (=> b!674478 (=> (not res!440933) (not e!384995))))

(assert (=> b!674478 (= res!440933 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19193 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!674479 () Bool)

(declare-fun res!440950 () Bool)

(assert (=> b!674479 (=> (not res!440950) (not e!384997))))

(assert (=> b!674479 (= res!440950 (not (contains!3447 lt!312619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674480 () Bool)

(declare-fun res!440932 () Bool)

(assert (=> b!674480 (=> (not res!440932) (not e!384995))))

(assert (=> b!674480 (= res!440932 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!674481 () Bool)

(declare-fun Unit!23731 () Unit!23728)

(assert (=> b!674481 (= e!384999 Unit!23731)))

(declare-fun b!674482 () Bool)

(declare-fun res!440945 () Bool)

(assert (=> b!674482 (=> (not res!440945) (not e!384995))))

(assert (=> b!674482 (= res!440945 (validKeyInArray!0 (select (arr!18829 a!3626) from!3004)))))

(declare-fun b!674483 () Bool)

(assert (=> b!674483 (= e!384996 (not (contains!3447 acc!681 k0!2843)))))

(declare-fun b!674484 () Bool)

(assert (=> b!674484 (= e!384991 (not (contains!3447 lt!312619 k0!2843)))))

(declare-fun b!674485 () Bool)

(declare-fun res!440948 () Bool)

(assert (=> b!674485 (=> (not res!440948) (not e!384995))))

(assert (=> b!674485 (= res!440948 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19193 a!3626))))))

(declare-fun b!674486 () Bool)

(declare-fun res!440939 () Bool)

(assert (=> b!674486 (=> (not res!440939) (not e!384995))))

(assert (=> b!674486 (= res!440939 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12867))))

(assert (= (and start!60226 res!440936) b!674473))

(assert (= (and b!674473 res!440947) b!674474))

(assert (= (and b!674474 res!440934) b!674460))

(assert (= (and b!674460 res!440935) b!674471))

(assert (= (and b!674471 res!440944) b!674462))

(assert (= (and b!674471 (not res!440930)) b!674467))

(assert (= (and b!674467 res!440951) b!674483))

(assert (= (and b!674471 res!440938) b!674486))

(assert (= (and b!674486 res!440939) b!674480))

(assert (= (and b!674480 res!440932) b!674485))

(assert (= (and b!674485 res!440948) b!674470))

(assert (= (and b!674470 res!440931) b!674468))

(assert (= (and b!674468 res!440942) b!674478))

(assert (= (and b!674478 res!440933) b!674482))

(assert (= (and b!674482 res!440945) b!674477))

(assert (= (and b!674477 c!77132) b!674472))

(assert (= (and b!674477 (not c!77132)) b!674481))

(assert (= (and b!674477 res!440941) b!674465))

(assert (= (and b!674465 res!440953) b!674469))

(assert (= (and b!674469 res!440952) b!674476))

(assert (= (and b!674476 res!440946) b!674479))

(assert (= (and b!674479 res!440950) b!674466))

(assert (= (and b!674466 res!440943) b!674464))

(assert (= (and b!674466 (not res!440949)) b!674463))

(assert (= (and b!674463 res!440954) b!674484))

(assert (= (and b!674466 res!440940) b!674461))

(assert (= (and b!674461 res!440937) b!674475))

(declare-fun m!642403 () Bool)

(assert (=> b!674460 m!642403))

(declare-fun m!642405 () Bool)

(assert (=> b!674476 m!642405))

(declare-fun m!642407 () Bool)

(assert (=> b!674470 m!642407))

(declare-fun m!642409 () Bool)

(assert (=> b!674473 m!642409))

(declare-fun m!642411 () Bool)

(assert (=> b!674474 m!642411))

(declare-fun m!642413 () Bool)

(assert (=> b!674486 m!642413))

(declare-fun m!642415 () Bool)

(assert (=> b!674465 m!642415))

(assert (=> b!674465 m!642415))

(declare-fun m!642417 () Bool)

(assert (=> b!674465 m!642417))

(declare-fun m!642419 () Bool)

(assert (=> b!674483 m!642419))

(declare-fun m!642421 () Bool)

(assert (=> start!60226 m!642421))

(declare-fun m!642423 () Bool)

(assert (=> b!674472 m!642423))

(declare-fun m!642425 () Bool)

(assert (=> b!674472 m!642425))

(declare-fun m!642427 () Bool)

(assert (=> b!674475 m!642427))

(declare-fun m!642429 () Bool)

(assert (=> b!674475 m!642429))

(declare-fun m!642431 () Bool)

(assert (=> b!674475 m!642431))

(declare-fun m!642433 () Bool)

(assert (=> b!674464 m!642433))

(declare-fun m!642435 () Bool)

(assert (=> b!674461 m!642435))

(assert (=> b!674482 m!642415))

(assert (=> b!674482 m!642415))

(declare-fun m!642437 () Bool)

(assert (=> b!674482 m!642437))

(declare-fun m!642439 () Bool)

(assert (=> b!674468 m!642439))

(declare-fun m!642441 () Bool)

(assert (=> b!674479 m!642441))

(declare-fun m!642443 () Bool)

(assert (=> b!674469 m!642443))

(assert (=> b!674477 m!642415))

(declare-fun m!642445 () Bool)

(assert (=> b!674480 m!642445))

(assert (=> b!674462 m!642419))

(assert (=> b!674484 m!642433))

(check-sat (not b!674470) (not b!674479) (not b!674468) (not start!60226) (not b!674474) (not b!674483) (not b!674464) (not b!674462) (not b!674473) (not b!674486) (not b!674484) (not b!674476) (not b!674469) (not b!674472) (not b!674480) (not b!674460) (not b!674482) (not b!674461) (not b!674475) (not b!674465))
(check-sat)
