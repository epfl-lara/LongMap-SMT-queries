; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60074 () Bool)

(assert start!60074)

(declare-fun b!669353 () Bool)

(declare-fun res!436277 () Bool)

(declare-fun e!382861 () Bool)

(assert (=> b!669353 (=> (not res!436277) (not e!382861))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!669353 (= res!436277 (validKeyInArray!0 k!2843))))

(declare-fun b!669354 () Bool)

(declare-fun e!382865 () Bool)

(declare-fun e!382867 () Bool)

(assert (=> b!669354 (= e!382865 e!382867)))

(declare-fun res!436269 () Bool)

(assert (=> b!669354 (=> (not res!436269) (not e!382867))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!669354 (= res!436269 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!669355 () Bool)

(declare-fun res!436260 () Bool)

(declare-fun e!382866 () Bool)

(assert (=> b!669355 (=> res!436260 e!382866)))

(declare-datatypes ((List!12794 0))(
  ( (Nil!12791) (Cons!12790 (h!13835 (_ BitVec 64)) (t!19022 List!12794)) )
))
(declare-fun lt!311585 () List!12794)

(declare-fun contains!3371 (List!12794 (_ BitVec 64)) Bool)

(assert (=> b!669355 (= res!436260 (contains!3371 lt!311585 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!669356 () Bool)

(declare-fun res!436266 () Bool)

(assert (=> b!669356 (=> (not res!436266) (not e!382861))))

(declare-fun e!382868 () Bool)

(assert (=> b!669356 (= res!436266 e!382868)))

(declare-fun res!436276 () Bool)

(assert (=> b!669356 (=> res!436276 e!382868)))

(declare-fun e!382864 () Bool)

(assert (=> b!669356 (= res!436276 e!382864)))

(declare-fun res!436259 () Bool)

(assert (=> b!669356 (=> (not res!436259) (not e!382864))))

(assert (=> b!669356 (= res!436259 (bvsgt from!3004 i!1382))))

(declare-fun b!669357 () Bool)

(declare-fun e!382869 () Bool)

(assert (=> b!669357 (= e!382868 e!382869)))

(declare-fun res!436265 () Bool)

(assert (=> b!669357 (=> (not res!436265) (not e!382869))))

(assert (=> b!669357 (= res!436265 (bvsle from!3004 i!1382))))

(declare-fun b!669358 () Bool)

(assert (=> b!669358 (= e!382867 (not (contains!3371 lt!311585 k!2843)))))

(declare-fun b!669359 () Bool)

(declare-fun res!436263 () Bool)

(assert (=> b!669359 (=> (not res!436263) (not e!382861))))

(declare-datatypes ((array!39121 0))(
  ( (array!39122 (arr!18753 (Array (_ BitVec 32) (_ BitVec 64))) (size!19117 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39121)

(assert (=> b!669359 (= res!436263 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19117 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!669360 () Bool)

(declare-fun res!436268 () Bool)

(assert (=> b!669360 (=> (not res!436268) (not e!382861))))

(declare-fun acc!681 () List!12794)

(declare-fun noDuplicate!618 (List!12794) Bool)

(assert (=> b!669360 (= res!436268 (noDuplicate!618 acc!681))))

(declare-fun res!436264 () Bool)

(assert (=> start!60074 (=> (not res!436264) (not e!382861))))

(assert (=> start!60074 (= res!436264 (and (bvslt (size!19117 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19117 a!3626))))))

(assert (=> start!60074 e!382861))

(assert (=> start!60074 true))

(declare-fun array_inv!14549 (array!39121) Bool)

(assert (=> start!60074 (array_inv!14549 a!3626)))

(declare-fun b!669361 () Bool)

(assert (=> b!669361 (= e!382869 (not (contains!3371 acc!681 k!2843)))))

(declare-fun b!669362 () Bool)

(declare-datatypes ((Unit!23490 0))(
  ( (Unit!23491) )
))
(declare-fun e!382860 () Unit!23490)

(declare-fun Unit!23492 () Unit!23490)

(assert (=> b!669362 (= e!382860 Unit!23492)))

(declare-fun lt!311587 () Unit!23490)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39121 (_ BitVec 64) (_ BitVec 32)) Unit!23490)

(assert (=> b!669362 (= lt!311587 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!669362 false))

(declare-fun b!669363 () Bool)

(assert (=> b!669363 (= e!382861 (not e!382866))))

(declare-fun res!436274 () Bool)

(assert (=> b!669363 (=> res!436274 e!382866)))

(assert (=> b!669363 (= res!436274 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun arrayNoDuplicates!0 (array!39121 (_ BitVec 32) List!12794) Bool)

(assert (=> b!669363 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311585)))

(declare-fun lt!311584 () Unit!23490)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39121 (_ BitVec 64) (_ BitVec 32) List!12794 List!12794) Unit!23490)

(assert (=> b!669363 (= lt!311584 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311585))))

(declare-fun -!108 (List!12794 (_ BitVec 64)) List!12794)

(assert (=> b!669363 (= (-!108 lt!311585 k!2843) acc!681)))

(declare-fun $colon$colon!242 (List!12794 (_ BitVec 64)) List!12794)

(assert (=> b!669363 (= lt!311585 ($colon$colon!242 acc!681 k!2843))))

(declare-fun lt!311589 () Unit!23490)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12794) Unit!23490)

(assert (=> b!669363 (= lt!311589 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!110 (List!12794 List!12794) Bool)

(assert (=> b!669363 (subseq!110 acc!681 acc!681)))

(declare-fun lt!311591 () Unit!23490)

(declare-fun lemmaListSubSeqRefl!0 (List!12794) Unit!23490)

(assert (=> b!669363 (= lt!311591 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!669363 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311592 () Unit!23490)

(declare-fun e!382862 () Unit!23490)

(assert (=> b!669363 (= lt!311592 e!382862)))

(declare-fun c!76916 () Bool)

(assert (=> b!669363 (= c!76916 (validKeyInArray!0 (select (arr!18753 a!3626) from!3004)))))

(declare-fun lt!311586 () Unit!23490)

(assert (=> b!669363 (= lt!311586 e!382860)))

(declare-fun c!76915 () Bool)

(declare-fun arrayContainsKey!0 (array!39121 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!669363 (= c!76915 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!669363 (arrayContainsKey!0 (array!39122 (store (arr!18753 a!3626) i!1382 k!2843) (size!19117 a!3626)) k!2843 from!3004)))

(declare-fun b!669364 () Bool)

(declare-fun res!436257 () Bool)

(assert (=> b!669364 (=> (not res!436257) (not e!382861))))

(assert (=> b!669364 (= res!436257 (not (contains!3371 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!669365 () Bool)

(declare-fun res!436267 () Bool)

(assert (=> b!669365 (=> (not res!436267) (not e!382861))))

(assert (=> b!669365 (= res!436267 (not (contains!3371 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!669366 () Bool)

(declare-fun res!436270 () Bool)

(assert (=> b!669366 (=> (not res!436270) (not e!382861))))

(assert (=> b!669366 (= res!436270 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19117 a!3626))))))

(declare-fun b!669367 () Bool)

(declare-fun res!436271 () Bool)

(assert (=> b!669367 (=> res!436271 e!382866)))

(assert (=> b!669367 (= res!436271 (not (noDuplicate!618 lt!311585)))))

(declare-fun b!669368 () Bool)

(declare-fun Unit!23493 () Unit!23490)

(assert (=> b!669368 (= e!382860 Unit!23493)))

(declare-fun b!669369 () Bool)

(declare-fun res!436261 () Bool)

(assert (=> b!669369 (=> (not res!436261) (not e!382861))))

(assert (=> b!669369 (= res!436261 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!669370 () Bool)

(assert (=> b!669370 (= e!382864 (contains!3371 acc!681 k!2843))))

(declare-fun b!669371 () Bool)

(declare-fun res!436273 () Bool)

(assert (=> b!669371 (=> res!436273 e!382866)))

(assert (=> b!669371 (= res!436273 (contains!3371 lt!311585 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!669372 () Bool)

(declare-fun lt!311590 () Unit!23490)

(assert (=> b!669372 (= e!382862 lt!311590)))

(declare-fun lt!311588 () Unit!23490)

(assert (=> b!669372 (= lt!311588 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!669372 (subseq!110 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39121 List!12794 List!12794 (_ BitVec 32)) Unit!23490)

(assert (=> b!669372 (= lt!311590 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!242 acc!681 (select (arr!18753 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!669372 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!669373 () Bool)

(declare-fun res!436258 () Bool)

(assert (=> b!669373 (=> (not res!436258) (not e!382861))))

(assert (=> b!669373 (= res!436258 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12791))))

(declare-fun b!669374 () Bool)

(declare-fun Unit!23494 () Unit!23490)

(assert (=> b!669374 (= e!382862 Unit!23494)))

(declare-fun b!669375 () Bool)

(declare-fun res!436272 () Bool)

(assert (=> b!669375 (=> (not res!436272) (not e!382861))))

(assert (=> b!669375 (= res!436272 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!669376 () Bool)

(assert (=> b!669376 (= e!382866 true)))

(declare-fun lt!311593 () Bool)

(assert (=> b!669376 (= lt!311593 e!382865)))

(declare-fun res!436262 () Bool)

(assert (=> b!669376 (=> res!436262 e!382865)))

(declare-fun e!382863 () Bool)

(assert (=> b!669376 (= res!436262 e!382863)))

(declare-fun res!436275 () Bool)

(assert (=> b!669376 (=> (not res!436275) (not e!382863))))

(assert (=> b!669376 (= res!436275 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!669377 () Bool)

(assert (=> b!669377 (= e!382863 (contains!3371 lt!311585 k!2843))))

(assert (= (and start!60074 res!436264) b!669360))

(assert (= (and b!669360 res!436268) b!669364))

(assert (= (and b!669364 res!436257) b!669365))

(assert (= (and b!669365 res!436267) b!669356))

(assert (= (and b!669356 res!436259) b!669370))

(assert (= (and b!669356 (not res!436276)) b!669357))

(assert (= (and b!669357 res!436265) b!669361))

(assert (= (and b!669356 res!436266) b!669373))

(assert (= (and b!669373 res!436258) b!669369))

(assert (= (and b!669369 res!436261) b!669366))

(assert (= (and b!669366 res!436270) b!669353))

(assert (= (and b!669353 res!436277) b!669375))

(assert (= (and b!669375 res!436272) b!669359))

(assert (= (and b!669359 res!436263) b!669363))

(assert (= (and b!669363 c!76915) b!669362))

(assert (= (and b!669363 (not c!76915)) b!669368))

(assert (= (and b!669363 c!76916) b!669372))

(assert (= (and b!669363 (not c!76916)) b!669374))

(assert (= (and b!669363 (not res!436274)) b!669367))

(assert (= (and b!669367 (not res!436271)) b!669371))

(assert (= (and b!669371 (not res!436273)) b!669355))

(assert (= (and b!669355 (not res!436260)) b!669376))

(assert (= (and b!669376 res!436275) b!669377))

(assert (= (and b!669376 (not res!436262)) b!669354))

(assert (= (and b!669354 res!436269) b!669358))

(declare-fun m!639467 () Bool)

(assert (=> b!669365 m!639467))

(declare-fun m!639469 () Bool)

(assert (=> b!669355 m!639469))

(declare-fun m!639471 () Bool)

(assert (=> b!669353 m!639471))

(declare-fun m!639473 () Bool)

(assert (=> start!60074 m!639473))

(declare-fun m!639475 () Bool)

(assert (=> b!669372 m!639475))

(declare-fun m!639477 () Bool)

(assert (=> b!669372 m!639477))

(declare-fun m!639479 () Bool)

(assert (=> b!669372 m!639479))

(declare-fun m!639481 () Bool)

(assert (=> b!669372 m!639481))

(assert (=> b!669372 m!639477))

(assert (=> b!669372 m!639479))

(declare-fun m!639483 () Bool)

(assert (=> b!669372 m!639483))

(declare-fun m!639485 () Bool)

(assert (=> b!669372 m!639485))

(declare-fun m!639487 () Bool)

(assert (=> b!669358 m!639487))

(declare-fun m!639489 () Bool)

(assert (=> b!669364 m!639489))

(declare-fun m!639491 () Bool)

(assert (=> b!669370 m!639491))

(declare-fun m!639493 () Bool)

(assert (=> b!669369 m!639493))

(declare-fun m!639495 () Bool)

(assert (=> b!669363 m!639495))

(declare-fun m!639497 () Bool)

(assert (=> b!669363 m!639497))

(assert (=> b!669363 m!639475))

(assert (=> b!669363 m!639477))

(declare-fun m!639499 () Bool)

(assert (=> b!669363 m!639499))

(declare-fun m!639501 () Bool)

(assert (=> b!669363 m!639501))

(declare-fun m!639503 () Bool)

(assert (=> b!669363 m!639503))

(assert (=> b!669363 m!639483))

(declare-fun m!639505 () Bool)

(assert (=> b!669363 m!639505))

(declare-fun m!639507 () Bool)

(assert (=> b!669363 m!639507))

(assert (=> b!669363 m!639477))

(declare-fun m!639509 () Bool)

(assert (=> b!669363 m!639509))

(declare-fun m!639511 () Bool)

(assert (=> b!669363 m!639511))

(assert (=> b!669363 m!639485))

(declare-fun m!639513 () Bool)

(assert (=> b!669360 m!639513))

(declare-fun m!639515 () Bool)

(assert (=> b!669362 m!639515))

(assert (=> b!669361 m!639491))

(declare-fun m!639517 () Bool)

(assert (=> b!669367 m!639517))

(declare-fun m!639519 () Bool)

(assert (=> b!669375 m!639519))

(declare-fun m!639521 () Bool)

(assert (=> b!669371 m!639521))

(assert (=> b!669377 m!639487))

(declare-fun m!639523 () Bool)

(assert (=> b!669373 m!639523))

(push 1)

(assert (not b!669375))

(assert (not b!669361))

(assert (not b!669367))

(assert (not b!669360))

(assert (not b!669370))

(assert (not b!669369))

(assert (not b!669363))

(assert (not b!669362))

(assert (not b!669353))

(assert (not b!669358))

(assert (not b!669372))

(assert (not b!669364))

(assert (not start!60074))

(assert (not b!669371))

(assert (not b!669377))

(assert (not b!669355))

(assert (not b!669365))

(assert (not b!669373))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

