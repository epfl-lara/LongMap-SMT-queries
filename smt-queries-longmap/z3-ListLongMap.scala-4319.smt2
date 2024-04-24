; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60000 () Bool)

(assert start!60000)

(declare-fun b!664627 () Bool)

(declare-datatypes ((Unit!23139 0))(
  ( (Unit!23140) )
))
(declare-fun e!381169 () Unit!23139)

(declare-fun lt!309715 () Unit!23139)

(assert (=> b!664627 (= e!381169 lt!309715)))

(declare-fun lt!309706 () Unit!23139)

(declare-datatypes ((List!12630 0))(
  ( (Nil!12627) (Cons!12626 (h!13674 (_ BitVec 64)) (t!18850 List!12630)) )
))
(declare-fun acc!681 () List!12630)

(declare-fun lemmaListSubSeqRefl!0 (List!12630) Unit!23139)

(assert (=> b!664627 (= lt!309706 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!44 (List!12630 List!12630) Bool)

(assert (=> b!664627 (subseq!44 acc!681 acc!681)))

(declare-datatypes ((array!38985 0))(
  ( (array!38986 (arr!18682 (Array (_ BitVec 32) (_ BitVec 64))) (size!19046 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38985)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!38985 List!12630 List!12630 (_ BitVec 32)) Unit!23139)

(declare-fun $colon$colon!173 (List!12630 (_ BitVec 64)) List!12630)

(assert (=> b!664627 (= lt!309715 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!173 acc!681 (select (arr!18682 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!38985 (_ BitVec 32) List!12630) Bool)

(assert (=> b!664627 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!664628 () Bool)

(declare-fun res!432229 () Bool)

(declare-fun e!381173 () Bool)

(assert (=> b!664628 (=> (not res!432229) (not e!381173))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!664628 (= res!432229 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19046 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!664629 () Bool)

(declare-fun e!381174 () Bool)

(assert (=> b!664629 (= e!381174 true)))

(declare-fun lt!309711 () Bool)

(declare-fun lt!309712 () List!12630)

(declare-fun contains!3282 (List!12630 (_ BitVec 64)) Bool)

(assert (=> b!664629 (= lt!309711 (contains!3282 lt!309712 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!432222 () Bool)

(assert (=> start!60000 (=> (not res!432222) (not e!381173))))

(assert (=> start!60000 (= res!432222 (and (bvslt (size!19046 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19046 a!3626))))))

(assert (=> start!60000 e!381173))

(assert (=> start!60000 true))

(declare-fun array_inv!14541 (array!38985) Bool)

(assert (=> start!60000 (array_inv!14541 a!3626)))

(declare-fun b!664630 () Bool)

(declare-fun res!432218 () Bool)

(assert (=> b!664630 (=> res!432218 e!381174)))

(declare-fun lt!309707 () Bool)

(assert (=> b!664630 (= res!432218 lt!309707)))

(declare-fun b!664631 () Bool)

(declare-fun res!432215 () Bool)

(assert (=> b!664631 (=> res!432215 e!381174)))

(assert (=> b!664631 (= res!432215 (not (subseq!44 acc!681 lt!309712)))))

(declare-fun b!664632 () Bool)

(declare-fun res!432216 () Bool)

(assert (=> b!664632 (=> res!432216 e!381174)))

(assert (=> b!664632 (= res!432216 (contains!3282 lt!309712 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!664633 () Bool)

(declare-fun Unit!23141 () Unit!23139)

(assert (=> b!664633 (= e!381169 Unit!23141)))

(declare-fun b!664634 () Bool)

(declare-fun res!432228 () Bool)

(assert (=> b!664634 (=> res!432228 e!381174)))

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!664634 (= res!432228 (contains!3282 acc!681 k0!2843))))

(declare-fun b!664635 () Bool)

(declare-fun res!432223 () Bool)

(assert (=> b!664635 (=> (not res!432223) (not e!381173))))

(assert (=> b!664635 (= res!432223 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19046 a!3626))))))

(declare-fun b!664636 () Bool)

(declare-fun res!432231 () Bool)

(assert (=> b!664636 (=> (not res!432231) (not e!381173))))

(assert (=> b!664636 (= res!432231 (not (contains!3282 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!664637 () Bool)

(declare-fun res!432219 () Bool)

(assert (=> b!664637 (=> (not res!432219) (not e!381173))))

(assert (=> b!664637 (= res!432219 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!664638 () Bool)

(declare-fun e!381168 () Bool)

(declare-fun e!381167 () Bool)

(assert (=> b!664638 (= e!381168 e!381167)))

(declare-fun res!432212 () Bool)

(assert (=> b!664638 (=> (not res!432212) (not e!381167))))

(assert (=> b!664638 (= res!432212 (bvsle from!3004 i!1382))))

(declare-fun b!664639 () Bool)

(declare-fun res!432224 () Bool)

(assert (=> b!664639 (=> (not res!432224) (not e!381173))))

(assert (=> b!664639 (= res!432224 (not (contains!3282 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!664640 () Bool)

(declare-fun res!432221 () Bool)

(assert (=> b!664640 (=> (not res!432221) (not e!381173))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!664640 (= res!432221 (validKeyInArray!0 k0!2843))))

(declare-fun b!664641 () Bool)

(declare-fun e!381172 () Unit!23139)

(declare-fun Unit!23142 () Unit!23139)

(assert (=> b!664641 (= e!381172 Unit!23142)))

(declare-fun b!664642 () Bool)

(declare-fun res!432220 () Bool)

(assert (=> b!664642 (=> (not res!432220) (not e!381173))))

(assert (=> b!664642 (= res!432220 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12627))))

(declare-fun b!664643 () Bool)

(assert (=> b!664643 (= e!381173 (not e!381174))))

(declare-fun res!432227 () Bool)

(assert (=> b!664643 (=> res!432227 e!381174)))

(assert (=> b!664643 (= res!432227 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!41 (List!12630 (_ BitVec 64)) List!12630)

(assert (=> b!664643 (= (-!41 lt!309712 k0!2843) acc!681)))

(assert (=> b!664643 (= lt!309712 ($colon$colon!173 acc!681 k0!2843))))

(declare-fun lt!309709 () Unit!23139)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12630) Unit!23139)

(assert (=> b!664643 (= lt!309709 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!664643 (subseq!44 acc!681 acc!681)))

(declare-fun lt!309714 () Unit!23139)

(assert (=> b!664643 (= lt!309714 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!664643 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!309708 () Unit!23139)

(assert (=> b!664643 (= lt!309708 e!381169)))

(declare-fun c!76577 () Bool)

(assert (=> b!664643 (= c!76577 (validKeyInArray!0 (select (arr!18682 a!3626) from!3004)))))

(declare-fun lt!309710 () Unit!23139)

(assert (=> b!664643 (= lt!309710 e!381172)))

(declare-fun c!76576 () Bool)

(assert (=> b!664643 (= c!76576 lt!309707)))

(declare-fun arrayContainsKey!0 (array!38985 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!664643 (= lt!309707 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!664643 (arrayContainsKey!0 (array!38986 (store (arr!18682 a!3626) i!1382 k0!2843) (size!19046 a!3626)) k0!2843 from!3004)))

(declare-fun b!664644 () Bool)

(declare-fun Unit!23143 () Unit!23139)

(assert (=> b!664644 (= e!381172 Unit!23143)))

(declare-fun lt!309713 () Unit!23139)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38985 (_ BitVec 64) (_ BitVec 32)) Unit!23139)

(assert (=> b!664644 (= lt!309713 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!664644 false))

(declare-fun b!664645 () Bool)

(assert (=> b!664645 (= e!381167 (not (contains!3282 acc!681 k0!2843)))))

(declare-fun b!664646 () Bool)

(declare-fun e!381170 () Bool)

(assert (=> b!664646 (= e!381170 (contains!3282 acc!681 k0!2843))))

(declare-fun b!664647 () Bool)

(declare-fun res!432214 () Bool)

(assert (=> b!664647 (=> res!432214 e!381174)))

(assert (=> b!664647 (= res!432214 (not (contains!3282 lt!309712 k0!2843)))))

(declare-fun b!664648 () Bool)

(declare-fun res!432225 () Bool)

(assert (=> b!664648 (=> res!432225 e!381174)))

(declare-fun noDuplicate!556 (List!12630) Bool)

(assert (=> b!664648 (= res!432225 (not (noDuplicate!556 lt!309712)))))

(declare-fun b!664649 () Bool)

(declare-fun res!432226 () Bool)

(assert (=> b!664649 (=> (not res!432226) (not e!381173))))

(assert (=> b!664649 (= res!432226 e!381168)))

(declare-fun res!432232 () Bool)

(assert (=> b!664649 (=> res!432232 e!381168)))

(assert (=> b!664649 (= res!432232 e!381170)))

(declare-fun res!432213 () Bool)

(assert (=> b!664649 (=> (not res!432213) (not e!381170))))

(assert (=> b!664649 (= res!432213 (bvsgt from!3004 i!1382))))

(declare-fun b!664650 () Bool)

(declare-fun res!432217 () Bool)

(assert (=> b!664650 (=> (not res!432217) (not e!381173))))

(assert (=> b!664650 (= res!432217 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!664651 () Bool)

(declare-fun res!432230 () Bool)

(assert (=> b!664651 (=> (not res!432230) (not e!381173))))

(assert (=> b!664651 (= res!432230 (noDuplicate!556 acc!681))))

(assert (= (and start!60000 res!432222) b!664651))

(assert (= (and b!664651 res!432230) b!664639))

(assert (= (and b!664639 res!432224) b!664636))

(assert (= (and b!664636 res!432231) b!664649))

(assert (= (and b!664649 res!432213) b!664646))

(assert (= (and b!664649 (not res!432232)) b!664638))

(assert (= (and b!664638 res!432212) b!664645))

(assert (= (and b!664649 res!432226) b!664642))

(assert (= (and b!664642 res!432220) b!664637))

(assert (= (and b!664637 res!432219) b!664635))

(assert (= (and b!664635 res!432223) b!664640))

(assert (= (and b!664640 res!432221) b!664650))

(assert (= (and b!664650 res!432217) b!664628))

(assert (= (and b!664628 res!432229) b!664643))

(assert (= (and b!664643 c!76576) b!664644))

(assert (= (and b!664643 (not c!76576)) b!664641))

(assert (= (and b!664643 c!76577) b!664627))

(assert (= (and b!664643 (not c!76577)) b!664633))

(assert (= (and b!664643 (not res!432227)) b!664648))

(assert (= (and b!664648 (not res!432225)) b!664630))

(assert (= (and b!664630 (not res!432218)) b!664634))

(assert (= (and b!664634 (not res!432228)) b!664631))

(assert (= (and b!664631 (not res!432215)) b!664647))

(assert (= (and b!664647 (not res!432214)) b!664632))

(assert (= (and b!664632 (not res!432216)) b!664629))

(declare-fun m!636415 () Bool)

(assert (=> b!664629 m!636415))

(declare-fun m!636417 () Bool)

(assert (=> b!664642 m!636417))

(declare-fun m!636419 () Bool)

(assert (=> b!664650 m!636419))

(declare-fun m!636421 () Bool)

(assert (=> b!664631 m!636421))

(declare-fun m!636423 () Bool)

(assert (=> b!664646 m!636423))

(declare-fun m!636425 () Bool)

(assert (=> b!664647 m!636425))

(assert (=> b!664645 m!636423))

(declare-fun m!636427 () Bool)

(assert (=> start!60000 m!636427))

(declare-fun m!636429 () Bool)

(assert (=> b!664637 m!636429))

(declare-fun m!636431 () Bool)

(assert (=> b!664648 m!636431))

(declare-fun m!636433 () Bool)

(assert (=> b!664639 m!636433))

(assert (=> b!664634 m!636423))

(declare-fun m!636435 () Bool)

(assert (=> b!664640 m!636435))

(declare-fun m!636437 () Bool)

(assert (=> b!664644 m!636437))

(declare-fun m!636439 () Bool)

(assert (=> b!664651 m!636439))

(declare-fun m!636441 () Bool)

(assert (=> b!664643 m!636441))

(declare-fun m!636443 () Bool)

(assert (=> b!664643 m!636443))

(declare-fun m!636445 () Bool)

(assert (=> b!664643 m!636445))

(declare-fun m!636447 () Bool)

(assert (=> b!664643 m!636447))

(declare-fun m!636449 () Bool)

(assert (=> b!664643 m!636449))

(declare-fun m!636451 () Bool)

(assert (=> b!664643 m!636451))

(declare-fun m!636453 () Bool)

(assert (=> b!664643 m!636453))

(declare-fun m!636455 () Bool)

(assert (=> b!664643 m!636455))

(assert (=> b!664643 m!636445))

(declare-fun m!636457 () Bool)

(assert (=> b!664643 m!636457))

(declare-fun m!636459 () Bool)

(assert (=> b!664643 m!636459))

(declare-fun m!636461 () Bool)

(assert (=> b!664643 m!636461))

(assert (=> b!664627 m!636443))

(assert (=> b!664627 m!636445))

(declare-fun m!636463 () Bool)

(assert (=> b!664627 m!636463))

(declare-fun m!636465 () Bool)

(assert (=> b!664627 m!636465))

(assert (=> b!664627 m!636445))

(assert (=> b!664627 m!636463))

(assert (=> b!664627 m!636451))

(assert (=> b!664627 m!636461))

(declare-fun m!636467 () Bool)

(assert (=> b!664632 m!636467))

(declare-fun m!636469 () Bool)

(assert (=> b!664636 m!636469))

(check-sat (not b!664631) (not b!664647) (not b!664643) (not b!664632) (not b!664642) (not b!664636) (not b!664640) (not b!664634) (not b!664644) (not b!664645) (not start!60000) (not b!664650) (not b!664648) (not b!664639) (not b!664646) (not b!664629) (not b!664637) (not b!664627) (not b!664651))
(check-sat)
