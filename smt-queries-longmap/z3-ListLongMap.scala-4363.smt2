; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60208 () Bool)

(assert start!60208)

(declare-fun b!673744 () Bool)

(declare-fun res!440285 () Bool)

(declare-fun e!384700 () Bool)

(assert (=> b!673744 (=> (not res!440285) (not e!384700))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!673744 (= res!440285 (validKeyInArray!0 k0!2843))))

(declare-fun b!673745 () Bool)

(declare-fun e!384701 () Bool)

(assert (=> b!673745 (= e!384701 false)))

(declare-datatypes ((array!39255 0))(
  ( (array!39256 (arr!18820 (Array (_ BitVec 32) (_ BitVec 64))) (size!19184 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39255)

(declare-fun lt!312511 () Bool)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12861 0))(
  ( (Nil!12858) (Cons!12857 (h!13902 (_ BitVec 64)) (t!19089 List!12861)) )
))
(declare-fun lt!312514 () List!12861)

(declare-fun arrayNoDuplicates!0 (array!39255 (_ BitVec 32) List!12861) Bool)

(assert (=> b!673745 (= lt!312511 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312514))))

(declare-fun b!673746 () Bool)

(declare-fun res!440287 () Bool)

(assert (=> b!673746 (=> (not res!440287) (not e!384700))))

(declare-fun acc!681 () List!12861)

(declare-fun contains!3438 (List!12861 (_ BitVec 64)) Bool)

