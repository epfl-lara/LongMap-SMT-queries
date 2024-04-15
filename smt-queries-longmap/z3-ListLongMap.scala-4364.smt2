; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60200 () Bool)

(assert start!60200)

(declare-fun b!673604 () Bool)

(declare-datatypes ((Unit!23678 0))(
  ( (Unit!23679) )
))
(declare-fun e!384569 () Unit!23678)

(declare-fun Unit!23680 () Unit!23678)

(assert (=> b!673604 (= e!384569 Unit!23680)))

(declare-fun b!673605 () Bool)

(declare-fun res!440285 () Bool)

(declare-fun e!384576 () Bool)

(assert (=> b!673605 (=> (not res!440285) (not e!384576))))

(declare-datatypes ((List!12901 0))(
  ( (Nil!12898) (Cons!12897 (h!13942 (_ BitVec 64)) (t!19120 List!12901)) )
))
(declare-fun acc!681 () List!12901)

(declare-fun noDuplicate!692 (List!12901) Bool)

(assert (=> b!673605 (= res!440285 (noDuplicate!692 acc!681))))

(declare-fun b!673606 () Bool)

(declare-fun res!440287 () Bool)

(assert (=> b!673606 (=> (not res!440287) (not e!384576))))

(declare-datatypes ((array!39258 0))(
  ( (array!39259 (arr!18821 (Array (_ BitVec 32) (_ BitVec 64))) (size!19186 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39258)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!673606 (= res!440287 (validKeyInArray!0 (select (arr!18821 a!3626) from!3004)))))

(declare-fun b!673607 () Bool)

(declare-fun res!440294 () Bool)

(declare-fun e!384570 () Bool)

(assert (=> b!673607 (=> (not res!440294) (not e!384570))))

(declare-fun lt!312281 () List!12901)

(assert (=> b!673607 (= res!440294 (noDuplicate!692 lt!312281))))

(declare-fun b!673608 () Bool)

(declare-fun e!384571 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3423 (List!12901 (_ BitVec 64)) Bool)

(assert (=> b!673608 (= e!384571 (not (contains!3423 acc!681 k0!2843)))))

(declare-fun b!673609 () Bool)

(declare-fun res!440289 () Bool)

(assert (=> b!673609 (=> (not res!440289) (not e!384576))))

(assert (=> b!673609 (= res!440289 (not (contains!3423 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673610 () Bool)

(declare-fun e!384578 () Bool)

(declare-fun e!384577 () Bool)

(assert (=> b!673610 (= e!384578 e!384577)))

(declare-fun res!440276 () Bool)

(assert (=> b!673610 (=> (not res!440276) (not e!384577))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!673610 (= res!440276 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!673611 () Bool)

(declare-fun res!440291 () Bool)

(assert (=> b!673611 (=> (not res!440291) (not e!384570))))

(assert (=> b!673611 (= res!440291 e!384578)))

(declare-fun res!440295 () Bool)

(assert (=> b!673611 (=> res!440295 e!384578)))

(declare-fun e!384573 () Bool)

(assert (=> b!673611 (= res!440295 e!384573)))

(declare-fun res!440292 () Bool)

(assert (=> b!673611 (=> (not res!440292) (not e!384573))))

(assert (=> b!673611 (= res!440292 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!673613 () Bool)

(declare-fun e!384574 () Bool)

(assert (=> b!673613 (= e!384574 e!384570)))

(declare-fun res!440299 () Bool)

(assert (=> b!673613 (=> (not res!440299) (not e!384570))))

(assert (=> b!673613 (= res!440299 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!289 (List!12901 (_ BitVec 64)) List!12901)

(assert (=> b!673613 (= lt!312281 ($colon$colon!289 acc!681 (select (arr!18821 a!3626) from!3004)))))

(declare-fun b!673614 () Bool)

(declare-fun res!440290 () Bool)

(assert (=> b!673614 (=> (not res!440290) (not e!384576))))

(assert (=> b!673614 (= res!440290 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19186 a!3626))))))

(declare-fun b!673615 () Bool)

(declare-fun res!440277 () Bool)

(assert (=> b!673615 (=> (not res!440277) (not e!384576))))

(declare-fun arrayNoDuplicates!0 (array!39258 (_ BitVec 32) List!12901) Bool)

(assert (=> b!673615 (= res!440277 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!673616 () Bool)

(declare-fun res!440288 () Bool)

(assert (=> b!673616 (=> (not res!440288) (not e!384576))))

(assert (=> b!673616 (= res!440288 (validKeyInArray!0 k0!2843))))

(declare-fun b!673617 () Bool)

(declare-fun res!440284 () Bool)

(assert (=> b!673617 (=> (not res!440284) (not e!384576))))

(assert (=> b!673617 (= res!440284 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19186 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!673618 () Bool)

(declare-fun res!440286 () Bool)

(assert (=> b!673618 (=> (not res!440286) (not e!384576))))

(declare-fun e!384572 () Bool)

(assert (=> b!673618 (= res!440286 e!384572)))

(declare-fun res!440279 () Bool)

(assert (=> b!673618 (=> res!440279 e!384572)))

(declare-fun e!384575 () Bool)

(assert (=> b!673618 (= res!440279 e!384575)))

(declare-fun res!440283 () Bool)

(assert (=> b!673618 (=> (not res!440283) (not e!384575))))

(assert (=> b!673618 (= res!440283 (bvsgt from!3004 i!1382))))

(declare-fun b!673619 () Bool)

(assert (=> b!673619 (= e!384577 (not (contains!3423 lt!312281 k0!2843)))))

(declare-fun b!673620 () Bool)

(declare-fun Unit!23681 () Unit!23678)

(assert (=> b!673620 (= e!384569 Unit!23681)))

(declare-fun arrayContainsKey!0 (array!39258 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!673620 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!312280 () Unit!23678)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39258 (_ BitVec 64) (_ BitVec 32)) Unit!23678)

(assert (=> b!673620 (= lt!312280 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!673620 false))

(declare-fun b!673621 () Bool)

(assert (=> b!673621 (= e!384576 e!384574)))

(declare-fun res!440278 () Bool)

(assert (=> b!673621 (=> (not res!440278) (not e!384574))))

(assert (=> b!673621 (= res!440278 (not (= (select (arr!18821 a!3626) from!3004) k0!2843)))))

(declare-fun lt!312279 () Unit!23678)

(assert (=> b!673621 (= lt!312279 e!384569)))

(declare-fun c!77031 () Bool)

(assert (=> b!673621 (= c!77031 (= (select (arr!18821 a!3626) from!3004) k0!2843))))

(declare-fun b!673622 () Bool)

(assert (=> b!673622 (= e!384575 (contains!3423 acc!681 k0!2843))))

(declare-fun b!673623 () Bool)

(declare-fun res!440282 () Bool)

(assert (=> b!673623 (=> (not res!440282) (not e!384576))))

(assert (=> b!673623 (= res!440282 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!673624 () Bool)

(declare-fun res!440297 () Bool)

(assert (=> b!673624 (=> (not res!440297) (not e!384576))))

(assert (=> b!673624 (= res!440297 (not (contains!3423 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!440298 () Bool)

(assert (=> start!60200 (=> (not res!440298) (not e!384576))))

(assert (=> start!60200 (= res!440298 (and (bvslt (size!19186 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19186 a!3626))))))

(assert (=> start!60200 e!384576))

(assert (=> start!60200 true))

(declare-fun array_inv!14704 (array!39258) Bool)

(assert (=> start!60200 (array_inv!14704 a!3626)))

(declare-fun b!673612 () Bool)

(declare-fun res!440296 () Bool)

(assert (=> b!673612 (=> (not res!440296) (not e!384570))))

(assert (=> b!673612 (= res!440296 (not (contains!3423 lt!312281 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673625 () Bool)

(declare-fun res!440281 () Bool)

(assert (=> b!673625 (=> (not res!440281) (not e!384576))))

(assert (=> b!673625 (= res!440281 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12898))))

(declare-fun b!673626 () Bool)

(assert (=> b!673626 (= e!384570 false)))

(declare-fun lt!312282 () Bool)

(assert (=> b!673626 (= lt!312282 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312281))))

(declare-fun b!673627 () Bool)

(assert (=> b!673627 (= e!384572 e!384571)))

(declare-fun res!440293 () Bool)

(assert (=> b!673627 (=> (not res!440293) (not e!384571))))

(assert (=> b!673627 (= res!440293 (bvsle from!3004 i!1382))))

(declare-fun b!673628 () Bool)

(assert (=> b!673628 (= e!384573 (contains!3423 lt!312281 k0!2843))))

(declare-fun b!673629 () Bool)

(declare-fun res!440280 () Bool)

(assert (=> b!673629 (=> (not res!440280) (not e!384570))))

(assert (=> b!673629 (= res!440280 (not (contains!3423 lt!312281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60200 res!440298) b!673605))

(assert (= (and b!673605 res!440285) b!673624))

(assert (= (and b!673624 res!440297) b!673609))

(assert (= (and b!673609 res!440289) b!673618))

(assert (= (and b!673618 res!440283) b!673622))

(assert (= (and b!673618 (not res!440279)) b!673627))

(assert (= (and b!673627 res!440293) b!673608))

(assert (= (and b!673618 res!440286) b!673625))

(assert (= (and b!673625 res!440281) b!673615))

(assert (= (and b!673615 res!440277) b!673614))

(assert (= (and b!673614 res!440290) b!673616))

(assert (= (and b!673616 res!440288) b!673623))

(assert (= (and b!673623 res!440282) b!673617))

(assert (= (and b!673617 res!440284) b!673606))

(assert (= (and b!673606 res!440287) b!673621))

(assert (= (and b!673621 c!77031) b!673620))

(assert (= (and b!673621 (not c!77031)) b!673604))

(assert (= (and b!673621 res!440278) b!673613))

(assert (= (and b!673613 res!440299) b!673607))

(assert (= (and b!673607 res!440294) b!673629))

(assert (= (and b!673629 res!440280) b!673612))

(assert (= (and b!673612 res!440296) b!673611))

(assert (= (and b!673611 res!440292) b!673628))

(assert (= (and b!673611 (not res!440295)) b!673610))

(assert (= (and b!673610 res!440276) b!673619))

(assert (= (and b!673611 res!440291) b!673626))

(declare-fun m!641331 () Bool)

(assert (=> b!673616 m!641331))

(declare-fun m!641333 () Bool)

(assert (=> b!673608 m!641333))

(declare-fun m!641335 () Bool)

(assert (=> b!673613 m!641335))

(assert (=> b!673613 m!641335))

(declare-fun m!641337 () Bool)

(assert (=> b!673613 m!641337))

(declare-fun m!641339 () Bool)

(assert (=> b!673619 m!641339))

(assert (=> b!673628 m!641339))

(declare-fun m!641341 () Bool)

(assert (=> b!673612 m!641341))

(declare-fun m!641343 () Bool)

(assert (=> b!673620 m!641343))

(declare-fun m!641345 () Bool)

(assert (=> b!673620 m!641345))

(declare-fun m!641347 () Bool)

(assert (=> b!673625 m!641347))

(declare-fun m!641349 () Bool)

(assert (=> b!673615 m!641349))

(declare-fun m!641351 () Bool)

(assert (=> b!673626 m!641351))

(declare-fun m!641353 () Bool)

(assert (=> b!673624 m!641353))

(declare-fun m!641355 () Bool)

(assert (=> b!673609 m!641355))

(declare-fun m!641357 () Bool)

(assert (=> b!673607 m!641357))

(declare-fun m!641359 () Bool)

(assert (=> b!673623 m!641359))

(assert (=> b!673622 m!641333))

(assert (=> b!673606 m!641335))

(assert (=> b!673606 m!641335))

(declare-fun m!641361 () Bool)

(assert (=> b!673606 m!641361))

(declare-fun m!641363 () Bool)

(assert (=> start!60200 m!641363))

(declare-fun m!641365 () Bool)

(assert (=> b!673629 m!641365))

(declare-fun m!641367 () Bool)

(assert (=> b!673605 m!641367))

(assert (=> b!673621 m!641335))

(check-sat (not b!673629) (not b!673625) (not b!673619) (not b!673612) (not b!673606) (not b!673615) (not start!60200) (not b!673622) (not b!673613) (not b!673628) (not b!673607) (not b!673605) (not b!673623) (not b!673626) (not b!673624) (not b!673620) (not b!673609) (not b!673608) (not b!673616))
(check-sat)
