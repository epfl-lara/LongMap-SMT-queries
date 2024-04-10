; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60106 () Bool)

(assert start!60106)

(declare-fun b!670585 () Bool)

(declare-fun e!383393 () Bool)

(declare-datatypes ((List!12810 0))(
  ( (Nil!12807) (Cons!12806 (h!13851 (_ BitVec 64)) (t!19038 List!12810)) )
))
(declare-fun lt!312097 () List!12810)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3387 (List!12810 (_ BitVec 64)) Bool)

(assert (=> b!670585 (= e!383393 (not (contains!3387 lt!312097 k0!2843)))))

(declare-fun b!670586 () Bool)

(declare-fun e!383389 () Bool)

(assert (=> b!670586 (= e!383389 true)))

(declare-datatypes ((array!39153 0))(
  ( (array!39154 (arr!18769 (Array (_ BitVec 32) (_ BitVec 64))) (size!19133 (_ BitVec 32))) )
))
(declare-fun lt!312098 () array!39153)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39153 (_ BitVec 32) List!12810) Bool)

(assert (=> b!670586 (arrayNoDuplicates!0 lt!312098 (bvadd #b00000000000000000000000000000001 from!3004) lt!312097)))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((Unit!23570 0))(
  ( (Unit!23571) )
))
(declare-fun lt!312106 () Unit!23570)

(declare-fun a!3626 () array!39153)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39153 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12810) Unit!23570)

(assert (=> b!670586 (= lt!312106 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!312097))))

(declare-fun b!670587 () Bool)

(declare-fun e!383388 () Unit!23570)

(declare-fun Unit!23572 () Unit!23570)

(assert (=> b!670587 (= e!383388 Unit!23572)))

(declare-fun b!670588 () Bool)

(declare-fun res!437300 () Bool)

(declare-fun e!383390 () Bool)

(assert (=> b!670588 (=> (not res!437300) (not e!383390))))

(declare-fun e!383391 () Bool)

(assert (=> b!670588 (= res!437300 e!383391)))

(declare-fun res!437307 () Bool)

(assert (=> b!670588 (=> res!437307 e!383391)))

(declare-fun e!383395 () Bool)

(assert (=> b!670588 (= res!437307 e!383395)))

(declare-fun res!437314 () Bool)

(assert (=> b!670588 (=> (not res!437314) (not e!383395))))

(assert (=> b!670588 (= res!437314 (bvsgt from!3004 i!1382))))

(declare-fun b!670589 () Bool)

(declare-fun res!437313 () Bool)

(assert (=> b!670589 (=> res!437313 e!383389)))

(declare-fun e!383392 () Bool)

(assert (=> b!670589 (= res!437313 e!383392)))

(declare-fun res!437317 () Bool)

(assert (=> b!670589 (=> (not res!437317) (not e!383392))))

(assert (=> b!670589 (= res!437317 e!383393)))

(declare-fun res!437308 () Bool)

(assert (=> b!670589 (=> res!437308 e!383393)))

(assert (=> b!670589 (= res!437308 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!670590 () Bool)

(declare-fun res!437312 () Bool)

(assert (=> b!670590 (=> (not res!437312) (not e!383390))))

(assert (=> b!670590 (= res!437312 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19133 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!670591 () Bool)

(declare-fun acc!681 () List!12810)

(assert (=> b!670591 (= e!383395 (contains!3387 acc!681 k0!2843))))

(declare-fun b!670592 () Bool)

(declare-fun res!437303 () Bool)

(assert (=> b!670592 (=> (not res!437303) (not e!383390))))

(declare-fun noDuplicate!634 (List!12810) Bool)

(assert (=> b!670592 (= res!437303 (noDuplicate!634 acc!681))))

(declare-fun b!670593 () Bool)

(declare-fun res!437299 () Bool)

(assert (=> b!670593 (=> res!437299 e!383389)))

(assert (=> b!670593 (= res!437299 (not (noDuplicate!634 lt!312097)))))

(declare-fun b!670594 () Bool)

(declare-fun e!383394 () Bool)

(assert (=> b!670594 (= e!383394 (not (contains!3387 acc!681 k0!2843)))))

(declare-fun b!670596 () Bool)

(assert (=> b!670596 (= e!383391 e!383394)))

(declare-fun res!437315 () Bool)

(assert (=> b!670596 (=> (not res!437315) (not e!383394))))

(assert (=> b!670596 (= res!437315 (bvsle from!3004 i!1382))))

(declare-fun b!670597 () Bool)

(declare-fun e!383397 () Unit!23570)

(declare-fun Unit!23573 () Unit!23570)

(assert (=> b!670597 (= e!383397 Unit!23573)))

(declare-fun b!670598 () Bool)

(declare-fun res!437318 () Bool)

(assert (=> b!670598 (=> (not res!437318) (not e!383390))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!670598 (= res!437318 (validKeyInArray!0 k0!2843))))

(declare-fun b!670599 () Bool)

(assert (=> b!670599 (= e!383390 (not e!383389))))

(declare-fun res!437305 () Bool)

(assert (=> b!670599 (=> res!437305 e!383389)))

(assert (=> b!670599 (= res!437305 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!670599 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312097)))

(declare-fun lt!312101 () Unit!23570)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39153 (_ BitVec 64) (_ BitVec 32) List!12810 List!12810) Unit!23570)

(assert (=> b!670599 (= lt!312101 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!312097))))

(declare-fun -!124 (List!12810 (_ BitVec 64)) List!12810)

(assert (=> b!670599 (= (-!124 lt!312097 k0!2843) acc!681)))

(declare-fun $colon$colon!258 (List!12810 (_ BitVec 64)) List!12810)

(assert (=> b!670599 (= lt!312097 ($colon$colon!258 acc!681 k0!2843))))

(declare-fun lt!312099 () Unit!23570)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12810) Unit!23570)

