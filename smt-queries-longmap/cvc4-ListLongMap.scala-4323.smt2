; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59970 () Bool)

(assert start!59970)

(declare-fun b!665453 () Bool)

(declare-fun res!432987 () Bool)

(declare-fun e!381364 () Bool)

(assert (=> b!665453 (=> (not res!432987) (not e!381364))))

(declare-datatypes ((List!12742 0))(
  ( (Nil!12739) (Cons!12738 (h!13783 (_ BitVec 64)) (t!18970 List!12742)) )
))
(declare-fun acc!681 () List!12742)

(declare-fun contains!3319 (List!12742 (_ BitVec 64)) Bool)

(assert (=> b!665453 (= res!432987 (not (contains!3319 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!432986 () Bool)

(assert (=> start!59970 (=> (not res!432986) (not e!381364))))

(declare-datatypes ((array!39017 0))(
  ( (array!39018 (arr!18701 (Array (_ BitVec 32) (_ BitVec 64))) (size!19065 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39017)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!59970 (= res!432986 (and (bvslt (size!19065 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19065 a!3626))))))

(assert (=> start!59970 e!381364))

(assert (=> start!59970 true))

(declare-fun array_inv!14497 (array!39017) Bool)

(assert (=> start!59970 (array_inv!14497 a!3626)))

(declare-fun b!665454 () Bool)

(declare-fun e!381369 () Bool)

(declare-fun e!381367 () Bool)

(assert (=> b!665454 (= e!381369 e!381367)))

(declare-fun res!433000 () Bool)

(assert (=> b!665454 (=> (not res!433000) (not e!381367))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!665454 (= res!433000 (bvsle from!3004 i!1382))))

(declare-fun b!665455 () Bool)

(declare-fun res!432994 () Bool)

(assert (=> b!665455 (=> (not res!432994) (not e!381364))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39017 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!665455 (= res!432994 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!665456 () Bool)

(declare-fun res!432981 () Bool)

(assert (=> b!665456 (=> (not res!432981) (not e!381364))))

(declare-fun arrayNoDuplicates!0 (array!39017 (_ BitVec 32) List!12742) Bool)

(assert (=> b!665456 (= res!432981 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12739))))

(declare-fun b!665457 () Bool)

(declare-fun e!381362 () Bool)

(assert (=> b!665457 (= e!381364 (not e!381362))))

(declare-fun res!432990 () Bool)

(assert (=> b!665457 (=> res!432990 e!381362)))

(assert (=> b!665457 (= res!432990 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun lt!310031 () List!12742)

(declare-fun -!56 (List!12742 (_ BitVec 64)) List!12742)

(assert (=> b!665457 (= (-!56 lt!310031 k!2843) acc!681)))

(declare-fun $colon$colon!190 (List!12742 (_ BitVec 64)) List!12742)

(assert (=> b!665457 (= lt!310031 ($colon$colon!190 acc!681 k!2843))))

(declare-datatypes ((Unit!23230 0))(
  ( (Unit!23231) )
))
(declare-fun lt!310030 () Unit!23230)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12742) Unit!23230)

(assert (=> b!665457 (= lt!310030 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!58 (List!12742 List!12742) Bool)

(assert (=> b!665457 (subseq!58 acc!681 acc!681)))

(declare-fun lt!310027 () Unit!23230)

(declare-fun lemmaListSubSeqRefl!0 (List!12742) Unit!23230)

(assert (=> b!665457 (= lt!310027 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!665457 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310025 () Unit!23230)

(declare-fun e!381368 () Unit!23230)

(assert (=> b!665457 (= lt!310025 e!381368)))

(declare-fun c!76603 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!665457 (= c!76603 (validKeyInArray!0 (select (arr!18701 a!3626) from!3004)))))

(declare-fun lt!310028 () Unit!23230)

(declare-fun e!381363 () Unit!23230)

(assert (=> b!665457 (= lt!310028 e!381363)))

(declare-fun c!76604 () Bool)

(declare-fun lt!310032 () Bool)

(assert (=> b!665457 (= c!76604 lt!310032)))

(assert (=> b!665457 (= lt!310032 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!665457 (arrayContainsKey!0 (array!39018 (store (arr!18701 a!3626) i!1382 k!2843) (size!19065 a!3626)) k!2843 from!3004)))

(declare-fun b!665458 () Bool)

(declare-fun res!432997 () Bool)

(assert (=> b!665458 (=> res!432997 e!381362)))

(assert (=> b!665458 (= res!432997 (not (subseq!58 acc!681 lt!310031)))))

(declare-fun b!665459 () Bool)

(assert (=> b!665459 (= e!381367 (not (contains!3319 acc!681 k!2843)))))

(declare-fun b!665460 () Bool)

(declare-fun res!432992 () Bool)

(assert (=> b!665460 (=> res!432992 e!381362)))

(declare-fun noDuplicate!566 (List!12742) Bool)

(assert (=> b!665460 (= res!432992 (not (noDuplicate!566 lt!310031)))))

(declare-fun b!665461 () Bool)

(assert (=> b!665461 (= e!381362 true)))

(declare-fun lt!310029 () Bool)

(assert (=> b!665461 (= lt!310029 (contains!3319 lt!310031 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!665462 () Bool)

(declare-fun res!432993 () Bool)

(assert (=> b!665462 (=> (not res!432993) (not e!381364))))

(assert (=> b!665462 (= res!432993 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19065 a!3626))))))

(declare-fun b!665463 () Bool)

(declare-fun res!432991 () Bool)

(assert (=> b!665463 (=> res!432991 e!381362)))

(assert (=> b!665463 (= res!432991 lt!310032)))

(declare-fun b!665464 () Bool)

(declare-fun Unit!23232 () Unit!23230)

(assert (=> b!665464 (= e!381368 Unit!23232)))

(declare-fun b!665465 () Bool)

(declare-fun res!432999 () Bool)

(assert (=> b!665465 (=> res!432999 e!381362)))

(assert (=> b!665465 (= res!432999 (contains!3319 acc!681 k!2843))))

(declare-fun b!665466 () Bool)

(declare-fun res!432982 () Bool)

(assert (=> b!665466 (=> (not res!432982) (not e!381364))))

(assert (=> b!665466 (= res!432982 (not (contains!3319 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!665467 () Bool)

(declare-fun e!381365 () Bool)

(assert (=> b!665467 (= e!381365 (contains!3319 acc!681 k!2843))))

(declare-fun b!665468 () Bool)

(declare-fun res!432998 () Bool)

(assert (=> b!665468 (=> (not res!432998) (not e!381364))))

(assert (=> b!665468 (= res!432998 (validKeyInArray!0 k!2843))))

(declare-fun b!665469 () Bool)

(declare-fun Unit!23233 () Unit!23230)

(assert (=> b!665469 (= e!381363 Unit!23233)))

(declare-fun lt!310033 () Unit!23230)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39017 (_ BitVec 64) (_ BitVec 32)) Unit!23230)

(assert (=> b!665469 (= lt!310033 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!665469 false))

(declare-fun b!665470 () Bool)

(declare-fun res!433001 () Bool)

(assert (=> b!665470 (=> (not res!433001) (not e!381364))))

(assert (=> b!665470 (= res!433001 e!381369)))

(declare-fun res!432995 () Bool)

(assert (=> b!665470 (=> res!432995 e!381369)))

(assert (=> b!665470 (= res!432995 e!381365)))

(declare-fun res!432983 () Bool)

(assert (=> b!665470 (=> (not res!432983) (not e!381365))))

(assert (=> b!665470 (= res!432983 (bvsgt from!3004 i!1382))))

(declare-fun b!665471 () Bool)

(declare-fun res!432984 () Bool)

(assert (=> b!665471 (=> (not res!432984) (not e!381364))))

(assert (=> b!665471 (= res!432984 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!665472 () Bool)

(declare-fun lt!310026 () Unit!23230)

(assert (=> b!665472 (= e!381368 lt!310026)))

(declare-fun lt!310024 () Unit!23230)

(assert (=> b!665472 (= lt!310024 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!665472 (subseq!58 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39017 List!12742 List!12742 (_ BitVec 32)) Unit!23230)

(assert (=> b!665472 (= lt!310026 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!190 acc!681 (select (arr!18701 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!665472 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!665473 () Bool)

(declare-fun res!432996 () Bool)

(assert (=> b!665473 (=> (not res!432996) (not e!381364))))

(assert (=> b!665473 (= res!432996 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19065 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!665474 () Bool)

(declare-fun res!432989 () Bool)

(assert (=> b!665474 (=> res!432989 e!381362)))

(assert (=> b!665474 (= res!432989 (not (contains!3319 lt!310031 k!2843)))))

(declare-fun b!665475 () Bool)

(declare-fun res!432985 () Bool)

(assert (=> b!665475 (=> res!432985 e!381362)))

(assert (=> b!665475 (= res!432985 (contains!3319 lt!310031 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!665476 () Bool)

(declare-fun Unit!23234 () Unit!23230)

(assert (=> b!665476 (= e!381363 Unit!23234)))

(declare-fun b!665477 () Bool)

(declare-fun res!432988 () Bool)

(assert (=> b!665477 (=> (not res!432988) (not e!381364))))

(assert (=> b!665477 (= res!432988 (noDuplicate!566 acc!681))))

(assert (= (and start!59970 res!432986) b!665477))

(assert (= (and b!665477 res!432988) b!665466))

(assert (= (and b!665466 res!432982) b!665453))

(assert (= (and b!665453 res!432987) b!665470))

(assert (= (and b!665470 res!432983) b!665467))

(assert (= (and b!665470 (not res!432995)) b!665454))

(assert (= (and b!665454 res!433000) b!665459))

(assert (= (and b!665470 res!433001) b!665456))

(assert (= (and b!665456 res!432981) b!665471))

(assert (= (and b!665471 res!432984) b!665462))

(assert (= (and b!665462 res!432993) b!665468))

(assert (= (and b!665468 res!432998) b!665455))

(assert (= (and b!665455 res!432994) b!665473))

(assert (= (and b!665473 res!432996) b!665457))

(assert (= (and b!665457 c!76604) b!665469))

(assert (= (and b!665457 (not c!76604)) b!665476))

(assert (= (and b!665457 c!76603) b!665472))

(assert (= (and b!665457 (not c!76603)) b!665464))

(assert (= (and b!665457 (not res!432990)) b!665460))

(assert (= (and b!665460 (not res!432992)) b!665463))

(assert (= (and b!665463 (not res!432991)) b!665465))

(assert (= (and b!665465 (not res!432999)) b!665458))

(assert (= (and b!665458 (not res!432997)) b!665474))

(assert (= (and b!665474 (not res!432989)) b!665475))

(assert (= (and b!665475 (not res!432985)) b!665461))

(declare-fun m!636501 () Bool)

(assert (=> b!665458 m!636501))

(declare-fun m!636503 () Bool)

(assert (=> b!665460 m!636503))

(declare-fun m!636505 () Bool)

(assert (=> b!665474 m!636505))

(declare-fun m!636507 () Bool)

(assert (=> b!665461 m!636507))

(declare-fun m!636509 () Bool)

(assert (=> b!665453 m!636509))

(declare-fun m!636511 () Bool)

(assert (=> b!665455 m!636511))

(declare-fun m!636513 () Bool)

(assert (=> b!665468 m!636513))

(declare-fun m!636515 () Bool)

(assert (=> b!665466 m!636515))

(declare-fun m!636517 () Bool)

(assert (=> b!665459 m!636517))

(declare-fun m!636519 () Bool)

(assert (=> b!665477 m!636519))

(declare-fun m!636521 () Bool)

(assert (=> b!665457 m!636521))

(declare-fun m!636523 () Bool)

(assert (=> b!665457 m!636523))

(declare-fun m!636525 () Bool)

(assert (=> b!665457 m!636525))

(declare-fun m!636527 () Bool)

(assert (=> b!665457 m!636527))

(declare-fun m!636529 () Bool)

(assert (=> b!665457 m!636529))

(declare-fun m!636531 () Bool)

(assert (=> b!665457 m!636531))

(declare-fun m!636533 () Bool)

(assert (=> b!665457 m!636533))

(declare-fun m!636535 () Bool)

(assert (=> b!665457 m!636535))

(assert (=> b!665457 m!636525))

(declare-fun m!636537 () Bool)

(assert (=> b!665457 m!636537))

(declare-fun m!636539 () Bool)

(assert (=> b!665457 m!636539))

(declare-fun m!636541 () Bool)

(assert (=> b!665457 m!636541))

(declare-fun m!636543 () Bool)

(assert (=> b!665469 m!636543))

(assert (=> b!665465 m!636517))

(assert (=> b!665472 m!636523))

(assert (=> b!665472 m!636525))

(declare-fun m!636545 () Bool)

(assert (=> b!665472 m!636545))

(declare-fun m!636547 () Bool)

(assert (=> b!665472 m!636547))

(assert (=> b!665472 m!636525))

(assert (=> b!665472 m!636545))

(assert (=> b!665472 m!636531))

(assert (=> b!665472 m!636541))

(declare-fun m!636549 () Bool)

(assert (=> b!665475 m!636549))

(declare-fun m!636551 () Bool)

(assert (=> b!665456 m!636551))

(declare-fun m!636553 () Bool)

(assert (=> start!59970 m!636553))

(assert (=> b!665467 m!636517))

(declare-fun m!636555 () Bool)

(assert (=> b!665471 m!636555))

(push 1)

(assert (not b!665465))

(assert (not b!665468))

(assert (not b!665453))

(assert (not b!665472))

(assert (not b!665457))

(assert (not b!665461))

(assert (not b!665458))

(assert (not b!665466))

(assert (not b!665456))

(assert (not start!59970))

(assert (not b!665467))

(assert (not b!665455))

(assert (not b!665459))

(assert (not b!665471))

(assert (not b!665475))

(assert (not b!665460))

(assert (not b!665469))

(assert (not b!665474))

(assert (not b!665477))

(check-sat)