(assert (=> b!673746 (= res!440287 (not (contains!3438 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673747 () Bool)

(declare-fun res!440268 () Bool)

(assert (=> b!673747 (=> (not res!440268) (not e!384700))))

(declare-fun arrayContainsKey!0 (array!39255 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!673747 (= res!440268 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!673748 () Bool)

(declare-fun res!440270 () Bool)

(assert (=> b!673748 (=> (not res!440270) (not e!384700))))

(assert (=> b!673748 (= res!440270 (not (contains!3438 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673749 () Bool)

(declare-fun e!384693 () Bool)

(assert (=> b!673749 (= e!384693 e!384701)))

(declare-fun res!440283 () Bool)

(assert (=> b!673749 (=> (not res!440283) (not e!384701))))

(assert (=> b!673749 (= res!440283 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!288 (List!12861 (_ BitVec 64)) List!12861)

(assert (=> b!673749 (= lt!312514 ($colon$colon!288 acc!681 (select (arr!18820 a!3626) from!3004)))))

(declare-fun b!673750 () Bool)

(declare-fun res!440269 () Bool)

(assert (=> b!673750 (=> (not res!440269) (not e!384700))))

(declare-fun e!384694 () Bool)

(assert (=> b!673750 (= res!440269 e!384694)))

(declare-fun res!440279 () Bool)

(assert (=> b!673750 (=> res!440279 e!384694)))

(declare-fun e!384695 () Bool)

(assert (=> b!673750 (= res!440279 e!384695)))

(declare-fun res!440290 () Bool)

(assert (=> b!673750 (=> (not res!440290) (not e!384695))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!673750 (= res!440290 (bvsgt from!3004 i!1382))))

(declare-fun b!673751 () Bool)

(declare-fun res!440291 () Bool)

(assert (=> b!673751 (=> (not res!440291) (not e!384700))))

(assert (=> b!673751 (= res!440291 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12858))))

(declare-fun b!673753 () Bool)

(declare-fun e!384692 () Bool)

(assert (=> b!673753 (= e!384692 (contains!3438 lt!312514 k0!2843))))

(declare-fun b!673754 () Bool)

(declare-fun res!440281 () Bool)

(assert (=> b!673754 (=> (not res!440281) (not e!384700))))

(assert (=> b!673754 (= res!440281 (validKeyInArray!0 (select (arr!18820 a!3626) from!3004)))))

(declare-fun b!673755 () Bool)

(declare-fun res!440276 () Bool)

(assert (=> b!673755 (=> (not res!440276) (not e!384700))))

(declare-fun noDuplicate!685 (List!12861) Bool)

(assert (=> b!673755 (= res!440276 (noDuplicate!685 acc!681))))

(declare-fun b!673756 () Bool)

(assert (=> b!673756 (= e!384695 (contains!3438 acc!681 k0!2843))))

(declare-fun b!673757 () Bool)

(declare-fun e!384697 () Bool)

(assert (=> b!673757 (= e!384697 (not (contains!3438 acc!681 k0!2843)))))

(declare-fun b!673758 () Bool)

(declare-fun res!440288 () Bool)

(assert (=> b!673758 (=> (not res!440288) (not e!384700))))

(assert (=> b!673758 (= res!440288 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19184 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!673759 () Bool)

(declare-fun res!440284 () Bool)

(assert (=> b!673759 (=> (not res!440284) (not e!384701))))

(assert (=> b!673759 (= res!440284 (not (contains!3438 lt!312514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673760 () Bool)

(declare-fun res!440271 () Bool)

(assert (=> b!673760 (=> (not res!440271) (not e!384701))))

(declare-fun e!384696 () Bool)

(assert (=> b!673760 (= res!440271 e!384696)))

(declare-fun res!440286 () Bool)

(assert (=> b!673760 (=> res!440286 e!384696)))

(assert (=> b!673760 (= res!440286 e!384692)))

(declare-fun res!440278 () Bool)

(assert (=> b!673760 (=> (not res!440278) (not e!384692))))

(assert (=> b!673760 (= res!440278 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!673761 () Bool)

(assert (=> b!673761 (= e!384694 e!384697)))

(declare-fun res!440273 () Bool)

(assert (=> b!673761 (=> (not res!440273) (not e!384697))))

(assert (=> b!673761 (= res!440273 (bvsle from!3004 i!1382))))

(declare-fun b!673762 () Bool)

(declare-fun res!440272 () Bool)

(assert (=> b!673762 (=> (not res!440272) (not e!384700))))

(assert (=> b!673762 (= res!440272 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!673763 () Bool)

(assert (=> b!673763 (= e!384700 e!384693)))

(declare-fun res!440275 () Bool)

(assert (=> b!673763 (=> (not res!440275) (not e!384693))))

(assert (=> b!673763 (= res!440275 (not (= (select (arr!18820 a!3626) from!3004) k0!2843)))))

(declare-datatypes ((Unit!23692 0))(
  ( (Unit!23693) )
))
(declare-fun lt!312513 () Unit!23692)

(declare-fun e!384702 () Unit!23692)

(assert (=> b!673763 (= lt!312513 e!384702)))

(declare-fun c!77105 () Bool)

(assert (=> b!673763 (= c!77105 (= (select (arr!18820 a!3626) from!3004) k0!2843))))

(declare-fun b!673752 () Bool)

(declare-fun res!440277 () Bool)

(assert (=> b!673752 (=> (not res!440277) (not e!384701))))

(assert (=> b!673752 (= res!440277 (noDuplicate!685 lt!312514))))

(declare-fun res!440289 () Bool)

(assert (=> start!60208 (=> (not res!440289) (not e!384700))))

(assert (=> start!60208 (= res!440289 (and (bvslt (size!19184 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19184 a!3626))))))

(assert (=> start!60208 e!384700))

(assert (=> start!60208 true))

(declare-fun array_inv!14616 (array!39255) Bool)

(assert (=> start!60208 (array_inv!14616 a!3626)))

(declare-fun b!673764 () Bool)

(declare-fun res!440274 () Bool)

(assert (=> b!673764 (=> (not res!440274) (not e!384701))))

(assert (=> b!673764 (= res!440274 (not (contains!3438 lt!312514 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673765 () Bool)

(declare-fun Unit!23694 () Unit!23692)

(assert (=> b!673765 (= e!384702 Unit!23694)))

(declare-fun b!673766 () Bool)

(declare-fun e!384698 () Bool)

(assert (=> b!673766 (= e!384696 e!384698)))

(declare-fun res!440280 () Bool)

(assert (=> b!673766 (=> (not res!440280) (not e!384698))))

(assert (=> b!673766 (= res!440280 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!673767 () Bool)

(assert (=> b!673767 (= e!384698 (not (contains!3438 lt!312514 k0!2843)))))

(declare-fun b!673768 () Bool)

(declare-fun Unit!23695 () Unit!23692)

(assert (=> b!673768 (= e!384702 Unit!23695)))

(assert (=> b!673768 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!312512 () Unit!23692)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39255 (_ BitVec 64) (_ BitVec 32)) Unit!23692)

(assert (=> b!673768 (= lt!312512 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!673768 false))

(declare-fun b!673769 () Bool)

(declare-fun res!440282 () Bool)

(assert (=> b!673769 (=> (not res!440282) (not e!384700))))

(assert (=> b!673769 (= res!440282 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19184 a!3626))))))

(assert (= (and start!60208 res!440289) b!673755))

(assert (= (and b!673755 res!440276) b!673748))

(assert (= (and b!673748 res!440270) b!673746))

(assert (= (and b!673746 res!440287) b!673750))

(assert (= (and b!673750 res!440290) b!673756))

(assert (= (and b!673750 (not res!440279)) b!673761))

(assert (= (and b!673761 res!440273) b!673757))

(assert (= (and b!673750 res!440269) b!673751))

(assert (= (and b!673751 res!440291) b!673762))

(assert (= (and b!673762 res!440272) b!673769))

(assert (= (and b!673769 res!440282) b!673744))

(assert (= (and b!673744 res!440285) b!673747))

(assert (= (and b!673747 res!440268) b!673758))

(assert (= (and b!673758 res!440288) b!673754))

(assert (= (and b!673754 res!440281) b!673763))

(assert (= (and b!673763 c!77105) b!673768))

(assert (= (and b!673763 (not c!77105)) b!673765))

(assert (= (and b!673763 res!440275) b!673749))

(assert (= (and b!673749 res!440283) b!673752))

(assert (= (and b!673752 res!440277) b!673759))

(assert (= (and b!673759 res!440284) b!673764))

(assert (= (and b!673764 res!440274) b!673760))

(assert (= (and b!673760 res!440278) b!673753))

(assert (= (and b!673760 (not res!440286)) b!673766))

(assert (= (and b!673766 res!440280) b!673767))

(assert (= (and b!673760 res!440271) b!673745))

(declare-fun m!642037 () Bool)

(assert (=> b!673748 m!642037))

(declare-fun m!642039 () Bool)

(assert (=> start!60208 m!642039))

(declare-fun m!642041 () Bool)

(assert (=> b!673764 m!642041))

(declare-fun m!642043 () Bool)

(assert (=> b!673757 m!642043))

(declare-fun m!642045 () Bool)

(assert (=> b!673746 m!642045))

(declare-fun m!642047 () Bool)

(assert (=> b!673751 m!642047))

(declare-fun m!642049 () Bool)

(assert (=> b!673767 m!642049))

(declare-fun m!642051 () Bool)

(assert (=> b!673749 m!642051))

(assert (=> b!673749 m!642051))

(declare-fun m!642053 () Bool)

(assert (=> b!673749 m!642053))

(assert (=> b!673754 m!642051))

(assert (=> b!673754 m!642051))

(declare-fun m!642055 () Bool)

(assert (=> b!673754 m!642055))

(declare-fun m!642057 () Bool)

(assert (=> b!673744 m!642057))

(assert (=> b!673753 m!642049))

(declare-fun m!642059 () Bool)

(assert (=> b!673755 m!642059))

(declare-fun m!642061 () Bool)

(assert (=> b!673752 m!642061))

(declare-fun m!642063 () Bool)

(assert (=> b!673747 m!642063))

(declare-fun m!642065 () Bool)

(assert (=> b!673759 m!642065))

(assert (=> b!673763 m!642051))

(declare-fun m!642067 () Bool)

(assert (=> b!673745 m!642067))

(declare-fun m!642069 () Bool)

(assert (=> b!673768 m!642069))

(declare-fun m!642071 () Bool)

(assert (=> b!673768 m!642071))

(declare-fun m!642073 () Bool)

(assert (=> b!673762 m!642073))

(assert (=> b!673756 m!642043))

(check-sat (not b!673757) (not start!60208) (not b!673745) (not b!673748) (not b!673767) (not b!673747) (not b!673762) (not b!673755) (not b!673753) (not b!673752) (not b!673756) (not b!673754) (not b!673744) (not b!673751) (not b!673746) (not b!673764) (not b!673759) (not b!673768) (not b!673749))
(check-sat)