(assert (=> b!670599 (= lt!312099 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!126 (List!12810 List!12810) Bool)

(assert (=> b!670599 (subseq!126 acc!681 acc!681)))

(declare-fun lt!312104 () Unit!23570)

(declare-fun lemmaListSubSeqRefl!0 (List!12810) Unit!23570)

(assert (=> b!670599 (= lt!312104 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!670599 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!312102 () Unit!23570)

(assert (=> b!670599 (= lt!312102 e!383397)))

(declare-fun c!77012 () Bool)

(assert (=> b!670599 (= c!77012 (validKeyInArray!0 (select (arr!18769 a!3626) from!3004)))))

(declare-fun lt!312105 () Unit!23570)

(assert (=> b!670599 (= lt!312105 e!383388)))

(declare-fun c!77011 () Bool)

(declare-fun arrayContainsKey!0 (array!39153 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!670599 (= c!77011 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!670599 (arrayContainsKey!0 lt!312098 k0!2843 from!3004)))

(assert (=> b!670599 (= lt!312098 (array!39154 (store (arr!18769 a!3626) i!1382 k0!2843) (size!19133 a!3626)))))

(declare-fun b!670600 () Bool)

(declare-fun res!437301 () Bool)

(assert (=> b!670600 (=> (not res!437301) (not e!383390))))

(assert (=> b!670600 (= res!437301 (not (contains!3387 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670601 () Bool)

(declare-fun res!437302 () Bool)

(assert (=> b!670601 (=> res!437302 e!383389)))

(assert (=> b!670601 (= res!437302 (contains!3387 lt!312097 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!670602 () Bool)

(declare-fun res!437304 () Bool)

(assert (=> b!670602 (=> (not res!437304) (not e!383390))))

(assert (=> b!670602 (= res!437304 (not (contains!3387 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670603 () Bool)

(declare-fun lt!312096 () Unit!23570)

(assert (=> b!670603 (= e!383397 lt!312096)))

(declare-fun lt!312100 () Unit!23570)

(assert (=> b!670603 (= lt!312100 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!670603 (subseq!126 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39153 List!12810 List!12810 (_ BitVec 32)) Unit!23570)

(assert (=> b!670603 (= lt!312096 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!258 acc!681 (select (arr!18769 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!670603 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!670604 () Bool)

(declare-fun res!437316 () Bool)

(assert (=> b!670604 (=> (not res!437316) (not e!383390))))

(assert (=> b!670604 (= res!437316 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun res!437298 () Bool)

(assert (=> start!60106 (=> (not res!437298) (not e!383390))))

(assert (=> start!60106 (= res!437298 (and (bvslt (size!19133 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19133 a!3626))))))

(assert (=> start!60106 e!383390))

(assert (=> start!60106 true))

(declare-fun array_inv!14565 (array!39153) Bool)

(assert (=> start!60106 (array_inv!14565 a!3626)))

(declare-fun b!670595 () Bool)

(declare-fun e!383396 () Bool)

(assert (=> b!670595 (= e!383396 (contains!3387 lt!312097 k0!2843))))

(declare-fun b!670605 () Bool)

(assert (=> b!670605 (= e!383392 e!383396)))

(declare-fun res!437309 () Bool)

(assert (=> b!670605 (=> res!437309 e!383396)))

(assert (=> b!670605 (= res!437309 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!670606 () Bool)

(declare-fun Unit!23574 () Unit!23570)

(assert (=> b!670606 (= e!383388 Unit!23574)))

(declare-fun lt!312103 () Unit!23570)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39153 (_ BitVec 64) (_ BitVec 32)) Unit!23570)

(assert (=> b!670606 (= lt!312103 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!670606 false))

(declare-fun b!670607 () Bool)

(declare-fun res!437311 () Bool)

(assert (=> b!670607 (=> (not res!437311) (not e!383390))))

(assert (=> b!670607 (= res!437311 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12807))))

(declare-fun b!670608 () Bool)

(declare-fun res!437297 () Bool)

(assert (=> b!670608 (=> (not res!437297) (not e!383390))))

(assert (=> b!670608 (= res!437297 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19133 a!3626))))))

(declare-fun b!670609 () Bool)

(declare-fun res!437306 () Bool)

(assert (=> b!670609 (=> res!437306 e!383389)))

(assert (=> b!670609 (= res!437306 (contains!3387 lt!312097 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!670610 () Bool)

(declare-fun res!437310 () Bool)

(assert (=> b!670610 (=> (not res!437310) (not e!383390))))

(assert (=> b!670610 (= res!437310 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(assert (= (and start!60106 res!437298) b!670592))

(assert (= (and b!670592 res!437303) b!670602))

(assert (= (and b!670602 res!437304) b!670600))

(assert (= (and b!670600 res!437301) b!670588))

(assert (= (and b!670588 res!437314) b!670591))

(assert (= (and b!670588 (not res!437307)) b!670596))

(assert (= (and b!670596 res!437315) b!670594))

(assert (= (and b!670588 res!437300) b!670607))

(assert (= (and b!670607 res!437311) b!670610))

(assert (= (and b!670610 res!437310) b!670608))

(assert (= (and b!670608 res!437297) b!670598))

(assert (= (and b!670598 res!437318) b!670604))

(assert (= (and b!670604 res!437316) b!670590))

(assert (= (and b!670590 res!437312) b!670599))

(assert (= (and b!670599 c!77011) b!670606))

(assert (= (and b!670599 (not c!77011)) b!670587))

(assert (= (and b!670599 c!77012) b!670603))

(assert (= (and b!670599 (not c!77012)) b!670597))

(assert (= (and b!670599 (not res!437305)) b!670593))

(assert (= (and b!670593 (not res!437299)) b!670601))

(assert (= (and b!670601 (not res!437302)) b!670609))

(assert (= (and b!670609 (not res!437306)) b!670589))

(assert (= (and b!670589 (not res!437308)) b!670585))

(assert (= (and b!670589 res!437317) b!670605))

(assert (= (and b!670605 (not res!437309)) b!670595))

(assert (= (and b!670589 (not res!437313)) b!670586))

(declare-fun m!640435 () Bool)

(assert (=> b!670598 m!640435))

(declare-fun m!640437 () Bool)

(assert (=> b!670591 m!640437))

(declare-fun m!640439 () Bool)

(assert (=> b!670586 m!640439))

(declare-fun m!640441 () Bool)

(assert (=> b!670586 m!640441))

(declare-fun m!640443 () Bool)

(assert (=> b!670606 m!640443))

(declare-fun m!640445 () Bool)

(assert (=> b!670607 m!640445))

(declare-fun m!640447 () Bool)

(assert (=> b!670599 m!640447))

(declare-fun m!640449 () Bool)

(assert (=> b!670599 m!640449))

(declare-fun m!640451 () Bool)

(assert (=> b!670599 m!640451))

(declare-fun m!640453 () Bool)

(assert (=> b!670599 m!640453))

(declare-fun m!640455 () Bool)

(assert (=> b!670599 m!640455))

(declare-fun m!640457 () Bool)

(assert (=> b!670599 m!640457))

(declare-fun m!640459 () Bool)

(assert (=> b!670599 m!640459))

(declare-fun m!640461 () Bool)

(assert (=> b!670599 m!640461))

(declare-fun m!640463 () Bool)

(assert (=> b!670599 m!640463))

(declare-fun m!640465 () Bool)

(assert (=> b!670599 m!640465))

(declare-fun m!640467 () Bool)

(assert (=> b!670599 m!640467))

(assert (=> b!670599 m!640451))

(declare-fun m!640469 () Bool)

(assert (=> b!670599 m!640469))

(declare-fun m!640471 () Bool)

(assert (=> b!670599 m!640471))

(declare-fun m!640473 () Bool)

(assert (=> b!670593 m!640473))

(declare-fun m!640475 () Bool)

(assert (=> b!670592 m!640475))

(declare-fun m!640477 () Bool)

(assert (=> b!670595 m!640477))

(declare-fun m!640479 () Bool)

(assert (=> start!60106 m!640479))

(declare-fun m!640481 () Bool)

(assert (=> b!670602 m!640481))

(assert (=> b!670603 m!640449))

(assert (=> b!670603 m!640451))

(declare-fun m!640483 () Bool)

(assert (=> b!670603 m!640483))

(declare-fun m!640485 () Bool)

(assert (=> b!670603 m!640485))

(assert (=> b!670603 m!640451))

(assert (=> b!670603 m!640483))

(assert (=> b!670603 m!640459))

(assert (=> b!670603 m!640471))

(declare-fun m!640487 () Bool)

(assert (=> b!670610 m!640487))

(declare-fun m!640489 () Bool)

(assert (=> b!670601 m!640489))

(assert (=> b!670594 m!640437))

(assert (=> b!670585 m!640477))

(declare-fun m!640491 () Bool)

(assert (=> b!670600 m!640491))

(declare-fun m!640493 () Bool)

(assert (=> b!670604 m!640493))

(declare-fun m!640495 () Bool)

(assert (=> b!670609 m!640495))

(check-sat (not b!670592) (not b!670609) (not b!670593) (not b!670598) (not b!670602) (not start!60106) (not b!670600) (not b!670607) (not b!670610) (not b!670595) (not b!670586) (not b!670604) (not b!670594) (not b!670599) (not b!670585) (not b!670591) (not b!670603) (not b!670601) (not b!670606))
(check-sat)
