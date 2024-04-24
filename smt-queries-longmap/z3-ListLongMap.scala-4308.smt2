; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59934 () Bool)

(assert start!59934)

(declare-fun b!662596 () Bool)

(declare-fun res!430502 () Bool)

(declare-fun e!380423 () Bool)

(assert (=> b!662596 (=> res!430502 e!380423)))

(declare-datatypes ((List!12597 0))(
  ( (Nil!12594) (Cons!12593 (h!13641 (_ BitVec 64)) (t!18817 List!12597)) )
))
(declare-fun acc!681 () List!12597)

(declare-fun lt!309099 () List!12597)

(declare-fun subseq!11 (List!12597 List!12597) Bool)

(assert (=> b!662596 (= res!430502 (not (subseq!11 acc!681 lt!309099)))))

(declare-fun b!662597 () Bool)

(declare-fun res!430507 () Bool)

(declare-fun e!380420 () Bool)

(assert (=> b!662597 (=> (not res!430507) (not e!380420))))

(declare-fun contains!3249 (List!12597 (_ BitVec 64)) Bool)

(assert (=> b!662597 (= res!430507 (not (contains!3249 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662598 () Bool)

(declare-datatypes ((Unit!22989 0))(
  ( (Unit!22990) )
))
(declare-fun e!380422 () Unit!22989)

(declare-fun Unit!22991 () Unit!22989)

(assert (=> b!662598 (= e!380422 Unit!22991)))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lt!309096 () Unit!22989)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-datatypes ((array!38919 0))(
  ( (array!38920 (arr!18649 (Array (_ BitVec 32) (_ BitVec 64))) (size!19013 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38919)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38919 (_ BitVec 64) (_ BitVec 32)) Unit!22989)

(assert (=> b!662598 (= lt!309096 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!662598 false))

(declare-fun b!662599 () Bool)

(declare-fun e!380424 () Bool)

(assert (=> b!662599 (= e!380424 (not (contains!3249 acc!681 k0!2843)))))

(declare-fun b!662600 () Bool)

(declare-fun res!430493 () Bool)

(assert (=> b!662600 (=> res!430493 e!380423)))

(assert (=> b!662600 (= res!430493 (contains!3249 lt!309099 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!662601 () Bool)

(declare-fun e!380426 () Bool)

(assert (=> b!662601 (= e!380426 e!380423)))

(declare-fun res!430498 () Bool)

(assert (=> b!662601 (=> res!430498 e!380423)))

(assert (=> b!662601 (= res!430498 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!140 (List!12597 (_ BitVec 64)) List!12597)

(assert (=> b!662601 (= lt!309099 ($colon$colon!140 acc!681 (select (arr!18649 a!3626) from!3004)))))

(assert (=> b!662601 (subseq!11 acc!681 acc!681)))

(declare-fun lt!309097 () Unit!22989)

(declare-fun lemmaListSubSeqRefl!0 (List!12597) Unit!22989)

(assert (=> b!662601 (= lt!309097 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!662602 () Bool)

(declare-fun res!430494 () Bool)

(assert (=> b!662602 (=> (not res!430494) (not e!380420))))

(declare-fun e!380425 () Bool)

(assert (=> b!662602 (= res!430494 e!380425)))

(declare-fun res!430510 () Bool)

(assert (=> b!662602 (=> res!430510 e!380425)))

(declare-fun e!380421 () Bool)

(assert (=> b!662602 (= res!430510 e!380421)))

(declare-fun res!430496 () Bool)

(assert (=> b!662602 (=> (not res!430496) (not e!380421))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!662602 (= res!430496 (bvsgt from!3004 i!1382))))

(declare-fun res!430497 () Bool)

(assert (=> start!59934 (=> (not res!430497) (not e!380420))))

(assert (=> start!59934 (= res!430497 (and (bvslt (size!19013 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19013 a!3626))))))

(assert (=> start!59934 e!380420))

(assert (=> start!59934 true))

(declare-fun array_inv!14508 (array!38919) Bool)

(assert (=> start!59934 (array_inv!14508 a!3626)))

(declare-fun b!662603 () Bool)

(declare-fun res!430506 () Bool)

(assert (=> b!662603 (=> res!430506 e!380423)))

(declare-fun noDuplicate!523 (List!12597) Bool)

(assert (=> b!662603 (= res!430506 (not (noDuplicate!523 lt!309099)))))

(declare-fun b!662604 () Bool)

(declare-fun res!430501 () Bool)

(assert (=> b!662604 (=> (not res!430501) (not e!380420))))

(assert (=> b!662604 (= res!430501 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19013 a!3626))))))

(declare-fun b!662605 () Bool)

(assert (=> b!662605 (= e!380421 (contains!3249 acc!681 k0!2843))))

(declare-fun b!662606 () Bool)

(assert (=> b!662606 (= e!380423 true)))

(declare-fun lt!309098 () Bool)

(declare-fun arrayNoDuplicates!0 (array!38919 (_ BitVec 32) List!12597) Bool)

(assert (=> b!662606 (= lt!309098 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!309099))))

(declare-fun lt!309095 () Unit!22989)

(declare-fun noDuplicateSubseq!11 (List!12597 List!12597) Unit!22989)

(assert (=> b!662606 (= lt!309095 (noDuplicateSubseq!11 acc!681 lt!309099))))

(declare-fun b!662607 () Bool)

(declare-fun res!430504 () Bool)

(assert (=> b!662607 (=> (not res!430504) (not e!380420))))

(assert (=> b!662607 (= res!430504 (noDuplicate!523 acc!681))))

(declare-fun b!662608 () Bool)

(assert (=> b!662608 (= e!380425 e!380424)))

(declare-fun res!430508 () Bool)

(assert (=> b!662608 (=> (not res!430508) (not e!380424))))

(assert (=> b!662608 (= res!430508 (bvsle from!3004 i!1382))))

(declare-fun b!662609 () Bool)

(assert (=> b!662609 (= e!380420 (not e!380426))))

(declare-fun res!430503 () Bool)

(assert (=> b!662609 (=> res!430503 e!380426)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!662609 (= res!430503 (not (validKeyInArray!0 (select (arr!18649 a!3626) from!3004))))))

(declare-fun lt!309100 () Unit!22989)

(assert (=> b!662609 (= lt!309100 e!380422)))

(declare-fun c!76421 () Bool)

(declare-fun arrayContainsKey!0 (array!38919 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!662609 (= c!76421 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!662609 (arrayContainsKey!0 (array!38920 (store (arr!18649 a!3626) i!1382 k0!2843) (size!19013 a!3626)) k0!2843 from!3004)))

(declare-fun b!662610 () Bool)

(declare-fun res!430492 () Bool)

(assert (=> b!662610 (=> (not res!430492) (not e!380420))))

(assert (=> b!662610 (= res!430492 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12594))))

(declare-fun b!662611 () Bool)

(declare-fun res!430505 () Bool)

(assert (=> b!662611 (=> (not res!430505) (not e!380420))))

(assert (=> b!662611 (= res!430505 (not (contains!3249 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662612 () Bool)

(declare-fun res!430509 () Bool)

(assert (=> b!662612 (=> (not res!430509) (not e!380420))))

(assert (=> b!662612 (= res!430509 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19013 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!662613 () Bool)

(declare-fun res!430495 () Bool)

(assert (=> b!662613 (=> (not res!430495) (not e!380420))))

(assert (=> b!662613 (= res!430495 (validKeyInArray!0 k0!2843))))

(declare-fun b!662614 () Bool)

(declare-fun res!430500 () Bool)

(assert (=> b!662614 (=> (not res!430500) (not e!380420))))

(assert (=> b!662614 (= res!430500 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!662615 () Bool)

(declare-fun res!430499 () Bool)

(assert (=> b!662615 (=> res!430499 e!380423)))

(assert (=> b!662615 (= res!430499 (contains!3249 lt!309099 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!662616 () Bool)

(declare-fun res!430491 () Bool)

(assert (=> b!662616 (=> (not res!430491) (not e!380420))))

(assert (=> b!662616 (= res!430491 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!662617 () Bool)

(declare-fun Unit!22992 () Unit!22989)

(assert (=> b!662617 (= e!380422 Unit!22992)))

(assert (= (and start!59934 res!430497) b!662607))

(assert (= (and b!662607 res!430504) b!662597))

(assert (= (and b!662597 res!430507) b!662611))

(assert (= (and b!662611 res!430505) b!662602))

(assert (= (and b!662602 res!430496) b!662605))

(assert (= (and b!662602 (not res!430510)) b!662608))

(assert (= (and b!662608 res!430508) b!662599))

(assert (= (and b!662602 res!430494) b!662610))

(assert (= (and b!662610 res!430492) b!662616))

(assert (= (and b!662616 res!430491) b!662604))

(assert (= (and b!662604 res!430501) b!662613))

(assert (= (and b!662613 res!430495) b!662614))

(assert (= (and b!662614 res!430500) b!662612))

(assert (= (and b!662612 res!430509) b!662609))

(assert (= (and b!662609 c!76421) b!662598))

(assert (= (and b!662609 (not c!76421)) b!662617))

(assert (= (and b!662609 (not res!430503)) b!662601))

(assert (= (and b!662601 (not res!430498)) b!662603))

(assert (= (and b!662603 (not res!430506)) b!662600))

(assert (= (and b!662600 (not res!430493)) b!662615))

(assert (= (and b!662615 (not res!430499)) b!662596))

(assert (= (and b!662596 (not res!430502)) b!662606))

(declare-fun m!634927 () Bool)

(assert (=> start!59934 m!634927))

(declare-fun m!634929 () Bool)

(assert (=> b!662606 m!634929))

(declare-fun m!634931 () Bool)

(assert (=> b!662606 m!634931))

(declare-fun m!634933 () Bool)

(assert (=> b!662598 m!634933))

(declare-fun m!634935 () Bool)

(assert (=> b!662603 m!634935))

(declare-fun m!634937 () Bool)

(assert (=> b!662599 m!634937))

(declare-fun m!634939 () Bool)

(assert (=> b!662607 m!634939))

(declare-fun m!634941 () Bool)

(assert (=> b!662615 m!634941))

(assert (=> b!662605 m!634937))

(declare-fun m!634943 () Bool)

(assert (=> b!662597 m!634943))

(declare-fun m!634945 () Bool)

(assert (=> b!662600 m!634945))

(declare-fun m!634947 () Bool)

(assert (=> b!662611 m!634947))

(declare-fun m!634949 () Bool)

(assert (=> b!662616 m!634949))

(declare-fun m!634951 () Bool)

(assert (=> b!662613 m!634951))

(declare-fun m!634953 () Bool)

(assert (=> b!662601 m!634953))

(assert (=> b!662601 m!634953))

(declare-fun m!634955 () Bool)

(assert (=> b!662601 m!634955))

(declare-fun m!634957 () Bool)

(assert (=> b!662601 m!634957))

(declare-fun m!634959 () Bool)

(assert (=> b!662601 m!634959))

(declare-fun m!634961 () Bool)

(assert (=> b!662610 m!634961))

(declare-fun m!634963 () Bool)

(assert (=> b!662596 m!634963))

(declare-fun m!634965 () Bool)

(assert (=> b!662614 m!634965))

(assert (=> b!662609 m!634953))

(declare-fun m!634967 () Bool)

(assert (=> b!662609 m!634967))

(declare-fun m!634969 () Bool)

(assert (=> b!662609 m!634969))

(assert (=> b!662609 m!634953))

(declare-fun m!634971 () Bool)

(assert (=> b!662609 m!634971))

(declare-fun m!634973 () Bool)

(assert (=> b!662609 m!634973))

(check-sat (not b!662609) (not b!662598) (not b!662606) (not b!662599) (not b!662610) (not b!662615) (not b!662607) (not b!662600) (not b!662597) (not start!59934) (not b!662601) (not b!662614) (not b!662605) (not b!662596) (not b!662613) (not b!662611) (not b!662603) (not b!662616))
(check-sat)
