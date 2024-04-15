; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60176 () Bool)

(assert start!60176)

(declare-fun b!672668 () Bool)

(declare-fun res!439427 () Bool)

(declare-fun e!384173 () Bool)

(assert (=> b!672668 (=> (not res!439427) (not e!384173))))

(declare-datatypes ((array!39234 0))(
  ( (array!39235 (arr!18809 (Array (_ BitVec 32) (_ BitVec 64))) (size!19174 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39234)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!672668 (= res!439427 (validKeyInArray!0 (select (arr!18809 a!3626) from!3004)))))

(declare-fun b!672669 () Bool)

(declare-fun res!439420 () Bool)

(assert (=> b!672669 (=> (not res!439420) (not e!384173))))

(declare-datatypes ((List!12889 0))(
  ( (Nil!12886) (Cons!12885 (h!13930 (_ BitVec 64)) (t!19108 List!12889)) )
))
(declare-fun acc!681 () List!12889)

(declare-fun arrayNoDuplicates!0 (array!39234 (_ BitVec 32) List!12889) Bool)

(assert (=> b!672669 (= res!439420 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!672670 () Bool)

(declare-datatypes ((Unit!23630 0))(
  ( (Unit!23631) )
))
(declare-fun e!384181 () Unit!23630)

(declare-fun Unit!23632 () Unit!23630)

(assert (=> b!672670 (= e!384181 Unit!23632)))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39234 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!672670 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!312136 () Unit!23630)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39234 (_ BitVec 64) (_ BitVec 32)) Unit!23630)

(assert (=> b!672670 (= lt!312136 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!672670 false))

(declare-fun b!672672 () Bool)

(declare-fun res!439435 () Bool)

(assert (=> b!672672 (=> (not res!439435) (not e!384173))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!672672 (= res!439435 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19174 a!3626))))))

(declare-fun b!672673 () Bool)

(declare-fun res!439419 () Bool)

(assert (=> b!672673 (=> (not res!439419) (not e!384173))))

(assert (=> b!672673 (= res!439419 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12886))))

(declare-fun b!672674 () Bool)

(declare-fun e!384182 () Bool)

(declare-fun e!384180 () Bool)

(assert (=> b!672674 (= e!384182 e!384180)))

(declare-fun res!439416 () Bool)

(assert (=> b!672674 (=> (not res!439416) (not e!384180))))

(assert (=> b!672674 (= res!439416 (bvsle from!3004 i!1382))))

(declare-fun b!672675 () Bool)

(declare-fun res!439424 () Bool)

(assert (=> b!672675 (=> (not res!439424) (not e!384173))))

(assert (=> b!672675 (= res!439424 e!384182)))

(declare-fun res!439414 () Bool)

(assert (=> b!672675 (=> res!439414 e!384182)))

(declare-fun e!384179 () Bool)

(assert (=> b!672675 (= res!439414 e!384179)))

(declare-fun res!439434 () Bool)

(assert (=> b!672675 (=> (not res!439434) (not e!384179))))

(assert (=> b!672675 (= res!439434 (bvsgt from!3004 i!1382))))

(declare-fun b!672676 () Bool)

(declare-fun res!439413 () Bool)

(assert (=> b!672676 (=> (not res!439413) (not e!384173))))

(assert (=> b!672676 (= res!439413 (validKeyInArray!0 k0!2843))))

(declare-fun b!672677 () Bool)

(declare-fun e!384174 () Bool)

(declare-fun lt!312137 () List!12889)

(declare-fun contains!3411 (List!12889 (_ BitVec 64)) Bool)

(assert (=> b!672677 (= e!384174 (not (contains!3411 lt!312137 k0!2843)))))

(declare-fun b!672678 () Bool)

(declare-fun res!439422 () Bool)

(assert (=> b!672678 (=> (not res!439422) (not e!384173))))

(declare-fun noDuplicate!680 (List!12889) Bool)

(assert (=> b!672678 (= res!439422 (noDuplicate!680 acc!681))))

(declare-fun b!672679 () Bool)

(declare-fun e!384178 () Bool)

(assert (=> b!672679 (= e!384178 false)))

(declare-fun lt!312138 () Bool)

(assert (=> b!672679 (= lt!312138 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312137))))

