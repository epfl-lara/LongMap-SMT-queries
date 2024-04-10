; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60868 () Bool)

(assert start!60868)

(declare-fun b!682623 () Bool)

(declare-fun res!448580 () Bool)

(declare-fun e!388943 () Bool)

(assert (=> b!682623 (=> (not res!448580) (not e!388943))))

(declare-datatypes ((array!39552 0))(
  ( (array!39553 (arr!18958 (Array (_ BitVec 32) (_ BitVec 64))) (size!19322 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39552)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12999 0))(
  ( (Nil!12996) (Cons!12995 (h!14040 (_ BitVec 64)) (t!19242 List!12999)) )
))
(declare-fun acc!681 () List!12999)

(declare-fun arrayNoDuplicates!0 (array!39552 (_ BitVec 32) List!12999) Bool)

(assert (=> b!682623 (= res!448580 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!448588 () Bool)

(assert (=> start!60868 (=> (not res!448588) (not e!388943))))

(assert (=> start!60868 (= res!448588 (and (bvslt (size!19322 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19322 a!3626))))))

(assert (=> start!60868 e!388943))

(assert (=> start!60868 true))

(declare-fun array_inv!14754 (array!39552) Bool)

(assert (=> start!60868 (array_inv!14754 a!3626)))

(declare-fun b!682624 () Bool)

(declare-fun res!448582 () Bool)

(assert (=> b!682624 (=> (not res!448582) (not e!388943))))

(declare-fun noDuplicate!823 (List!12999) Bool)

(assert (=> b!682624 (= res!448582 (noDuplicate!823 acc!681))))

(declare-fun b!682625 () Bool)

(declare-datatypes ((Unit!23957 0))(
  ( (Unit!23958) )
))
(declare-fun e!388941 () Unit!23957)

(declare-fun Unit!23959 () Unit!23957)

(assert (=> b!682625 (= e!388941 Unit!23959)))

(declare-fun b!682626 () Bool)

(declare-fun lt!313590 () Unit!23957)

(assert (=> b!682626 (= e!388941 lt!313590)))

(declare-fun lt!313588 () Unit!23957)

(declare-fun lemmaListSubSeqRefl!0 (List!12999) Unit!23957)

(assert (=> b!682626 (= lt!313588 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!162 (List!12999 List!12999) Bool)

(assert (=> b!682626 (subseq!162 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39552 List!12999 List!12999 (_ BitVec 32)) Unit!23957)

(declare-fun $colon$colon!327 (List!12999 (_ BitVec 64)) List!12999)

(assert (=> b!682626 (= lt!313590 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!327 acc!681 (select (arr!18958 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!682626 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!682627 () Bool)

(declare-fun e!388944 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3576 (List!12999 (_ BitVec 64)) Bool)

(assert (=> b!682627 (= e!388944 (not (contains!3576 acc!681 k0!2843)))))

(declare-fun b!682628 () Bool)

(declare-fun e!388942 () Unit!23957)

(declare-fun Unit!23960 () Unit!23957)

(assert (=> b!682628 (= e!388942 Unit!23960)))

(declare-fun b!682629 () Bool)

(declare-fun res!448581 () Bool)

(assert (=> b!682629 (=> (not res!448581) (not e!388943))))

(assert (=> b!682629 (= res!448581 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12996))))

(declare-fun b!682630 () Bool)

(declare-fun e!388938 () Bool)

(assert (=> b!682630 (= e!388938 (contains!3576 acc!681 k0!2843))))

(declare-fun b!682631 () Bool)

(declare-fun res!448589 () Bool)

(assert (=> b!682631 (=> (not res!448589) (not e!388943))))

(assert (=> b!682631 (= res!448589 (not (contains!3576 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!682632 () Bool)

(declare-fun res!448592 () Bool)

(assert (=> b!682632 (=> (not res!448592) (not e!388943))))

(declare-fun e!388940 () Bool)

(assert (=> b!682632 (= res!448592 e!388940)))

(declare-fun res!448579 () Bool)

(assert (=> b!682632 (=> res!448579 e!388940)))

(assert (=> b!682632 (= res!448579 e!388938)))

(declare-fun res!448584 () Bool)

(assert (=> b!682632 (=> (not res!448584) (not e!388938))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!682632 (= res!448584 (bvsgt from!3004 i!1382))))

(declare-fun b!682633 () Bool)

(assert (=> b!682633 (= e!388943 (not true))))

(declare-fun -!127 (List!12999 (_ BitVec 64)) List!12999)

(assert (=> b!682633 (= (-!127 ($colon$colon!327 acc!681 k0!2843) k0!2843) acc!681)))

(declare-fun lt!313585 () Unit!23957)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12999) Unit!23957)

(assert (=> b!682633 (= lt!313585 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!682633 (subseq!162 acc!681 acc!681)))

(declare-fun lt!313589 () Unit!23957)

(assert (=> b!682633 (= lt!313589 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!682633 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!313591 () Unit!23957)

(assert (=> b!682633 (= lt!313591 e!388941)))

(declare-fun c!77390 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!682633 (= c!77390 (validKeyInArray!0 (select (arr!18958 a!3626) from!3004)))))

(declare-fun lt!313587 () Unit!23957)

(assert (=> b!682633 (= lt!313587 e!388942)))

(declare-fun c!77389 () Bool)

(declare-fun arrayContainsKey!0 (array!39552 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!682633 (= c!77389 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!682633 (arrayContainsKey!0 (array!39553 (store (arr!18958 a!3626) i!1382 k0!2843) (size!19322 a!3626)) k0!2843 from!3004)))

(declare-fun b!682634 () Bool)

(declare-fun Unit!23961 () Unit!23957)

(assert (=> b!682634 (= e!388942 Unit!23961)))

(declare-fun lt!313586 () Unit!23957)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39552 (_ BitVec 64) (_ BitVec 32)) Unit!23957)

(assert (=> b!682634 (= lt!313586 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!682634 false))

(declare-fun b!682635 () Bool)

(declare-fun res!448586 () Bool)

(assert (=> b!682635 (=> (not res!448586) (not e!388943))))

(assert (=> b!682635 (= res!448586 (validKeyInArray!0 k0!2843))))

(declare-fun b!682636 () Bool)

(assert (=> b!682636 (= e!388940 e!388944)))

(declare-fun res!448591 () Bool)

(assert (=> b!682636 (=> (not res!448591) (not e!388944))))

(assert (=> b!682636 (= res!448591 (bvsle from!3004 i!1382))))

(declare-fun b!682637 () Bool)

(declare-fun res!448587 () Bool)

(assert (=> b!682637 (=> (not res!448587) (not e!388943))))

(assert (=> b!682637 (= res!448587 (not (contains!3576 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!682638 () Bool)

(declare-fun res!448585 () Bool)

(assert (=> b!682638 (=> (not res!448585) (not e!388943))))

(assert (=> b!682638 (= res!448585 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19322 a!3626))))))

(declare-fun b!682639 () Bool)

(declare-fun res!448590 () Bool)

(assert (=> b!682639 (=> (not res!448590) (not e!388943))))

(assert (=> b!682639 (= res!448590 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!682640 () Bool)

(declare-fun res!448583 () Bool)

(assert (=> b!682640 (=> (not res!448583) (not e!388943))))

(assert (=> b!682640 (= res!448583 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19322 a!3626)) (= from!3004 i!1382)))))

(assert (= (and start!60868 res!448588) b!682624))

(assert (= (and b!682624 res!448582) b!682637))

(assert (= (and b!682637 res!448587) b!682631))

(assert (= (and b!682631 res!448589) b!682632))

(assert (= (and b!682632 res!448584) b!682630))

(assert (= (and b!682632 (not res!448579)) b!682636))

(assert (= (and b!682636 res!448591) b!682627))

(assert (= (and b!682632 res!448592) b!682629))

(assert (= (and b!682629 res!448581) b!682623))

(assert (= (and b!682623 res!448580) b!682638))

(assert (= (and b!682638 res!448585) b!682635))

(assert (= (and b!682635 res!448586) b!682639))

(assert (= (and b!682639 res!448590) b!682640))

(assert (= (and b!682640 res!448583) b!682633))

(assert (= (and b!682633 c!77389) b!682634))

(assert (= (and b!682633 (not c!77389)) b!682628))

(assert (= (and b!682633 c!77390) b!682626))

(assert (= (and b!682633 (not c!77390)) b!682625))

(declare-fun m!647283 () Bool)

(assert (=> start!60868 m!647283))

(declare-fun m!647285 () Bool)

(assert (=> b!682623 m!647285))

(declare-fun m!647287 () Bool)

(assert (=> b!682639 m!647287))

(declare-fun m!647289 () Bool)

(assert (=> b!682630 m!647289))

(declare-fun m!647291 () Bool)

(assert (=> b!682626 m!647291))

(declare-fun m!647293 () Bool)

(assert (=> b!682626 m!647293))

(declare-fun m!647295 () Bool)

(assert (=> b!682626 m!647295))

(declare-fun m!647297 () Bool)

(assert (=> b!682626 m!647297))

(assert (=> b!682626 m!647293))

(assert (=> b!682626 m!647295))

(declare-fun m!647299 () Bool)

(assert (=> b!682626 m!647299))

(declare-fun m!647301 () Bool)

(assert (=> b!682626 m!647301))

(declare-fun m!647303 () Bool)

(assert (=> b!682633 m!647303))

(declare-fun m!647305 () Bool)

(assert (=> b!682633 m!647305))

(assert (=> b!682633 m!647291))

(assert (=> b!682633 m!647293))

(declare-fun m!647307 () Bool)

(assert (=> b!682633 m!647307))

(declare-fun m!647309 () Bool)

(assert (=> b!682633 m!647309))

(assert (=> b!682633 m!647299))

(declare-fun m!647311 () Bool)

(assert (=> b!682633 m!647311))

(assert (=> b!682633 m!647303))

(assert (=> b!682633 m!647293))

(declare-fun m!647313 () Bool)

(assert (=> b!682633 m!647313))

(declare-fun m!647315 () Bool)

(assert (=> b!682633 m!647315))

(assert (=> b!682633 m!647301))

(declare-fun m!647317 () Bool)

(assert (=> b!682635 m!647317))

(declare-fun m!647319 () Bool)

(assert (=> b!682624 m!647319))

(declare-fun m!647321 () Bool)

(assert (=> b!682634 m!647321))

(declare-fun m!647323 () Bool)

(assert (=> b!682629 m!647323))

(assert (=> b!682627 m!647289))

(declare-fun m!647325 () Bool)

(assert (=> b!682631 m!647325))

(declare-fun m!647327 () Bool)

(assert (=> b!682637 m!647327))

(check-sat (not b!682639) (not b!682634) (not start!60868) (not b!682635) (not b!682631) (not b!682630) (not b!682623) (not b!682633) (not b!682629) (not b!682637) (not b!682624) (not b!682626) (not b!682627))
(check-sat)