(declare-fun b!672680 () Bool)

(declare-fun res!439426 () Bool)

(assert (=> b!672680 (=> (not res!439426) (not e!384178))))

(assert (=> b!672680 (= res!439426 (not (contains!3411 lt!312137 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672681 () Bool)

(declare-fun res!439415 () Bool)

(assert (=> b!672681 (=> (not res!439415) (not e!384178))))

(assert (=> b!672681 (= res!439415 (not (contains!3411 lt!312137 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672682 () Bool)

(assert (=> b!672682 (= e!384179 (contains!3411 acc!681 k0!2843))))

(declare-fun b!672683 () Bool)

(declare-fun res!439425 () Bool)

(assert (=> b!672683 (=> (not res!439425) (not e!384173))))

(assert (=> b!672683 (= res!439425 (not (contains!3411 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672684 () Bool)

(declare-fun res!439429 () Bool)

(assert (=> b!672684 (=> (not res!439429) (not e!384178))))

(declare-fun e!384172 () Bool)

(assert (=> b!672684 (= res!439429 e!384172)))

(declare-fun res!439418 () Bool)

(assert (=> b!672684 (=> res!439418 e!384172)))

(declare-fun e!384175 () Bool)

(assert (=> b!672684 (= res!439418 e!384175)))

(declare-fun res!439417 () Bool)

(assert (=> b!672684 (=> (not res!439417) (not e!384175))))

(assert (=> b!672684 (= res!439417 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!672685 () Bool)

(declare-fun res!439432 () Bool)

(assert (=> b!672685 (=> (not res!439432) (not e!384173))))

(assert (=> b!672685 (= res!439432 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!672686 () Bool)

(declare-fun res!439428 () Bool)

(assert (=> b!672686 (=> (not res!439428) (not e!384173))))

(assert (=> b!672686 (= res!439428 (not (contains!3411 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672687 () Bool)

(declare-fun e!384177 () Bool)

(assert (=> b!672687 (= e!384177 e!384178)))

(declare-fun res!439433 () Bool)

(assert (=> b!672687 (=> (not res!439433) (not e!384178))))

(assert (=> b!672687 (= res!439433 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!277 (List!12889 (_ BitVec 64)) List!12889)

(assert (=> b!672687 (= lt!312137 ($colon$colon!277 acc!681 (select (arr!18809 a!3626) from!3004)))))

(declare-fun b!672688 () Bool)

(assert (=> b!672688 (= e!384175 (contains!3411 lt!312137 k0!2843))))

(declare-fun b!672689 () Bool)

(declare-fun Unit!23633 () Unit!23630)

(assert (=> b!672689 (= e!384181 Unit!23633)))

(declare-fun res!439421 () Bool)

(assert (=> start!60176 (=> (not res!439421) (not e!384173))))

(assert (=> start!60176 (= res!439421 (and (bvslt (size!19174 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19174 a!3626))))))

(assert (=> start!60176 e!384173))

(assert (=> start!60176 true))

(declare-fun array_inv!14692 (array!39234) Bool)

(assert (=> start!60176 (array_inv!14692 a!3626)))

(declare-fun b!672671 () Bool)

(assert (=> b!672671 (= e!384180 (not (contains!3411 acc!681 k0!2843)))))

(declare-fun b!672690 () Bool)

(assert (=> b!672690 (= e!384173 e!384177)))

(declare-fun res!439430 () Bool)

(assert (=> b!672690 (=> (not res!439430) (not e!384177))))

(assert (=> b!672690 (= res!439430 (not (= (select (arr!18809 a!3626) from!3004) k0!2843)))))

(declare-fun lt!312135 () Unit!23630)

(assert (=> b!672690 (= lt!312135 e!384181)))

(declare-fun c!76995 () Bool)

(assert (=> b!672690 (= c!76995 (= (select (arr!18809 a!3626) from!3004) k0!2843))))

(declare-fun b!672691 () Bool)

(declare-fun res!439423 () Bool)

(assert (=> b!672691 (=> (not res!439423) (not e!384178))))

(assert (=> b!672691 (= res!439423 (noDuplicate!680 lt!312137))))

(declare-fun b!672692 () Bool)

(declare-fun res!439412 () Bool)

(assert (=> b!672692 (=> (not res!439412) (not e!384173))))

(assert (=> b!672692 (= res!439412 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19174 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!672693 () Bool)

(assert (=> b!672693 (= e!384172 e!384174)))

(declare-fun res!439431 () Bool)

(assert (=> b!672693 (=> (not res!439431) (not e!384174))))

(assert (=> b!672693 (= res!439431 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(assert (= (and start!60176 res!439421) b!672678))

(assert (= (and b!672678 res!439422) b!672683))

(assert (= (and b!672683 res!439425) b!672686))

(assert (= (and b!672686 res!439428) b!672675))

(assert (= (and b!672675 res!439434) b!672682))

(assert (= (and b!672675 (not res!439414)) b!672674))

(assert (= (and b!672674 res!439416) b!672671))

(assert (= (and b!672675 res!439424) b!672673))

(assert (= (and b!672673 res!439419) b!672669))

(assert (= (and b!672669 res!439420) b!672672))

(assert (= (and b!672672 res!439435) b!672676))

(assert (= (and b!672676 res!439413) b!672685))

(assert (= (and b!672685 res!439432) b!672692))

(assert (= (and b!672692 res!439412) b!672668))

(assert (= (and b!672668 res!439427) b!672690))

(assert (= (and b!672690 c!76995) b!672670))

(assert (= (and b!672690 (not c!76995)) b!672689))

(assert (= (and b!672690 res!439430) b!672687))

(assert (= (and b!672687 res!439433) b!672691))

(assert (= (and b!672691 res!439423) b!672681))

(assert (= (and b!672681 res!439415) b!672680))

(assert (= (and b!672680 res!439426) b!672684))

(assert (= (and b!672684 res!439417) b!672688))

(assert (= (and b!672684 (not res!439418)) b!672693))

(assert (= (and b!672693 res!439431) b!672677))

(assert (= (and b!672684 res!439429) b!672679))

(declare-fun m!640875 () Bool)

(assert (=> b!672677 m!640875))

(declare-fun m!640877 () Bool)

(assert (=> b!672681 m!640877))

(declare-fun m!640879 () Bool)

(assert (=> b!672668 m!640879))

(assert (=> b!672668 m!640879))

(declare-fun m!640881 () Bool)

(assert (=> b!672668 m!640881))

(declare-fun m!640883 () Bool)

(assert (=> b!672686 m!640883))

(declare-fun m!640885 () Bool)

(assert (=> b!672678 m!640885))

(declare-fun m!640887 () Bool)

(assert (=> b!672679 m!640887))

(declare-fun m!640889 () Bool)

(assert (=> b!672670 m!640889))

(declare-fun m!640891 () Bool)

(assert (=> b!672670 m!640891))

(declare-fun m!640893 () Bool)

(assert (=> b!672685 m!640893))

(assert (=> b!672688 m!640875))

(assert (=> b!672690 m!640879))

(declare-fun m!640895 () Bool)

(assert (=> start!60176 m!640895))

(declare-fun m!640897 () Bool)

(assert (=> b!672673 m!640897))

(declare-fun m!640899 () Bool)

(assert (=> b!672676 m!640899))

(declare-fun m!640901 () Bool)

(assert (=> b!672680 m!640901))

(declare-fun m!640903 () Bool)

(assert (=> b!672691 m!640903))

(declare-fun m!640905 () Bool)

(assert (=> b!672683 m!640905))

(declare-fun m!640907 () Bool)

(assert (=> b!672671 m!640907))

(assert (=> b!672687 m!640879))

(assert (=> b!672687 m!640879))

(declare-fun m!640909 () Bool)

(assert (=> b!672687 m!640909))

(assert (=> b!672682 m!640907))

(declare-fun m!640911 () Bool)

(assert (=> b!672669 m!640911))

(check-sat (not b!672687) (not b!672670) (not b!672679) (not b!672678) (not b!672673) (not b!672685) (not b!672680) (not b!672682) (not b!672691) (not b!672683) (not b!672686) (not b!672668) (not b!672688) (not b!672676) (not b!672677) (not b!672669) (not b!672681) (not b!672671) (not start!60176))
(check-sat)
